<%-- 
    Document   : welcome
    Created on : Apr 4, 2015, 3:57:33 PM
    Author     : Raj-HP
--%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="hibernate.pojo.TblPlant"%>
<%@page import="org.hibernate.Session" %>
<%@page import="org.hibernate.Transaction" %>
<%@page import="java.math.BigDecimal" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Welcome!</h1>
        <%
            ValueStack s = ActionContext.getContext().getValueStack();
            Integer plantid = (Integer)s.findValue("current_session");
            out.println(plantid);
        %>
        
    </body>
</html>
