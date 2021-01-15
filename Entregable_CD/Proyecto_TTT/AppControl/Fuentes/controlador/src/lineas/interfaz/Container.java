package lineas.interfaz;

import sistema.Datos;
import ttt.comunicacion.clases.Linea;
import android.app.TabActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.TabHost;

public class Container extends TabActivity {
	private static final int MNU_MAP_OPC2 = 0;
	private static final int MNU_MAP_OPC1 = 0;

	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		TabHost host = getTabHost();
		Intent intent = new Intent(this, Mapa.class);
		Bundle bundle = new Bundle();

		if (Datos.mostrarMapaLinea){
			Bundle recibidos = getIntent().getExtras();			
			Linea linea = (Linea) recibidos.getSerializable("linea");
			bundle.putSerializable("linea", linea);
		} 
		intent.putExtras(bundle);		
		host.addTab(host.newTabSpec("mapa").setIndicator("Mapa").setContent(intent));//Falla aqui
		host.addTab(host.newTabSpec("autobuses").setIndicator("Autobuses").setContent(new Intent(this, Autobuses.class)));
		host.addTab(host.newTabSpec("main").setIndicator("Lineas").setContent(new Intent(this, main.class)));
		
	}

	public boolean onCreateOptionsMenu(Menu menu) {
	    menu.add(Menu.NONE, MNU_MAP_OPC1, Menu.NONE, "Salir");
	    return true;
	}
	
	public boolean onOptionsItemSelected(MenuItem item) {
	    switch (item.getItemId()) {
	        case MNU_MAP_OPC1:
	        	salir();
	            return true;
	        default:
	            return super.onOptionsItemSelected(item);
	    }
	}

	private void salir() {
		finish();
	}
	

}
