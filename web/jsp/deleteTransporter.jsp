<%@page import="EditTransporter.deleteTransporter"%>
<%@page import="java.math.BigDecimal"%>

<%
    EditTransporter.deleteTransporter e = new EditTransporter.deleteTransporter();
    if(e.del(new BigDecimal(request.getParameter("Id")))==true)
        out.print("success");
    else
        out.print("failure");
%>