<%-- 
    Document   : rep1
    Created on : 17/05/2019, 07:12:34 PM
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
                <h1>Cambios</h1>
                <%
                    String id;
                    Connection c=null;
                    PreparedStatement s=null;
                    PreparedStatement s2=null;
                    ResultSet r=null;
                    ResultSet rs=null;
                    id = request.getParameter("id");

                    try{
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        c=DriverManager.getConnection("jdbc:mysql://localhost/AetherIncSop","root","n0m3l0");
                        String q = " select * from Reportes where id ='"+ id +"' ";
                        String Puesto = "Ingeniero de Soporte";
                        String Puesto2 = "Gerente de soporte";
                        String Query="select * from usuarios where rol ='"+Puesto+"' or rol='"+Puesto2+"' ";
                        s= c.prepareStatement(q);
                        s2=c.prepareStatement(Query);
                    }
                    catch(SQLException error)
                    {
                        out.print(error.toString());
                    }
                    try{
                        rs= s2.executeQuery();
                        r = s.executeQuery();
                        if(r.next()){ 
                            out.print("<form action='rep2.jsp' method='post'><br><br>");
                            out.print("ingeniero asignado:<br><br>");
                            //barra ingeniero
                            out.print("<select name='inge'>");
                            while(rs.next()){
                                out.print("<option value=" + rs.getString("nombre") + ">");
                                out.print(rs.getString("nombre"));
                                out.print("</option>");
                            }
                            out.print("</select><br><br>");
                            //fin
                            out.print("<input type='hidden' name='id' value='"+id+"'><br><br>");
                            out.print("<input type='submit' name='cambios' value='cambios'>");
                            out.print("</form>");
                        }
                        else 
                        {
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
