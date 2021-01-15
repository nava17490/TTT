package lineas.interfaz;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import sistema.Datos;
import ttt.comunicacion.clases.Autobus;
import ttt.comunicacion.clases.Linea;
import ttt.comunicacion.clases.Parada;
import ttt.comunicacion.cliente.Peticion;

import com.google.android.maps.GeoPoint;
import com.google.android.maps.ItemizedOverlay;
import com.google.android.maps.MapActivity;
import com.google.android.maps.MapController;
import com.google.android.maps.MapView;
import com.google.android.maps.Overlay;
import com.google.android.maps.OverlayItem;
import com.google.android.maps.MapView.LayoutParams;

import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.Toast;


public class Mapa extends MapActivity 
{
	
	private static final int DIALOG_PROGRESS = 0;
	private MapView mapView; 
	private MapController mc;
    private MiItemizedOverlay itemizedoverlay; 
    private GeoPoint p;
    private List<Overlay> mapOverlays;
	private Runnable viewOrders;
	private ProgressDialog dialogo;
	private ArrayList<Autobus> autobuses;
	private ArrayList<Parada> paradas;


    	
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) 
    {
       super.onCreate(savedInstanceState);
       setContentView(R.layout.tab1);
       mapView = (MapView) findViewById(R.id.mapView);
        LinearLayout zoomLayout = (LinearLayout)findViewById(R.id.zoom);  
   		@SuppressWarnings("deprecation")
   		View zoomView = mapView.getZoomControls(); 

   		
   		
        zoomLayout.addView(zoomView, 
            new LinearLayout.LayoutParams(
                LayoutParams.WRAP_CONTENT, 
                LayoutParams.WRAP_CONTENT)); 
        mapView.displayZoomControls(true);

        if(Datos.mostrarTodosAutobuses){
        	viewOrders = new Runnable (){
                
                public void run() {
                    getAutobuses();
                }
            };  
            Thread  thread =  new Thread (null, viewOrders, "MagentoBackground");
	        thread.start();
	        this.onCreateDialog(DIALOG_PROGRESS);
        }else if (Datos.mostrarMapaLinea){
         	Bundle bundle = getIntent().getExtras();
         	Linea linea = (Linea) bundle.getSerializable("linea");
         	
    		centrarEnLinea(linea);        
        }        
    }
    
    public Dialog onCreateDialog(int id) {
    	switch (id) {
    	case DIALOG_PROGRESS:
    		dialogo = ProgressDialog.show(Mapa.this, "Bienvenido a la aplicacion TTT para el Control", "Cargando, espere .....", true);
    		break;
    	}
    	return dialogo;
    }

    public ArrayList<Autobus> getAutobuses(){
    	autobuses = new ArrayList<Autobus>();
        autobuses = Peticion.pedir().resultado(Peticion.pedir().getAutobuses());
        if (Datos.mostrarTodosAutobuses) this.runOnUiThread(todosAutobuses);
        return autobuses;
    }
    
    private Runnable  todosAutobuses = new Runnable () {

        
        public void run() {    
        	mostrarTodosAutobuses();
        	dialogo.dismiss();
        }
    };
        
    public ArrayList<Parada> getParadas() {
        paradas = new ArrayList<Parada>();
        paradas = Peticion.pedir().resultado(Peticion.pedir().getParadas());
        return paradas;
    }
    
	private void mostrarTodosAutobuses() {
    	mc = mapView.getController();
    	String coordinates[]= {"40.341331","-1.108232"};
    	double lat = Double.parseDouble(coordinates[0]);
    	double lng = Double.parseDouble(coordinates[1]);
        p = new GeoPoint((int)(lat* 1E6), (int)(lng* 1E6));
        mc.animateTo(p);
        mc.setZoom(16);
        mapView.invalidate();
        mapOverlays = mapView.getOverlays();
    	Drawable drawable = this.getResources().getDrawable(R.drawable.busmap);
    	itemizedoverlay = new MiItemizedOverlay(this, drawable);
    	
        mostrarAutobuses(autobuses);
	}
    
	private void mostrarAutobuses(List<Autobus> autobusesLinea) {
		Iterator<Autobus> i = autobusesLinea.iterator();
		while (i.hasNext()) {
			Autobus autobus = i.next();			
			itemizedoverlay.addLocalizacion(autobus.getUltimaParada().getLatitud(), autobus.getUltimaParada().getLongitud(), "Autobus " + autobus.getIdAutobus());
		}
		mapOverlays.add(itemizedoverlay);
	}
	

    private void centrarEnLinea(Linea linea) {
    	mostrarParadasLinea(linea);
		List<Autobus> autobuses = getAutobuses();
		List<Autobus> autobusesLinea = new ArrayList<Autobus>();
		Iterator<Autobus> i = autobuses.iterator();
		while (i.hasNext()) {
			Autobus autobus = i.next();
			if (autobus.getLinea().equals(linea)) {
				autobusesLinea.add(autobus);
			}
		}
    	Drawable drawable = this.getResources().getDrawable(R.drawable.busmap);
    	itemizedoverlay = new MiItemizedOverlay(this, drawable);
		mostrarAutobuses(autobusesLinea);
	}
    
	private void mostrarParadasLinea(Linea linea) {
		mc = mapView.getController();
    	String coordinates[]= {"40.341331","-1.108232"};
    	double lat = Double.parseDouble(coordinates[0]);
    	double lng = Double.parseDouble(coordinates[1]);
        p = new GeoPoint((int)(lat* 1E6), (int)(lng* 1E6));
        mc.animateTo(p);
        mc.setZoom(16);
        mapView.invalidate();
        mapOverlays = mapView.getOverlays();
    	Drawable drawable = this.getResources().getDrawable(R.drawable.parada);
    	itemizedoverlay = new MiItemizedOverlay(this, drawable);
    	ArrayList<Parada> paradas = linea.getParadas();
        mostrarParadas(paradas);
		
	}

	private void mostrarParadas(ArrayList<Parada> paradas) {
		Iterator<Parada> i = paradas.iterator();
    	while(i.hasNext()){    	
    		Parada parada = i.next();
    		itemizedoverlay.addLocalizacion(parada.getLatitud(),parada.getLongitud(),"Parada " + parada.getIdParada());
    	}
    	mapOverlays.add(itemizedoverlay);
	}

	@Override
	protected boolean isRouteDisplayed() {
		// TODO Auto-generated method stub
		return false;
	}

	public class MiItemizedOverlay extends ItemizedOverlay <OverlayItem>{

		private ArrayList<OverlayItem> mOverlays = new ArrayList<OverlayItem>();
		private Context context;
		public MiItemizedOverlay(Context context, Drawable defaultMarker){
			super(boundCenterBottom(defaultMarker));
			this.context = context;
		}

	    
		public void addLocalizacion(double lat, double lon, String etiqueta){
			int lt = (int) (lat * 1E6);
			int ln = (int) (lon * 1E6);
			GeoPoint punto = new GeoPoint (lt, ln);
			OverlayItem item = new OverlayItem (punto, etiqueta, null);
			mOverlays.add(item);
			populate();
		}
		public void clear(){
			mOverlays.clear();
			populate();
		}
		
		@Override
		protected OverlayItem createItem(int i) {
			return mOverlays.get(i);
		}

		@Override
		public int size() {
			return mOverlays.size();
		}
		
		@Override
		protected boolean onTap(int index){
			GeoPoint punto = mOverlays.get(index).getPoint();
			Autobus autobus = obtenerAutobus(punto);
			if (autobus!= null){
				Intent intent = new Intent(Mapa.this, DetalleAutobus.class);
				Bundle bun = new Bundle();
				bun.putSerializable("autobus", autobus);
		    	intent.putExtras(bun);
		    	startActivity(intent); 				
			}
			return false;
		}


		private Autobus obtenerAutobus(GeoPoint punto) {
			ArrayList<Autobus> autobuses = getAutobuses();
        	Iterator<Autobus> i = autobuses.iterator();
    		while(i.hasNext()){    	    	
        		Autobus autobus =i.next();
        		if (autobus.getUltimaParada().getLatitud()* 1E6==punto.getLatitudeE6() && autobus.getUltimaParada().getLongitud()* 1E6==punto.getLongitudeE6()){
        			return autobus;
        		}
    		}
    		return null;
		}
	}
}

