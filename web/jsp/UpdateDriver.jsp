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
    
    String dr_id = request.getParameter("dr_id");
    String dr_name = request.getParameter("dr_name");
    String dr_addr1 = request.getParameter("dr_addr1");
    String dr_addr2 = request.getParameter("dr_addr2");
    String dr_city = request.getParameter("dr_city");
    String dr_state = request.getParameter("dr_state");
    String dr_pin = request.getParameter("dr_pin");
    String dr_email_id = request.getParameter("dr_email");
    String dr_lcnno = request.getParameter("dr_lnumber");
    
    hibernate.helper.Driver_handler dl = new hibernate.helper.Driver_handler();
    dl.update_in_table(user.getTblPlant().getIPlantId().intValue(), Integer.parseInt(dr_id), dr_name, dr_addr1, dr_addr2, dr_city, dr_state, dr_pin, dr_email_id, dr_lcnno);
%>