<%-- 
    Document   : ViewCard
    Created on : Dec 21, 2015, 2:40:53 PM
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
        <title>All Card</title>
        <link rel="stylesheet" href="css/table.css">
        <script src="js/deleteTransporter.js"></script>
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
                
                hibernate.helper.CardList cl = new hibernate.helper.CardList();
                List<hibernate.pojo.TblCard> cardList = cl.getCardList(user.getTblPlant().getIPlantId().toString());
                
                String getCardString = new String();
                getCardString+="<table border=1 width=\"100%\" id=\"CradList\">";
                getCardString+="<thead>";
                getCardString+="<tr>";
                getCardString+="<th>Card Number</th>";
                if(user.getBPlantModify())
                {
                    getCardString+="<th>Modify Card</th>";
                
                }
                getCardString+="</tr>";
                getCardString+="</thead>";
                getCardString+="<tbody>";
                int rowId=0;
                for(hibernate.pojo.TblCard i: cardList)
                {
                    getCardString+="<tr>";
                    getCardString+=("<td>" + i.getCCardId() + "</td>");
                    if(user.getBPlantModify())
                    {
                        getCardString+=("<td><button id=\"" + i.getCCardId() + "\" value=\"" + rowId + "\" type=\"button\" onclick=\"modifyCard(this)\"> Modify </button> </td>");
                    }
                    getCardString+="</tr>";
                    rowId++;
                }
                out.println(getCardString);
        %>  
    </body>
</html>
