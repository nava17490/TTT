<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="ttt.cliente.web.Comunicacion_UI"%>

<%	// Obtener informacion de los autobuses a mostrar	
	String linea;
	if (request.getParameter("linea") != null)
		linea = request.getParameter("linea");
	else linea = null;
	int sentido;
	if (request.getParameter("sentido") != null)
		sentido = Integer.parseInt(request.getParameter("sentido"));
	else sentido = -1;
	
%>

// JavaScript Document

<%=Comunicacion_UI.autobuses(linea,sentido,false)%>

   					

