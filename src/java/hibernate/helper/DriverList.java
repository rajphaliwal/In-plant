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
            Query q = session.createQuery ("FROM hibernate.pojo.TblDriver where i_transporter_id = " + t);
            driverList = (List<hibernate.pojo.TblDriver>) q.list();
            //Collections.sort(driverList);
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
