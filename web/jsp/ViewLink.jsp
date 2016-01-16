<%-- 
    Document   : ViewLink
    Created on : Dec 21, 2015, 2:40:37 PM
    Author     : Raj-HP
--%>

<%@page import="hibernate.pojo.TblEpos"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Link</title>
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
                
                hibernate.helper.LinkList ll = new hibernate.helper.LinkList();
                List<hibernate.pojo.TblLinks> linkList = ll.getLinkList(user.getTblPlant().getIPlantId().toString());
                
                String getLinkString = new String();
                getLinkString+="<table border=1 width=\"100%\" id=\"LinkList\">";
                getLinkString+="<thead>";
                getLinkString+="<tr>";
                getLinkString+="<th>From</th>";
                getLinkString+="<th>To</th>";
                getLinkString+="<th>Time In Between</th>";
                if(user.getBPlantModify())
                {
                    getLinkString+="<th>Modify Link</th>";
                
                }
                getLinkString+="</tr>";
                getLinkString+="</thead>";
                getLinkString+="<tbody>";
                int rowId=0;
                for(hibernate.pojo.TblLinks i: linkList)
                {
                    getLinkString+="<tr>";
                    getLinkString+=("<td>" + i.getTblEposIFrom().getTGatewayName() + "</td>");
                    getLinkString+=("<td>" + i.getTblEposITo().getTGatewayName() + "</td>");
                    getLinkString+=("<td>" + i.getNTimediffInMin() + "</td>");
                    if(user.getBPlantModify())
                    {
                        getLinkString+=("<td><button id=\"" + i.getILid() + "\" value=\"" + rowId + "\" type=\"button\" onclick=\"pop('popDiv')\"> Modify </button> </td>");
                    }
                    getLinkString+="</tr>";
                    rowId++;
                }
                out.println(getLinkString);
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
