<%-- 
    Document   : Mapping
    Created on : May 29, 2015, 10:49:54 AM
    Author     : Raj-HP
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="hibernate.helper.MappingList"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="java.util.Map"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="hibernate.helper.CardList"%>
<%@page import="java.util.List"%>
<%@page import="EditTransporter.TransporterList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery-min.js" type="text/javascript"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <title>Mapping</title>
    </head>
    <body>
        <script>
            function xyz()
            {
                var xmlhttp;
                if (window.XMLHttpRequest)
                {
                    // code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp=new XMLHttpRequest();
                }
                else
                {
                    // code for IE6, IE5
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange=function()
                {
                    if(xmlhttp.readyState==4 && xmlhttp.status==200)
                    {
                        document.getElementById("Driver").length = 0;
                        document.getElementById("Driver").innerHTML=xmlhttp.responseText;
                    }
                };
                var a = document.getElementById("Transporter").value;
                var b = document.getElementById("Id").value;
                /*var url = "jsp/getDriver.jsp";
                var par = "transporterId=" + a + "&plantId=" + b;
                xmlhttp.open("POST", url, true);
                xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xmlhttp.setRequestHeader("Content-length", par.length);
                xmlhttp.setRequestHeader("Connection", "close");
                xmlhttp.send(par);*/
                xmlhttp.open("GET", "jsp/getDriver.jsp?transporterId=" + a + "&plantId=" + b, true);
                xmlhttp.send();
                
                abc();
            }
            function abc()
            {
                var xmlhttp;
                if (window.XMLHttpRequest)
                {
                    // code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp=new XMLHttpRequest();
                }
                else
                {
                    // code for IE6, IE5
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange=function()
                {
                    if(xmlhttp.readyState==4 && xmlhttp.status==200)
                    {
                        document.getElementById("Vehicle").length = 0;
                        document.getElementById("Vehicle").innerHTML=xmlhttp.responseText;
                    }
                };
                var a = document.getElementById("Transporter").value;
                var b = document.getElementById("Id").value;
                /*var url = "jsp/getVehicle.jsp";
                var par = "transporterId=" + a + "&plantId=" + b;
                xmlhttp.open("POST", url, true);
                xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xmlhttp.setRequestHeader("Content-length", par.length);
                xmlhttp.setRequestHeader("Connection", "close");
                xmlhttp.send(par);*/
                xmlhttp.open("GET", "jsp/getVehicle.jsp?transporterId=" + a + "&plantId=" + b, true);
                xmlhttp.send();
            }
            function trip()
            {
                
                document.getElementById("cardid").value=document.getElementById("Card").value;
                document.getElementById("transporterid").value=document.getElementById("Transporter").value;
                document.getElementById("vehicleid").value=document.getElementById("Vehicle").value;
                document.getElementById("driverid").value=document.getElementById("Driver").value;
                document.getElementById("processid").value=document.getElementById("Process").value;
                
                document.mapping.action="starttrip";
                document.mapping.submit();
            }
            function show()
            {
                if(document.getElementById("Driver").value == 0)
                {
                    document.getElementById("dname").style.display="block";
                    document.getElementById("drivername").style.display="block";
                    document.getElementById("bname").value="1";
                }
                else
                {
                    document.getElementById("dname").style.display="none";
                    document.getElementById("drivername").style.display="none";
                    document.getElementById("bname").value="0";
                }
                return;
            }
            function backhome()
            {
                document.mapping.action="Home";
                document.mapping.submit();
            }
        </script>
        <%
            ValueStack stack = ActionContext.getContext().getValueStack();
            Map sesion = (Map)ActionContext.getContext().getSession();
            if(sesion.get("user")==null)
            {
                RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                rd.forward(request, response);
            }
        %>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="jumbotron">
                        <h2 style="text-align: center">Mapping</h2>
                        <div class="form-group">
                            <label for="card">Card No. </label>
                            <select class="form-control" id="Card">
                            <%
                                hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers)sesion.get("user");
                            %>
                            <%
                                out.println("<option>Choose Card No. </option>");
                                CardList c=new CardList();
                                List<hibernate.pojo.TblCard> CardList=c.getCardList(user.getTblPlant().getIPlantId().toString());
                                MappingList m=new MappingList();
                                List<hibernate.pojo.TblMapping> MappingList=m.getMappingList(user.getTblPlant().getIPlantId().toString());
                                
                                HashMap hm = new HashMap();
                                for(int i=0;i<MappingList.size();i++)
                                    hm.put(MappingList.get(i).getICardId().toString(),"true");
                                /*for(int i = 0; i < MappingList.size(); i++)
                                {
                                    out.println("<option value=\""+ MappingList.get(i).getICardId()+"\">"+ MappingList.get(i).getICardId() +"</option>");
                                }*/
                                for(int i = 0; i < CardList.size(); i++)
                                {
                                    if( hm.get(CardList.get(i).getCCardId().toString()) != "true")
                                    out.println("<option value=\""+ CardList.get(i).getCCardId()+"\">"+ CardList.get(i).getCCardId() +"</option>");
                                }
                            %>
                            </select>
                        </div>
                    <div class="form-group">
                        <label for="Process">Process Type </label>
                        <select class="form-control" id="Process">
                        <%
                            out.println("<option>Choose Process Type </option>");
                            hibernate.helper.ProcessList p=new hibernate.helper.ProcessList();
                            List<hibernate.pojo.TblProcess> processList=p.getProcessList(user.getTblPlant().getIPlantId().toString());
                            for(int i = 0; i < processList.size(); i++)
                                out.println("<option value=\""+ processList.get(i).getIProcessId()+"\">"+ processList.get(i).getTProcessType() +"</option>");
                        %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="Transporter">Transporter </label>
                        <select class="form-control" id="Transporter" onchange="xyz()">
                        <%
                            out.println("<option>Choose Transporter</option>");
                            TransporterList t=new TransporterList();
                            List<hibernate.pojo.TblTransporter> transporterList=t.getTransporterList(user.getTblPlant().getIPlantId().toString());
                            for(int i = 0; i < transporterList.size(); i++)
                                out.println("<option value=\""+transporterList.get(i).getITransporterId()+"\">"+ transporterList.get(i).getTTransporterName() +"</option>");
                        %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="Vehicle">Vehicle </label>
                        <select class="form-control" id="Vehicle">
                        <option>Choose Vehicle </option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="Driver">Driver </label>
                        <select class="form-control" id="Driver" onchange="show()">
                        <option>Choose Driver </option>
                    </select>
                    </div>    
                    <br>

                        <form role="form" name="mapping" action="" method="post">
                            <div class="form-group">
                                <label id="dname" for="drivername" style="display:none;">Driver Name:</label>
                                <input type="text" class="form-control" id="drivername" name="drivername" value="" style="display:none;" />
                            </div>
                            <input type="hidden" id="bname" name="bname" value="0">
                            <input type="hidden" id="Id" name="Id" value="<%out.print(user.getTblPlant().getIPlantId().toString());%>"/>           
                            <input type="hidden" name="cardid" id="cardid" value=""/>
                            <input type="hidden" name="transporterid" id="transporterid" value=""/>
                            <input type="hidden" name="vehicleid" id="vehicleid" value=""/>
                            <input type="hidden" name="driverid" id="driverid" value=""/>
                            <input type="hidden" name="processid" id="processid" value=""/>  
                            <div class="form-group">
                                <label>Date : </label>
                                <input class="form-control" type="date" name="tdate">
                            </div>
                            <input class="btn btn-primary col-sm-12" type="button" value="Start Trip" onClick="trip()"><br><br>
                            <input type="button" class="btn btn-info col-sm-12" name="home" id="home" value="Home" onClick = "backhome(this)" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
