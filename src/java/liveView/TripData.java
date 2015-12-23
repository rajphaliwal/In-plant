/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package liveView;

import hibernate.pojo.TblVehicleFlight;
import java.math.BigDecimal;
import java.util.Collections;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Jonty
 */
public class TripData 
{
    Session session = null;
    private List<hibernate.pojo.TblVehicleFlight> TripDataList = null;
    public TripData() 
    {
    }

    /**
     * @return the TripDataList
     */
    public List<hibernate.pojo.TblVehicleFlight> getTripDataList(BigDecimal b, BigDecimal IPlantID) 
    {
        this.session = hibernate.helper.NewHibernateUtil.getSessionFactory().openSession();
        try 
        {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createQuery ("from TblVehicleFlight where i_trip_id="+b+" and IPlantId="+IPlantID+" order by dtTime");
            TripDataList = (List<hibernate.pojo.TblVehicleFlight>) q.list();
            Collections.sort(TripDataList);
            for(TblVehicleFlight i:TripDataList)
            {
                Hibernate.initialize(i.getTblEpos());
                Hibernate.initialize(i.getTblMapping().getTblVehicle().getTVehicleId());
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
        return TripDataList;
    }
    
}
