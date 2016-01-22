<%-- 
    Document   : path
    Created on : Apr 24, 2015, 9:34:19 PM
    Author     : Raj-HP
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="hibernate.helper.EposList"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="hibernate.pojo.TblPlant"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <title>Path</title>
    </head>
    <body>

        <script>
            function pathaction(button)
            {
                if(button.id === "home")
                {
                    document.path.action = "Home";
                    document.path.submit();
                }
                else
                {
                    var temp = document.getElementById("addepos").value;
                    temp=temp.substring(0,temp.length - 1);
                    document.getElementById("addepos").value = temp;
                    document.path.action = "AddPath";
                    document.path.submit();
                }
            }
            function addPath()
            {
                var dropdown = document.getElementById("epos");
                var dropdownText = dropdown.options[dropdown.selectedIndex].text;
                
                paths = document.getElementById("addepos").value + dropdown.value;
                paths = paths + ",";
                document.getElementById("addepos").value = paths;
                
                var newElement = document.createElement("p");
                newElement.setAttribute('class', 'newElement');
                var node = document.createTextNode(dropdownText);
                dropdownText = null;
                newElement.appendChild(node);
                
                var parent = document.getElementById("div1");
                var child = document.getElementById("reset");
                parent.insertBefore(newElement, child);
                
                document.getElementById("reset").style.visibility = 'visible';
                
                var tname = document.getElementById("TName");
                if(tname.value !== "")
                {
                    tname.setAttribute('readonly', 'readonly');
                }
            }
            function resetpath()
            {
                paths = "";
                document.getElementById("addepos").value = paths;
                var elements = document.getElementsByClassName('newElement');
                while(elements.length > 0){
                    elements[0].parentNode.removeChild(elements[0]);
                }
            }
        </script>
        <%
                ValueStack stack = ActionContext.getContext().getValueStack();
                Map sesion = (Map)ActionContext.getContext().getSession();
                hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers)sesion.get("user");
        %>
        <div class="container">
            <div class="row">
                <div class="jumbotron">
                    <h2 style="text-align: center">Path</h2>
                </div>
            </div>
            <div>
                ${status}
            </div>
            <div class="row">
                <div class="col-md-4 col-md-offset-4 jumbotron"> 
                    
                    <form name="path" action="" method="post">
                        <div class="form-group" id="div1">
                            <label>Path Name</label>
                            <input class="form-control" type="text" name="TName" id="TName"/><br>
                            <div class="form-group" id="div2">
                                <select class="form-control" id="epos" >
                                    <%
                                        out.println("<option>Choose Epos From</option>");
                                        EposList t = new EposList();
                                        List<hibernate.pojo.TblEpos> eposList = t.getEposList(user.getTblPlant().getIPlantId().toString());
                                        for (int i = 0; i < eposList.size(); i++) {
                                            out.println("<option value=\"" + eposList.get(i).getIMachineId() + "\">" + eposList.get(i).getTGatewayName() + "</option>");
                                        }
                                    %>
                                </select>
                                <br><br>
                            </div>
                                <input type="button" name="reset" id="reset" value="Reset" class="btn btn-info col-sm-12" style="visibility: hidden;" onClick = "resetpath()" /><br><br>
                            <input type="hidden" name="Id" id="Id" value="<% out.print(user.getTblPlant().getIPlantId().toString()); %>" >
                            <input type="hidden" name="addepos" id="addepos" value=""/>
                            <input type="button" class="btn btn-info col-sm-12" name="add" id="addpath" value="Add to path" onClick = "addPath()" /><br><br>          
                            <input type="button" class="btn btn-info col-sm-12" name="add" id="add" value="Save Paths" onClick = "pathaction(this)" /><br><br>
                            <input type="button" name="home" class="btn btn-success col-sm-12"  id="home" value="Home" onClick = "pathaction(this)" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
