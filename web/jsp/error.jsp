<%-- 
    Document   : error
    Created on : 22 Jan, 2016, 3:22:22 PM
    Author     : Ankit
--%>


<%@ page isErrorPage="true" import="java.io.*" contentType="text/plain"%>

Message:
<%=exception.getMessage()%>

<!--StackTrace:
<%
	/*StringWriter stringWriter = new StringWriter();
	PrintWriter printWriter = new PrintWriter(stringWriter);
	exception.printStackTrace(printWriter);
	out.println(stringWriter);
	printWriter.close();
	stringWriter.close();*/
%>-->
