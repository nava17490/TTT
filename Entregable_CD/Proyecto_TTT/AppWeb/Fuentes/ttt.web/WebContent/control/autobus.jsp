<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Información de autobús</title>
    <link rel='stylesheet' type='text/css' href='../estilos/estilos.css' />
    <link rel="icon" type="image/png"  href='../imagenes/favicon.png' />
    <script type="text/javascript" src="../javascript/cargaCodigo.js"></script>
</head>

<body>

<div id='contenedor' style="width:250px;">
<div id='detalle'>
            <%@ include file="detalleAutobus.jsp"%>
</div>
<h5 style="width:250px;color:#990000;"><a href="index.jsp">Ir a la página principal</a></h5>          
</div>

</body>

</html>
