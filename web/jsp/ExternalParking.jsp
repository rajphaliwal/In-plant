<%-- 
    Document   : ExternalParking
    Created on : Jan 22, 2016, 12:03:52 AM
    Author     : Raj-HP
--%>

<%@page import="java.util.Map"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>External Parking</title>
        <link rel="stylesheet" href="css/table.css">
        <style>
            th, td{min-width: 100px;}
        </style>
    </head>
    <body style="overflow-x: scroll">
        <div id="top">
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            <div id="scroll" >
                <%  
                    
                        /*ValueStack stack = ActionContext.getContext().getValueStack();
                        Map sesion = (Map)ActionContext.getContext().getSession();
                        if(sesion.get("user")==null)
                        {
                            RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                            rd.forward(request, response);
                        }
                        else
                        {*/
                            //hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers)sesion.get("user");
                            externalParking.ExternalParking  e = new externalParking.ExternalParking();
                            out.println(e.getEParkingList("157"));//user.getTblPlant().getIPlantId().toString()));
                        //}
                %>
            </div>
        </div>
    </body>
</html>
