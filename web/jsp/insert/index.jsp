<%-- 
    Document   : index
    Created on : Apr 4, 2015, 2:57:51 PM
    Author     : Raj-HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../js/jquery-min.js" type="text/javascript"></script>
        <script src="../../js/bootstrap.min.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-min.js" type="text/javascript"></script>
        <script src="../../js/placeholder.js" type="text/javascript"></script>
        <title>Plant Registration</title>
        <script>
            function insertaction()
            {
                var pwd = document.getElementById("pwd").value;
                var pwd2 = document.getElementById("pwd2").value;
                if (pwd != pwd2)
                {
                    alert("passwords dont match");
                    return;
                }
                document.registration.submit();
            }
        </script> 
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="jumbotron">
                    <h2 style="text-align:center">Plant Registration</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-md-offset-4 jumbotron">
                    
                        <form role="form" name="registration" action="insertplant" method="post">
                            <div class="form-group">
                                <label>Plant Name:</label>
                                <input class="form-control" type="text" name="TPlantName" value=""  placeholder="Enter plant name" onfocus="hide(this)" onblur="show(this, 'Enter plant name')"/><br>
                            </div>
                            <div class="form-group">
                                <label>Plant Owner:</label>
                                <input class="form-control" type="text" name="TPlantOwner" value=""  placeholder="Enter plant owner" onfocus="hide(this)" onblur="show(this, 'Enter plant owner')"/><br>
                            </div>
                            <div class="form-group">
                                <label>Username:</label>
                                <input type="text" class="form-control" name="username" value="" placeholder="Enter username" onfocus="hide(this)" onblur="show(this, 'Enter username')"/><br>
                            </div>
                            <div class="form-group">
                                <label>Set A Password:</label> 
                                <input type="password" id="pwd" class="form-control" name="password" value=""  placeholder="Enter password" onfocus="hide(this)" onblur="show(this, 'Enter password')"/> <br> 
                            </div>
                            <div class="form-group">
                                <label>Confirm Password:</label> 
                                <input type="password" class="form-control" id="pwd2" name="cpassword" value=""  placeholder="Confirm password" onfocus="hide(this)" onblur="show(this, 'Confirm Password')"/> <br>
                            </div>
                            <input type="button" value="Submit" class="btn btn-success col-sm-12" onClick = "insertaction()" />
                        </form>
                    
                </div>
            </div>
        </div>
</body>
</html>
