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
                        getEposString+=("<td><button id=\"" + i.getIMachineId() + "\" value=\"" + rowId + "\" type=\"button\" onclick=\"popup('this')\"> Modify </button> </td>");
                    }
                    getEposString+="</tr>";
                    rowId++;
                }
                getEposString+="</tbody>";
                out.println(getEposString);
                if(user.getBAddEpos())
                    out.println(" <form name=\"add\"> " + 
                        "<input type=\"submlt\" value=\"Add New Epos\" onclick=\"addepos()\"/><br><br></form> ");
        %>
        
        <script>
            function addepos()
            {
                document.add.action = "loggedIn-AddEpos";
                document.add.submit();
            }
            var mat_id;
            function popup(button)
            {
                document.getElementById("mat_id").value = button.id;
                pop('popDiv');
            }
            function xyz()
            {
                var xmlhttp;
                if (window.XMLHttpRequest)
                {
                    // code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp=new XMLHttpRequest();
                }
                else
                {
                    // code for IE6, IE5
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange=function()
                {
                    if(xmlhttp.readyState==4 && xmlhttp.status==200)
                    {
                        location.reload();
                    }
                };
                var a = document.getElementById("ITerminalId").value;
                var b = document.getElementById("IGateNo").value;
                var c = document.getElementById("TGatewayName").value;
                var d = document.getElementById("TLocation").value;
                
                xmlhttp.open("GET", "jsp/UpdateEpos.jsp?machine_id=" + document.getElementById("mat_id").value
                        + "&terminal_id=" + a + "&gate_no=" + b + 
                                    "&gateway_name=" + c + "&location=" + d , true);
                xmlhttp.send();
            }
        </script>
        <form>
            <input type="hidden" id="mat_id" name="mat_id" value="778999">
        </form>
        <div id="popDiv" class="ontop">
            <div id="popup">
                <label for="Path" id="heading">Modify</label><br>
                <form>
                    <label>Terminal Id:</label>  
                    <input type="text" class="form-control" id="ITerminalId" placeholder="Enter Terminal Id" onfocus="hide(this)" onblur="show(this, 'Enter Terminal Id')"/><br>
                    <label>Gate Number:  </label>
                    <input type="text" class="form-control" id="IGateNo" placeholder="Enter Gate No" onfocus="hide(this)" onblur="show(this, 'Enter Gate No')"/><br>
                    <label>Gateway Name: </label>
                    <input type="text" class="form-control" id="TGatewayName" placeholder="Enter Gateway Name" onfocus="hide(this)" onblur="show(this, 'Enter Gateway Name')"/><br>
                    <label>Location:    </label>
                    <input type="text" class="form-control" id="TLocation" placeholder="Enter Location" onfocus="hide(this)" onblur="show(this, 'Enter Location')"/><br>
                    <input type="button" name="Update" id="Update" value="Update" onClick = "xyz()" /><br><br>
                    <input type="button" name="Cancel" id="Cancel" value="Cancel" onClick = "hide('popDiv')" /><br><br>
                </form>
            </div>
        </div>
    </body>
</html>
