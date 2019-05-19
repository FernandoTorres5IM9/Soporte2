<%-- 
    Document   : ValInicio
    Created on : 13/05/2019, 09:22:59 AM
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
            String contra;
            String nombre;
            String repcontra;
            Connection c = null; 
            Statement s = null, s2 = null;
            ResultSet rnombre = null,r = null;
            
            HttpSession sesion = request.getSession();
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                c = DriverManager.getConnection("jdbc:mysql://localhost/AetherIncSop","root","n0m3l0");
                s = c.createStatement();
                s2 = c.createStatement();
            }
            catch( SQLException error) {
                out.print(error.toString() );
            }
            try{
                contra = request.getParameter("Contasena");
                nombre = request.getParameter("Usuario");
                repcontra = request.getParameter("Repita Contrasena");
                
                if(repcontra.equals(contra)){
                    rnombre = s2.executeQuery("select * from usuarios where nombre= '"+ nombre +"'");
                    r = s.executeQuery("select * from usuarios where contrasena= '"+ contra +"' and nombre= '"+ nombre +"'");
                    if(rnombre.next()){
                        if(r.next()){
                            String con = r.getString("contrasena");
                            String nom = r.getString("nombre");
                            String rango = r.getString("rol");
                        
                            //SESIONES IMPORTANTES
                        
                            sesion.setAttribute("Usuario", nombre);
                            sesion.setAttribute("Rango", rango);
                        
                            //FIN
                        
                        
                            out.println("<script>swal({"
                                +"title: 'Bienvenido',"
                                +" text: '¡Hola otra vez, "+nom+"!',"
                                +"icon: 'success',"
                                +"button: 'Aceptar'"
                                +"}).then(function(){window.location = 'TipoUsuario.jsp'});"
                                + "</script>");
                        }
                        else{
                            out.println("<script>swal({"
                                +"title: 'ATENCIÓN',"
                                +" text: 'Contraseña incorrecta.',"
                                +"icon: 'warning',"
                                +"button: 'Aceptar'"
                                +"}).then(function(){window.history.back();});"
                                + "</script>");
                        }
                    }
                    else{
                        out.println("<script>swal({"
                            +"title: 'ATENCIÓN',"
                            +" text: 'Usuario inexistente.',"
                            +"icon: 'warning',"
                            +"button: 'Aceptar'"
                            +"}).then(function(){window.history.back();});"
                            + "</script>");}
                }else{
                    out.println("<script>swal({"
                        +"title: 'ATENCIÓN',"
                        +"TEXT: 'Contraseñas no coinciden',"
                        +"icon: 'warning',"
                        +"button: 'Aceptar'"
                        +"]).then(function(){window.history.back();});"
                        +"</script>");}
            }
            catch( SQLException error) {
                out.print(error.toString() );
            }
        %>
    </body>
</html>
