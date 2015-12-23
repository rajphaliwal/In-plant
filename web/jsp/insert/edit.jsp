<%-- 
    Document   : edit
    Created on : 19 Apr, 2015, 3:06:18 PM
    Author     : Ankit
--%>

<%@page import="hibernate.pojo.TblUsers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <% 
            hibernate.helper.Users_handler u = new hibernate.helper.Users_handler();
            hibernate.pojo.TblUsers user= new TblUsers();
            user.setBPlantModify(true);
            EditTransporter.editTransporter e = new EditTransporter.editTransporter();
            out.print(e.getTransporter(user));
        %> 
    </body>
</html>
