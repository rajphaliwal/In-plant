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
        <title>Vehicle</title>
    </head>
    <body>
        <div class="container">
            <!--<div class="row">
                <div class="jumbotron">
                    <h2 style="text-align: center">Vehicle</h2>
                </div>
            </div>-->
            <script>
                function vehicleaction(button)
                {
                    if(button.id == "home")
                        document.vehicle.action = "Home";
                    else if(button.id == "next")
                    {
                        var input = document.forms["vehicle"]["vid"];
                        if(input.value == '')
                            input.style.borderColor="red";
                        else
                            input.style.border="none";
                        
                        var input = document.forms["vehicle"]["TChasisNo"];
                        if(input.value == '')
                            input.style.borderColor="red";
                        else
                            input.style.borderColor="blue";
                        
                        var input = document.forms["vehicle"]["TVehicleType"];
                        if(input.value == '')
                            input.style.borderColor="red";
                        else
                            input.style.borderColor="blue";
                        
                        var input = document.forms["vehicle"]["ILoadCapacity"];
                        if(input.value == '')
                            input.style.borderColor="red";
                        else
                            input.style.borderColor="blue";
                        
                        var input = document.forms["vehicle"]["TNationalPermit"];
                        if(input.value == '')
                            input.style.borderColor="red";
                        else
                            input.style.borderColor="blue";
                        
                        var input = document.forms["vehicle"]["dtLicenseExpiryDate"];
                        if(input.value == '')
                            input.style.borderColor="red";
                        else
                            input.style.borderColor="blue";
                        
                        var number = /^\d+$/;
                        var a = document.forms["vehicle"]["ILoadCapacity"].value;
                        if (!number.test(a))
                        {
                            alert("Load capacity : Expected Integer");
                            return;
                        }
                        if(document.getElementById("Transporter").length < 1)
                        {
                            alert("Add Transporter to add Vehicle");
                            return;
                        }
                        document.vehicle.action = "AddVehicle";
                        var dropdown = document.getElementById("Transporter");
                        document.getElementById("TOwner").value = dropdown.value;
                    }
                    document.vehicle.submit();
                }
            </script>
            <%
                ValueStack stack = ActionContext.getContext().getValueStack();
                Map sesion = (Map)ActionContext.getContext().getSession();
                hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers)sesion.get("user");
            %>
            <div class="row">
                <div class="col-md-4 col-md-offset-4 jumbotron">
                    <h2 style="text-align: center">Add Vehicle</h2>
                    <form name="vehicle" action="" method="post">
                        <div class="form-group">
                            <input type="hidden" name="Id" value="<%out.print(user.getTblPlant().getIPlantId().toString());%>" ><br>
                            <label>Vehicle Id:  </label>
                            <input type="text" class="form-control" name="vid" placeholder="Enter Vehicle Id" onfocus="hide(this)" onblur="show(this, 'Enter Vehicle Id')"/>
                            <label>Chasis No:  </label>
                            <input type="text" class="form-control" name="TChasisNo" placeholder="Enter Chasis No" onfocus="hide(this)" onblur="show(this, 'Enter Chasis No')"/>
                            <label>Vehicle Type: </label>
                            <input type="text" class="form-control" name="TVehicleType" placeholder="Enter Vehicle Type" onfocus="hide(this)" onblur="show(this, 'Enter Vehicle Type')"/>
                            <label>Loading Capacity: </label>
                            <input type="text" class="form-control" name="ILoadCapacity" placeholder="Enter Loading Capacity" onfocus="hide(this)" onblur="show(this, 'Enter Loading Capacity')"/>
                            <label>National Permit:   </label>
                            <input type="text" class="form-control" name="TNationalPermit" placeholder="Enter National Permit" onfocus="hide(this)" onblur="show(this, 'Enter National Permit')"/>
                            <label>License Expiry Date: </label>
                            <input type="date" class="form-control" name="dtLicenseExpiryDate"/>
                            <input type="hidden" name="TOwner" id="TOwner" value="" >
                        </div>
                    </form>
                    <div class="form-group">
                        <select class="form-control" id="Transporter" >
                            <%
                                out.println("<option>Choose Transporter</option>");
                                hibernate.helper.TransporterList t = new hibernate.helper.TransporterList();
                                List<hibernate.pojo.TblTransporter> transporterList = t.getTransporterList(user.getTblPlant().getIPlantId().toString());
                                for (int i = 0; i < transporterList.size(); i++) {
                                    out.println("<option value=\"" + transporterList.get(i).getITransporterId() + "\">" + transporterList.get(i).getTTransporterName() + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <form>
                        <div class="form-group">
                            <input type="button" class="btn btn-success col-sm-12" name="next" id="next" value="Submit" onClick = "vehicleaction(this)" /><br><br>
                            <input type="button" class="btn btn-info col-sm-12" name="home" id="home" value="Home" onClick = "vehicleaction(this)" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
