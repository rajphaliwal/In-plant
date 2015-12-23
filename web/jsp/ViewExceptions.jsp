<%-- 
    Document   : viewLive
    Created on : Mar 19, 2015, 6:32:31 PM
    Author     : rahul
--%>

<%@page import="exceptionView.ExceptionView"%>
<%@page import="java.util.Map"%>
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
        <script src="js/endException.js"></script>
    </head>
    <body>
        <div id="top"><jsp:include page="Menu.jsp"/></div>
        


        <%   
           ValueStack stack = ActionContext.getContext().getValueStack();
           Map sesion = (Map)ActionContext.getContext().getSession();
           hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers)sesion.get("user");

           exceptionView.ExceptionView e = new ExceptionView();
           out.print(e.getExceptionViewString(user.getTblPlant().getIPlantId()));
           
       %>
        
    </body>
</html>
