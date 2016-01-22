<%-- 
    Document   : CheckGateNo
    Created on : 21 Jan, 2016, 12:33:11 AM
    Author     : Ankit
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="hibernate.helper.Epos_handler"%>
<%
    String a = request.getParameter("gno");
    String id = request.getParameter("plantid");
    hibernate.helper.Epos_handler epos = new Epos_handler();
    List<hibernate.pojo.TblEpos> u;
    u = epos.get_tuple_by_gno(Integer.parseInt(a), Integer.parseInt(id));
    if(u.size() != 0)
    {
        System.out.println("Terminal already exists");
        out.print("Gate Number already exists");
    }
    else
    {
        System.out.println("Terminal is unique");
        out.print("Gate Number is unique");
    }
%>
