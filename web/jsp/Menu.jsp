<%-- 
    Document   : viewLive
    Created on : Mar 19, 2015, 6:32:31 PM
    Author     : rahul
--%>

<%@page import="java.util.Map"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>

    <!--<link rel="stylesheet" href="css/styles.css">
    <script src="js/jquery-min.js" type="text/javascript"></script>
    <script src="js/script.js" type="text/javascript"></script>-->
     
           
            <%   
               ValueStack stack = ActionContext.getContext().getValueStack();
               //out.println("Size of the valueStack: " + stack.size()); //this is where we access the object
               //hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers)stack.findValue("user");
               
               Map sesion = (Map)ActionContext.getContext().getSession();
               if(sesion.get("user")==null)
                {
                    RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                    rd.forward(request, response);
                }
                else
                {
                    hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers)sesion.get("user");

                    menu.GenerateMenuHtml g=new menu.GenerateMenuHtml(user.getSUsername());
                    out.println(g.getHtml());
                }
           %>
   

