/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exceptionView;

import hibernate.pojo.TblExceptions;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Collections;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Jonty
 */
public class ExceptionList 
{
    Session session = null;
    private List<hibernate.pojo.TblExceptions> ExceptionList;

    public List<TblExceptions> getExceptionList(BigDecimal IPlantID) 
    {
        this.session = hibernate.helper.NewHibernateUtil.getSessionFactory().openSession();
        try 
        {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createQuery ("from TblExceptions Where tblPlant="+IPlantID+" and BIsChecked=false");
            ExceptionList = (List<TblExceptions>) q.list();
            for(TblExceptions i:ExceptionList)
            {
                Hibernate.initialize(i.getTblEpos());
                Hibernate.initialize(i.getTblMapping().getTblVehicle());
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
        return ExceptionList;
    }
    
     
}
