<%-- 
    Document   : UpdateDriver
    Created on : Dec 22, 2015, 11:16:00 PM
    Author     : Raj-HP
--%>

<%@page import="java.util.Map"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="hibernate.helper.MappingList"%>
<%
    /*ValueStack stack = ActionContext.getContext().getValueStack();
    Map sesion = (Map)ActionContext.getContext().getSession();
    if(sesion.get("user")==null)
    {
        RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
        rd.forward(request, response);
    }
    hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers)sesion.get("user");*/
    
    String process_id = request.getParameter("process_id");
    String process_name = request.getParameter("process_name");
    
    
    hibernate.helper.Process_handler pl = new hibernate.helper.Process_handler();
    pl.update_in_table(Integer.parseInt(process_id),23, process_name);
%>