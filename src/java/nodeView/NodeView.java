/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nodeView;


import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;
import liveView.TripData;
import liveView.TripList;


/**
 *
 * @author Jonty
 */
public class NodeView 
{
    private String nodeViewString;
    private ApproachingList ApproachingListVar; 
    private List<hibernate.pojo.TblMapping> VehicleList;
    private liveView.TripData tripDataVar;
    private Link linkVar;
    
    public NodeView() 
    {
        nodeViewString="";
        ApproachingListVar= new ApproachingList();
        VehicleList=null;
        tripDataVar = new TripData();
        linkVar = new Link();
    }
    
    public String getNodeView(BigDecimal IPlantID, String TNext) 
    {
        VehicleList = ApproachingListVar.getApproachingList(IPlantID, TNext);
        if(VehicleList.size()==0)
            return "<div class=\"NodeHeading\">No Vehicles Approaching</div>";
        nodeViewString+="<table border=\"1\" id=\"liveTable\" width=\"100%\">";
        nodeViewString+="<thead>";
        nodeViewString+="<tr>";
        
        nodeViewString+="<th>Vehicle ID</th>";
        nodeViewString+="<th>Driver</th>";
        nodeViewString+="<th>Transporter</th>";
        nodeViewString+="<th>Last Crossed</th>";
        nodeViewString+="<th>Expected Time</th>";
        nodeViewString+="</tr>";
        nodeViewString+=("</thead>");
        
        nodeViewString+=("<tbody>");
        
        for(hibernate.pojo.TblMapping i: VehicleList)
        {
            nodeViewString+=("<tr>");
            nodeViewString+=("<td>"+i.getTblVehicle().getTVehicleId()+"</td>");
            nodeViewString+=("<td>"+i.getTblDriver().getTDriverName()+"</td>");
            nodeViewString+=("<td>"+i.getTblTransporter().getTTransporterName()+"</td>");
            
            List<hibernate.pojo.TblVehicleFlight> tripDataList = tripDataVar.getTripDataList(i.getITripId(),IPlantID);
            hibernate.pojo.TblVehicleFlight lastChecked = tripDataList.get(tripDataList.size()-1);
            
            Calendar cal = Calendar.getInstance();
            cal.setTime(lastChecked.getDtTime());
            
            nodeViewString+=("<td>"+lastChecked.getTblEpos().getTGatewayName()+" </br> "+ cal.getTime()+"</td>");
            
            hibernate.pojo.TblLinks link = linkVar.getEposName(new BigDecimal(TNext), lastChecked.getTblEpos().getIMachineId(), IPlantID);
            
            
            cal.add(Calendar.MINUTE, link.getNTimediffInMin().intValue());
            
            nodeViewString+=("<td>"+cal.getTime()+"</td>");
            nodeViewString+=("</tr>");
        }
        nodeViewString+="</table>";
        return nodeViewString;
    }
    public static void main(String args[])
    {
        NodeView g=new NodeView();
        System.out.println(g.getNodeView(BigDecimal.ONE, "5"));
    }
}
