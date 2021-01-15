package lineas.interfaz;



import java.text.SimpleDateFormat;
import java.util.Calendar;

import ttt.comunicacion.clases.Autobus;
import ttt.comunicacion.clases.Linea;
import ttt.comunicacion.cliente.Peticion;
import lineas.interfaz.R;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import sistema.Autobus_IU;

public class ComienzoRuta extends Activity { 
    final int GET_NUM_AUTOBUS=1;
    final int GET_LINEA=2;
    final int COMENZAR=3;
    
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.comienzo_ruta);
        Bundle bundle = getIntent().getExtras(); 
        final Linea l = (Linea) bundle.getSerializable("linea");
        final String idBus = bundle.getString("idBus");
        TextView linea = (TextView) findViewById(R.id.linea);
        linea.setText("Linea: " + l.toString());
        TextView autobus = (TextView) findViewById(R.id.autobus);
        autobus.setText("Autobus: " + idBus);
        final Button comenzar = (Button) findViewById(R.id.comenzar);        
        comenzar.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
            	Autobus_IU autobusIU= new Autobus_IU(Integer.parseInt(idBus), l, null, 0.0);//COMO OBTENGO LINEA Y PARADA SI SOLO TENGO EL ID??
            	//Datos.getInstance().setAutobus(autobus);
            	Intent intent = new Intent(ComienzoRuta.this, Recorrido.class);
            	Bundle bundle = new Bundle();
            	bundle.putSerializable("autobus", autobusIU);
            	bundle.putSerializable("lineas", getIntent().getExtras().getSerializable("lineas"));
            	intent.putExtras(bundle);
            	startActivity(intent);
            	finish();
            }
        }); 
        
        final Button volver = (Button) findViewById(R.id.volver);
        volver.setOnClickListener( new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				Intent intent = new Intent(ComienzoRuta.this, Autobuses.class);
            	Bundle bundle = new Bundle();
            	bundle.putSerializable("linea", getIntent().getExtras().getSerializable("linea"));
            	bundle.putSerializable("lineas", getIntent().getExtras().getSerializable("lineas"));
            	intent.putExtras(bundle);
            	startActivity(intent);
				finish();
			}
		});
        TextView hora = (TextView)findViewById(R.id.hora);
        SimpleDateFormat sf = new SimpleDateFormat("HH:mm"); 
        Calendar calendari = Calendar.getInstance(); 
        hora.setText(sf.format(calendari.getTime())); 
        
        //Datos.servidorIS = getResources().openRawResource(R.raw.servidor);
        //Datos.autobusIS = getResources().openRawResource(R.raw.autobus);*/
        
    }  
    
  
}        