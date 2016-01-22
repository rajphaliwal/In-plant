<%-- 
    Document   : CheckUsername
    Created on : 19 Jan, 2016, 3:14:00 AM
    Author     : Ankit
--%>

<%@page import="hibernate.helper.Card_handler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String a = request.getParameter("card");
    hibernate.helper.Card_handler card = new Card_handler();
    hibernate.pojo.TblCard u = card.get_tuple(a);
    if(u != null)
        out.print("Card already exists");
    else
        out.print("Card is unique");
%>
