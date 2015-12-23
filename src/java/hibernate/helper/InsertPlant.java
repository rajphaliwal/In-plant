/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Raj-HP
 */
package hibernate.helper;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import hibernate.pojo.TblPlant;
import java.util.Map;
import java.util.HashMap;
import java.math.BigDecimal;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class InsertPlant 
{
    private Session session;
    
    public InsertPlant()
    {
        session=hibernate.folder.HibernateUtil.getSessionFactory().openSession();
    }
    
    public void insertIntoPlant(String name,String owner)
    {
        try
        {
            org.hibernate.Transaction tx=session.beginTransaction();
            hibernate.pojo.TblPlant plant= new hibernate.pojo.TblPlant();
            plant.setIPlantId(new BigDecimal(3));
            plant.setTPlantName(name);
            plant.setTPlantOwner(owner);
            
            ValueStack stack = ActionContext.getContext().getValueStack();
            Map<String, Object> context = new HashMap<String, Object>();
            context.put("current_session", plant);
            stack.push(context);
            session.save(plant);
            tx.commit();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            session.close();
        }
    }
    public TblPlant get_tuple(int id)
    {
        Transaction tx = null;
        TblPlant plant = null;
        try
        {
           // org.hibernate.Transaction tx=session.beginTransaction();
            tx=session.beginTransaction();
             plant=(TblPlant) session.get(TblPlant.class ,new BigDecimal(id));
        }
         catch(Exception e)
        {
             if (tx != null)
             {
                tx.rollback();
                e.printStackTrace();
            }
        }
        finally
        {
            session.close();
             return plant;
        }      
    }
}

