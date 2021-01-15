<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="ttt.cliente.web.Comunicacion_UI"%>

<%	// Obtener informacion del autobús a tratar
	int id;
	if (request.getParameter("id") != null)
		id = Integer.parseInt(request.getParameter("id"));
	else id = -1;
%>

        	<div id="titulodetalle">
            	<h1 style="width: 210px;">Autobús <%=id%></h1>
            </div>
        	<div class="botonesopciones">
            	<div class="botonesopciones" style="width:100px;"
            	onmouseover="this.style.cursor='pointer'" 
            	onclick="bookmarkurl='http://155.210.68.122:8080/ttt.web/control/autobus.jsp?id=<%=id%>';
					bookmarktitle='TTT: Autobús <%=id%>';
				if (document.all)
					window.external.AddFavorite(bookmarkurl,bookmarktitle);
				else if (window.sidebar) // firefox
					window.sidebar.addPanel(bookmarktitle, bookmarkurl, '');">
            		<h5>Añadir marcador</h5>
                </div>
            	<div class="botonesopciones" style="width:100px;">
            	</div>
            </div>


			<%=Comunicacion_UI.detalleAutobus(id)%>

           
        	<div class="botonrefresco" 
        	onclick="load('detalle','detalleAutobus.jsp?id=<%=id%>');">
	                <h5 style="width:220px;">Refrescar datos</h5>
            </div>           

            