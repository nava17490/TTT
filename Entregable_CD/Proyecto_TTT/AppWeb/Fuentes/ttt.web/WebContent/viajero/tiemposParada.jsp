<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="ttt.cliente.web.Comunicacion_UI"%>

<%	// Obtener informacion de la parada a tratar
	int idParada;
	if (request.getParameter("idParada") != null)
		idParada = Integer.parseInt(request.getParameter("idParada"));
	else idParada = -1;
	String direccion;
	if (request.getParameter("direccion") != null)
		direccion = request.getParameter("direccion");
	else direccion = "";
	direccion = direccion.replace("Ã±","ñ");
	direccion = direccion.replace("Ã¡","á");
	direccion = direccion.replace("Ã©","é");
	direccion = direccion.replace("Ã³","ó");
	direccion = direccion.replace("Âº","º");
	direccion = direccion.replace("Ã­","í");
	
	double latitud;
	if (request.getParameter("latitud") != null)
		latitud = Double.parseDouble(request.getParameter("latitud"));
	else latitud = -1;
	
	double longitud;
	if (request.getParameter("longitud") != null)
		longitud = Double.parseDouble(request.getParameter("longitud"));
	else longitud = -1;
	
%>

        	<div id="titulodetalle">
            	<h1 style="width: 210px;"><%=direccion%></h1>
            </div>
        	<div class="botonesopciones">
            	<div class="botonesopciones" style="width:100px;"
            	onmouseover="this.style.cursor='pointer'" 
            	onclick="bookmarkurl='http://155.210.68.122:8080/ttt.web/viajero/parada.jsp?idParada=<%=idParada%>&direccion=<%=direccion%>&latitud=<%=latitud%>&longitud=<%=longitud%>';
					bookmarktitle='TTT: Parada en <%=direccion%>';
				if (document.all)
					window.external.AddFavorite(bookmarkurl,bookmarktitle);
				else if (window.sidebar) // firefox
					window.sidebar.addPanel(bookmarktitle, bookmarkurl, '');">
            		<h5>Añadir marcador</h5>
                </div>
            	<div class="botonesopciones" style="width:100px;" 
            	onmouseover="this.style.cursor='pointer'" 
            	onclick="map.panTo(new google.maps.LatLng(<%=latitud%>, <%=longitud%>)); map.setZoom(16);">
	                <h5>Mostrar en mapa</h5>
                </div>
            </div>


<%=Comunicacion_UI.tiemposViajero(idParada)%>

           
        	<div class="botonrefresco"
        	onclick="load('detalle','tiemposParada.jsp?idParada=<%=idParada%>&direccion=<%=direccion%>&latitud=<%=latitud%>&longitud=<%=longitud%>');">
	                <h5 style="width:220px;">Refrescar tiempos</h5>
            </div>           
