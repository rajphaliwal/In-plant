<%-- 
    Document   : Node
    Created on : 18 Apr, 2015, 3:32:11 PM
    Author     : Jonty
--%>

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
        <title>Node View</title>
         <link rel="stylesheet" href="css/table.css">
    </head>
    <body>
        <div id="top"><jsp:include page="Menu.jsp"/></div>
        <%
            String INodeId= request.getParameter("id");
            ValueStack stack = ActionContext.getContext().getValueStack();
            Map sesion = (Map)ActionContext.getContext().getSession();
            hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers)sesion.get("user");
            nodeView.NodeView n = new nodeView.NodeView();
            out.print(n.getNodeView(user.getTblPlant().getIPlantId(), INodeId));
        %>
    </body>
</html>
