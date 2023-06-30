<%-- 
    Document   : Delete
    Created on : 02/02/2018, 03:34:00 PM
    Author     : Joel
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
       Connection con;       
       String url="jdbc:mysql://localhost:3306/usuarios";
       String Driver="com.mysql.jdbc.Driver";
       String user="root";
       String clave="1234";
       Class.forName(Driver);
       con=DriverManager.getConnection(url,user,clave);
       PreparedStatement ps;       
       int id=Integer.parseInt(request.getParameter("id"));
       ps=con.prepareStatement("delete from usuario where id="+id);
       ps.executeUpdate();
       response.sendRedirect("index.jsp");
       %>
    </body>
</html>
