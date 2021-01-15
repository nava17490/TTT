package lineas.interfaz;




import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import sistema.Autobus_IU;
import ttt.comunicacion.clases.Autobus;
import ttt.comunicacion.clases.Linea;
import ttt.comunicacion.clases.Parada;
import ttt.comunicacion.cliente.Peticion;
import lineas.interfaz.R;
import android.app.Activity;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.location.LocationProvider;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class Recorrido extends Activity {
	
	private Autobus_IU autobus;
	private ArrayList<Linea> lineas;
	private TextView sigParada;
	private TextView tiempoRecorrido;
	private long horaInicio;
	private boolean pausa;
	
	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.recorrido);
        pausa = false;
        TextView hora = (TextView)findViewById(R.id.hora_recorrido);
        SimpleDateFormat sf = new SimpleDateFormat("HH:mm"); 
        Calendar calendario = Calendar.getInstance(); 
        hora.setText(sf.format(calendario.getTime()));
        Bundle bundle = getIntent().getExtras();
        LocationManager locationMgr = (LocationManager)getSystemService(LOCATION_SERVICE);
        autobus = (Autobus_IU) bundle.getSerializable("autobus");        
        TextView lineaT = (TextView) findViewById(R.id.linea);
        lineaT.setText("Linea: " + autobus.getLinea().toString());
        TextView autobusT = (TextView) findViewById(R.id.autobus);
        autobusT.setText("Autobus: " + autobus.getIdAutobus() + "");
        sigParada = (TextView) findViewById(R.id.sig_parada);
        tiempoRecorrido = (TextView) findViewById(R.id.tiempo_recorrido);
        horaInicio = (new Date()).getTime();        
        if (autobus.comenzarRuta()) {
        	System.out.println("comienza la ruta");
        }
        Peticion.pedir().establecerInfoBus(new Autobus(autobus.getIdAutobus(), autobus.getLinea(), new Parada(101, "Nicanor Villalta(Salida)", 40.330605, -1.090903, 0), 0.0));

		sigParada.setText("Proxima Parada: " + autobus.getLinea().getParadas().iterator().next().toString());
		long tiempoActual = (new Date()).getTime();
		Date recorridoT = new Date(this.horaInicio-tiempoActual);
		tiempoRecorrido.setText("Tiempo Recorrido: " + recorridoT.getHours() + ":" + recorridoT.getMinutes());        
        lineas = (ArrayList<Linea>) getIntent().getExtras().getSerializable("lineas");
        if (locationMgr.isProviderEnabled(LocationManager.GPS_PROVIDER)) {
        	mostrarInfoProveedor();
        	LocationListener locListener = new LocationListener() {
        		 
        	    public void onLocationChanged(Location location) { 
        	    	if (!pausa) {
        	    		mostrarPosicion(location);
        	    	} else {
    					Toast.makeText(Recorrido.this, "Aplicacion en pausa", Toast.LENGTH_LONG).show();
        	    	}
        	    }        	    

				public void onProviderDisabled(String provider){
        	        
        	    }
        	 
        	    public void onProviderEnabled(String provider){

        	    }
        	 
        	    public void onStatusChanged(String provider, int status, Bundle extras){
        	    	if (!pausa) {
        	    		String estado;
        	    		switch (status) {
        	    		case LocationProvider.AVAILABLE:
        	    			estado = "DISPONIBLE";
        	    			break;
        	    		case LocationProvider.OUT_OF_SERVICE:
        	    			estado = "FUERA DE SERVICIO";
        	    			break;
        	    		case LocationProvider.TEMPORARILY_UNAVAILABLE:
        	    			estado = "TEMPORALMENTE NO DISPONIBLE";
        	    			break;
        	    		default:
        	    			estado = "SIN ESTADO";	
        	    		}
        	    		Toast.makeText(Recorrido.this, "Proveedor ha cambiado su estado a: " + estado + "", Toast.LENGTH_LONG).show();
        	    	} else {
    					Toast.makeText(Recorrido.this, "Aplicacion en pausa", Toast.LENGTH_LONG).show();
        	    	}
        	    }
        	};
            locationMgr.requestLocationUpdates(LocationManager.GPS_PROVIDER, 15000, 0, locListener);
        } else  {
        	Toast.makeText(this, "GPS DESACTIVADO POR FAVOR ACTIVELO", Toast.LENGTH_LONG).show();
        }
        final Button pausar = (Button) findViewById(R.id.pausar);
        pausar.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				if (!pausa) {
					pausar.setText("Reanudar");
					pausa = true;
					Toast.makeText(Recorrido.this, "Aplicacion en pausa", Toast.LENGTH_LONG).show();
				}  else {
					pausar.setText("Pausar");
					pausa = false;
				}
			}
		});
        
        final Button finalizar = (Button) findViewById(R.id.finalizar);
        finalizar.setOnClickListener( new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				finish();
			}
		});
    }


	private void mostrarInfoProveedor() {
    	Toast.makeText(this, "GPS ACTIVADO", Toast.LENGTH_LONG).show();		
	}
	
	private void mostrarPosicion(Location location) {
		if (location != null) {
			autobus.setPosicion(location);
			if (autobus.estaEnParada()) {
				autobus.alcanzarParada(lineas);
				//sigParada.setText(autobus.getSiguienteParada().toString());
				long tiempoActual = (new Date()).getTime();
				Date recorridoT = new Date(this.horaInicio-tiempoActual);
				tiempoRecorrido.setText(recorridoT.getHours() + ":" + recorridoT.getMinutes());
				Toast.makeText(this, "Hemos alcanzado la siguiente parada enviando datos.....", Toast.LENGTH_LONG).show();	
			}		
		} 
	}
}