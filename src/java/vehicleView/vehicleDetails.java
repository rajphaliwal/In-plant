package vehicleView;


import java.math.BigDecimal;
import org.hibernate.Session;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Jonty
 */
public class vehicleDetails
{
    String vehicleDetails;
    Session session = null;
    
    public vehicleDetails()
    {
        vehicleDetails="";
    }
    
    public String getVehicleDetails(BigDecimal ITripId)
    {
        
        try
        {
            this.session = hibernate.helper.NewHibernateUtil.getSessionFactory().openSession();
            hibernate.pojo.TblMapping trip = (hibernate.pojo.TblMapping)session.get(hibernate.pojo.TblMapping.class, ITripId);
            vehicleDetails+="<div class=\"outerlayer\">";
            
            //Vehicle Details
            
            vehicleDetails+="<p class=\"heading\">+ Vehicle Details</p>";
            
            vehicleDetails+="<div class=\"content\">";
            
            vehicleDetails+="<span class=\"attribute\">Registration Number: </span>";
            vehicleDetails+="<span class=\"value\">"+trip.getTblVehicle().getTVehicleId()+"</span>";
            vehicleDetails+="<br/>";
            
            vehicleDetails+="<span class=\"attribute\">Chasis Number: </span>";
            vehicleDetails+="<span class=\"value\">"+trip.getTblVehicle().getTChasisNo()+"</span>";
            vehicleDetails+="<br/>";
            
            vehicleDetails+="<span class=\"attribute\">National Permit: </span>";
            vehicleDetails+="<span class=\"value\">"+trip.getTblVehicle().getTNationalPermit()+"</span>";
            vehicleDetails+="<br/>";
            
            vehicleDetails+="<span class=\"attribute\">Vehicle Type: </span>";
            vehicleDetails+="<span class=\"value\">"+trip.getTblVehicle().getTVehicleType()+"</span>";
            vehicleDetails+="<br/>";
            
            vehicleDetails+="</div>";
            
            
            
            vehicleDetails+="</div>";
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return vehicleDetails;
    }
}
