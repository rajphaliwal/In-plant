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
    ValueStack stack = ActionContext.getContext().getValueStack();
    Map sesion = (Map)ActionContext.getContext().getSession();
    if(sesion.get("user")==null)
    {
        RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
        rd.forward(request, response);
    }
    hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers)sesion.get("user");
    
    String link_id = request.getParameter("link_id");
    String to = request.getParameter("to");
    String from = request.getParameter("from");
    String time = request.getParameter("time");
    
    hibernate.helper.Link_handler ll = new hibernate.helper.Link_handler();
    ll.update_in_table(Integer.parseInt(link_id), user.getTblPlant().getIPlantId().intValue(), Integer.parseInt(to), Integer.parseInt(from), Integer.parseInt(time));
%>