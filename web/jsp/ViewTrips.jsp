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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Live View</title>
        <link rel="stylesheet" href="css/table.css">
        <script src="js/endTrip.js"></script>
        <style>
            th, td{min-width: 100px;}
        </style>
        <script>
            /*function body(t)
            {
                var box = document.getElementById("scroll");
                box.scrollTop = box.scrollHeight;
                setTimeout("location.reload(true);", t);
            }*/
        </script>
        <%
           /* response.setHeader("Cache-Control","no-cache");
            response.setHeader("Cache-Control","no-store");
            response.setDateHeader("Expires", 0);
            response.setHeader("Pragma","no-cache");*/
        %>
    </head>
    <body style="overflow-x: scroll">
        <div id="top">
            
            <div style="position: fixed; width: 100%"><jsp:include page="Menu.jsp"/></div>
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            <div id="scroll" >
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
        </div>
    </body>
</html>
