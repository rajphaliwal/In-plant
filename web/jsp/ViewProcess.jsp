<%-- 
    Document   : ViewProcess
    Created on : Dec 21, 2015, 2:42:17 PM
    Author     : Raj-HP
--%>

<%@page import="java.util.List"%>
<%@page import="hibernate.helper.ProcessList"%>
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
                
                hibernate.helper.ProcessList pl = new hibernate.helper.ProcessList();
                List<hibernate.pojo.TblProcess> processList = pl.getProcessList(user.getTblPlant().getIPlantId().toString());
                String getProcessString = new String();
                getProcessString+="<table border=1 width=\"100%\" id=\"table_id\">";
                getProcessString+="<thead>";
                getProcessString+="<tr>";
                getProcessString+="<th>Process Name</th>";
                if(user.getBPlantModify())
                {
                    getProcessString+="<th>Modify Process</th>";
                
                }
                getProcessString+="</tr>";
                getProcessString+="</thead>";
                getProcessString+="<tbody>";
                int rowId=0;
                for(hibernate.pojo.TblProcess i: processList)
                {
                    getProcessString+="<tr>";
                    getProcessString+=("<td>" + i.getTProcessType() + "</td>");
                    if(user.getBPlantModify())
                    {
                        getProcessString+=("<td><button id=\"" + i.getIProcessId() + "\" value=\"" + rowId + "\" type=\"button\" onclick=\"popup(this)\"> Modify </button> </td>");
                    }
                    getProcessString+="</tr>";
                    rowId++;
                }
                getProcessString+="</tbody>";
                out.println(getProcessString);
                if(user.getBAddProcess())
                    out.println(" <form name=\"add\"> " + 
                        "<input type=\"submlt\" value=\"Add New Process\" onclick=\"addprocess()\"/><br><br></form> ");
                
        %>
        
        <script>
            function addprocess()
            {
                document.add.action = "loggedIn-AddProcess";
                document.add.submit();
            }
        
            var processid;
            function popup(button)
            {
                processid=button.id;
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
                var a = document.getElementById("processname").value;
                var b = processid;
                var c = document.getElementById("plant_id").value;
                xmlhttp.open("GET", "jsp/UpdateProcess.jsp?plant_id=" + c + "&process_id=" + b + "&process_name=" + a, true);
                xmlhttp.send();
            }
        </script>
        <div id="popDiv" class="ontop">
            <div id="popup">
                <label for="Path" id="heading">Modify</label><br>
                <form>
                    <input  type="hidden" name="Id" id="plant_id" value="<%out.print(user.getTblPlant().getIPlantId().toString());%>"/>
                    <label>Process Name : </label>
                    <input type="text" name="processname" id="processname"  placeholder="Enter Process Name" onfocus="hide(this)" onblur="show(this, 'Enter Process Name')"/><br>
                    <input type="button" name="Update" id="Update" value="Update" onClick = "xyz()" /><br><br>
                    <input type="button" name="Cancel" id="Cancel" value="Cancel" onClick = "hide('popDiv')" /><br><br>
                </form>
            </div>
        </div>
    </body>
</html>
