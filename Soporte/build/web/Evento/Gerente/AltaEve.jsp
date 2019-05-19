<%-- 
    Document   : AltaEve
    Created on : 13/05/2019, 10:20:21 AM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession obj_Session = request.getSession(false);
    String usuario = (String)obj_Session.getAttribute("Usuario");
    String rol = (String)obj_Session.getAttribute("Rango");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../../CSS/inputredondo.css" rel="stylesheet" type="text/css"/>
        <link href="../../CSS/Estilosinimagen.css" rel="stylesheet" type="text/css"/>
        <script src="AltaEvento.js" type="text/javascript"></script>
    </head>
    <body>
        <form method="get" action="LevaEvento.jsp" id="For">
            <div style="display: table; float: left; height:100%; width:100%">
            <div style="display: table; float: left; height: 10%; width: 100%">
                <input type="button" onclick="location.href='../InicioSesion.html'" style= "font-size: 20px; size: 100px; right: initial" value="Regresar">
                <center>
                    <h2>Eventos</h2>
                </center>
            </div>
            <div style="display: table; float: left; height: 80%; width: 100%">
                <center>
                    <br><br>Nombre evento:<br><br> <input type="text" name="Nom" onkeypress="ValidarLN()" onfocus=" return disbaleCopyPaste(elm)" autocomplete="off" onkeydown="return interceptKeys(event)">
                    <br><br>Fecha evento:<br><br> <input type="date" name="Fec" onfocus=" return disbaleCopyPaste(elm)" autocomplete="off" onkeydown="return interceptKeys(event)">
                    <br><br>Módulo:<br><br>  <input type="text" name="Lug" onkeypress="ValidarLN()" onfocus=" return disbaleCopyPaste(elm)" autocomplete="off" onkeydown="return interceptKeys(event)">
                    <br><br>Ingeniero: <br><br> <input type="text" name="Ing" onkeypress="ValidarLN()" onfocus="return disableCopyPaste(elm)" autocomplete="off" onkeydown="return interceptKey(event)">
                    <br><br>Descripcion:<br><br>  <input type="text" name="Des"  style="height: 200px ; width: 500px" onkeypress="ValidarLN()" onfocus=" return disbaleCopyPaste(elm)" autocomplete="off" onkeydown="return interceptKeys(event)"><br><br>
                
                <br> 
                </center>
            </div>
            
            <div style="display: table; float: left; height: 10%; width: 100%">
                <center>
                    <input type="submit" name="Aceptar" value="Aceptar">
                </center>
            </div>
            </div>
        </form>
    </body>
</html>
