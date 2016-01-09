/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package liveView;

import hibernate.helper.Users_handler;
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
    public static void main(String[] args) {
        LiveView l = new LiveView();
        Users_handler u = new Users_handler();
        TblUsers user = u.get_tuple("PLANT_ADMIN");
        String s = l.getLiveView(user);
        System.out.println("helllllloooooo");
    }
    public String getLiveView(TblUsers user) 
    {
        liveViewString+="<table border=\"1\" id=\"liveTable\" width=\"100%\">";
        liveViewString+="<thead>";
        liveViewString+="<tr>";
        List<hibernate.pojo.TblEpos> eposList = eposListVar.getEposList(user.getTblPlant().getIPlantId());
        List<BigDecimal> machineCodes = new ArrayList<BigDecimal>(eposList.size());
        liveViewString+="<th>Trip Id</th>";
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
                liveViewString+=("<tr>");
                String href1 = "TripDetails?trip="+i.getITripId();
                liveViewString+=("<td><a href="+href1+">"+i.getITripId()+"</a></td>");
                
                String href2 = "VehicleDetails?vehicle="+i.getITripId();
                liveViewString+=("<td><a href="+href2+">"+i.getTblVehicle().getTVehicleId()+"</a></td>");
                
                List<hibernate.pojo.TblVehicleFlight> tripDataList = tripDataVar.getTripDataList(tripid,user.getTblPlant().getIPlantId());
                /*for(int m=0,k=0; k < tripDataList.size();)
                    if(tripDataList.get(k).getTblEpos().getIMachineId().intValue() == machineCodes.get(m).intValue())
                    {
                        System.out.println(tripDataList.get(k).getTblEpos().getIMachineId() + "  " + machineCodes.get(m));
                        k++;
                        m++;
                    }
                    else
                        m++;*/
                int TripDataListPointer=0;
                for(int j=0;j<machineCodes.size();j++)
                {
                    //System.out.println( "Hello" + tripDataList.get(TripDataListPointer).getDtTime().toString());
                    //System.out.println(machineCodes.get(j) + "   " + tripDataList.get(TripDataListPointer).getTblEpos().getIMachineId());
                    if(TripDataListPointer < tripDataList.size() && machineCodes.get(j).intValue() ==tripDataList.get(TripDataListPointer).getTblEpos().getIMachineId().intValue())
                    {
                        liveViewString+=("<td>"+tripDataList.get(TripDataListPointer).getDtTime().toString()+"</td>");
                        //System.out.println( "Hello" + tripDataList.get(TripDataListPointer).getDtTime());
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
    
    
}
