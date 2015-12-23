<%-- 
    Document   : login
    Created on : 29 Mar, 2015, 6:27:53 PM
    Author     : rahul
--%>

<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
         <%
       Map sesion = (Map)ActionContext.getContext().getSession();
       hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers)sesion.get("user");
       out.print("***"+user.getSUsername()+"***"+" in "+request.getRequestURI());
       %>
    </body>
    
</html>
