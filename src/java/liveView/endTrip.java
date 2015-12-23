/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package liveView;

import java.math.BigDecimal;
import java.util.Collections;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Jonty
 */
public class endTrip 
{
    Session session = null;
    public boolean end(BigDecimal tripId)
    {
        this.session = hibernate.helper.NewHibernateUtil.getSessionFactory().openSession();
        try 
        {
            org.hibernate.Transaction tx = session.beginTransaction();
            hibernate.pojo.TblMapping trip = (hibernate.pojo.TblMapping)session.load(hibernate.pojo.TblMapping.class, tripId);
            trip.setBIsActive(false);
            tx.commit();
        }
        catch (Exception e) 
        {
            e.printStackTrace();
            return false;
        }
        finally
        {
            this.session.close();
        }
        return true;
    }
    public static void main(String args[])
    {
        endTrip e=new endTrip();
        //e.end(BigDecimal.ONE);
    }
}
