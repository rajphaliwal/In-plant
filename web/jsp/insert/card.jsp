<%-- 
    Document   : card
    Created on : May 29, 2015, 11:43:06 AM
    Author     : Raj-HP
--%>

<%@page import="java.util.Map"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="hibernate.pojo.TblPlant"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../../js/placeholder.js" type="text/javascript"></script>
        <title>Card</title>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../js/jquery-min.js" type="text/javascript"></script>
        <script src="../../js/bootstrap.min.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-min.js" type="text/javascript"></script>
    </head>
    <body>
        <script>
            function skipcard()
            {
                document.card.action = "skipcard";
                document.card.submit();
            }
            function cardaction(button)
            {
                var a = document.forms["card"]["cardid"].value;
                if (a == "")
                {
                    alert("Enter Card Id ");
                    return;
                }

                if (button.id === "add")
                    document.card.action = "insertcard";
                else if (button.id === "next")
                    document.card.action = "insertcardnext";
                document.card.submit();
            }
        </script>
        <%
                ValueStack stack = ActionContext.getContext().getValueStack();
                Map sesion = (Map)ActionContext.getContext().getSession();
                hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers)sesion.get("user");
            %>
        <div class="container">
            <div class="row">
                <div class="jumbotron">
                    <h2 style="text-align: center">Card</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-md-offset-4 jumbotron"> 
                    <form role="form" name="card" action="" method="post">
                        
                        <input  type="hidden" name="Id" value="<% out.print(user.getTblPlant().getIPlantId().toString());%>"/>
                        <div class="form-group">
                            <label>Card Id:</label>
                            <input type="text" class="form-control" name="cardid" id="cardid" placeholder="Enter Card Id" onfocus="hide(this)" onblur="show(this, 'Enter Card Id')"/><br><br>
                        </div>
                        
                        <input type="button" class="btn btn-info col-sm-12" name="add" id="add" value="Add More Card" onClick = "cardaction(this)" /><br><br>
                        <input type="button" class="btn btn-success col-sm-12" name="next" id="next" value="Submit And Next Page" onClick = "cardaction(this)" /><br><br>
                        <input type="button" class="btn btn-info col-sm-12" name="skip" id="skip" value="Skip" onClick = "skipcard()" />
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
