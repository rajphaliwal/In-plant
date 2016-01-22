/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package externalParking;

import hibernate.helper.Epos_handler;
import hibernate.pojo.TblEpos;
import java.math.BigDecimal;
import java.util.List;
import org.hibernate.Hibernate;

/**
 *
 * @author Raj-HP
 */
public class ExternalParking {
    
    TripList tl = new TripList();
    VehicleFlightList vehicleFlightList = new VehicleFlightList();
    List<hibernate.pojo.TblMapping> tripList = null;
    
    public String getEParkingList(String id)
    {
        String html = "<table border=\"1\" id=\"liveTable\" width=\"100%\">";
        html +="<thead>";
        html+="<tr>";
        html+="<th>Vehicle Id</th>";
        html+="<th>Driver Id</th>";
        html+="<th>Loading Location</th>";
        html+="</tr>";
        html+=("</thead>");
        html+=("<tbody>");
        tripList = tl.getTripList(id);
        EposQuery eqloading = new EposQuery();
        eqloading.EposQueryLoading(id);
        EposQuery eqentry = new EposQuery();
        eqentry.EposQueryEntry(id);
        for(hibernate.pojo.TblMapping i : tripList)
        {
            Hibernate.initialize(i.getTblLivePath());
            String m_id = i.getTblLivePath().getTNext();
            if(eqentry.isEntry(new BigDecimal(m_id)) )
            {
                html+=("<tr>");
                html+=("<td>" + i.getTblVehicle().getTVehicleId() + "</td>");
                if(i.getTblDriver() != null)
                    html+=("<td>" + i.getTblDriver().getTDriverName() +"</td>");
                else
                    html+=("<td>" + i.getTDriverName() +"</td>");
                String path = i.getTblLivePath().getTCurrPath();
                String matchineid[] = path.split(",");
                for(int k=0;k<matchineid.length;k++)
                {
                    if(eqloading.isLoading(new BigDecimal(matchineid[k])))
                    {
                        Epos_handler e = new Epos_handler();
                        TblEpos epos = e.get_tuple(Integer.parseInt(matchineid[k]));
                        html+=("<td>" + epos.getTGatewayName() +"</td>");
                    }
                }
                html+=("</tr>");
            }
        }
        html+=("</tbody>");
        html+="</table>";
        return html;
    }
    public static void main(String[] args) {
        ExternalParking e = new ExternalParking();
        System.out.println(e.getEParkingList("157"));
    }
}
