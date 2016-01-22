<%-- 
    Document   : process
    Created on : Jun 1, 2015, 10:22:25 AM
    Author     : Raj-HP
--%>

<%@page import="java.util.Map"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="hibernate.pojo.TblPlant"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/placeholder.js" type="text/javascript"></script>
        <script src="js/jquery-min.js" type="text/javascript"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <title>Process Page</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="jumbotron">
                    <h2 style="text-align: center">Process</h2>
                </div>
            </div>
            <div>
                ${status}
            </div>
            <script>
                function homeprocess()
                {
                    document.Process.action = "Home";
                    document.Process.submit();
                }
                function processaction(button)
                {
                    var a = document.forms["Process"]["processname"].value;
                    if (a == "")
                    {
                        alert("Enter Process Name.");
                        return;
                    }

                    document.Process.action = "AddProcess";
                    document.Process.submit();
                }
                function checkprocess()
                {
                    if(document.forms["Process"]["processname"].value.length != 0)
                    {
                        var xmlhttp = new XMLHttpRequest();
                        var Id = document.forms["Process"]["Id"].value;
                        var name = document.forms["Process"]["processname"].value;
                        //var plantid = document.getElementById("IPlantId").value;
                        var url = "jsp/check/CheckProcess.jsp?Id=" + Id + "&name=" + name;
                        xmlhttp.onreadystatechange = function()
                        {
                            if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
                            {
                                //alert(xmlhttp.responseText);
                                if(xmlhttp.responseText.trim() == "Process already exists")
                                    document.getElementById("check").style.color = 'red';
                                else
                                    document.getElementById("check").style.color = 'green';
                                document.getElementById("check").innerHTML = xmlhttp.responseText;
                            }

                        };
                        try
                        {
                            xmlhttp.open("GET",url,true);
                            xmlhttp.send();
                        }
                        catch(e){   alert("unable to connect to server"); }
                    }
                    else
                        document.getElementById("check").innerHTML = "";
                }
            </script>
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

                    <form name="Process" action="" method="post">
                        <div class="form-group">
                            <input  type="hidden" name="Id" value="<%out.print(user.getTblPlant().getIPlantId().toString());%>"/>
                            <label>Process Name : </label>
                            <input class="form-control" type="text" name="processname"  placeholder="Enter Process Name" onfocus="hide(this)" onblur="show(this, 'Enter Process Name')" oninput="checkprocess()"/><span id="check" style="color: red"></span><br><br>
                            
                            <input type="button" name="next" id="next" class="btn btn-success col-sm-12"  value="Submit" onClick = "processaction(this)" /><br><br>
                            <input type="button" name="home" id="home" class="btn btn-info col-sm-12"  value="Home" onClick = "homeprocess()" />
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </body>
</html>
