<%-- 
    Document   : getVehicle
    Created on : May 29, 2015, 7:57:43 PM
    Author     : Raj-HP
--%>

<%@page import="java.util.HashMap"%>
<%@page import="hibernate.helper.MappingList"%>
<%@page import="java.util.Map"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String s = request.getParameter("transporterId").toString();
    String p = request.getParameter("plantId").toString();
    /*Map sesion = (Map)ActionContext.getContext().getSession();
    hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers)sesion.get("user");
    */
    MappingList m = new MappingList();
    List<hibernate.pojo.TblMapping> mappingList = m.getMappingList(p);
    
    HashMap hm = new HashMap();
    for(int i=0;i< mappingList.size();i++)
        hm.put(mappingList.get(i).getTblVehicle().getTVehicleId().toString(),"true");
    
    hibernate.helper.VehicleList v = new hibernate.helper.VehicleList();
    List<hibernate.pojo.TblVehicle> vehicleList=v.getVehicleList(s);
    for(int i = 0; i < vehicleList.size(); i++)
        if(hm.get(vehicleList.get(i).getTVehicleId().toString()) != "true")
                    out.println("<option value=\""+vehicleList.get(i).getTVehicleId()+"\">"+ vehicleList.get(i).getTVehicleId()+"</option>");
    
%>