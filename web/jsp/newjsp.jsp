<%-- 
    Document   : newjsp
    Created on : May 31, 2015, 10:32:15 PM
    Author     : Raj-HP
--%>

<%@page import="hibernate.pojo.TblProcess"%>
<%@page import="hibernate.helper.Process_handler"%>
<%@page import="hibernate.pojo.TblCard"%>
<%@page import="hibernate.helper.Card_handler"%>
<%@page import="hibernate.pojo.TblVehicle"%>
<%@page import="hibernate.helper.Vehicle_handler"%>
<%@page import="hibernate.pojo.TblDriver"%>
<%@page import="hibernate.helper.Driver_handler"%>
<%@page import="hibernate.pojo.TblTransporter"%>
<%@page import="hibernate.helper.Transporter_handler"%>
<%@page import="hibernate.pojo.TblPlant"%>
<%@page import="hibernate.helper.Plant_handler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                Plant_handler ph = new Plant_handler();
                TblPlant plant = ph.get_tuple(17);
                out.println("<p>" + plant.getTPlantName() + "</p>");

                Transporter_handler tr = new Transporter_handler();
                TblTransporter transporter = tr.get_tuple(19);
                out.println("<p>" + transporter.getTTransporterName() + "</p>");
                
                Driver_handler d = new Driver_handler();
                TblDriver driver = d.get_tuple(22);
                out.println("<p>" + driver.getTDriverName() + "</p>");
                
                Vehicle_handler v = new Vehicle_handler();
                TblVehicle vehicle = v.get_tuple("11");
                out.println("<p>" + vehicle.getTVehicleId() + "</p>");
                
                Card_handler c = new Card_handler();
                TblCard card = c.get_tuple("1002");
                out.println("<p>" + card.getCCardId() + "</p>");
                
                Process_handler p = new Process_handler();
                TblProcess process = p.get_tuple(1);
                out.println("<p>" + process.getTProcessType() + "</p>");

        %>
    </body>
</html>
