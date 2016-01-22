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
public class TripList {
    Session session = null;
    private List<hibernate.pojo.TblMapping> TripList = null;
    public TripList() 
    {
        
    }
    public List<hibernate.pojo.TblMapping> getTripList(String IPlantID) 
    {
        this.session = hibernate.helper.NewHibernateUtil.getSessionFactory().openSession();
        
        try 
        {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q=session.createQuery ("FROM hibernate.pojo.TblMapping where BIsActive=true And tblPlant="+IPlantID);
            TripList = (List<hibernate.pojo.TblMapping>) q.list();
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        finally
        {
            this.session.close();
        }
        return TripList;
    }
}
