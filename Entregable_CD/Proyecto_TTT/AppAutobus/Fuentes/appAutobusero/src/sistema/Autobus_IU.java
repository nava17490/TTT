package sistema;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Iterator;
import java.util.Properties;
import android.location.Location;
import android.location.LocationManager;
import ttt.comunicacion.clases.*;
import ttt.comunicacion.cliente.*;

public class Autobus_IU extends Autobus {

	private static final long serialVersionUID = 3390986811962751185L;
	private Parada siguienteParada;
	private long tiempoParada;
	private boolean enRuta;
	private int radio = 5;
	private Location posicion;
	private Linea linea;

	public Autobus_IU() {
		super();
		// Cargar propiedades del fichero de configuracion
		Properties propBus = new Properties();
		InputStream fis;
		try {
			fis = Datos.getAutobusIS();
			propBus.loadFromXML(fis);
			radio = Integer.parseInt(propBus.getProperty("radio"));
		} catch (FileNotFoundException e) {
			radio = 5;
			System.err.println("Se ha producido un error leyendo etc/autobus.xml");
			e.printStackTrace();
		} catch (InvalidPropertiesFormatException e) {
			radio = 5;
			System.err.println("Se ha producido un error leyendo etc/autobus.xml");
			e.printStackTrace();
		} catch (IOException e) {
			radio = 5;
			System.err.println("Se ha producido un error leyendo etc/autobus.xml");
			e.printStackTrace();
		}
}

public Autobus_IU(int idAutobus, Linea linea, Parada ultimaParada, double velocidad) {
	super(idAutobus, linea, ultimaParada, velocidad);
	this.enRuta=false;
	// Cargar propiedades del fichero de configuracion
	Properties propBus = new Properties();
	InputStream fis;
	try {
		fis = Datos.getAutobusIS();
		propBus.loadFromXML(fis);
		radio = Integer.parseInt(propBus.getProperty("radio"));
	} catch (FileNotFoundException e) {
		radio = 5;
		System.err.println("Se ha producido un error leyendo etc/autobus.xml");
		e.printStackTrace();
	} catch (InvalidPropertiesFormatException e) {
		radio = 5;
		System.err.println("Se ha producido un error leyendo etc/autobus.xml");
		e.printStackTrace();
	} catch (IOException e) {
		radio = 5;
		System.err.println("Se ha producido un error leyendo etc/autobus.xml");
		e.printStackTrace();
	}
}

public void setLinea(Linea linea) {
	this.linea=linea;
}

public boolean comenzarRuta() {
	if (!enRuta && getIdAutobus() > -1 && getLinea() != null) {
		enRuta = true;
		//siguienteParada = this.getLinea().getParadas().get(0);
		//this.enviarDatos();
		return true;
	} else {
		return false;
	}
}

protected void enviarDatos(){
	/*if (Peticion.pedir().resultado(Peticion.pedir().establecerInfoBus(this))==null) {
		System.err.println("hola esto peta");
	}*/
	Peticion.pedir().establecerInfoBus(new Autobus(this.getIdAutobus(), this.getLinea(), this.getSiguienteParada(), this.getVelocidad()));
}

public int getDistancia(Location posicion1,Location posicion2) {
// Devuelve los metros entre dos Location en valor absoluto
	return (int)posicion1.distanceTo(posicion2);
}

public boolean estaEnParada() {	
	Location posicionParada = new Location(LocationManager.GPS_PROVIDER);
	if (this.siguienteParada==null) {//SI INICIA RUTA FIJA UNA PARADA POR DEFECTO
		siguienteParada = this.getLinea().getParadas().get(0);
	}
	posicionParada.setLatitude(this.siguienteParada.getLatitud());
	posicionParada.setLongitude(this.siguienteParada.getLongitud());
	return this.getDistancia(posicion, posicionParada)<=this.radio;
}

public Parada alcanzarParada(ArrayList<Linea> lineas) {
	setUltimaParada(siguienteParada);
	siguienteParada = this.getLinea().siguienteParada(siguienteParada);
	long tiempoParadaNueva = System.currentTimeMillis();
	setVelocidad((siguienteParada.getDistanciaAnterior()/(tiempoParadaNueva-tiempoParada))*3.6);
	this.tiempoParada=tiempoParadaNueva;
	this.enviarDatos();
	if (siguienteParada == null) {
		this.cambiarSentido(lineas);
	}
	return siguienteParada;
}

private void cambiarSentido(ArrayList<Linea> lineas) {
	Iterator<Linea> i = lineas.iterator();
	Linea lineaAux;
	while (i.hasNext()) {
		lineaAux = i.next();
		if (lineaAux.getIdLinea().equals(this.linea.getIdLinea()) && lineaAux.getSentido() != this.linea.getSentido()) {
			this.linea = lineaAux;
			this.siguienteParada = this.linea.getParadas().get(0);
			break;
		}
	}
}

public Parada getSiguienteParada() {
	return this.siguienteParada;
}

protected void setSiguienteParada(Parada siguienteParada) {
	this.siguienteParada = siguienteParada;
}

public void setPosicion(Location posicion2) {
	this.posicion = posicion2;
}

public Parada getPrimeraParada() {
	Parada parada = this.linea.getParadas().get(0);
	this.siguienteParada = parada;
	return parada;
}


}