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
    
    String tr_id = request.getParameter("tr_id");
    String tr_name = request.getParameter("tr_name");
    String tr_mob_no = request.getParameter("tr_mob_no");
    String tr_address = request.getParameter("tr_address");
    String tr_city = request.getParameter("tr_city");
    String tr_state = request.getParameter("tr_state");
    String tr_pin = request.getParameter("tr_pin");
    String tr_email_id = request.getParameter("tr_email");
    
    hibernate.helper.Transporter_handler tl = new hibernate.helper.Transporter_handler();
    tl.update_in_table(Integer.parseInt(tr_id), user.getTblPlant().getIPlantId().intValue(), tr_name, tr_mob_no, tr_address, tr_city, tr_state, tr_pin, tr_email_id);
    
%>