<%-- 
    Document   : Logout
    Created on : 8 Apr, 2015, 11:52:57 PM
    Author     : rahul
--%>

<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="plant" scope="page" class="hibernate.helper.InsertPlant" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-min.js" type="text/javascript"></script>
        <style>
            
        </style>
        <%
            response.setHeader("Cache-Control","no-cache");
            response.setHeader("Cache-Control","no-store");
            response.setDateHeader("Expires", 0);
            response.setHeader("Pragma","no-cache");
        %>
    </head>
    <body>
        <%
            Map sesion = (Map)ActionContext.getContext().getSession();
            sesion.clear();
            sesion.remove("user");
            session.removeAttribute("user");
            session.invalidate();
            //RequestDispatcher rd = request.getRequestDispatcher("Login.jsp").forward(request, response);
            RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
            rd.forward(request, response);
        %>
    </body>
</html>
