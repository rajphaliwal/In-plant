/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exceptionView;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;

/**
 *
 * @author Jonty
 */
public class ExceptionView 
{
    private String exceptionViewString;
    private ExceptionList ExceptionListVar; 
    private List<hibernate.pojo.TblExceptions> ExceptionList;
    
    public ExceptionView() 
    {
        exceptionViewString="";
        ExceptionListVar = new ExceptionList();
        ExceptionList = null;
    }

    public String getExceptionViewString(BigDecimal IPlantID) 
    {
        ExceptionList = ExceptionListVar.getExceptionList(IPlantID);
        if(ExceptionList.size()==0)
            return "<div class=\"NodeHeading\">No Open Exceptions</div>";
        exceptionViewString+="<table border=\"1\" id=\"exceptionTable\" width=\"100%\">";
        exceptionViewString+="<thead>";
        exceptionViewString+="<tr>";
        
        exceptionViewString+="<th>Vehicle Id</th>";
        exceptionViewString+="<th>Date Created</th>";
        exceptionViewString+="<th>Exception Raised At</th>";
        exceptionViewString+="<th>Expected Time</th>";
        exceptionViewString+="<th>Arrival Time</th>";
        exceptionViewString+="<th>Close Exception</th>";
        exceptionViewString+="</tr>";
        exceptionViewString+=("</thead>");
        
        exceptionViewString+=("<tbody>");
        
        for(hibernate.pojo.TblExceptions i: ExceptionList)
        {
            String href = "TripDetails?trip="+i.getTblMapping().getITripId();
            exceptionViewString+=("<tr>");
            exceptionViewString+="<td><a href="+href+">"+i.getTblMapping().getTblVehicle().getTVehicleId()+"</a></td>";
            exceptionViewString+="<td>"+i.getDtCreated()+"</td>";
            exceptionViewString+="<td>"+i.getTblEpos().getTGatewayName()+"</td>";
            exceptionViewString+="<td>"+i.getDtExpectedTime()+"</td>";
            if(i.getDtArrivalTime()==null)
                exceptionViewString+="<td class=\"expect\">Missed!</td>";
            else
                exceptionViewString+="<td class=\"expect\">"+i.getDtArrivalTime()+"</td>";
            exceptionViewString+="<td><button id=\""+i.getIExceptionId()+"\"  value=\"end\" type=\"button\" onclick=\"endexception(this)\">Close!</button></td>";
            exceptionViewString+=("</tr>");
        }
        exceptionViewString+=("</table>");
        return exceptionViewString;
    }
    
    public static void main(String args[])
    {
        ExceptionView e = new ExceptionView();
        System.out.println(e.getExceptionViewString(BigDecimal.ONE));
    }
}
