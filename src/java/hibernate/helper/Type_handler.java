/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate.helper;

import hibernate.pojo.TblPlant;
import hibernate.pojo.TblProcess;
import hibernate.pojo.TblType;
import java.math.BigDecimal;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Raj-HP
 */
public class Type_handler {
    private Session session;
    
    public String insert_into_table(int plant_id, String typename){
        
        boolean error_flag=false;
        
        session=hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        org.hibernate.Transaction tx = null;

        try
        {
            tx=session.beginTransaction();
        
            TblType t =new TblType();
            
            Plant_handler ph=new Plant_handler();
            TblPlant plant= ph.get_tuple(plant_id);
         
            if(plant!=null)
                   t.setTblPlant(plant);
            else    throw new Exception();
            
            t.setITypeId(BigDecimal.TEN);
            t.setTName(typename);
            
            
            //System.out.println(c.);
            
            
            session.save(t);
            tx.commit();
        }
        catch(Exception e)
        {
            error_flag=true; 
            if (tx != null) {
                tx.rollback();
            //e.printStackTrace();
        }
        }
        finally
        {
            session.close();
           if(error_flag==false) return "Success";
           else         return "Failure";
        }
    }
    
    
    public TblType get_tuple(int typeid) {
        session=hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblType t = new TblType();
        try
        {
           
            tx=session.beginTransaction();
            t=(TblType) session.get(TblType.class,new BigDecimal(typeid));
        }
        catch(Exception e)
        {
             if (tx != null) {
                tx.rollback();
            e.printStackTrace();
        }
        }
        finally
        {
            session.close();
             return t;
        }     
    }
    public static void main(String[] args)
    {
        
    }
    public String update_in_table(int type_id, String typename)
    {
        session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();
       
        boolean error_flag=false;
        
        Transaction tx = null;
        try
        {   
            TblType t = (TblType) session.get(TblType.class,new BigDecimal(type_id));
            tx=session.beginTransaction();
            t.setTName(typename);
            
            tx.commit();
        }
        catch(Exception e)
        {
            error_flag=true; 
            if (tx != null) {
                tx.rollback();
            e.printStackTrace();
        }
        }
        finally
        {
            session.close();
            if(error_flag==false) return "Success";
           else         return "Failure";
        }   
    }
}
