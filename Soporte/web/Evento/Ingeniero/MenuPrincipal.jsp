<%-- 
    Document   : MenuPrincipal
    Created on : 17/05/2019, 06:16:19 PM
    Author     : Gina
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
                <p class="titulo">REPORTE DE EVENTO: INGENIERO: <%out.println(usuario); %> </p>
                
                
                
                <div class="container" style="display: table; float: left; top: 50%; left: 20%">
                    <img src="../../Fotos/certificado.png" alt="Preguntas" class="image" onclick="location.href='ResRep.jsp'">
                    <div class="overlay">
                        <div class="text" onclick="location.href='ResRep.jsp'"><p class="hola"><br><br>Resolver Reporte</p></div>
                    </div>
                </div>
                
                <div class="container" style="display: table; float: left; top: 50%; left: 50%">
                    <img src="../../Fotos/notas.png" alt="Evento" class="image" onclick="location.href='RepAsig.jsp'">
                    <div class="overlay">
                        <div class="text" onclick="location.href='RepAsig.jsp'"><p class="hola"><br><br>Mostrar Reportes Asignados</p></div>
                    </div>
                </div>
                
                
                
            </center>
        </div>
        <div style="display: table; float: left; width: 100%; height: 10%;">
            
        </div>
    </body>
</html>
