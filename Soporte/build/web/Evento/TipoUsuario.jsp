<%-- 
    Document   : TipoUsuario
    Created on : 13/05/2019, 10:08:47 AM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% //VALIDAR SOLO OPERADORES
    HttpSession obj_Session = request.getSession(false);
    String usuario = (String)obj_Session.getAttribute("Usuario");
    String rol = (String)obj_Session.getAttribute("Rango");
    
    
    if(usuario.equals("")){
        //No puedes acceder sin haber iniciado sesion
        response.sendRedirect("MenuPrincipal.html");}
    if(rol.equals("Gerente de soporte")){
        //No puedes acceder si eres gerente
        response.sendRedirect("Gerente/MenuPrincipal.jsp");
    }
    else 
        if(rol.equals("Operador"))
    {
        //No eres del staff, adios
        response.sendRedirect("Operador/Operador.jsp");
    }
    else
        if(rol.equals("Ingeniero de Soporte")){
        //No puedes acceder si eres gerente
        response.sendRedirect("Ingeniero/Ingeniero.jsp");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
