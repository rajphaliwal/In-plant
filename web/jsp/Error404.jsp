<%-- 
    Document   : Error404
    Created on : 17 Jan, 2016, 9:54:35 PM
    Author     : Ankit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
        <link rel="stylesheet" href="css/app.min.1.css">
        <link rel="stylesheet" href="css/app.min.2.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/menu.css">
        <title>404 Page Not Found</title>
    </head>
    <body class="sw-toggled" style="padding-top:70px">
        <jsp:include page="includes/header.jsp"></jsp:include>
        <div id="top">
            <div style="position: fixed; width: 100%">
                <jsp:include page="Menu.jsp"></jsp:include>
            </div>
        </div><br><br>
            
        <div>
            <h1>404</h1>
            <p>Sorry The Page You Are Looking For Doesn't Exist In This Server</p>
            <p>Please Check The Name Of The File</p>
        </div>
    </body>
</html>
