<%-- 
    Document   : CheckMid
    Created on : 21 Jan, 2016, 12:22:41 AM
    Author     : Ankit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="hibernate.helper.Epos_handler"%>
<%
    String a = request.getParameter("mid");
    hibernate.helper.Epos_handler epos = new Epos_handler();
    hibernate.pojo.TblEpos u;
    u = epos.get_tuple(Integer.parseInt(a));
    //for(hibernate.pojo.TblEpos i: u)
        //System.out.println(u.getITerminalId());
    if(u != null)
    {
        System.out.println("Terminal already exists");
        out.print("Machine already exists");
    }
    else
    {
        System.out.println("Terminal is unique");
        out.print("Machine is unique");
    }
%>
