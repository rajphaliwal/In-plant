<%-- 
    Document   : UpdateDriver
    Created on : Dec 22, 2015, 11:16:00 PM
    Author     : Raj-HP
--%>

<%@page import="java.math.BigDecimal"%>
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
    //
    String machine_id = request.getParameter("machine_id");
    String terminal_id = request.getParameter("terminal_id");
    String Gate_no = request.getParameter("gate_no");
    String Gateway_name = request.getParameter("gateway_name");
    String location = request.getParameter("location");
    
    out.println("yooo"+machine_id);
    
    hibernate.helper.Epos_handler el = new hibernate.helper.Epos_handler();
    el.update_in_table(Integer.parseInt(machine_id), user.getTblPlant().getIPlantId().intValueExact(), Integer.parseInt(terminal_id), Integer.parseInt(Gate_no),Gateway_name, location);
%>