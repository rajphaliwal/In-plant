/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate.helper;

import hibernate.pojo.TblTransporter;
import hibernate.pojo.TblUsers;
import java.math.BigDecimal;
import java.util.Collections;
import java.util.List;
import javax.management.openmbean.SimpleType;
import org.hibernate.Query;
import org.hibernate.Session;
/**
 *
 * @author Ankit
 */
public class VehicleList 
{
    Session session = null;
    public VehicleList() 
    {
        
    }
    
    
    private List<hibernate.pojo.TblVehicle> vehicleList = null;
    
    public List<hibernate.pojo.TblVehicle> getVehicleList(String t){
        this.session = hibernate.helper.NewHibernateUtil.getSessionFactory().openSession();
        try 
        {
            Query q = session.createQuery ("FROM hibernate.pojo.TblVehicle where i_transporter_id = " + t);
            vehicleList = (List<hibernate.pojo.TblVehicle>) q.list();
            
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        finally
        {
            this.session.close();
        }
       return vehicleList;
    }
    public static void main(String args[])
    {
        VehicleList t = new VehicleList();
        System.out.println(t.getVehicleList("17"));
    }
}
