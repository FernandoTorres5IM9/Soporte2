<%-- 
    Document   : ResRep1
    Created on : 17/05/2019, 06:22:48 PM
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
                <%
                    String id;
                    Connection c=null;
                    PreparedStatement s=null;
                    ResultSet r=null;
                    id = request.getParameter("id");
 
                    try{
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        c=DriverManager.getConnection("jdbc:mysql://localhost/AetherIncSop","root","n0m3l0");
                        String q = " select * from Reportes where ingeniero ='"+usuario+"' and id ='"+ id +"' and estado = 'Sin resolver'";
                        s= c.prepareStatement(q);
                    }
                    catch(SQLException error)
                    {
                        out.print(error.toString());
                    }
                    try{
                        r = s.executeQuery();
                        if(r.next()){
                            String ing = r.getString("ingeniero");
                                out.print("<form action='ResRep2.jsp' method='post'>");
                                out.print("Respuesta:<br><br>");
                                out.print("<input type='text' name='resp'><br><br>");
                                out.print("<input type='hidden' name='id' value='"+id+"'>");
                                out.print("<input type='submit' name='Enviar' value='cambios'>");
                                out.print("</form>");
                        } 
                        else {
                            out.print("<script>alert('No existe este reporte.');</script>");
                    
                        }
                    } catch(SQLException error){
                        out.print(error.toString());
                    }
                %>
            </div>
        </div>
    </body>
</html>
