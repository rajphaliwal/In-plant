<%-- 
    Document   : CheckProcess
    Created on : 22 Jan, 2016, 12:42:32 PM
    Author     : Ankit
--%>

<%@page import="java.util.List"%>
<%@page import="hibernate.helper.Process_handler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String a = request.getParameter("Id");
    String name = request.getParameter("name");
    hibernate.helper.Process_handler process = new Process_handler();
    hibernate.pojo.TblProcess u;
    u = process.get_tuple_by_plant(Integer.parseInt(a), name);
    //for(hibernate.pojo.TblEpos i: u)
        //System.out.println(u.getITerminalId());
    //System.out.println("hello" + u.size());
    if(u != null)
    {
        System.out.println("Terminal already exists");
        out.print("Process already exists");
    }
    else
    {
        System.out.println("Terminal is unique");
        out.print("Process is unique");
    }
%>
