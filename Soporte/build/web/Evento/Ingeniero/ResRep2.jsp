<%-- 
    Document   : ResRep2
    Created on : 17/05/2019, 06:29:54 PM
    Author     : Gina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*" %>
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
    </head>
    <body>
        <header class="headerdin">
            <div class="wrapper">
                <div class="logo">REPORTE DE EVENTO</div>
                    <nav>
                        <a href="MenuPrincipal.jsp">Regresar</a>
                    </nav>
            </div>
        </header>
        <div class="contenedor-formulario">
            <div class="wrap">
                <H2>Solucion enviada con exito</H2>
                <%
                    String id = request.getParameter("id");
                    String res = request.getParameter("resp");

                    Connection c=null;
                    PreparedStatement s=null;
             
                   try{
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        c = DriverManager.getConnection("jdbc:mysql://localhost/AetherIncSop","root","n0m3l0");     
                    } catch(SQLException error){
                        out.print(error.toString());
                    }
                    try
                    {
                        String q = "update Reportes set estado= 'Resuelto', respuesta='"+ res +"' where id='"+ id+"'";
                        s= c.prepareStatement(q);
                        s.executeUpdate();
                        c.close();
                    } catch(Exception error){
                        out.print(error.toString());
                    }
                %>
            </div>
        </div>
    </body>
</html>
