<%-- 
    Document   : ayuda
    Created on : 12-jun-2011, 0:04:04
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Tiempos de Transporte de Teruel</title>
    <link rel='stylesheet' type='text/css' href='../estilos/estilos.css' />
    <link rel="icon" type="image/png"  href='../imagenes/favicon.png' />
    <script type="text/javascript">
        function enviar(obj) {
            alert("Mensaje enviado con éxito.");
        }
    </script>
    </head>
    <body>
        <div id="pagina">

  	<div id="cabecera">
    	<a href='index.jsp'><img src="../imagenes/cabecera.png" alt="Tiempos de Transporte de Teruel" /></a>
	</div>

    <div id="contenedor" style="padding-bottom:20px;">
        <div id="listalineas" style="padding-left:20px;">
            <h1>Temas de ayuda<br /></h1>
            <h2><a href="#datos_parada">Ver datos de una parada</a><br /></h2>
            <h2><a href="#add_favoritos">Añadir una parada a favoritos</a><br /></h2>
            <h2><a href="#contactar">Contactar con la empresa</a><br /></h2>
        </div>
        <div id="mapa">
            <h1 style="text-align:center;width:100%;">Contenido de la ayuda</h1><br /><br /><br />
            <h2 style="text-align:left;width:100%;">Ver datos de una parada</h2><br /><br /><br />
            <a name="datos_parada"></a>
            <p align="left">
                Siga los siguientes pasos:<br />
                1) Seleccione la linea en la lista de la izquierda o seleccione la opcion de todas las paradas.<br />
                2) Haga click sobre la parada en el mapa.<br />
            </p>
            <h2 style="text-align:left;width:100%;">Añadir una parada a favoritos</h2><br /><br /><br />
            <a name="add_favoritos"></a>
            <p align="left">
                Siga los siguientes pasos:<br />
                1) Seleccionar la linea y el sentido en el menu de la izquierda.<br />
                2) Hacer click en la parada en el mapa.<br />
                3) Pulsar el boton de añadir a favoritos.<br />
            </p>
            <h2 style="text-align:left;width:100%;">Contactar con la empresa</h2><br /><br /><br />
            <a name="contactar"></a>
            <p align="left">
                Siga los siguientes pasos:<br />
                1) Seleccionar contactar.<br />
                2) Rellenar los datos de contacto.<br />
                3) Rellenar el contenido de la consulta.<br />
                4) Pulsar el boton de Enviar.<br />
            </p>
        </div>
    </div>
	<h5 style="width:1000px;"><a href="javascript: history.go(-1)">Volver</a> - <a href="mapa.jsp">Mapa web</a> - <a href="contacto.jsp">Contacto</a></h5>
	</div>

    </body>
    </body>
</html>
