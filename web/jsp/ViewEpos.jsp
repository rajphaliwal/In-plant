<%-- 
    Document   : ViewEPos
    Created on : Dec 21, 2015, 2:40:05 PM
    Author     : Raj-HP
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Epos</title><script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
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
                
                hibernate.helper.EposList el = new hibernate.helper.EposList();
                List<hibernate.pojo.TblEpos> eposList = el.getEposList(user.getTblPlant().getIPlantId().toString());
                
                String getEposString = new String();
                getEposString+="<table border=1 width=\"100%\" id=\"table_id\">";
                getEposString+="<thead>";
                getEposString+="<tr>";
                getEposString+="<th>Terminal Id</th>";
                getEposString+="<th>Machine Id</th>";
                getEposString+="<th>Gate Number</th>";
                getEposString+="<th>Gate Name</th>";
                getEposString+="<th>Gate Location</th>";
                if(user.getBPlantModify())
                {
                    getEposString+="<th>Modify Epos</th>";
                
                }
                getEposString+="</tr>";
                getEposString+="</thead>";
                getEposString+="<tbody>";
                int rowId=0;
                for(hibernate.pojo.TblEpos i: eposList)
                {
                    getEposString+="<tr>";
                    getEposString+=("<td>" + i.getITerminalId() + "</td>");
                    getEposString+=("<td>" + i.getIMachineId() + "</td>");
                    getEposString+=("<td>" + i.getIGateNo() + "</td>");
                    getEposString+=("<td>" + i.getTGatewayName() + "</td>");
                    getEposString+=("<td>" + i.getTLocation() + "</td>");
                    if(user.getBPlantModify())
                    {
                        getEposString+=("<td><button id=\"" + i.getIMachineId() + "\" value=\"" + rowId + "\" type=\"button\" onclick=\"popup('this')\"> Modify </button> </td>");
                    }
                    getEposString+="</tr>";
                    rowId++;
                }
                getEposString+="</tbody>";
                out.println(getEposString);
                if(user.getBAddEpos())
                    out.println(" <form name=\"add\"> " + 
                        "<input type=\"submlt\" value=\"Add New Epos\" onclick=\"addepos()\"/><br><br></form> ");
        %>
        
        <script>
            function addepos()
            {
                document.add.action = "loggedIn-AddEpos";
                document.add.submit();
            }
            var mat_id;
            function popup(button)
            {
                document.getElementById("mat_id").value = button.id;
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
                var a = document.getElementById("ITerminalId").value;
                var b = document.getElementById("IGateNo").value;
                var c = document.getElementById("TGatewayName").value;
                var d = document.getElementById("TLocation").value;
                
                xmlhttp.open("GET", "jsp/UpdateEpos.jsp?machine_id=" + document.getElementById("mat_id").value
                        + "&terminal_id=" + a + "&gate_no=" + b + 
                                    "&gateway_name=" + c + "&location=" + d , true);
                xmlhttp.send();
            }
        </script>
        <form>
            <input type="hidden" id="mat_id" name="mat_id" value="778999">
        </form>
        <div id="popDiv" class="ontop">
            <div id="popup">
                <label for="Path" id="heading">Modify</label><br>
                <form>
                    <label>Terminal Id:</label>  
                    <input type="text" class="form-control" id="ITerminalId" placeholder="Enter Terminal Id" onfocus="hide(this)" onblur="show(this, 'Enter Terminal Id')"/><br>
                    <label>Gate Number:  </label>
                    <input type="text" class="form-control" id="IGateNo" placeholder="Enter Gate No" onfocus="hide(this)" onblur="show(this, 'Enter Gate No')"/><br>
                    <label>Gateway Name: </label>
                    <input type="text" class="form-control" id="TGatewayName" placeholder="Enter Gateway Name" onfocus="hide(this)" onblur="show(this, 'Enter Gateway Name')"/><br>
                    <label>Location:    </label>
                    <input type="text" class="form-control" id="TLocation" placeholder="Enter Location" onfocus="hide(this)" onblur="show(this, 'Enter Location')"/><br>
                    <input type="button" name="Update" id="Update" value="Update" onClick = "xyz()" /><br><br>
                    <input type="button" name="Cancel" id="Cancel" value="Cancel" onClick = "hide('popDiv')" /><br><br>
                </form>
            </div>
        </div>
    </body>
</html>
