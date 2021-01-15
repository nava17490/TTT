<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Control de Tiempos de Transporte de Teruel</title>
    <link rel='stylesheet' type='text/css' href='../estilos/estilos.css' />
    <link rel="icon" type="image/png"  href='../imagenes/favicon.png' />
</head>
    
<body>
 <div id="pagina">
	
  	<div id="cabecera">
    	<a href='index.jsp'><img src="../imagenes/cabecera.png" alt="Control de Tiempos de Transporte de Teruel" /></a>
	</div>
	<div id="contenedor">

        
        <div class='lineaform' style='height:50px;'>
        </div>
        <div class='lineaform' style='padding-bottom:30px;'>
        <% 
		if (request.getSession(true).getAttribute("Autenticado")!=null)
				out.print("<h1>Autenticado como " + 
						request.getSession(true).getAttribute("Autenticado") + "</h1>");
		else out.print("<h1>Introduzca los datos para acceder a la aplicación</h1>");
		%>
   		</div>
   		
        <form name="AutenticarControl" action="../AutenticarControl" method="post">
        	<div class='lineaform'>
        		<h3 style='width:220px;text-align:right;'>Identificador de personal de control</h3>
        		<input type="text" name="usuario" value="Introduzca su identificador de personal de control" 
        			style="width:280px" 
        			onkeydown="if (event.keyCode == 13) document.AutenticarControl.password.focus()" 
        			onclick="if (value=='Introduzca su identificador de personal de control') value=''"/>
        	</div>
        	<div class='lineaform'>
        		<h3 style='width:220px;text-align:right;'>Contraseña de personal de control</h3>
        		<input type="password" name="password"
        			style="width:280px" 
        			onkeydown="if (event.keyCode == 13) document.AutenticarControl.submit()" />
        	</div>
        	<div class='lineaform'>
        	<input type="submit" value="Iniciar sesión en TTT como controlador" />
        	</div>
        </form>
        <div class='lineaform' style='padding-bottom:30px;'>
        <% 
		if (request.getSession(true).getAttribute("Autenticado")!=null)
				out.print("<h1>Autenticado como " + 
						request.getSession(true).getAttribute("Autenticado") + "</h1>");
		else out.print("<h4><a href='../viajero/'>Volver a la aplicación del viajero</a></h4>");
		%>
   		</div>
		<div class='lineaform' style='height:40px;'>
   		</div>
    
    
	</div>
                <h5 style="width:1000px;"><a href="../viajero/ayuda.jsp">Ayuda para el viajero</a> - <a href="../viajero/mapa.jsp">Mapa web</a> - <a href="../viajero/contacto.jsp">Contacto</a></h5>
</div>
</body>

</html>
