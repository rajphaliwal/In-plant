<%-- 
    Document   : ViewEPos
    Created on : Dec 21, 2015, 2:40:05 PM
    Author     : Raj-HP
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Epos</title>
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
                
                hibernate.helper.EposList el = new hibernate.helper.EposList();
                List<hibernate.pojo.TblEpos> eposList = el.getEposList(user.getTblPlant().getIPlantId().toString());
                
                String getEposString = new String();
                getEposString+="<table border=1 width=\"100%\" id=\"CradList\">";
                getEposString+="<thead>";
                getEposString+="<tr>";
                getEposString+="<th>Terminal Id</th>";
                getEposString+="<th>Machine Id</th>";
                getEposString+="<th>Gate Number</th>";
                getEposString+="<th>Gate Name</th>";
                getEposString+="<th>Gate Location</th>";
                if(user.getBPlantModify())
                {
                    getEposString+="<th>Modify Epos</th>";
                
                }
                getEposString+="</tr>";
                getEposString+="</thead>";
                getEposString+="<tbody>";
                int rowId=0;
                for(hibernate.pojo.TblEpos i: eposList)
                {
                    getEposString+="<tr>";
                    getEposString+=("<td>" + i.getITerminalId() + "</td>");
                    getEposString+=("<td>" + i.getIMachineId() + "</td>");
                    getEposString+=("<td>" + i.getIGateNo() + "</td>");
                    getEposString+=("<td>" + i.getTGatewayName() + "</td>");
                    getEposString+=("<td>" + i.getTLocation() + "</td>");
                    if(user.getBPlantModify())
                    {
                        getEposString+=("<td><button id=\"" + i.getIMachineId() + "\" value=\"" + rowId + "\" type=\"button\" onclick=\"pop('popDiv')\"> Modify </button> </td>");
                    }
                    getEposString+="</tr>";
                    rowId++;
                }
                out.println(getEposString);
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
