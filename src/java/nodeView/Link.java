/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nodeView;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Jonty
 */
public class Link 
{
    Session session = null;
    hibernate.pojo.TblLinks link;
    
    
    public hibernate.pojo.TblLinks getEposName(BigDecimal ITo, BigDecimal IFrom, BigDecimal IPlantID)
    {
        this.session = hibernate.helper.NewHibernateUtil.getSessionFactory().openSession();
        
        try 
        {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from TblLinks where i_to="+ITo+" and i_from = "+IFrom+" and tblPlant="+IPlantID);
            link = (hibernate.pojo.TblLinks)q.uniqueResult();
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        finally
        {
            this.session.close();
        }
        return link;
        
    }
    
    public static void main(String args[])
     {
         Link l= new Link();
         hibernate.pojo.TblLinks link = l.getEposName(new BigDecimal("157"), new BigDecimal("156"), new BigDecimal("157"));
         if(link == null)
             System.out.println("Null");
         else
            System.out.println(link.getILid());
     }
}
