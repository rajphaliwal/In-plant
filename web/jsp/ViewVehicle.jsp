<%-- 
    Document   : login
    Created on : 29 Mar, 2015, 6:27:53 PM
    Author     : rahul
--%>

<%@page import="java.util.List"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="css/table.css">
        <link href="css/popup.css" rel="stylesheet" type="text/css"/>
        <script src="js/popup.js"></script>
    </head>
    <body>
        <div><jsp:include page="Menu.jsp"/></div>
         <%
                ValueStack stack = ActionContext.getContext().getValueStack();
                Map sesion = (Map)ActionContext.getContext().getSession();
                if(sesion.get("user")==null)
                {
                    RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                    rd.forward(request, response);
                }
                hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers)sesion.get("user");
                
                hibernate.helper.VehicleList vl = new hibernate.helper.VehicleList();
                List<hibernate.pojo.TblVehicle> vehicleList = vl.getVehicleList(user.getTblPlant().getIPlantId().toString());
                
                String getVehicleString = new String();
                getVehicleString+="<table border=1 width=\"100%\" id=\"VehicleList\">";
                getVehicleString+="<thead>";
                getVehicleString+="<tr>";
                getVehicleString+="<th>Chasis Number</th>";
                getVehicleString+="<th>Vehicle Type</th>";
                getVehicleString+="<th>Load Capacity</th>";
                getVehicleString+="<th>National Permit</th>";
                getVehicleString+="<th>Transporter Name</th>";
                if(user.getBPlantModify())
                {
                    getVehicleString+="<th>Modify Vehicle</th>";
                
                }
                getVehicleString+="</tr>";
                getVehicleString+="</thead>";
                getVehicleString+="<tbody>";
                int rowId=0;
                for(hibernate.pojo.TblVehicle i: vehicleList)
                {
                    getVehicleString+="<tr>";
                    getVehicleString+=("<td>" + i.getTChasisNo() + "</td>");
                    getVehicleString+=("<td>" + i.getTVehicleType() + "</td>");
                    getVehicleString+=("<td>" + i.getILoadCapacity() + "</td>");
                    getVehicleString+=("<td>" + i.getTNationalPermit() + "</td>");
                    getVehicleString+=("<td>" + i.getTblTransporter().getTTransporterName() + "</td>");
                    if(user.getBPlantModify())
                    {
                        getVehicleString+=("<td><button id=\"" + i.getTVehicleId() + "\" value=\"" + rowId + "\" type=\"button\" onclick=\"pop('popDiv')\"> Modify </button> </td>");
                    }
                    getVehicleString+="</tr>";
                    rowId++;
                }
                out.println(getVehicleString);
        %>
        <div id="popDiv" class="ontop">
            <div id="popup">
                <label for="Path" id="heading">Modify</label><br>
                <form>
                    
                </form>
            </div>
        </div>
    </body>
</html>