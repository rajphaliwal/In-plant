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
public class ApproachingList 
{
    Session session = null;
    private List<hibernate.pojo.TblLivePath> ApproachingList;
    private List<hibernate.pojo.TblMapping> VehicleList;

    public ApproachingList() 
    {
        ApproachingList  = null;
        VehicleList = new ArrayList<hibernate.pojo.TblMapping>();
    }
    
    
    
    public List<hibernate.pojo.TblMapping> getApproachingList(BigDecimal IPlantID, String TNext)
    {
        this.session = hibernate.helper.NewHibernateUtil.getSessionFactory().openSession();
        
        try 
        {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q;
            q=session.createQuery ("from TblLivePath where TNext=\'"+TNext+"\' And tblPlant="+IPlantID);
            ApproachingList = (List<hibernate.pojo.TblLivePath>) q.list();
            for(hibernate.pojo.TblLivePath i: ApproachingList)
            {
                for(hibernate.pojo.TblMapping j :i.getTblMappings())
                {
                    VehicleList.add(j);
                    Hibernate.initialize(j.getTblTransporter());
                    Hibernate.initialize(j.getTblDriver());
                    Hibernate.initialize(j.getTblVehicle());
                    Hibernate.initialize(j.getTblVehicleFlights());
                }
               
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
        return VehicleList;
    }
    public static void main(String args[])
    {
        ApproachingList g=new ApproachingList();
        
        //System.out.println(g.getApproachingList(BigDecimal.ONE, "5"));
    }
}
