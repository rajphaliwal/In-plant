<%-- 
    Document   : viewLive
    Created on : Mar 19, 2015, 6:32:31 PM
    Author     : jonty
--%>

<%@page import="java.util.Map"%>
<jsp:useBean id="user" scope="page" class="hibernate.pojo.TblUsers" />
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    
"http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Live View</title>
        <link rel="stylesheet" href="css/table.css">
        <script src="js/endTrip.js"></script>
    </head>
    <body>
        <div id="top"><jsp:include page="Menu.jsp"/></div>
        <%   
           ValueStack stack = ActionContext.getContext().getValueStack();
           Map sesion = (Map)ActionContext.getContext().getSession();
           user = (hibernate.pojo.TblUsers)sesion.get("user");
       %>
        
       <form action="PermissionChange">
           <input type="checkbox" name="Modify User" value="<%%>" />
       </form>
    </body>
</html>
