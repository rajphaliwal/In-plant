<%-- 
    Document   : login
    Created on : 29 Mar, 2015, 6:27:53 PM
    Author     : rahul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="plant" scope="page" class="hibernate.helper.InsertPlant" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <%
            response.setHeader("Cache-Control","no-cache");
            response.setHeader("Cache-Control","no-store");
            response.setDateHeader("Expires", 0);
            response.setHeader("Pragma","no-cache");
        %>
    </head>
    <body>
    <div class="container">
        <div class="jumbotron">
            <h2 style="text-align: center">Login Here</h2>
        </div>
        <br><br><br>
        <div class="row">
            <div class="col-md-4 col-md-offset-4">    
                <div class="jumbotron" style="background: background">
                    <form role="form" action="userLogin" method="post">
                        <label style="display: block; color: #ffffff; background-color: #ff150f; text-align: center"> Invalid Username Or Password </label>
                        <div class="form-group">
                            <label for="text">Enter Username</label>
                            <input type="text" class="form-control" name="loginName" id="text"/>
                        </div>
                        <div class="form-group">
                            <label for="pwd">Enter Password</label>
                            <input type="password" class="form-control" name="password" /> <!-- members of same name must exist in corresponding action class so that their value is automatically set-->
                        </div>

                            <input class="btn btn-success col-sm-12" type="submit" value="Login"/>
                            <!--<b style="text-align:center">OR</b>-->
                            <!--<a href="jsp/insert/index.jsp" style="color:black">Or register Here</a>-->
                            <!--<input class="btn btn-success col-sm-12" type="button" value="Register Here" onclick="window.location='jsp/insert/index.jsp'"/> -->
                    </form>
                    <br>
                    <!--<a href="jsp/insert/index.jsp">Or register Here</a>-->
                </div>
            </div>    
        </div>
    </div>
    </body>
</html>
