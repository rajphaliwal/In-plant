/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exceptionView;

import java.math.BigDecimal;
import org.hibernate.Session;

/**
 *
 * @author Jonty
 */
public class endException 
{
    Session session = null;
    public boolean end(BigDecimal IExceptionId)
    {
        this.session = hibernate.helper.NewHibernateUtil.getSessionFactory().openSession();
        try 
        {
            org.hibernate.Transaction tx = session.beginTransaction();
            hibernate.pojo.TblExceptions exception = (hibernate.pojo.TblExceptions)session.load(hibernate.pojo.TblExceptions.class, IExceptionId);
            exception.setBIsChecked(true);
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
    
}
