/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package liveView;

import hibernate.pojo.TblUsers;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author Jonty
 */
public class LiveView 
{
    private String liveViewString;
    EposList eposListVar;
    TripList tripListVar;
    TripData tripDataVar;
    public LiveView()
    {
        liveViewString="";
        eposListVar= new EposList();
        tripListVar = new TripList();
        tripDataVar = new liveView.TripData();
                
    }
    
    public String getLiveView(TblUsers user) 
    {
        liveViewString+="<table border=\"1\" id=\"liveTable\" width=\"100%\">";
        liveViewString+="<thead>";
        liveViewString+="<tr>";
        List<hibernate.pojo.TblEpos> eposList = eposListVar.getEposList(user.getTblPlant().getIPlantId());
        List<BigDecimal> machineCodes = new ArrayList<BigDecimal>(eposList.size());
        liveViewString+="<th>Vehicle Id</th>";
        for(hibernate.pojo.TblEpos i: eposList)
        {
            String href="#";
            if(user.getBNodeView())
            {
                href="NodeView?id="+i.getIMachineId().toString();
            }
            
                liveViewString+="<th><a href=\""+href+"\">"+i.getTGatewayName()+"</a></th>";
            
            machineCodes.add(i.getIMachineId());
        }
        if(user.getBRemoveTrip())
            liveViewString+="<th>Force End Trip</th>";
        liveViewString+="</tr>";
        liveViewString+=("</thead>");
        
        //Getting tripList by Transporter View
        List<hibernate.pojo.TblMapping> tripList;
        if(user.getITransporterId()==null)
            tripList=tripListVar.getTripList(user.getTblPlant().getIPlantId());
        else
            tripList=tripListVar.getTripList(user.getTblPlant().getIPlantId(),user.getITransporterId());
        
        liveViewString+=("<tbody>");
        if(tripList!=null)
        {
            int rowId=0;
            for(hibernate.pojo.TblMapping i: tripList)
            {
                BigDecimal tripid=i.getITripId();
                List<hibernate.pojo.TblVehicleFlight> tripDataList = tripDataVar.getTripDataList(tripid,user.getTblPlant().getIPlantId());
                int TripDataListPointer=0;
                liveViewString+=("<tr>");
                String href = "TripDetails?trip="+i.getITripId();
                liveViewString+=("<td><a href="+href+">"+i.getTblVehicle().getTVehicleId()+"</a></td>");
                for(int j=0;j<machineCodes.size();j++)
                {
                    if(TripDataListPointer<tripDataList.size() && machineCodes.get(j)==tripDataList.get(TripDataListPointer).getTblEpos().getIMachineId())
                    {
                        liveViewString+=("<td>"+tripDataList.get(TripDataListPointer).getDtTime()+"</td>");
                        TripDataListPointer++;
                    }            
                    else
                    {
                        if(i.getTblLivePath()!=null && Integer.parseInt(i.getTblLivePath().getTNext())==machineCodes.get(j).intValue())
                        {
                            liveViewString+=("<td class=\"expect\">Expected Here!</td>");
                        }
                        else
                            liveViewString+=("<td></td>");
                    }
                }
                if(user.getBRemoveTrip())
                    liveViewString+="<td><button id=\""+i.getITripId()+"\"  value=\""+rowId+"\" type=\"button\" onclick=\"endtrip(this)\">End!</button></td>";
                liveViewString+=("</tr>");
                rowId++;
            }
        }
        liveViewString+="</table>";
        return liveViewString;
    }
    
    public static void main(String args[])
    {
        LiveView l = new LiveView();
        hibernate.pojo.TblUsers user;    
        Session s=hibernate.helper.NewHibernateUtil.getSessionFactory().openSession();
        user=(hibernate.pojo.TblUsers)s.get(hibernate.pojo.TblUsers.class, "Admin");
        System.out.println(l.getLiveView(user));
    }
}
