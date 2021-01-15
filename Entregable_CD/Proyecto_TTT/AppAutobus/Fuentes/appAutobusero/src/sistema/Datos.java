package sistema;

import java.io.InputStream;
import java.util.ArrayList;

import ttt.comunicacion.clases.*;

public class Datos {
	private static InputStream servidorIS;
	private static InputStream autobusIS;

	public static InputStream getServidorIS() {
		return servidorIS;
	}
	
	public static InputStream getAutobusIS() {
		return autobusIS;
	}
	
	public static void setServidorIS(InputStream canal) {
		servidorIS = canal;
	}
	
	public static void setAutobusIS(InputStream canal) {
		autobusIS = canal;
	}
	
}
