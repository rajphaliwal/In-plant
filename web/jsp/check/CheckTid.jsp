<%-- 
    Document   : CheckEpos
    Created on : 20 Jan, 2016, 8:53:38 PM
    Author     : Ankit
--%>

<%@page import="java.util.List"%>
<%@page import="hibernate.helper.Epos_handler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String a = request.getParameter("tid");
    String id = request.getParameter("plantid");
    hibernate.helper.Epos_handler epos = new Epos_handler();
    //hibernate.pojo.TblEpos u = epos.get_tuple_by_tid(Integer.parseInt(a), Integer.parseInt(id));
    hibernate.pojo.TblEpos u;
    u = epos.get_tuple_by_tid(Integer.parseInt(a), Integer.parseInt(id));
    //for(hibernate.pojo.TblEpos i: u)
        //System.out.println(u.getITerminalId());
    if(u != null)
    {
        System.out.println("Terminal already exists");
        out.print("Terminal already exists");
    }
    else
    {
        System.out.println("Terminal is unique");
        out.print("Terminal is unique");
    }
%>
