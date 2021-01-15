package lineas.interfaz;

import java.util.ArrayList;

import ttt.comunicacion.clases.Autobus;
import ttt.comunicacion.clases.Linea;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class DetalleAutobus extends Activity {
	
	public void onCreate(Bundle savedInstanceState) {    	
        super.onCreate(savedInstanceState);	
        setContentView(R.layout.detalle_autobus);
		Bundle recibidos = getIntent().getExtras();		

		Autobus autobus = (Autobus) recibidos.getSerializable("autobus");
        
		final Button volver = (Button)findViewById(R.id.volver); 
		volver.setOnClickListener(new View.OnClickListener() {
			
			public void onClick(View v) {
				finish();
			}
		});
		
		TextView autobusTV = (TextView) findViewById(R.id.autobus);
		autobusTV.setText("Autobus: " + autobus.getIdAutobus());
		
		TextView ultimaParada = (TextView) findViewById(R.id.ultima_parada);
		ultimaParada.setText("Ultima Parada: " + autobus.getUltimaParada().toString());
		
		TextView velocidad = (TextView) findViewById(R.id.velocidad);
		velocidad.setText("Velocidad: " + autobus.getVelocidad() + " Km/h");

		TextView linea = (TextView) findViewById(R.id.linea);
		linea.setText(autobus.getLinea().toString());
		
    }
	
	
	
	
}
