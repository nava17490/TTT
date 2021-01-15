package lineas.interfaz;

import java.util.ArrayList;

import sistema.Datos;
import ttt.comunicacion.clases.Linea;
import ttt.comunicacion.cliente.Peticion;
import android.app.Dialog;
import android.app.ListActivity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;


public class main extends ListActivity {
	private Linea linea;
	private static final int DIALOG_PROGRESS = 1;
    private LineaAdapter m_adapter;
    private Runnable  viewOrders;
    private Dialog dialogo=null;
    private ArrayList<Linea> lineas;
	
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {    	
        super.onCreate(savedInstanceState);
        lineas = new ArrayList<Linea>();
        
        this.m_adapter = new LineaAdapter(this, R.layout.main, lineas);
        setListAdapter(this.m_adapter);
        
        viewOrders = new Runnable (){
            
            public void run() {
                getItems();
            }
        };
        Thread  thread =  new Thread (null, viewOrders, "MagentoBackground");
        thread.start();
        this.onCreateDialog(DIALOG_PROGRESS);

    }

    public Dialog onCreateDialog(int id) {
    	switch (id) {
    	case DIALOG_PROGRESS:
    		dialogo = ProgressDialog.show(main.this, "Listado de Lineas", "Cargando, espere .....", true);
    		break;
    	}
    	return dialogo;
    }
    
    private Runnable  returnRes = new Runnable () {

        
        public void run() {
            if(lineas != null && lineas.size() > 0){
                m_adapter.notifyDataSetChanged();
                for(int i=0;i<lineas.size();i++)
                	m_adapter.add(lineas.get(i));
            }
            dialogo.dismiss();
            m_adapter.notifyDataSetChanged();
        }
    };

    public void onListItemClick(ListView l, View v, int position, long id){
    	linea = (Linea)l.getItemAtPosition(position);
    	Datos.mostrarMapaLinea = true;
    	Datos.mostrarTodosAutobuses = false;
    	Intent intent = new Intent(this,Container.class);
    	Bundle bundle = new Bundle();
    	bundle.putSerializable("linea", linea);
    	intent.putExtras(bundle);
    	startActivity(intent);
    	finish();
    }    
    
    /*
     * Obtiene una lista de libros
     *
     * @returns ArrayList<Libro> libros
     */
    public ArrayList<Linea> getItems() {
        lineas = new ArrayList<Linea>();
        lineas = Peticion.pedir().resultado(Peticion.pedir().getLineas());
        runOnUiThread(returnRes);

        return lineas;
    }

    private class LineaAdapter extends ArrayAdapter<Linea> {
   	 
        private ArrayList<Linea> items;

        public LineaAdapter(Context context, int textViewResourceId, ArrayList<Linea> items) {
            super(context, textViewResourceId, items);
            this.items = items;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            View v = convertView;
            if (v == null) {
                LayoutInflater vi = (LayoutInflater) getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                v = vi.inflate(R.layout.main, null);
            }
            Linea linea = items.get(position);
            if (linea != null) {
                TextView tlinea = (TextView) v.findViewById(R.id.linea);
                TextView tsentido = (TextView) v.findViewById(R.id.sentido);
                if (tlinea != null) {
                    tlinea.setText(linea.getIdLinea());
                }
                if (tsentido != null) {
                    tsentido.setText(linea.getNombre());
                }
            }
            return v;
        }
    }

}

