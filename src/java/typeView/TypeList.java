/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package typeView;

import java.math.BigDecimal;
import java.util.Collections;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Raj-HP
 */
public class TypeList {
    Session session = null;
    private List<hibernate.pojo.TblType> typeList = null;

    public List<hibernate.pojo.TblType> getEposList(BigDecimal IPlantID) 
    {
        this.session = hibernate.helper.NewHibernateUtil.getSessionFactory().openSession();
        try 
        {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createQuery ("FROM hibernate.pojo.TblType where tblPlant="+IPlantID);
            typeList = (List<hibernate.pojo.TblType>) q.list();
            Collections.sort(typeList);
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        finally
        {
            this.session.close();
        }
        return typeList;
    }
    public static void main(String[] args) {
        TypeList t = new TypeList();
        List<hibernate.pojo.TblType> l = t.getEposList(new BigDecimal(157));
        for(hibernate.pojo.TblType i : l)
        {
            System.out.println(i.getTName() + "  ");
        }
    }
}
