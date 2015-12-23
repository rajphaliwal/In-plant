package tripView;


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
public class tripDetails
{
    String tripDetails;
    Session session = null;
    
    public tripDetails()
    {
        tripDetails="";
    }
    
    public String getTripDetails(BigDecimal ITripId)
    {
        
        try
        {
            this.session = hibernate.helper.NewHibernateUtil.getSessionFactory().openSession();
            hibernate.pojo.TblMapping trip = (hibernate.pojo.TblMapping)session.get(hibernate.pojo.TblMapping.class, ITripId);
            tripDetails+="<div class=\"outerlayer\">";
            
            //Trip Details
            
            tripDetails+="<p class=\"heading\">+ Trip Details</p>";
            
            tripDetails+="<div class=\"content\">";
            
            tripDetails+="<span class=\"attribute\">Trip ID: </span>";
            tripDetails+="<span class=\"value\">"+trip.getITripId()+"</span>";
            tripDetails+="<br/>";
            
            tripDetails+="<span class=\"attribute\">Card ID: </span>";
            tripDetails+="<span class=\"value\">"+trip.getICardId()+"</span>";
            tripDetails+="<br/>";
            
            tripDetails+="</div>";
            
            //Vehicle Details
            
            tripDetails+="<p class=\"heading\">+ Vehicle Details</p>";
            
            tripDetails+="<div class=\"content\">";
            
            tripDetails+="<span class=\"attribute\">Registration Number: </span>";
            tripDetails+="<span class=\"value\">"+trip.getTblVehicle().getTVehicleId()+"</span>";
            tripDetails+="<br/>";
            
            tripDetails+="<span class=\"attribute\">Chasis Number: </span>";
            tripDetails+="<span class=\"value\">"+trip.getTblVehicle().getTChasisNo()+"</span>";
            tripDetails+="<br/>";
            
            tripDetails+="<span class=\"attribute\">National Permit: </span>";
            tripDetails+="<span class=\"value\">"+trip.getTblVehicle().getTNationalPermit()+"</span>";
            tripDetails+="<br/>";
            
            tripDetails+="<span class=\"attribute\">Vehicle Type: </span>";
            tripDetails+="<span class=\"value\">"+trip.getTblVehicle().getTVehicleType()+"</span>";
            tripDetails+="<br/>";
            
            tripDetails+="</div>";
            
            //Driver Details
            
            tripDetails+="<p class=\"heading\">+ Driver Details</p>";
            
            tripDetails+="<div class=\"content\">";
            
            tripDetails+="<span class=\"attribute\">Driver Name: </span>";
            tripDetails+="<span class=\"value\">"+trip.getTblDriver().getTDriverName()+"</span>";
            tripDetails+="<br/>";
            
            tripDetails+="<span class=\"attribute\">License Number: </span>";
            tripDetails+="<span class=\"value\">"+trip.getTblDriver().getTLicenceNo()+"</span>";
            tripDetails+="<br/>";
            
            tripDetails+="<span class=\"attribute\">Address: </span>";
            tripDetails+="<span class=\"value\">"+trip.getTblDriver().getTDriverAddr1()+" "+trip.getTblDriver().getTDriverAddr2()+" "+trip.getTblDriver().getTStateId()+" "+trip.getTblDriver().getIDriverPin()+"</span>";
            tripDetails+="<br/>";
            
            tripDetails+="<span class=\"attribute\">Email ID: </span>";
            tripDetails+="<span class=\"value\">"+trip.getTblDriver().getTDriverEmailId()+"</span>";
            tripDetails+="<br/>";
            
            tripDetails+="</div>";
            
            //Transporter Details
            
            tripDetails+="<p class=\"heading\">+ Transporter Details</p>";
            
            tripDetails+="<div class=\"content\">";
            
            tripDetails+="<span class=\"attribute\">Transporter Name: </span>";
            tripDetails+="<span class=\"value\">"+trip.getTblTransporter().getTTransporterName()+"</span>";
            tripDetails+="<br/>";
            
            tripDetails+="<span class=\"attribute\">Mobile Number: </span>";
            tripDetails+="<span class=\"value\">"+trip.getTblTransporter().getTTransporterMobileNo()+"</span>";
            tripDetails+="<br/>";
            
            tripDetails+="<span class=\"attribute\">Email ID: </span>";
            tripDetails+="<span class=\"value\">"+trip.getTblTransporter().getTTransporterEmailId()+"</span>";
            tripDetails+="<br/>";
            
            tripDetails+="<span class=\"attribute\">Address: </span>";
            tripDetails+="<span class=\"value\">"+trip.getTblTransporter().getTTransporterAddr()+" "+trip.getTblTransporter().getTTransporterCity()+" "+trip.getTblTransporter().getTTransporterState()+" "+trip.getTblTransporter().getITransporterPin()+"</span>";
            tripDetails+="<br/>";
            
            tripDetails+="</div>";
            
            //DO Details
            
            tripDetails+="<p class=\"heading\">+ Delivery Order Details</p>";
            
            tripDetails+="<div class=\"content\">";
            
            tripDetails+="<span class=\"attribute\">Consignee Name: </span>";
            tripDetails+="<span class=\"value\">"+trip.getTblDo().getTConsignee()+"</span>";
            tripDetails+="<br/>";
            
            tripDetails+="<span class=\"attribute\">Consigner Name: </span>";
            tripDetails+="<span class=\"value\">"+trip.getTblDo().getTConsigner()+"</span>";
            tripDetails+="<br/>";
            
            tripDetails+="<span class=\"attribute\">Delivery Address: </span>";
            tripDetails+="<span class=\"value\">"+trip.getTblDo().getTDeliveryAddress()+"</span>";
            tripDetails+="<br/>";
            
            tripDetails+="</div>";
            
            tripDetails+="</div>";
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return tripDetails;
    }
}
