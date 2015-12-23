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
                
                hibernate.helper.DriverList dl = new hibernate.helper.DriverList();
                List<hibernate.pojo.TblDriver> driverList = dl.getDriverList(user.getTblPlant().getIPlantId().toString());
                
                String getDriverString = new String();
                getDriverString+="<table border=1 width=\"100%\" id=\"CradList\">";
                getDriverString+="<thead>";
                getDriverString+="<tr>";
                getDriverString+="<th>Driver Number</th>";
                getDriverString+="<th>Driver Address 1</th>";
                getDriverString+="<th>Driver Address 2</th>";
                getDriverString+="<th>City</th>";
                getDriverString+="<th>State</th>";
                getDriverString+="<th>Pin</th>";
                getDriverString+="<th>Driver email</th>";
                getDriverString+="<th>License Number</th>";
                if(user.getBPlantModify())
                {
                    getDriverString+="<th>Modify Driver</th>";
                }
                getDriverString+="</tr>";
                getDriverString+="</thead>";
                getDriverString+="<tbody>";
                int rowId=0;
                for(hibernate.pojo.TblDriver i: driverList)
                {
                    getDriverString+="<tr>";
                    getDriverString+=("<td>" + i.getTDriverName() + "</td>");
                    getDriverString+=("<td>" + i.getTDriverAddr1() + "</td>");
                    getDriverString+=("<td>" + i.getTDriverAddr2() + "</td>");
                    getDriverString+=("<td>" + i.getTDriverCity() + "</td>");
                    getDriverString+=("<td>" + i.getTStateId() + "</td>");
                    getDriverString+=("<td>" + i.getIDriverPin() + "</td>");
                    getDriverString+=("<td>" + i.getTDriverEmailId() + "</td>");
                    getDriverString+=("<td>" + i.getTLicenceNo() + "</td>");
                    if(user.getBPlantModify())
                    {
                        getDriverString+=("<td><button id=\"" + i.getIDriverId() + "\" value=\"" + rowId + "\" type=\"button\" onclick=\"pop('popDiv')\"> Modify </button> </td>");
                    }
                    getDriverString+="</tr>";
                    rowId++;
                }
                out.println(getDriverString);
        %>
        <div id="popDiv" class="ontop">
            <form id="popup">
                <label for="Path" id="heading">Modify</label><br>
                <div id="list">

                </div>
            </form>
        </div>
    </body>
    
</html>
