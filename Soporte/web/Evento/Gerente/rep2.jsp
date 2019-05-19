<%-- 
    Document   : rep2
    Created on : 17/05/2019, 07:18:02 PM
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
                <div class="logo">Anicare</div>
                    <nav>
                        <a href="MenuPrincipal.jsp">Regresar</a>
                    </nav>
            </div>
        </header>
        <div class="contenedor-formulario">
            <div class="wrap">
                <h1 style="color: #082330">Cambios</h1><br><br>
                <he>Cambios realizados con exito</he>
        
                <%
                    String id = request.getParameter("id");
                    String ing = request.getParameter("inge");
                    out.print(ing);
          
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
                        String q = "update Reportes set ingeniero= '"+ing+"' where id='"+id+"'";
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
