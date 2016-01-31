<%-- 
    Document   : ViewCard
    Created on : Dec 21, 2015, 2:40:53 PM
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
        <title>All Card</title>
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="js/dataTables.jqueryui.js"></script>
    
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
            function addcard()
            {
                document.add.action = "loggedIn-AddCard";
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
                
                hibernate.helper.CardList cl = new hibernate.helper.CardList();
                List<hibernate.pojo.TblCard> cardList = cl.getCardList(user.getTblPlant().getIPlantId().toString());
                
                if(user.getBAddCard())
                {
                    out.println("<a href=\"javascript:void(0)\" id=\"bShow\"  data-toggle=\"modal\" data-target=\"#myModal\" ></a>");
                    out.println(" <form name=\"add\"> " + 
                        "<a href=\"javascript:void(0)\" onclick=\"addNew()\" style=\"padding-left: 7%;\"><img src=\"images/addnew.jpg\" height=\"20\" width=\"20\" /> Add New</a><br><br></form> ");
                }
                String getCardString = new String();
                getCardString+="<table border=1 width=\"100%\" id=\"table_id\">";
                getCardString+="<thead>";
                getCardString+="<tr>";
                getCardString+="<th>Card Number</th>";
                if(user.getBPlantModify())
                {
                    getCardString+="<th>Modify Card</th>";
                
                }
                getCardString+="</tr>";
                getCardString+="</thead>";
                getCardString+="<tbody>";
                int rowId=0;
                for(hibernate.pojo.TblCard i: cardList)
                {
                    getCardString+="<tr>";
                    getCardString+=("<td>" + i.getCCardId() + "</td>");
                    if(user.getBPlantModify())
                    {
                        getCardString+=("<td><button id=\"" + i.getCCardId() + "\" value=\"" + rowId + "\" type=\"button\" onclick=\"pop('popDiv')\"> Modify </button> </td>");
                    }
                    getCardString+="</tr>";
                    rowId++;
                }
                getCardString+="</tbody>";
                out.println(getCardString);
                
        %>
        
        
        <div id="popDiv" class="ontop">
            <form id="popup">
                <!--<label for="Path" id="heading">Modify</label><br>-->
                
            </form>
        </div>
    </body>
</html>
