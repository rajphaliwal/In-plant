<%-- 
    Document   : Node
    Created on : 18 Apr, 2015, 3:32:11 PM
    Author     : Jonty
--%>

<%@page import="java.math.BigDecimal"%>
<%@page import="tripView.tripDetails"%>
<%@page import="java.util.Map"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trip View</title>
        <link rel="stylesheet" href="css/ExpandCollapse.css?v=<%out.println(Math.random()%1000+"\"");%> >
            <script src="js/jquery-min.js"></script>
            <script src="js/ExpandCollapse.js"></script>
            
    </head>
    <body>
        <div id="top"><jsp:include page="Menu.jsp"/></div>
        <%
            String ITripId= request.getParameter("trip");
            tripView.tripDetails t = new tripDetails();
            out.print(t.getTripDetails(new BigDecimal(ITripId)));
        %>
    </body>
</html>
