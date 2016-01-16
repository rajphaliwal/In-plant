/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate.helper;

import hibernate.pojo.TblTransporter;
import hibernate.pojo.TblUsers;
import java.util.Collections;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Ankit
 */
public class DriverList 
{
    Session session = null;
    private List<hibernate.pojo.TblDriver> driverList = null;

    public DriverList() 
    {
        
    }
    
    
    public List<hibernate.pojo.TblDriver> getDriverList(String t) 
    {
        this.session = hibernate.helper.NewHibernateUtil.getSessionFactory().openSession();
        try 
        {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q;
            Transporter_handler th = new Transporter_handler();
            TblTransporter trans = th.get_tuple(Integer.parseInt(t));
            if(trans == null)
            {
                //System.out.println("@@@@@@@@@@@@@@@@@@Transporter not found@@@@@@@@@@@@@@@@@@@");
                q = session.createQuery ("FROM hibernate.pojo.TblDriver where i_plant_id = " + t);
                driverList = (List<hibernate.pojo.TblDriver>) q.list();
            }
            else
            {
                //System.out.println("@@@@@@@@@@@@@@@@@@Transporter found@@@@@@@@@@@@@@@@@@@");
                q = session.createQuery ("FROM hibernate.pojo.TblDriver where i_transporter_id = " + t);
                driverList = (List<hibernate.pojo.TblDriver>) q.list();
            }
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        finally
        {
            this.session.close();
        }
        return driverList;
    }
    
}
