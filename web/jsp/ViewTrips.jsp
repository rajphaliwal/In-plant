<%-- 
    Document   : viewLive
    Created on : Mar 19, 2015, 6:32:31 PM
    Author     : rahul
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
        <title>Live View</title>
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
        <link rel="stylesheet" href="css/app.min.1.css">
        <link rel="stylesheet" href="css/app.min.2.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/menu.css">
<!--         <link rel="stylesheet" href="css/table.css"> -->
        <script src="js/endTrip.js"></script>
        <style>
            th, td{min-width: 100px;}
        </style>
    </head>
    <body class="sw-toggled" style="padding-top:70px">
    	<jsp:include page="includes/header.jsp"></jsp:include>
        <div id="top">
            <div style="position: fixed; width: 100%"><jsp:include page="Menu.jsp"/></div>
            <!--tab view-->
            <br />
			<div id="tabs" style="margin-top:50px;">
			  <ul>
				  <li><a href="#tabs-1">Scheduled Auction</a></li>
				  <li><a href="#tabs-2">Active Auction</a></li>
			  </ul>
 			</div> 
                <%  
                        ValueStack stack = ActionContext.getContext().getValueStack();
                        Map sesion = (Map)ActionContext.getContext().getSession();
                        if(sesion.get("user")==null)
                        {
                            RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                            rd.forward(request, response);
                        }
                        else
                        {
                            hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers)sesion.get("user");
                            liveView.LiveView l = new liveView.LiveView();
                            out.println(l.getLiveView(user));
                        }
                %>
            </div>
<!--         </div> -->
    </body>
</html>
