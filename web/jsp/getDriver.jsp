<%-- 
    Document   : getDriver
    Created on : May 30, 2015, 3:02:07 PM
    Author     : Raj-HP
--%>

<%@page import="java.util.HashMap"%>
<%@page import="hibernate.helper.MappingList"%>
<%@page import="java.util.List"%>
<%
    String a = request.getParameter("transporterId");
    String p = request.getParameter("plantId").toString();
    
    hibernate.helper.DriverList d = new hibernate.helper.DriverList();
    List<hibernate.pojo.TblDriver> driverList=d.getDriverList(a);
    out.println("<option>Choose Driver </option>");
    if(driverList.size() > 0)
    {
        MappingList m = new MappingList();
        List<hibernate.pojo.TblMapping> mappingList = m.getMappingList(p);
    
        HashMap hm = new HashMap();
        for(int i=0;i< mappingList.size();i++)
            hm.put(mappingList.get(i).getTblDriver().getIDriverId().toString(),"true");
        for(int i = 0; i < driverList.size(); i++)
            if(hm.get(driverList.get(i).getIDriverId().toString()) != "true")
                        out.println("<option value=\""+driverList.get(i).getIDriverId()+"\">"+ driverList.get(i).getTDriverName()+"</option>");
    }
    out.println("<option value=\"0\">Others</option>");
%>
