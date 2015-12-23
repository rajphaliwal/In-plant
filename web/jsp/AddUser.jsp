<%-- 
    Document   : login
    Created on : 29 Mar, 2015, 6:27:53 PM
    Author     : rahul
--%>

<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/placeholder.js" type="text/javascript"></script>

        <title>Add User</title>
    </head>
    <body>

        <%
            Map sesion = (Map) ActionContext.getContext().getSession();
            if(sesion.get("user")==null)
            {
                RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                rd.forward(request, response);
            }
            hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers) sesion.get("user");
        %>
        <script>
            function permission(name, bool)
            {
                document.getElementById(name).value = bool;
                document.getElementById(name).value = bool;
            }
            function home()
            {
                
                document.user.action="Home";
                document.user.submit();
            }
            function useraction()
            {
                var pwd = document.getElementById("pwd").value;
                var pwd2 = document.getElementById("pwd2").value;
                if (pwd != pwd2)
                {
                    alert("passwaords dont match");
                    return;
                }
                document.user.action="insertuser";
                document.user.submit();
            }
            
        </script>
        <div class="container">
            <div class="col-md-6 col-md-offset-3 jumbotron">
                <h2 style="text-align: center">Add User</h2>
            <form name="user" action="">
                <div class="form-group">
                    <div class="row">
                        <input type="hidden" name="Id" value="<% out.print(user.getTblPlant().getIPlantId().toString());%>">
                        <label>Username  :</label>
                        <input type="text" name="SUsername" class="form-control" value="" placeholder="Enter Username" onfocus="hide(this)" onblur="show(this,'Enter Username')"/><br>
                        <label>Password  :</label>
                        <input type="password" id="pwd" class="form-control" name="SPassword" value="" placeholder="Enter Password" onfocus="hide(this)" onblur="show(this,'Enter Password')"/> <br>
                        <label>Confirm Password  : </label>
                        <input type="password" id="pwd2" class="form-control" name="cSPassword" value="" placeholder="Confirm Password" onfocus="hide(this)" onblur="show(this,'Confirm Password')"/> <br>
                        <label style="text-align: center">Permissions : </label>
                        <br><br>
                    </div>
                        
                    <div class="row">
                        <div class="col-xs-4">
                            <b>Remove Trip</b> : <br>
                            <input type="radio" class="radio-inline" name="1" value="Yes" onClick="permission('BRemoveTrip', 1)" />Yes
                            <input type="radio" class="radio-inline" name="1" value="No" checked  onClick="permission('BRemoveTrip', 0)"/>No
                            <input type="hidden" name="BRemoveTrip" id="BRemoveTrip" value="0">
                            <br><br>
                            View Trip :  <br>   
                            <input type="radio" class="radio-inline-inline" name="2" value="Yes" onClick="permission('BViewTrip', 1)" />Yes
                            <input type="radio" name="2" value="No" checked  onClick="permission('BViewTrip', 0)"/>No
                            <input type="hidden" name="BViewTrip" id="BViewTrip" value="0">
                            <br><br>
                            Add Trip :  <br>   <input type="radio" class="radio-inline-inline" name="3" value="Yes" onClick="permission('BAddTrip', 1)" />Yes

                            <input type="radio" name="3" value="No" checked class="radio-inline" onClick="permission('BAddTrip', 0)"/>No
                            <input type="hidden" name="BAddTrip" id="BAddTrip" value="0">
                            <br><br>
                            Add User : <br>     <input type="radio" name="4" class="radio-inline" value="Yes" onClick="permission('BAddUser', 1)" />Yes
                            <input type="radio" name="4" value="No" checked  onClick="permission('BAddUser', 0)"/>No
                            <input type="hidden" name="BAddUser" id="BAddUser" value="0">
                            <br><br>
                            Modify User :   <br>  <input type="radio" name="5" class="radio-inline" value="Yes" onClick="permission('BModifyUser', 1)" />Yes
                            <input type="radio" name="5" value="No" checked  onClick="permission('BModifyUser', 0)"/>No
                            <input type="hidden" name="BModifyUser" id="BModifyUser" value="0">
                            <br><br>
                            Add Card :   <br>  <input type="radio" name="5" class="radio-inline" value="Yes" onClick="permission('BAddCard', 1)" />Yes
                            <input type="radio" name="5" value="No" checked  onClick="permission('BAddCard', 0)"/>No
                            <input type="hidden" name="BAddCard" id="BAddCard" value="0">
                            <br><br>
                            Add Process :   <br>  <input type="radio" name="5" class="radio-inline" value="Yes" onClick="permission('BAddProcess', 1)" />Yes
                            <input type="radio" name="5" value="No" checked  onClick="permission('BAddProcess', 0)"/>No
                            <input type="hidden" name="BAddProcess" id="BAddProcess" value="0">
                            <br><br>
                            Add Link :   <br>  <input type="radio" name="5" class="radio-inline" value="Yes" onClick="permission('BAddLink', 1)" />Yes
                            <input type="radio" name="5" value="No" checked  onClick="permission('BAddLink', 0)"/>No
                            <input type="hidden" name="BAddLink" id="BAddLink" value="0">
                            <br><br>
                            Modify Link :   <br>  <input type="radio" name="5" class="radio-inline" value="Yes" onClick="permission('BModifyLink', 1)" />Yes
                            <input type="radio" name="5" value="No" checked  onClick="permission('BModifyLink', 0)"/>No
                            <input type="hidden" name="BModifyLink" id="BModifyLink" value="0">
                            <br><br>
                            Add Vehicle :  <br>   <input type="radio" name="6" class="radio-inline" value="Yes" onClick="permission('BAddVehicle', 1)" />Yes
                            <input type="radio" name="6" value="No" checked  onClick="permission('BAddVehicle', 0)"/>No
                            <input type="hidden" name="BAddVehicle" id="BAddVehicle" value="0">
                        </div>
                      
                        <div class="col-xs-4 col-xs-offset4">
                            Modify Vehicle : <br>    <input type="radio" name="7" class="radio-inline" value="Yes" onClick="permission('BModifyVehicle', 1)" />Yes
                            <input type="radio" name="7" value="No" checked  onClick="permission('BModifyVehicle', 0)"/>No
                            <input type="hidden" name="BModifyVehicle" id="BModifyVehicle" value="0">
                            <br><br>
                            Add Driver :   <br>  <input type="radio" name="8" value="Yes" class="radio-inline" onClick="permission('BAddDriver', 1)" />Yes
                            <input type="radio" name="8" value="No" checked  onClick="permission('BAddDriver', 0)"/>No
                            <input type="hidden" name="BAddDriver" id="BAddDriver" value="0">
                            <br><br>
                            Modify Driver :  <br>   <input type="radio" name="9" value="Yes" class="radio-inline" onClick="permission('BModifyDriver', 1)" />Yes
                            <input type="radio" name="9" value="No" checked  onClick="permission('BModifyDriver', 0)"/>No
                            <input type="hidden" name="BModifyDriver" id="BModifyDriver" value="0">
                            <br><br>
                            Setup New Plant :  <br>   <input type="radio" name="10" value="Yes" class="radio-inline" onClick="permission('BSetupNewPlant', 1)" />Yes
                            <input type="radio" name="10" value="No" checked  onClick="permission('BSetupNewPlant', 0)"/>No
                            <input type="hidden" name="BSetupNewPlant" id="BSetupNewPlant" value="0">
                            <br><br>
                            Change Plant :  <br>   <input type="radio" name="10" value="Yes" class="radio-inline" onClick="permission('BChangeCurrentPlant', 1)" />Yes
                            <input type="radio" name="10" value="No" checked  onClick="permission('BChangeCurrentPlant', 0)"/>No
                            <input type="hidden" name="BChangeCurrentPlant" id="BChangeCurrentPlant" value="0">
                            <br><br>
                            Plant Modify :  <br>   <input type="radio" name="11" value="Yes" class="radio-inline" onClick="permission('BPlantModify', 1)" />Yes
                            <input type="radio" name="11" value="No" checked  onClick="permission('BPlantModify', 0)"/>No
                            <input type="hidden" name="BPlantModify" id="BPlantModify" value="0">
                            <br><br>
                            Add transporter :  <br>   <input type="radio" name="11" value="Yes" class="radio-inline" onClick="permission('BAddTransporter', 1)" />Yes
                            <input type="radio" name="11" value="No" checked  onClick="permission('BAddTransporter', 0)"/>No
                            <input type="hidden" name="BAddTransporter" id="BAddTransporter" value="0">
                            <br><br>
                            Modify Transporter :   <br>  <input type="radio" name="5" class="radio-inline" value="Yes" onClick="permission('BModifyTransporter', 1)" />Yes
                            <input type="radio" name="5" value="No" checked  onClick="permission('BModifyTransporter', 0)"/>No
                            <input type="hidden" name="BModifyTransporter" id="BModifyTransporter" value="0">
                            <br><br>
                            Modify Process :   <br>  <input type="radio" name="5" class="radio-inline" value="Yes" onClick="permission('BModifyProcess', 1)" />Yes
                            <input type="radio" name="5" value="No" checked  onClick="permission('BModifyProcess', 0)"/>No
                            <input type="hidden" name="BModifyProcess" id="BModifyProcess" value="0">
                            <br><br>
                            Add Path :  <br>   <input type="radio" name="11" value="Yes" class="radio-inline" onClick="permission('BAddPath', 1)" />Yes
                            <input type="radio" name="11" value="No" checked  onClick="permission('BAddPath', 0)"/>No
                            <input type="hidden" name="BAddPath" id="BAddPath" value="0">
                            
                        </div>
                        
                            <div class="col-xs-4 col-xs-offset8">
                            View Exception :   <br>  <input type="radio" name="12" value="Yes" class="radio-inline" onClick="permission('BViewException', 1)" />Yes
                            <input type="radio" name="12" value="No" checked  onClick="permission('BViewException', 0)"/>No
                            <input type="hidden" name="BViewException" id="BViewException" value="0">
                            <br><br>
                        
                            End Exception :  <br>   <input type="radio" name="13" class="radio-inline" value="Yes" onClick="permission('BEndException', 1)" />Yes
                            <input type="radio" name="13" value="No" checked  onClick="permission('BEndException', 0)"/>No
                            <input type="hidden" name="BEndException" id="BEndException" value="0">
                            <br><br>
                            View Plant History :  <br>   <input type="radio" name="14" class="radio-inline" value="Yes" onClick="permission('BViewHistory', 1)" />Yes
                            <input type="radio" name="14" value="No" checked  onClick="permission('BViewHistory', 0)"/>No
                            <input type="hidden" name="BViewHistory" id="BViewHistory" value="0">
                            <br><br>
                            Node View :   <br>  <input type="radio" name="15" value="Yes" class="radio-inline" onClick="permission('BNodeView', 1)" />Yes
                            <input type="radio" name="15" value="No" checked  onClick="permission('BNodeView', 0)"/>No
                            <input type="hidden" name="BNodeView" id="BNodeView" value="0">
                            <br><br>
                            View DO :  <br>   <input type="radio" name="16" value="Yes" class="radio-inline" onClick="permission('BViewDo', 1)" />Yes
                            <input type="radio" name="16" value="No" checked  onClick="permission('BViewDo', 0)"/>No
                            <input type="hidden" name="BViewDo" id="BViewDo" value="0">
                            <br><br>
                            Add Epos :  <br>   <input type="radio" name="16" value="Yes" class="radio-inline" onClick="permission('BAddEpos', 1)" />Yes
                            <input type="radio" name="16" value="No" checked  onClick="permission('BAddEpos', 0)"/>No
                            <input type="hidden" name="BAddEpos" id="BAddEpos" value="0">
                            <br><br>
                            Modify Path :   <br>  <input type="radio" name="5" class="radio-inline" value="Yes" onClick="permission('BModifyPath', 1)" />Yes
                            <input type="radio" name="5" value="No" checked  onClick="permission('BModifyPath', 0)"/>No
                            <input type="hidden" name="BModifyPath" id="BModifyPath" value="0">
                            <br><br>
                            Modify Epos :   <br>  <input type="radio" name="5" class="radio-inline" value="Yes" onClick="permission('BModifyEpos', 1)" />Yes
                            <input type="radio" name="5" value="No" checked  onClick="permission('BModifyEpos', 0)"/>No
                            <input type="hidden" name="BModifyEpos" id="BModifyEpos" value="0">
                            <br><br>
                            Modify Card :   <br>  <input type="radio" name="5" class="radio-inline" value="Yes" onClick="permission('BModifyCard', 1)" />Yes
                            <input type="radio" name="5" value="No" checked  onClick="permission('BModifyCard', 0)"/>No
                            <input type="hidden" name="BModifyCard" id="BModifyCard" value="0">
                            <br><br>
                            Logged In :   <br>  <input type="radio" name="17" value="Yes" class="radio-inline" onClick="permission('BLoggedIn', 1)" />Yes
                            <input type="radio" name="17" value="No" checked  onClick="permission('BLoggedIn', 0)"/>No
                        </div>
                        <div> &nbsp;</div>
                        <input type="hidden" name="BLoggedIn" id="BLoggedIn" value="0">
                        <input type="button" class="btn btn-success col-sm-12" value="Add User" onClick = "useraction()" />
                        <div>&nbsp;</div>
                        <input type="button" class="btn btn-info col-sm-12" value="Home" onClick = "home()" />
                    </div>
            </form>
        </div>
        </div>
                        

    </body>

</html>
