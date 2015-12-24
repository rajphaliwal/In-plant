<%-- 
    Document   : link
    Created on : Apr 20, 2015, 10:14:40 AM
    Author     : Raj-HP
--%>

<%@page import="java.util.Map"%>
<%@page import="hibernate.helper.EposList"%>
<%@page import="java.util.List"%>
<%@page import="hibernate.pojo.TblPlant"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/placeholder.js" type="text/javascript"></script>
        <title>Link</title>
        <script>
            function homelink()
            {
                document.link.action = "Home";
                document.link.submit();
            }
            function linkaction(button)
            {
                if(document.getElementById("epos1").length < 2)
                {
                    alert("Atleast require two epos to add a link");
                    return;
                }
                var number = /^\d+$/;
                var a = document.forms["link"]["timeinbetween"].value;
                if (!number.test(a))
                {
                    alert("Expected Time : Expected Integer");
                    return;
                }
                var dropdown1 = document.getElementById("epos1");
                document.getElementById("from").value = dropdown1.value;
                var dropdown2 = document.getElementById("epos2");
                document.getElementById("to").value = dropdown2.value;
                document.link.action = "AddLink";
                document.link.submit();
            }
        </script>
    </head>
    <body>

        <div class="container">
            <div class="row">
                <div class="jumbotron">
                    <h2 style="text-align: center">LInks</h2>
                </div>
            </div>
            <%
                ValueStack stack = ActionContext.getContext().getValueStack();
                Map sesion = (Map)ActionContext.getContext().getSession();
                if(sesion.get("user")==null)
                {
                    RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                    rd.forward(request, response);
                }
                hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers)sesion.get("user");
            %>
            <div class="row">
                <div class="col-md-4 col-md-offset-4 jumbotron"> 
                    <div class="form-group">
                        <select id="epos1" class="form-control">
                            <%
                                out.println("<option>Choose Epos From</option>");
                                EposList t = new EposList();
                                List<hibernate.pojo.TblEpos> eposList = t.getEposList(user.getTblPlant().getIPlantId().toString());    
                                for (int i = 0; i < eposList.size(); i++) {
                                    out.println("<option value=\"" + eposList.get(i).getIMachineId() + "\">" + eposList.get(i).getTGatewayName() + "</option>");
                                }
                            %>
                        </select>
                        <br>
                        <select class="form-control" id="epos2" >
                            <%
                                out.println("<option>Choose Epos To</option>");
                                for (int i = 0; i < eposList.size(); i++) {
                                    out.println("<option value=\"" + eposList.get(i).getIMachineId() + "\">" + eposList.get(i).getTGatewayName() + "</option>");
                                }
                            %>
                        </select>
                        <br>
                    </div>
                    <form role="form" name="link" action="" method="post">
                        <div class="form-group">
                            <input type="hidden" name="Id" id="Id" value="<% out.print(user.getTblPlant().getIPlantId().toString());%>">
                            <input type="hidden" name="from" id="from" value=""/>
                            <input type="hidden" name="to" id="to" value=""/>
                            <label>Expected Time Between Them</label>
                            <input class="form-control" type="text" name="timeinbetween" placeholder="Enter Time in Minutes" onfocus="hide(this)" onblur="show(this, 'Enter Time in MInutes')"/><br>
                            
                            <input type="button" class="btn btn-success col-sm-12" name="next" id="next" value="Submit" onClick = "linkaction(this)" /><br><br>
                            <input type="button" class="btn btn-info col-sm-12" name="home" id="home" value="Home" onClick = "homelink()" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
