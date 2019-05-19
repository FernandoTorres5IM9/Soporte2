<%-- 
    Document   : LevaEvento
    Created on : 13/05/2019, 10:24:58 AM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession obj_Session = request.getSession(false);
            String usuario = (String)obj_Session.getAttribute("Usuario");
            String Nombre;
            String Modulo;
            String Descripcion;
            String ingeniero;
            ResultSet r;
            Connection c=null; 
            Statement s=null, s2=null;
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                c = DriverManager.getConnection("jdbc:mysql://localhost/AetherIncSop","root","n0m3l0");
                s= c.createStatement();
                s2= c.createStatement();
            }
            catch( SQLException error) {
                out.print(error.toString() );
            }
            try{
                r = s2.executeQuery("SELECT * FROM Reportes WHERE id = (SELECT MAX(id) from Reportes);");
                Nombre= request.getParameter("nombre");
                Modulo = request.getParameter("modulo");
                Descripcion = request.getParameter("descripcion");
                ingeniero = "Sin Ingeniero";
                
                
                String estado="Sin resolver";
                if(r.next()){
                int id1;
                String aux;
                String resp="Sin respuesta";
                aux = r.getString("id");
                
                id1 = Integer.parseInt(aux) + 1;
                
                s.executeUpdate("insert into Reportes values ('"+id1+"','"+ usuario +"', '"+ Nombre +"', '"+ Modulo +"' , '"+ Descripcion +"' , '"+ ingeniero +"','"+estado+"','"+resp+"')");
                    out.println("<script>swal({"
                                +"title: 'REGISTRADO',"
                                +" text: '¡Reporte exitosamente registrado en Anicare!',"
                                +"icon: 'success',"
                                +"button: 'Aceptar'"
                                +"}).then(function(){window.history.back();});"
                                + "</script>");
                }
            }                
            catch( SQLException error) {
                out.print(error.toString() );
            }
        %>
    </body>
</html>
