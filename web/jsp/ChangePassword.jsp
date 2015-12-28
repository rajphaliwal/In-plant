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
        <title>Login</title>
        <script>
            
        </script>
    </head>
    <body>
        <div style="position: fixed; width: 100%"><jsp:include page="Menu.jsp"/></div>
        <div>&nbsp;</div>
        <div>&nbsp;</div>
        <div>&nbsp;</div>
        <%
            Map sesion = (Map)ActionContext.getContext().getSession();
            hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers)sesion.get("user");
            if(sesion.get("user")==null)
            {
                RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                rd.forward(request, response);
            }
        %>
        <div>
            <form action="changepassword" method="post">
                <label for="old">Old Password: </label>
                <input type="text" id="old" name="old"><br><br>
                <label for="pass">New Password: </label>
                <input type="password" id="pass" name="newpass"><br><br>
                <label for="retype">Retype Password: </label>
                <input type="password" id="retype" name="renewpass"><br><br>
                <input type="submit">
                <%
                    out.println("<input type = \"text\" value=\"" + user.getTblPlant().getIPlantId() + "\" name=\"plantid\" hidden>");
                    out.println("<input type = \"text\" value=\"" + user.getSUsername() + "\" name=\"username\" hidden>");
                %>
            </form>
        </div>
    </body>
    
</html>
