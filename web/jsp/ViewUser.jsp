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
        <script>
            function adduser()
            {
                document.add.action = "loggedIn-AddUser";
                document.add.submit();
            }
        </script>
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
                
                hibernate.helper.UsersList ul = new hibernate.helper.UsersList();
                List<hibernate.pojo.TblUsers> usersList = ul.getUsersList(user.getTblPlant().getIPlantId().toString());
                
                String getUsersString = new String();
                getUsersString+="<table border=1 width=\"100%\" id=\"CradList\">";
                getUsersString+="<thead>";
                getUsersString+="<tr>";
                getUsersString+="<th>Users Name</th>";
                if(user.getBPlantModify())
                {
                    getUsersString+="<th>Modify Card</th>";
                
                }
                getUsersString+="</tr>";
                getUsersString+="</thead>";
                getUsersString+="<tbody>";
                int rowId=0;
                for(hibernate.pojo.TblUsers i: usersList)
                {
                    getUsersString+="<tr>";
                    getUsersString+=("<td>" + i.getSUsername() + "</td>");
                    if(user.getBPlantModify())
                    {
                        getUsersString+=("<td><button id=\"" + i.getSUsername() + "\" value=\"" + rowId + "\" type=\"button\" onclick=\"pop('popDiv')\"> Modify </button> </td>");
                    }
                    getUsersString+="</tr>";
                    rowId++;
                }
                getUsersString+="</tbody>";
                out.println(getUsersString);
                if(user.getBAddUser())
                    out.println(" <form name=\"add\"> " + 
                        "<input type=\"submlt\" value=\"Add New User\" onclick=\"adduser()\"/><br><br></form> ");
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
