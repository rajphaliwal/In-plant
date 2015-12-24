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
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Path</title>
        <script>
            function pathaction(button)
            {
                var temp = document.getElementById("addepos").value;
                temp=temp.substring(0,temp.length - 1);
                document.getElementById("addepos").value = temp;
                if (button.id === "add")
                {
                    document.path.action = "insertpath";
                }
                else if (button.id === "next")
                {
                    document.path.action = "insertpathnext";
                }
                else if (button.id === "skip")
                {
                    //window.location = "/ProjectInPlant2/";
                    document.path.action = "skippath";

                }
                document.path.submit();
            }
            function addPath()
            {
                var dropdown = document.getElementById("epos");
                var temp = document.getElementById("addepos").value + dropdown.value;
                temp = temp + ",";
                document.getElementById("addepos").value = temp;
                alert(temp);
                dropdown.options[dropdown.selectedIndex]=null;
            }
            /*function skip()
            {
                window.open('Login.jsp', '_self', false);
            }*/
        </script>
    </head>
    <body>
        <%
        ValueStack stack = ActionContext.getContext().getValueStack();
        Map sesion = (Map) ActionContext.getContext().getSession();
        hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers) sesion.get("user");
        %>
        <div class="container">
            <div class="row">
                <div class="jumbotron">
                    <h2 style="text-align: center">Path</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-md-offset-4 jumbotron"> 
                    <div class="form-group">
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
                    <form name="path" action="" method="post">
                        <div class="form-group">
                            <label>Path Name</label>
                            <input class="form-control" type="text" name="TName"/><br>
                            <input type="hidden" name="Id" id="Id" value="<% out.print(user.getTblPlant().getIPlantId().toString());%>" >
                            <input type="hidden" name="addepos" id="addepos" value=""/>
                            <input type="button" class="btn btn-info col-sm-12" name="add" id="addpath" value="Add to path" onClick = "addPath()" /><br><br>          
                            <input type="button" class="btn btn-info col-sm-12" name="add" id="add" value="Add More Paths" onClick = "pathaction(this)" /><br><br>
                            <input type="submit" name="next" class="btn btn-success col-sm-12"  id="next" value="Submit And Next Page" onClick = "pathaction(this)" /><br><br>
                            <input type="button" name="skip" class="btn btn-success col-sm-12"  id="skip" value="Skip" onClick = "pathaction(this)" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
