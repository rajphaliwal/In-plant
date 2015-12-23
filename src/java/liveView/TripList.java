/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package liveView;

import hibernate.pojo.TblPlant;
import java.math.BigDecimal;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Jonty
 */
public class TripList 
{
    Session session = null;
    private List<hibernate.pojo.TblMapping> TripList = null;
    public TripList() 
    {
        
    }

    /**
     * @return the TripDataList
     */
    public List<hibernate.pojo.TblMapping> getTripList(BigDecimal IPlantID, BigDecimal ITransporterId) 
    {
        this.session = hibernate.helper.NewHibernateUtil.getSessionFactory().openSession();
        
        try 
        {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q;
            if(!(ITransporterId.equals(new BigDecimal(-1))))
                q=session.createQuery ("FROM hibernate.pojo.TblMapping where BIsActive=true And tblTransporter="+ITransporterId+" And tblPlant="+IPlantID);
            else
                q=session.createQuery ("FROM hibernate.pojo.TblMapping where BIsActive=true And tblPlant="+IPlantID);
            TripList = (List<hibernate.pojo.TblMapping>) q.list();
            for(hibernate.pojo.TblMapping i: TripList)
            {
                Hibernate.initialize(i.getTblLivePath());
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
        return TripList;
    }
    
     public List<hibernate.pojo.TblMapping> getTripList(BigDecimal IPlantID)
     {
         return getTripList(IPlantID,new BigDecimal(-1));
     }
     
     public static void main(String args[])
     {
         TripList t=new TripList();
         //System.out.println(t.getTripList());
     }
}
