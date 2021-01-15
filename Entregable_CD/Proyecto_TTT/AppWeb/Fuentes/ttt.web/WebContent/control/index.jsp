<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="ttt.cliente.web.Comunicacion_UI"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Control de Tiempos de Transporte de Teruel</title>
    <link rel='stylesheet' type='text/css' href='../estilos/estilos.css' />
    <link rel="icon" type="image/png"  href='../imagenes/favicon.png' />
    <script type="text/javascript" src="../javascript/cargaCodigo.js"></script>
    <!-- TODO: Introducir clave sensor=false;key=dasdasdadasdas"-->
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&region=ES"></script>
    <script type="text/javascript">
	var map;
	var positions;
	var positionsBus;
	var paradas;
	var autobuses;
	var ruta;
    function initialize() {
    	var myLatlng = new google.maps.LatLng(40.341331, -1.108232);
    	var myOptions = {
      		zoom: 13,
      		center: myLatlng,
      		mapTypeId: google.maps.MapTypeId.ROADMAP
    	}
    	map = new google.maps.Map(document.getElementById("vistamapa"), myOptions);
		positions = new Array();
		positionsBus = new Array();
		paradas = new Array();
		autobuses = new Array();
		ruta = new google.maps.Polyline();
		todos();
	}
    </script>
    
</head>

<body onload="initialize()">
<div id="pagina">
	
  	<div id="cabecera">
    	<a href='index.jsp'><img src="../imagenes/cabecera.png" alt="Control de Tiempos de Transporte de Teruel" /></a>
	</div>
    
    <div id="contenedor">
    	<div id="listalineas">
        	<div id="todas" onclick="todos()" onmouseover="this.style.cursor='pointer';">
            	<h1>Todos los autobuses</h1>
            	<script type="text/javascript">
				function todos() {
					//limpiar detalle
					document.getElementById('detalle').innerHTML = '';
					//barra lateral
					deseleccionarTodo();
					document.getElementById('todas').style.backgroundColor='#990000';
					document.getElementById('todas').style.color='#FFFFFF';
					
					//inicializaciones de positions y paradas en script inicializacion
					var fileref=document.createElement('script');
			  		fileref.setAttribute("type","text/javascript");
			  		fileref.setAttribute("src", "autobusControl.jsp");
			  		document.getElementsByTagName("head")[0].appendChild(fileref);
				}
				</script>	
            </div>
            <script type="text/javascript">
			function deseleccionarTodo() {
				
				//quitar puntos de paradas mapa
				for (var i in paradas)
				{
					paradas[i].setMap(null);
				}
				paradas = [];
				positions = [];
				positionsBus = [];
				//quitar ruta del mapa
				ruta.setMap(null);
				//quitar puntos de autobuses del mapa
				for (var i in autobuses)
				{
					autobuses[i].setMap(null);
				}
				autobuses = [];
				//quitar seleccion barra lateral
				document.getElementById('todas').style.backgroundColor='transparent';
				document.getElementById('todas').style.color='#990000';
		<%=Comunicacion_UI.lineas(true)%>

        </div>
        <div id="mapa">
        	<div id="vistamapa">
        	</div>
        	<div id="buscar">
            	<script type="text/javascript">
            	function centrarMapa() {
					var geocoder = new google.maps.Geocoder();
    				var address = document.getElementById("direccion").value + ", teruel";
    				if (geocoder) {
      					geocoder.geocode( { 'address': address}, function(results, status) {
        					if (status == google.maps.GeocoderStatus.OK) {
								map.setZoom(16);
          						map.panTo(results[0].geometry.location);
        					} else {
          						alert("No se ha encontrado la dirección indicada");
        					}
      					});
    				}
				}
				</script>      
        		<input id="direccion" type="textbox" value="Centrar mapa en..." style="width:160px" onkeydown="if (event.keyCode == 13) centrarMapa()" onclick="if (value=='Centrar mapa en...') value=''">
    			<input type="button" value="Centrar mapa" onclick="centrarMapa()">
        	</div>
        </div>
        <div id="detalle">
            
    	</div>
    
    
	</div>
            <h5 style="width:1000px;"><a href="../viajero/ayuda.jsp">Ayuda para el viajero</a> - <a href="../DesautenticarControl">Salir del modo de Control</a> - <a href="../viajero/mapa.jsp">Mapa web</a> - <a href="../viajero/contacto.jsp">Contacto</a></h5>

</body>

</html>
