<%-- 
    Document   : ConEve
    Created on : 17/05/2019, 05:31:16 PM
    Author     : Gina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*" %>
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
        <header>
            <div>
                <div>C O N S U L T A   D E  E V E N T O</div>
                <nav>
                    <a><% out.println(usuario);%></a>
                </nav>
                <nav>
                    <a><% out.println(rol);%></a>
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
                    <h1>Historial de reportes enviados</h1>
                    <br><br>
                    <h2>Usuario:</h2>
                    <h3> <% out.println(usuario);%></h3>
                    <br><br>
                    
                    <%
                        Connection c = null;
                        Statement s = null;
                        ResultSet r = null;
                        ResultSet n = null;
                        try{
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            c = DriverManager.getConnection("jdbc:mysql://localhost/AetherIncSop","root","n0m3l0");
                            s = c.createStatement();
                        }
                        catch(SQLException error){
                            out.print(error.toString());
                        }
                        
                        try{
                            r = s.executeQuery("select * from Reportes;");
                                out.println("<center><table cellpading='50' width='100%'>");
                                out.println("<tr><th style='font-size: 15px;'>ID</th>");
                                out.println("<th style='font-size: 15px;'>Autor</th>");
                                out.println("<th style='font-size: 15px;'>Nombre</th>");
                                out.println("<th style='font-size: 15px;'>Modulo</th>");
                                out.println("<th style='font-size: 15px;'>Descripcion</th>");
                                out.println("<th style='font-size: 15px;'>Ingeniero</th>");
                                out.println("<th style='font-size: 15px;'>Estado</th>");
                                out.println("<th style='font-size: 15px;'>Respuesta</th></tr>");
                                
                                while(r.next()){
                                    String id = r.getString("id");
                                    String autor = r.getString("autor");
                                    String nom = r.getString("nombre");
                                    String mod = r.getString("modulo");
                                    String des = r.getString("descripcion");
                                    String ing = r.getString("ingeniero");
                                    String est = r.getString("estado");
                                    String res = r.getString("respuesta");
                                    
                                    out.println("<tr><th>" + id + "</th>");
                                    out.println("<th>" + autor + "</th>");
                                    out.println("<th>" + nom + "</th>");
                                    out.println("<th>" + mod + "</th>");
                                    out.println("<th>" + des + "</th>");
                                    out.println("<th>" + ing + "</th>");
                                    out.println("<th>" + est + "</th>");
                                    out.println("<th>" + res + "</th></tr>");
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
