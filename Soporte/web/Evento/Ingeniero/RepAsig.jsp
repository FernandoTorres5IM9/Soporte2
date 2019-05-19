<%-- 
    Document   : RepAsig
    Created on : 17/05/2019, 06:34:23 PM
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
                    <a> <% out.println(usuario);%> </a>
                </nav>
                <nav>
                    <a> <% out.println(rol);%> </a>
                </nav>
                <nav>
                    <a href="MenuPrincipal.jsp">Regresar</a>
                </nav>
            </div>
        </header>
        <br><br>
        <section class="contenido wrapper">
            <div class="desarrollo">
                <center>
                    <br><br>
                    <h1>Historial de reportes por resolver</h1>
                    <br><br>
                    <h2>Usuario:</h2>
                    <h3> <% out.println(usuario);%> </h3>
                    <br><br>
                    <%
                        Connection c=null;
                        Statement s=null;
                        ResultSet r=null;
                        ResultSet n=null;
                        try{
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            c = DriverManager.getConnection("jdbc:mysql://localhost/AetherIncSop", "root", "n0m3l0");
                            s = c.createStatement();
                        }
                        catch(SQLException error){
                            out.print(error.toString());
                        }
                
                        try
                        {
                            r = s.executeQuery("select * from Reportes where ingeniero = '"+ usuario +"';");
                                out.println("<center><table cellpadding='50' width='100%'>");
                                out.println("<tr><th style='font-size: 20px;'>Id</th>");
                                out.println("<th style='font-size: 20px;'>Nombre </th>");
                                out.println("<th style='font-size: 20px;'>Modulo </th>");
                                out.println("<th style='font-size: 20px;'>Descripcion</th>");
                                out.println("<th style='font-size: 20px;'>Estado</th>");
                                out.println("<th style='font-size: 20px;'>Respuesta</th></tr>");
                                while(r.next()){
                                    String Id = r.getString("id");
                                    String asunto = r.getString("nombre");
                                    String cla= r.getString("modulo");
                                    String mod = r.getString("descripcion");
                                    String estado = r.getString("estado");
                                    String resp = r.getString("respuesta");


                                    out.println("<tr><th>"+ Id + "</th>");
                                    out.println("<th>" + asunto + "</th>");
                                    out.println("<th>" + cla + "</th>");
                                    out.println("<th>"+ mod + "</th>");
                                    out.println("<th>"+ estado + "</th>");
                                    out.println("<th>"+ resp + "</th></tr>");
                                   
                                }
                                out.println("</table></center>");
                        }       

                        catch(SQLException error){
                            out.print(error.toString());
                        }
                    %>
                </center>
            </div>     
        </section>
    </body>
</html>
