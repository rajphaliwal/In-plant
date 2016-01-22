/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package externalParking;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Raj-HP
 */
public class EposQuery {
    List<hibernate.pojo.TblEpos> eposList = null;
    Session session = null;
    HashMap hm = new HashMap();

    public EposQuery()
    {
        this.session = hibernate.helper.NewHibernateUtil.getSessionFactory().openSession();
        org.hibernate.Transaction tx = session.beginTransaction();
    }
    
    public void EposQueryLoading(String id)
    {
        
        Query q=session.createQuery ("FROM hibernate.pojo.TblEpos where tblPlant="+id +" and i_type_id=3");
        eposList = (List<hibernate.pojo.TblEpos>)q.list();
        for(hibernate.pojo.TblEpos i : eposList)
            hm.put(i.getIMachineId(), "true");
    }
    public void EposQueryEntry(String id)
    {
        Query q=session.createQuery ("FROM hibernate.pojo.TblEpos where tblPlant="+id +" and i_type_id=2");
        eposList = (List<hibernate.pojo.TblEpos>)q.list();
        for(hibernate.pojo.TblEpos i : eposList)
            hm.put(i.getIMachineId(), "true");
    }
    public Boolean isLoading(BigDecimal m_id)
    {
        if(hm.get(m_id) == "true")
            return true;
        else
            return false;
    }
    public Boolean isEntry(BigDecimal m_id)
    {
        if(hm.get(m_id) == "true")
            return true;
        else
            return false;
    }
}
