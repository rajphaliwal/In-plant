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
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="js/dataTables.jqueryui.js"></script>
        <link href="css/popup.css" rel="stylesheet" type="text/css"/>
        <script src="js/popup.js"></script>
        <link href="css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="css/jquery-ui.css" rel="stylesheet">
        <link href="css/dataTables.jqueryui.css" rel="stylesheet">        
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
        <link rel="stylesheet" href="css/app.min.1.css">
        <link rel="stylesheet" href="css/app.min.2.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/menu.css">
        <style type="text/css">
                    .dataTables_wrapper .ui-toolbar{                         
                margin-left: 5%;
                width: 90%;
                padding-bottom: 0px;
                padding-top: 0px;
            }
             .dataTables_scroll{
                width: 90%;
                margin-left: 5%;                
            }            
            .dataTables_length label{
                 padding-top: 4%;
            }
            table.dataTable tbody td {
                  padding: 3px 10px;
            }
            table.dataTable .odd{
                 background-color: #BEBFB6;
            }
        </style>

        <script type="text/javascript">
                    
            $(document).ready(function () {
                $('#table_id').dataTable({
                    "aLengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                    "pagingType": "full_numbers",
                    "scrollY":        "300px",                    
                    "scrollCollapse": true,
                    
                });
                
            });
            
            function editDetails(index){
				document.getElementById('divHeader').innerHTML="Edit Terminal Details <button type='button' class='close' data-dismiss='modal'>&times;</button><i class='fa-fuel-pump'></i>";
			
				var desc=document.getElementById('description_hidden_'+index).value;
				var location=document.getElementById('locationName_hidden_'+index).value;
				var terminalId=document.getElementById('tId_hidden_'+index).value;
				var locationId=document.getElementById('locId_hidden_'+index).value;
			
				var latitude=document.getElementById('latitude_hidden_'+index).value;
				var longitude=document.getElementById('longitude_hidden_'+index).value;
				var t_address=document.getElementById('t_address_hidden_'+index).value;
				var s_m_address=document.getElementById('s_m_address_hidden_'+index).value;
				var s_m_name=document.getElementById('s_m_name_hidden_'+index).value;
				var s_m_phone=document.getElementById('s_m_phone_hidden_'+index).value;
				var s_terminal_tag=document.getElementById('s_terminal_tag_hidden_'+index).value;
				var s_zone=document.getElementById('s_zone_hidden_'+index).value;
				var s_pin_code=document.getElementById('s_pin_code_hidden_'+index).value;
				var s_category=document.getElementById('s_category_hidden_'+index).value;
				var s_loc_type=document.getElementById('s_loc_type_hidden_'+index).value;
				var stationType=document.getElementById('swipeStation_hidden_'+index).value;
				var phNum=document.getElementById('s_m_phone_hidden_'+index).value;
				var cName=document.getElementById('s_c_name_hidden_'+index).value;
				
				document.getElementById('terminalDisplay').innerHTML=desc+"<input type='hidden' name='terminalNo' value='"+desc+"'/>";
				document.getElementById('locationDisplay').innerHTML=location+"<input type='hidden' name='locationId' value='"+locationId+"'/>";
				document.getElementById('terminalIdDis').innerHTML=terminalId+"<input type='hidden' name='terminalID' value='"+terminalId+"'/>";
				          
				
				 document.getElementById('stationType').value=stationType;
				 document.getElementById('categoryType').value=s_category;
				 document.getElementById('locationType').value=s_loc_type;
				 document.getElementById('region').value=s_zone;
				 document.getElementById('latitute').value=latitude;
				 document.getElementById('longitute').value=longitude;
				 document.getElementById('terminalTag').value=s_terminal_tag;
				 document.getElementById('add').value=t_address;
				 document.getElementById('pinCode').value=s_pin_code;
				 document.getElementById('merchantName').value=s_m_name;
				 document.getElementById('address').value=s_m_address;
				 document.getElementById('phNum').value=phNum;
				 document.getElementById('perName').value=cName;
				 
				 
				 
				document.getElementById('process').value="update";
				document.getElementById('bShow').click();
			}
			function addNew(){
				document.getElementById('divHeader').innerHTML="Add Terminal Details <button type='button' class='close' data-dismiss='modal'>&times;</button><i class='fa-fuel-pump'></i>";
				document.getElementById('terminalDisplay').innerHTML="<input type='text' name='terminalNo' value='' style='width: 50%' />";
				document.getElementById('locationDisplay').innerHTML="<select name='locationId' style='width: 50%'><option value='0'>--Select Location--</option><logic:iterate id='x' name='LOCATION_DETAILS'><option value='${x.ids}'>${x.name}</option></logic:iterate></select>";
				document.getElementById('process').value="add";
				document.getElementById('bShow').click();
			}

        </script>
        <script>
            var dr_id;
            function popup(button)
            {
                dr_id = button.id;
                pop('popDiv');
            }
            function xyz()
            {
                var xmlhttp;
                if (window.XMLHttpRequest)
                {
                    // code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp=new XMLHttpRequest();
                }
                else
                {
                    // code for IE6, IE5
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange=function()
                {
                    if(xmlhttp.readyState==4 && xmlhttp.status==200)
                    {
                        location.reload();
                    }
                };
                var a = document.getElementById("TDriverName").value;
                var b = document.getElementById("TDriverAddr1").value;
                var c = document.getElementById("TDriverAddr2").value;
                var d = document.getElementById("TDriverCity").value;
                var e = document.getElementById("TStateId").value;
                var f = document.getElementById("IDriverPin").value;
                var g = document.getElementById("TDriverEmailId").value;
                var h = document.getElementById("TLicenceNo").value;
                
                xmlhttp.open("GET", "jsp/UpdateDriver.jsp?dr_id=" + dr_id + "&dr_name=" + a + "&dr_addr1=" + b + "&dr_addr2=" + c +
                                    "&dr_city=" + d "&dr_state=" + e + "&dr_pin=" + f "&dr_email=" + g + "&dr_lnumber=" + h, true);
                xmlhttp.send();
            }
        </script>
        <script>
            function adddrvr()
            {
                document.add.action = "loggedIn-AddDriver";
                document.add.submit();
            }
        </script>
    </head>
    <body class="sw-toggled" style="padding-top:70px">
        <jsp:include page="includes/header.jsp"></jsp:include>
        <div><jsp:include page="Menu.jsp"/></div><br>
         <%
                ValueStack stack = ActionContext.getContext().getValueStack();
                Map sesion = (Map)ActionContext.getContext().getSession();
                if(sesion.get("user")==null)
                {
                    RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                    rd.forward(request, response);
                }
                hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers)sesion.get("user");
                
                hibernate.helper.DriverList dl = new hibernate.helper.DriverList();
                List<hibernate.pojo.TblDriver> driverList = dl.getDriverList(user.getTblPlant().getIPlantId().toString());
                
                String getDriverString = new String();
                getDriverString+="<table border=1 width=\"100%\" id=\"table_id\">";
                getDriverString+="<thead>";
                getDriverString+="<tr>";
                getDriverString+="<th>Driver Number</th>";
                getDriverString+="<th>Driver Address 1</th>";
                getDriverString+="<th>Driver Address 2</th>";
                getDriverString+="<th>City</th>";
                getDriverString+="<th>State</th>";
                getDriverString+="<th>Pin</th>";
                getDriverString+="<th>Driver email</th>";
                getDriverString+="<th>License Number</th>";
                if(user.getBPlantModify())
                {
                    getDriverString+="<th>Modify Driver</th>";
                }
                getDriverString+="</tr>";
                getDriverString+="</thead>";
                getDriverString+="<tbody>";
                int rowId=0;
                for(hibernate.pojo.TblDriver i: driverList)
                {
                    getDriverString+="<tr>";
                    getDriverString+=("<td>" + i.getTDriverName() + "</td>");
                    getDriverString+=("<td>" + i.getTDriverAddr1() + "</td>");
                    getDriverString+=("<td>" + i.getTDriverAddr2() + "</td>");
                    getDriverString+=("<td>" + i.getTDriverCity() + "</td>");
                    getDriverString+=("<td>" + i.getTStateId() + "</td>");
                    getDriverString+=("<td>" + i.getIDriverPin() + "</td>");
                    getDriverString+=("<td>" + i.getTDriverEmailId() + "</td>");
                    getDriverString+=("<td>" + i.getTLicenceNo() + "</td>");
                    if(user.getBPlantModify())
                    {
                        getDriverString+=("<td><button id=\"" + i.getIDriverId() + "\" value=\"" + rowId + "\" type=\"button\" onclick=\"pop('popDiv')\"> Modify </button> </td>");
                    }
                    getDriverString+="</tr>";
                    rowId++;
                }
                getDriverString+="</tbody>";
                out.println(getDriverString);
                if(user.getBAddDriver())
                    out.println(" <form name=\"add\"> " + 
                        "<input type=\"submlt\" value=\"Add New Driver\" onclick=\"adddrvr()\"/><br><br></form> ");
        %>
        
        <div id="popDiv" class="ontop">
            <div id="popup">
                <label for="Path" id="heading">Modify</label><br>
                <form>
                    <label>Driver Name:</label>
                    <input class="form-control" type="text" name="TDriverName" id = "TDriverName" placeholder="Enter Driver Name" onfocus="hide(this)" onblur="show(this, 'Enter Driver Name')"/><br>
                    <label>Driver Address 1: </label>
                    <input class="form-control" type="text" name="TDriverAddr1" id ="TDriverAddr1"  placeholder="Enter Driver's 1st Address" onfocus="hide(this)" onblur="show(this, 'Enter Drivers 1st Address')" /><br>
                    <label>Driver Address 2: </label>
                    <input class="form-control" type="text" name="TDriverAddr2" id="TDriverAddr2" placeholder="Enter Driver's 2nd Address" onfocus="hide(this)" onblur="show(this, 'Enter Drivers 2nd Address')"/><br>
                    <label>City: </label>
                    <input class="form-control" type="text" name="TDriverCity" id ="TDriverCity" placeholder="Enter City" onfocus="hide(this)" onblur="show(this, 'Enter City')" /><br>
                    <label>State Id:   </label>
                    <input type="text" name="TStateId" id ="TStateId" class="form-control" placeholder="Enter State" onfocus="hide(this)" onblur="show(this, 'Enter State')" /><br>
                    <label>Driver Pin: </label>  
                    <input type="text" name="IDriverPin" id ="IDriverPin" class="form-control" placeholder="Enter Driver Pin" onfocus="hide(this)" onblur="show(this, 'Enter Driver Pin')" /><br>
                    <label>Driver Email Id:   </label>
                    <input type="text" name="TDriverEmailId" id ="TDriverEmailId" class="form-control" placeholder="Enter Email Id"  onfocus="hide(this)" onblur="show(this, 'Enter Email Id')"/><br>
                    <label>License No:   </label>
                    <input type="text" name="TLicenceNo" id ="TLicenceNo" class="form-control" placeholder="Enter Licence No" onfocus="hide(this)" onblur="show(this, 'Enter Licence No')" /><br>
                    
                    <input type="button" name="Update" id="Update" value="Update" onClick = "xyz()" /><br><br>
                    <input type="button" name="Cancel" id="Cancel" value="Cancel" onClick = "hide('popDiv')" /><br><br>
                </form>
            </div>
        </div>
    </body>
    
</html>
