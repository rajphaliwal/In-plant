
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="hibernate.helper.Transporter_handler"%>
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
        <script src="js/placeholder.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://cdn.jsdelivr.net/webshim/1.12.4/extras/modernizr-custom.js"></script>
        <script src="http://cdn.jsdelivr.net/webshim/1.12.4/polyfiller.js"></script>
        <script>
          webshims.setOptions('waitReady', false);
          webshims.setOptions('forms-ext', {types: 'date'});
          webshims.polyfill('forms forms-ext');
        </script>
        <title>Driver</title>
    </head>
    <body>
        <div class="container">
            
            <!--<div class="row">
                <div class="jumbotron">
                    <h2 style="text-align: center">Driver</h2>
                </div>
            </div>-->
            <script>
                function driveraction(button)
                {
                    if(button.id == "home")
                        document.vehicle.action = "Home";
                    else if(button.id == "next")
                    {
                        if(document.getElementById("Transporter").length < 2)
                        {
                            alert("Add Transporter to add Driver");
                            return;
                        }
                        document.vehicle.action = "AddDriver";
                        var dropdown = document.getElementById("Transporter");
                        document.getElementById("TOwner").value = dropdown.value;
                    }
                    document.vehicle.submit();
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
                    <h2 style="text-align: center">Add Driver</h2>
                    <div>
                        ${status}
                    </div>
                    <form role="form" name="vehicle" action="" method="post">
                        <input type="hidden" name="Id" value="<% out.print(user.getTblPlant().getIPlantId().toString()); %>" >
                        <div class="form-group">
                            <label>Driver Name:</label>
                            <input class="form-control" type="text" name="TDriverName" placeholder="Enter Driver Name" onfocus="hide(this)" onblur="show(this, 'Enter Driver Name')"/><br>
                            <label>Driver Address 1: </label>
                            <input class="form-control" type="text" name="TDriverAddr1" placeholder="Enter Driver's 1st Address" onfocus="hide(this)" onblur="show(this, 'Enter Drivers 1st Address')" /><br>
                            <label>Driver Address 2: </label>
                            <input class="form-control" type="text" name="TDriverAddr2" placeholder="Enter Driver's 2nd Address" onfocus="hide(this)" onblur="show(this, 'Enter Drivers 2nd Address')"/><br>
                            <label>City: </label>
                            <input class="form-control" type="text" name="TDriverCity" placeholder="Enter City" onfocus="hide(this)" onblur="show(this, 'Enter City')" /><br>
                            <label>State Id:   </label>
                            <input type="text" name="TStateId" class="form-control" placeholder="Enter State" onfocus="hide(this)" onblur="show(this, 'Enter State')" /><br>
                            <label>Driver Pin: </label>  
                            <input type="text" name="IDriverPin" class="form-control" placeholder="Enter Driver Pin" onfocus="hide(this)" onblur="show(this, 'Enter Driver Pin')" /><br>
                            <label>Country Id:   </label>
                            <input type="text" name="TCountryId" class="form-control" placeholder="Enter Country Id" onfocus="hide(this)" onblur="show(this, 'Enter Country Id')" /><br>
                            <label>Driver Email Id:   </label>
                            <input type="text" name="TDriverEmailId" class="form-control" placeholder="Enter Email Id"  onfocus="hide(this)" onblur="show(this, 'Enter Email Id')"/><br>
                            <label>License No:   </label>
                            <input type="text" name="TLicenceNo" class="form-control" placeholder="Enter Licence No" onfocus="hide(this)" onblur="show(this, 'Enter Licence No')" /><br>
                            <label>License Expiry Date: </label>
                            <input type="date" name="dtLicenseExpiryDate" class="form-control"/>
                        </div>
                        <input type="hidden" name="TOwner" id="TOwner" value="" >
                    </form>
                    <select id="Transporter" class="form-control">
                        <%
                            out.println("<option>Choose Transporter</option>");
                            hibernate.helper.TransporterList t = new hibernate.helper.TransporterList();
                            List<hibernate.pojo.TblTransporter> transporterList = t.getTransporterList(user.getTblPlant().getIPlantId().toString());
                            for (int i = 0; i < transporterList.size(); i++) {
                                out.println("<option value=\"" + transporterList.get(i).getITransporterId() + "\">" + transporterList.get(i).getTTransporterName() + "</option>");
                            }
                        %>
                    </select>
                    <br><br>
                    <form role="form">
                        <div class="form-group">
                            <input type="button"  class="btn btn-success col-sm-12" name="next" id="next" value="Submit" onClick = "driveraction(this)" /><br><br>
                            <input type="button" class="btn btn-info col-sm-12" name="home" id="home" value="Home" onClick = "driveraction(this)" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
