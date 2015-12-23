<%@page import="liveView.endTrip"%>
<%@page import="java.math.BigDecimal"%>

<%
    liveView.endTrip e = new endTrip();
    if(e.end(new BigDecimal(request.getParameter("tripId").toString()))==true)
        out.print("success");
    else
        out.print("failure");
%>