package lineas.interfaz;

import java.util.ArrayList;

import sistema.Datos;
import ttt.comunicacion.clases.Autobus;
import ttt.comunicacion.clases.Linea;
import ttt.comunicacion.cliente.Peticion;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.ListActivity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;


public class main extends ListActivity {
    private static final int DIALOG_ALERT = 0;
	private static final int DIALOG_PROGRESS = 1;
	private Linea linea;
    private ArrayList<Linea> lineas;
    private LineaAdapter m_adapter;
    private Runnable  viewOrders;
    private Dialog dialogo=null;
    
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Datos.setAutobusIS(getResources().openRawResource(R.raw.autobus));
        Datos.setServidorIS(getResources().openRawResource(R.raw.servidor));
        lineas = new ArrayList<Linea>();
        this.m_adapter = new LineaAdapter(this, R.layout.main, lineas);
        setListAdapter(this.m_adapter);
        
        viewOrders = new Runnable (){
            @Override
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
    	case DIALOG_ALERT:
    		AlertDialog.Builder builder = new AlertDialog.Builder(this);
    		builder.setMessage("¿Seguro que va a recorrer la linea " + linea.toString()+ "?");
    		builder.setCancelable(false);
    		builder.setNegativeButton("No", new DialogInterface.OnClickListener() {
				
				@Override
				public void onClick(DialogInterface dialog, int which) {
					dialog.cancel();					
				}
			});
    		builder.setPositiveButton("Sí", new DialogInterface.OnClickListener() {
				
				@Override
				public void onClick(DialogInterface dialog, int which) {				   	
			    	Intent intent = new Intent(main.this, Autobuses.class);
			    	Bundle bundle = new Bundle();
			    	bundle.putSerializable("linea", linea);
			    	bundle.putSerializable("lineas", lineas);
			    	intent.putExtras(bundle);
			    	startActivity(intent);
			    	finish();
				}
			});
    		dialogo = builder.create();
    		break;
    	case DIALOG_PROGRESS:
    		dialogo = ProgressDialog.show(main.this, "Bienvenido a la aplicacion TTT para el Autobús", "Cargando, espere .....", true);
    		break;
    	}
    	return dialogo;
    }
    
    private Runnable  returnRes = new Runnable () {

        @Override
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
    
    public void onListItemClick(ListView l, View v, int position, long id) {
    	linea = (Linea)l.getItemAtPosition(position);
    	dialogo = null;
    	this.onCreateDialog(DIALOG_ALERT).show();
    }
    
    public void getItems() {
        lineas = new ArrayList<Linea>();
        lineas = Peticion.pedir().resultado(Peticion.pedir().getLineas());        
        runOnUiThread(returnRes);
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

