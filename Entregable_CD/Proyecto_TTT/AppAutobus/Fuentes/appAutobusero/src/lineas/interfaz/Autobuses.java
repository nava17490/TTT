package lineas.interfaz;

import ttt.comunicacion.clases.Autobus;
import ttt.comunicacion.clases.Linea;
import ttt.comunicacion.cliente.Peticion;
import lineas.interfaz.R;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class Autobuses extends Activity {
	private static final int DIALOG_ALERT = 0;
	private Dialog dialogo = null;
	private String idBus;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.autobuses);
		final Button enviar = (Button)findViewById(R.id.aceptar);
		enviar.setOnClickListener(new View.OnClickListener() {		
			
			public void onClick(View v) {
				EditText numBus=(EditText)findViewById(R.id.autobus);
				idBus = numBus.getText().toString();	
				Autobuses.this.onCreateDialog(DIALOG_ALERT).show();
			}
		});
		final Button cancelar = (Button)findViewById(R.id.cancelar);
		cancelar.setOnClickListener(new View.OnClickListener() {			
			public void onClick(View v) {
				Intent intent = new Intent(Autobuses.this, main.class);
				startActivity(intent);
				finish();				
			}
		});
	}

	public Dialog onCreateDialog(int id) {
    	switch (id) {
    	case DIALOG_ALERT:
    		AlertDialog.Builder builder = new AlertDialog.Builder(this);
    		builder.setMessage("¿Seguro que el autobus que va a conducir es el " + idBus+ "?");
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
					Intent intent = new Intent(Autobuses.this, ComienzoRuta.class);
					Bundle bundle = new Bundle();
					bundle.putString("idBus", idBus);
					bundle.putSerializable("linea", getIntent().getExtras().getSerializable("linea"));
					bundle.putSerializable("lineas", getIntent().getExtras().getSerializable("lineas"));
					intent.putExtras(bundle);
				    startActivity(intent);
				    finish();
				}
			});
    		dialogo = builder.create();
    		break;
    	}
    	return dialogo;
	}
	
}
