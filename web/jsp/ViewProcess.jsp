<%-- 
    Document   : ViewProcess
    Created on : Dec 21, 2015, 2:42:17 PM
    Author     : Raj-HP
--%>

<%@page import="java.util.List"%>
<%@page import="hibernate.helper.ProcessList"%>
<%@page import="java.util.Map"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/popup.css" rel="stylesheet" type="text/css"/>
        <script src="js/popup.js"></script>
        <link rel="stylesheet" href="css/table.css">
        <title>All Process</title>
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
                
                hibernate.helper.ProcessList pl = new hibernate.helper.ProcessList();
                List<hibernate.pojo.TblProcess> processList = pl.getProcessList(user.getTblPlant().getIPlantId().toString());
                String getProcessString = new String();
                getProcessString+="<table border=1 width=\"100%\" id=\"ProcessList\">";
                getProcessString+="<thead>";
                getProcessString+="<tr>";
                getProcessString+="<th>Process Name</th>";
                if(user.getBPlantModify())
                {
                    getProcessString+="<th>Modify Process</th>";
                
                }
                getProcessString+="</tr>";
                getProcessString+="</thead>";
                getProcessString+="<tbody>";
                int rowId=0;
                for(hibernate.pojo.TblProcess i: processList)
                {
                    getProcessString+="<tr>";
                    getProcessString+=("<td>" + i.getTProcessType() + "</td>");
                    if(user.getBPlantModify())
                    {
                        getProcessString+=("<td><button id=\"" + i.getIProcessId() + "\" value=\"" + rowId + "\" type=\"button\" onclick=\"popup(this)\"> Modify </button> </td>");
                    }
                    getProcessString+="</tr>";
                    rowId++;
                }
                out.println(getProcessString);
                
        %>
        <script>
            var processid;
            function popup(button)
            {
                processid=button.id;
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
                var a = document.getElementById("processname").value;
                var b = processid;
                var c = document.getElementById("plant_id").value;
                xmlhttp.open("GET", "jsp/UpdateProcess.jsp?plant_id=" + c + "&process_id=" + b + "&process_name=" + a, true);
                xmlhttp.send();
            }
        </script>
        <div id="popDiv" class="ontop">
            <div id="popup">
                <label for="Path" id="heading">Modify</label><br>
                <form>
                    <input  type="hidden" name="Id" id="plant_id" value="<%out.print(user.getTblPlant().getIPlantId().toString());%>"/>
                    <label>Process Name : </label>
                    <input type="text" name="processname" id="processname"  placeholder="Enter Process Name" onfocus="hide(this)" onblur="show(this, 'Enter Process Name')"/><br>
                    <input type="button" name="Update" id="Update" value="Update" onClick = "xyz()" /><br><br>
                    <input type="button" name="Cancel" id="Cancel" value="Cancel" onClick = "hide('popDiv')" /><br><br>
                </form>
            </div>
        </div>
    </body>
</html>
