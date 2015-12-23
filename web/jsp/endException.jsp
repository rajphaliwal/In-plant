<%@page import="exceptionView.endException"%>
<%@page import="java.math.BigDecimal"%>

<%
    exceptionView.endException e = new endException ();
    if(e.end(new BigDecimal(request.getParameter("exceptionId").toString()))==true)
        out.print("success");
    else
        out.print("failure");
%>