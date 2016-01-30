<%-- 
    Document   : ViewPath
    Created on : Dec 21, 2015, 2:41:35 PM
    Author     : Raj-HP
--%>

<%@page import="hibernate.helper.Epos_handler"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Path</title>
        <link rel="stylesheet" href="css/table.css">
        <link href="css/popup.css" rel="stylesheet" type="text/css"/>
        <script src="js/popup.js"></script>
        <script>
            function addpath()
            {
                document.add.action = "loggedIn-AddPath";
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
                
                hibernate.helper.PathList pl = new hibernate.helper.PathList();
                List<hibernate.pojo.TblPaths> pathList = pl.getPathList(user.getTblPlant().getIPlantId().toString());
                
                String getPathString = new String();
                getPathString+="<table border=1 width=\"100%\" id=\"PathList\">";
                getPathString+="<thead>";
                getPathString+="<tr>";
                getPathString+="<th>Path Name</th>";
                getPathString+="<th>Path Details</th>";
                if(user.getBPlantModify())
                {
                    getPathString+="<th>Modify Path</th>";
                
                }
                getPathString+="</tr>";
                getPathString+="</thead>";
                getPathString+="<tbody>";
                int rowId=0;
                for(hibernate.pojo.TblPaths i: pathList)
                {
                    getPathString+="<tr>";
                    getPathString+=("<td>" + i.getTName() + "</td>");
                    //getPathString+=("<td>" + i.getTArrPath() + "</td>");
                    String str = i.getTArrPath();
                    String temp[] = str.split(",");
                    String res = new String();
                    int id;
                    for(int j = 0; j<temp.length; j++)
                    {
                        hibernate.helper.Epos_handler EposList = new Epos_handler();
                        if(temp[j].charAt(0) == '-')
                        {
                            //temp[j] = temp[j].substring(1);
                            id = (-1)*(Integer.parseInt(temp[j].substring(1)));
                        }
                        else
                            id = Integer.parseInt(temp[j]);
                        hibernate.pojo.TblEpos epos = EposList.get_tuple(id);
                        res+=epos.getTGatewayName();
                        if(j<(temp.length-1))
                            res+="->";
                    }
                    getPathString+=("<td>" + res + "</td>");
                    res="";
                    if(user.getBPlantModify())
                    {
                        getPathString+=("<td><button id=\"" + i.getIPathId() + "\" value=\"" + rowId + "\" type=\"button\" onclick=\"pop('popDiv')\"> Modify </button> </td>");
                    }
                    getPathString+="</tr>";
                    rowId++;
                }
                getPathString+="</tbody>";
                out.println(getPathString);
                if(user.getBAddPath())
                    out.println(" <form name=\"add\"> " + 
                        "<input type=\"submlt\" value=\"Add New Path\" onclick=\"addpath()\"/><br><br></form> ");
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
