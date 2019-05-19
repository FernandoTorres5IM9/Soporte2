<%-- 
    Document   : MenuPrincipal
    Created on : 13/05/2019, 10:13:23 AM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession obj_Session = request.getSession(false);
    String usuario = (String)obj_Session.getAttribute("Usuario");
    String rol = (String)obj_Session.getAttribute("Rango");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../../CSS/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class = "princ" style="display: table; float: left; width: 100%; height: 70%;/*background-image: url(../Fotos/rombitos.jpg)*/">
            <center><br><br>
                <p class="titulo">REPORTE DE EVENTO: GERENTE: <%out.println(usuario); %> </p>
                
                
                
                <div class="container" style="display: table; float: left; top: 50%; left: 20%">
                    <img src="../../Fotos/AltaEve.png" alt="Preguntas" class="image" onclick="location.href='AltaEve.jsp'">
                    <div class="overlay">
                        <div class="text" onclick="location.href='AltaEve.jsp'"><p class="hola"><br><br>Alta de Evento</p></div>
                    </div>
                </div>
                <div class="container" style="display: table; float: left; top: 50%; left: 35%">
                    <img src="../../Fotos/ConEve.png" alt="Mantenimiento" class="image" onclick="location.href='ConEve.jsp'">
                    <div class="overlay">
                        <div class="text" onclick="location.href='ConEve.jsp'"><p class="hola"><br><br>Consulta de Evento</p></div>
                    </div>
                </div>
                <div class="container" style="display: table; float: left; top: 50%; left: 50%">
                    <img src="../../Fotos/ModEve.png" alt="Evento" class="image" onclick="location.href='AsigEve.jsp'">
                    <div class="overlay">
                        <div class="text" onclick="location.href='AsigEve.jsp'"><p class="hola"><br><br>Asigna Ingeniero</p></div>
                    </div>
                </div>
                
                
                
            </center>
        </div>
        <div style="display: table; float: left; width: 100%; height: 10%;">
            
        </div>
    </body>
</html>
