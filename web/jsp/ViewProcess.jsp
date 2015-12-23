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
        <title>All Process</title>
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
                        getProcessString+=("<td><button id=\"" + i.getIProcessId() + "\" value=\"" + rowId + "\" type=\"button\" onclick=\"pop('popDiv')\"> Modify </button> </td>");
                    }
                    getProcessString+="</tr>";
                    rowId++;
                }
                out.println(getProcessString);
                
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
