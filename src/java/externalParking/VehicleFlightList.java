/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package externalParking;

import java.math.BigDecimal;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Raj-HP
 */
public class VehicleFlightList {
    Session session = null;
    public VehicleFlightList()
    {
        
    }
    public Boolean isPresent(BigDecimal IPlantID,BigDecimal tripId) 
    {
        this.session = hibernate.helper.NewHibernateUtil.getSessionFactory().openSession();
        Boolean result = false;
        try 
        {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q=session.createQuery ("FROM hibernate.pojo.TblVehicleFlight where i_trip_id = " + tripId +" and i_plant_id="+IPlantID);
            List<hibernate.pojo.TblVehicleFlight> vf = q.list();
            if(vf.size() != 0)
                result = true;
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        finally
        {
            this.session.close();
        }
        return result;
    }
    public static void main(String[] args) {
        VehicleFlightList v = new VehicleFlightList();
        System.out.println( v.isPresent(new BigDecimal(157), new BigDecimal(4435)) );
    }
}
