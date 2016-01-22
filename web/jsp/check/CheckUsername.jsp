<%-- 
    Document   : CheckUsername
    Created on : 19 Jan, 2016, 3:14:00 AM
    Author     : Ankit
--%>

<%@page import="hibernate.helper.Users_handler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String a = request.getParameter("username");
    hibernate.helper.Users_handler user = new Users_handler();
    hibernate.pojo.TblUsers u = user.get_tuple(a);
    if(u != null)
        out.print("Username already exists");
    else
        out.print("Username is unique");
%>
