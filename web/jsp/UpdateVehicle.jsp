<%-- 
    Document   : UpdateDriver
    Created on : Dec 22, 2015, 11:16:00 PM
    Author     : Raj-HP
--%>

<%@page import="java.util.Date"%>
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
    
    String v_id = request.getParameter("v_id");
    String v_chasis = request.getParameter("v_chasis");
    String v_type = request.getParameter("v_type");
    String v_load = request.getParameter("v_load");
    String v_owner = request.getParameter("v_owner");
    String v_permit = request.getParameter("v_permit");
    
    hibernate.helper.Vehicle_handler vl = new hibernate.helper.Vehicle_handler();
    vl.update_in_table(v_id, user.getTblPlant().getIPlantId().intValue(), v_chasis, v_type, Long.parseLong(v_load), v_owner, v_permit);
%>