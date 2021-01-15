package lineas.interfaz;

import java.util.ArrayList;

import ttt.comunicacion.clases.Autobus;
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
import android.widget.BaseAdapter;
import android.widget.ListView;
import android.widget.TextView;



public class Autobuses extends ListActivity {

	
	private static final int DIALOG_PROGRESS = 0;
	private Runnable viewOrders;
	private ProgressDialog dialogo;

    private ArrayList<Autobus> autobuses;
	private AutobusAdapter m_adapter;
	
	/** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {    	
        super.onCreate(savedInstanceState);		
        autobuses = new ArrayList<Autobus>();
        this.m_adapter = new AutobusAdapter(this, R.layout.tab2, autobuses);
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
    		dialogo = ProgressDialog.show(Autobuses.this, "Listado de Autobuses", "Cargando, espere .....", true);
    		break;
    	}
    	return dialogo;
    }
    
    private Runnable  returnRes = new Runnable () {

        

		public void run() {
            if(autobuses != null && autobuses.size() > 0){
                m_adapter.notifyDataSetChanged();
                for(int i=0;i<autobuses.size();i++) 
                	m_adapter.add(autobuses.get(i));
            }
            dialogo.dismiss();
            m_adapter.notifyDataSetChanged();
        }
    };

    
	    
    public void onListItemClick(ListView l, View v, int position, long id){
    	Autobus autobus = (Autobus)l.getItemAtPosition(position);
    	Intent intent = new Intent(this, DetalleAutobus.class);
    	Bundle bundle = new Bundle();
    	bundle.putSerializable("autobus", autobus);
    	intent.putExtras(bundle);
    	startActivity(intent);

    }

    public ArrayList<Autobus> getItems() {
        autobuses = new ArrayList<Autobus>();
        autobuses = Peticion.pedir().resultado(Peticion.pedir().getAutobuses());
        this.runOnUiThread(returnRes);
        return autobuses;
    }

    private class AutobusAdapter extends ArrayAdapter<Autobus> {
   	 
        private ArrayList<Autobus> items;

        public AutobusAdapter(Context context, int textViewResourceId, ArrayList<Autobus> items) {
            super(context, textViewResourceId, items);
            this.items = items;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            View v = convertView;
            if (v == null) {
                LayoutInflater vi = (LayoutInflater) getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                v = vi.inflate(R.layout.tab2, null);
            }
            Autobus autobus = items.get(position);
            if (autobus != null) {
                TextView tautobus = (TextView) v.findViewById(R.id.autobus);
                if (tautobus != null) {            	
                    tautobus.setText(autobus.toString());              
                }
            }
            return v;
        }
    }
}
