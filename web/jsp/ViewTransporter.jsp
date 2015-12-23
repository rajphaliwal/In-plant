<%-- 
    Document   : ModifyTransporter
    Created on : 11 Jun, 2015, 12:37:10 PM
    Author     : Ankit
--%>

<%@page import="java.util.List"%>
<%--@page import="EditTransporter.editTransporter"--%>
<%@page import="java.util.Map"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Transporter</title>
        <link rel="stylesheet" href="css/table.css">
        <link href="css/popup.css" rel="stylesheet" type="text/css"/>
        <script src="js/popup.js"></script>
    </head>
    <body>
        <div><jsp:include page="Menu.jsp"/></div>
        <%
            Map sesion = (Map)ActionContext.getContext().getSession();
            if(sesion.get("user")==null)
            {
                RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                rd.forward(request, response);
            }
            hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers)sesion.get("user");
            hibernate.helper.TransporterList tl = new hibernate.helper.TransporterList();
            List<hibernate.pojo.TblTransporter> transporterList = tl.getTransporterList(user.getTblPlant().getIPlantId().toString());
                
            /*EditTransporter.editTransporter e = new editTransporter();
            out.println(e.getTransporter(user));*/
            String getTransporterString = new String();
            getTransporterString = new String();
            getTransporterString+="<table border=1 width=\"100%\" id=\"TransporterList\">";
            getTransporterString+="<thead>";
            getTransporterString+="<tr>";
            getTransporterString+="<th>Name</th>";
            getTransporterString+="<th>Address</th>";
            getTransporterString+="<th>City</th>";
            getTransporterString+="<th>State</th>";
            getTransporterString+="<th>Pin Code</th>";
            getTransporterString+="<th>Mobile</th>";
            getTransporterString+="<th>Email ID</th>";
            if(user.getBPlantModify())
            {
                getTransporterString+="<th>Modify Transporter</th>";
                
            }
            getTransporterString+="</tr>";
            getTransporterString+="</thead>";
            getTransporterString+="<tbody>";
            int rowId=0;
            for(hibernate.pojo.TblTransporter i: transporterList)
            {
                getTransporterString+="<tr>";
                getTransporterString+=("<td>" + i.getTTransporterName() + "</td>");
                getTransporterString+=("<td>" + i.getTTransporterAddr() + "</td>");
                getTransporterString+=("<td>" + i.getTTransporterCity() + "</td>");
                getTransporterString+=("<td>" + i.getTTransporterState() + "</td>");
                getTransporterString+=("<td>" + i.getITransporterPin() + "</td>");
                getTransporterString+=("<td>" + i.getTTransporterMobileNo() + "</td>");
                getTransporterString+=("<td>" + i.getTTransporterEmailId() + "</td>");
                if(user.getBPlantModify())
                {
                    getTransporterString+=("<td><button id=\"" + i.getITransporterId() + "\" value=\"" + rowId + "\" type=\"button\" onclick=\"pop('popDiv')\"> Modify </button> </td>");
                }
                getTransporterString+="</tr>";
                rowId++;
            }
            out.println(getTransporterString);
        %>
        <div id="popDiv" class="ontop">
            <form id="popup">
                <label for="Path" id="heading">Modify</label><br>
                <div id="list">

                </div>
            </form>
        </div>
        <form action="">
            <input type="hidden" id="hide" name="id" value="">
            <input type="hidden" id="Id" name="Id" value="">
        </form>
    </body>
</html>
