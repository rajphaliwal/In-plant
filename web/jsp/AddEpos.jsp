<%-- 
    Document   : epos
    Created on : Apr 5, 2015, 12:23:29 PM
    Author     : Raj-HP
    17251
--%>

<%@page import="java.util.Map"%>
<%@page import="hibernate.pojo.TblPlant"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/placeholder.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Epos</title>
        <script>
            var i;
            function showtimestamp()
            {
                document.getElementById("time").style.display = "block";
                document.getElementById("timestamp").style.display = "block";
                document.getElementById("Bothway").value = "1";
            }
            function hidetimestamp()
            {
                document.getElementById("time").style.display = "none";
                document.getElementById("timestamp").style.display = "none";
                document.getElementById("Bothway").value = "0";
            }
            function eposaction(button)
            {
                if(button.id == "home")
                    document.epos.action = "Home";
                else
                {
                    var number = /^\d+$/;
                    var a = document.forms["epos"]["ITerminalId"].value;
                    if (!number.test(a))
                    {
                        alert("Terminal Id : Expected Integer");
                        return;
                    }
                    var b = document.forms["epos"]["IMachineId"].value;
                    if (!number.test(b))
                    {
                        alert("Machine Id : Expected Integer");
                        return;
                    }
                    var c = document.forms["epos"]["IGateNo"].value;
                    if (!number.test(c))
                    {
                        alert("Gate No : Expected Integer");
                        return;
                    }
                    document.epos.action = "AddEpos";
                }
                document.epos.submit();
            }
            function checktid()
            {
                if(document.forms["epos"]["ITerminalId"].value.length != 0)
                {
                    var xmlhttp = new XMLHttpRequest();
                    var tid = document.forms["epos"]["ITerminalId"].value;
                    var plantid = document.getElementById("IPlantId").value;
                    var url = "jsp/check/CheckTid.jsp?tid=" + tid + "&plantid=" + plantid;
                    xmlhttp.onreadystatechange = function()
                    {
                        if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
                        {
                            //alert(xmlhttp.responseText);
                            if(xmlhttp.responseText.trim() == "Terminal already exists")
                                document.getElementById("check1").style.color = 'red';
                            else
                                document.getElementById("check1").style.color = 'green';
                            document.getElementById("check1").innerHTML = xmlhttp.responseText;
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
                    document.getElementById("check1").innerHTML = "";
            }
            function checkmid()
            {
                if(document.forms["epos"]["IMachineId"].value.length != 0)
                {
                    var xmlhttp = new XMLHttpRequest();
                    var mid = document.forms["epos"]["IMachineId"].value;
                    //var plantid = document.getElementById("IPlantId").value;
                    var url = "jsp/check/CheckMid.jsp?mid=" + mid;
                    xmlhttp.onreadystatechange = function()
                    {
                        if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
                        {
                            //alert(xmlhttp.responseText);
                            if(xmlhttp.responseText.trim() == "Machine already exists")
                                document.getElementById("check2").style.color = 'red';
                            else
                                document.getElementById("check2").style.color = 'green';
                            document.getElementById("check2").innerHTML = xmlhttp.responseText;
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
                    document.getElementById("check2").innerHTML = "";
            }
            function checkgateno()
            {
                if(document.forms["epos"]["IGateNo"].value.length != 0)
                {
                    var xmlhttp = new XMLHttpRequest();
                    var gno = document.forms["epos"]["IGateNo"].value;
                    var plantid = document.getElementById("IPlantId").value;
                    var url = "jsp/check/CheckGateNo.jsp?gno=" + gno + "&plantid=" + plantid;
                    xmlhttp.onreadystatechange = function()
                    {
                        if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
                        {
                            //alert(xmlhttp.responseText);
                            if(xmlhttp.responseText.trim() == "Gate Number already exists")
                                document.getElementById("check3").style.color = 'red';
                            else
                                document.getElementById("check3").style.color = 'green';
                            document.getElementById("check3").innerHTML = xmlhttp.responseText;
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
                    document.getElementById("check3").innerHTML = "";
            }
        </script>
    </head>
    <%
        ValueStack stack = ActionContext.getContext().getValueStack();
        Map sesion = (Map) ActionContext.getContext().getSession();
        if(sesion.get("user")==null)
        {
            RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
            rd.forward(request, response);
        }
        hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers) sesion.get("user");
    %>
    <div class="container">
        <div class="row">
            <div class="jumbotron">
                <h2 style="text-align: center">Epos</h2>
            </div>
        </div>
        <div>
            ${status}
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-4 jumbotron"> 
                <form name="epos" action="" method="post">
                    <input  type="hidden" name="IPlantId" id="IPlantId" value="<% out.print(user.getTblPlant().getIPlantId().toString());%>" />
                    <div class="form-group">
                        <label>Terminal Id:</label>  
                        <input type="text" class="form-control" name="ITerminalId" placeholder="Enter Terminal Id" onfocus="hide(this)" onblur="show(this, 'Enter Terminal Id')" oninput="checktid()"/><span id="check1" style="color: red"></span><br><br>
                        <label>Machine Id: </label> 
                        <input type="text" class="form-control" name="IMachineId" placeholder="Enter Machine Id" onfocus="hide(this)" onblur="show(this, 'Enter Machine Id')" oninput="checkmid()"/><span id="check2" style="color: red"></span><br><br>
                        <label>Gate Number:  </label>
                        <input type="text" class="form-control" name="IGateNo" placeholder="Enter Gate No" onfocus="hide(this)" onblur="show(this, 'Enter Gate No')" oninput="checkgateno()"/><span id="check3" style="color: red"></span><br><br>
                        <label>Gateway Name: </label>
                        <input type="text" class="form-control" name="TGatewayName" placeholder="Enter Gateway Name" onfocus="hide(this)" onblur="show(this, 'Enter Gateway Name')" /><br>
                        <label>Location:    </label>
                        <input type="text" class="form-control" name="TLocation" placeholder="Enter Location" onfocus="hide(this)" onblur="show(this, 'Enter Location')"/><br>
                        <label>Function:	</label>  
                        <input type="radio" class="radio" name="BBothways" value="single" checked onClick="hidetimestamp()"/>Single Way<br>
                        <input type="radio" class="radio" name="BBothways" value="bothway" onClick="showtimestamp()" />Bothway<br>
                        <input type="hidden" name="Bothway" id="Bothway" value="0">
                        <label id="timestamp" style="display:none;">Timestamp:</label>

                        <input type="text" class="form-control" id="time" name="ITimeInBetween" value="0" style="display:none;" />
                        <input type="button" class="btn btn-success btn-success col-sm-12" name="next" id="next" value="Submit" onClick = "eposaction(this)" />
                        <div>&nbsp;</div>
                        <input type="button" value="Home" class="btn btn-info col-sm-12" id="home" onClick = "eposaction(this)" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</html>
