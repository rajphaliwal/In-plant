/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package typeView;

import hibernate.helper.Users_handler;
import hibernate.pojo.TblUsers;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Raj-HP
 */
public class typeView {
    String liveViewString;
    
    public String getTypeView(TblUsers user)
    {
        
        liveViewString+="<table border=\"1\" id=\"liveTable\" width=\"100%\">";
        liveViewString+="<thead>";
        liveViewString+="<tr>";
        TypeList t = new TypeList();
        List<hibernate.pojo.TblType> l = t.getEposList(user.getTblPlant().getIPlantId());
        List<BigDecimal> typeIds = new ArrayList<BigDecimal>(l.size());
        liveViewString+="<th>Trip Id</th>";
        liveViewString+="<th>Vehicle Id</th>";
        for(hibernate.pojo.TblType i : l)
        {
            liveViewString+= "<th>";
            liveViewString+= i.getTName();
            liveViewString+= "</th>";
            liveViewString+= "<th>Time In</th>";
            liveViewString+= "<th>Time Out </th>";
            typeIds.add(i.getITypeId());
        }
        liveViewString+="</tr>";
        liveViewString+=("</thead>");
        
        TripList triplist = new TripList();
        List<hibernate.pojo.TblMapping> tripList=triplist.getTripList(user.getTblPlant().getIPlantId());//user.getTblPlant().getIPlantId());
        TripData tripdata = new TripData();
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
                
                List<hibernate.pojo.TblVehicleFlight> tripDataList = tripdata.getTripDataList(tripid,user.getTblPlant().getIPlantId()); //user.getTblPlant().getIPlantId());        
                int TripDataListPointer=0;
                for(int j=0;j<typeIds.size();j++)
                {
                    //System.out.println( "Hello" + tripDataList.get(TripDataListPointer).getDtTime().toString());
                    //System.out.println(machineCodes.get(j) + "   " + tripDataList.get(TripDataListPointer).getTblEpos().getIMachineId());
                    if(TripDataListPointer < tripDataList.size() && typeIds.get(j).intValue() == tripDataList.get(TripDataListPointer).getTblEpos().getTblType().getITypeId().intValue())
                    {
                        liveViewString+=("<td>"+tripDataList.get(TripDataListPointer).getTblEpos().getTGatewayName()+"</td>");
                        liveViewString+=("<td>"+tripDataList.get(TripDataListPointer).getDtTime().toString()+"</td>");
                        if(typeIds.get(j).intValue() == tripDataList.get(TripDataListPointer+1).getTblEpos().getTblType().getITypeId().intValue())
                        {
                            liveViewString+=("<td>"+tripDataList.get(TripDataListPointer+1).getDtTime().toString()+"</td>");
                            TripDataListPointer++;
                        }
                        else
                            liveViewString+=("<td></td>");
                        //System.out.println( "Hello" + tripDataList.get(TripDataListPointer).getDtTime());
                        TripDataListPointer++;
                    }
                    else
                    {
                        liveViewString+=("<td></td>");
                        liveViewString+=("<td></td>");
                        liveViewString+=("<td></td>");
                    }
                }
            }
        
        return liveViewString;
    }
        return null;
}
    public static void main(String[] args) {
        typeView tv = new typeView();
        Users_handler uh = new Users_handler();
        hibernate.pojo.TblUsers user = uh.get_tuple(new String("PLANT_ADMIN"));
        //System.out.println(user.getTblPlant().getIPlantId().toString());
        String s = tv.getTypeView(user);
        System.out.println(s);
    }
}