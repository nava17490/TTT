<%-- 
    Document   : contacto
    Created on : 07-jun-2011, 19:50:54
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
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
        
        <h1 style="width:1000px;text-align:center;">Contacte con nosotros</h1><br /><br /><br /><br />
        <form action="javascript:enviar(this)" method="POST">
        <div style="width:176px;height:30px;margin-right:412px;margin-left:412px;clear:both;">
        	<div style="float:left;padding-top:4px;">Nombre: </div>
        	<input type="text" name="nombre" style="float:right;"><br />
        </div>
        <div style="width:176px;height:30px;margin-right:412px;margin-left:412px;clear:both;">
        	<div style="float:left;padding-top:4px;">E-mail:  </div>
        	<input type="text" name="mail" style="float:right;"><br />
        </div>
        <div style="width:176px;height:30px;margin-right:412px;margin-left:412px;clear:both;">
        	<div style="float:left;padding-top:4px;">Asunto:  </div>
        	<input type="text" name="asunto" style="float:right;"><br />
        </div>

            Contenido: <br /><textarea cols="50" rows="20" name="contenido"></textarea><br />
            <input type="reset" name="limpiar">
            <input type="submit" name="enviar">
        </form>
    </div>
	<h5 style="width:1000px;"><a href="javascript: history.go(-1)">Volver</a> - <a href="./ayuda.jsp">Ayuda para el viajero</a> - <a href="mapa.jsp">Mapa web</a></h5>
	</div>

    </body>
</html>
