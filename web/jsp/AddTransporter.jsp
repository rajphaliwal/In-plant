<%-- 
    Document   : transporter
    Created on : 5 Apr, 2015, 12:09:25 PM
    Author     : Ankit
--%>

<%@page import="java.util.Map"%>
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
        <title>Transporter</title>
        <script>
            function transporteraction(button)
            {
                if(button.id == "home")
                {
                    document.transporter.action = "Home";
                    document.transporter.submit();
                }
                else if (button.id === "next")
                {
                    if(document.getElementById("TTransporterName").value.length == 0)
                        alert("Trnsporter Name Required");
                    else if(document.getElementById("TTransporterMobileNo").value.length == 0)
                        alert("Mobile Number Required");
                    else if(document.getElementById("TTransporterAddr").value.length == 0)
                        alert("Address Required");
                    else if(document.getElementById("TTransporterCity").value.length == 0)
                        alert("City Required");
                    else if(document.getElementById("TTransporterState").value.length == 0)
                        alert("State Required");
                    else if(document.getElementById("ITransporterPin").value.length == 0)
                        alert("Pincode Required");
                    else if(document.getElementById("TTransporterEmailId").value.length == 0)
                        alert("Email Id Required");
                    else if(document.getElementById("SUsername").value.length == 0)
                        alert("Username Required");
                    else if(document.getElementById("SPassword").value.length == 0)
                        alert("Password Required");
                    else
                    {
                        document.transporter.action = "AddTransporter";
                        document.transporter.submit();
                    }
                }
                
            }
            
            function checkuser()
            {
                var xmlhttp = new XMLHttpRequest();
                var username = document.forms["transporter"]["SUsername"].value;
                var url = "jsp/check/CheckUsername.jsp?username=" + username;
                xmlhttp.onreadystatechange = function()
                {
                    if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        if(xmlhttp.responseText.trim() == "Username already exists")
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
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="jumbotron">
                    <h2 style="text-align: center">Transporter</h2>
                </div>
            </div>
            <div>
                ${status}
            </div>
            <div class="row">
                <div class="col-md-4 col-md-offset-4 jumbotron"> 
                    <form name="transporter" action="" method="post">
                        <div class="form-group">
                        <input type="hidden" name="Id" value="<% out.print(user.getTblPlant().getIPlantId().toString());%>" ><br>
                        <label>Name:  </label> 
                        <input type="text" class="form-control" name="TTransporterName" id="TTransporterName" placeholder='Enter Transporter Name' onfocus="hide(this)" onblur="show(this, 'Enter Transporter Name')"/><br>
                        <label>Mobile: </label>
                        <input type="text" class="form-control" name="TTransporterMobileNo" id="TTransporterMobileNo" placeholder="Enter Mobile No" onfocus="hide(this)" onblur="show(this, 'Enter Mobile No')"/><br>
                        <label>Address:</label>
                        <input type="text" class="form-control" name="TTransporterAddr" id="TTransporterAddr" placeholder="Enter Address" onfocus="hide(this)" onblur="show(this, 'Enter Address')"/><br>
                        <label>City:  </label> 
                        <input type="text" class="form-control" name="TTransporterCity" id="TTransporterCity" placeholder="Enter City" onfocus="hide(this)" onblur="show(this, 'Enter City')"/><br>
                        <label>State:  </label>
                        <input type="text" class="form-control" name="TTransporterState" id="TTransporterState" placeholder="Enter State" onfocus="hide(this)" onblur="show(this, 'Enter State')"/><br>
                        <label>Pin:    </label>
                        <input type="text" class="form-control" name="ITransporterPin" id="ITransporterPin" placeholder="Enter Transporter Pin" onfocus="hide(this)" onblur="show(this, 'Enter Transporter Pin')"/><br>
                        <label>Email:  </label>
                        <input type="text" class="form-control" name="TTransporterEmailId" id="TTransporterEmailId" placeholder="Enter Email Id" onfocus="hide(this)" onblur="show(this, 'Enter Email Id')"/><br>
                        <label>Username: </label>
                        <input type="text" class="form-control" name="SUsername" id="SUsername" placeholder="Enter Username" onfocus="hide(this)" onblur="show(this, 'Enter Username')" oninput="checkuser()" /><span id="check" style="color: red"></span><br><br>
                        <label>Password: </label>
                        <input type="password" class="form-control" name="SPassword" id="SPassword" placeholder="Enter Password" onfocus="hide(this)" onblur="show(this, 'Enter password')"><br>
                        
                        <input type="button" name="next" id="next" class="btn btn-success col-sm-12" value="Submit" onClick = "transporteraction(this)" /><br><br>
                        <input type="button" name="home" id="home" class="btn btn-info col-sm-12" value="Home" onClick = "transporteraction(this)" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
