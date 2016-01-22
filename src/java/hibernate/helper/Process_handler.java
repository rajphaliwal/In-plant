/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate.helper;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import hibernate.pojo.TblProcess;
import hibernate.pojo.TblPlant;
import hibernate.pojo.TblProcess;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Raj-HP
 */
public class Process_handler {

    private Session session;
    
    
    public String insert_into_table(int plant_id, String processname){
        
        boolean error_flag=false;
        
        session=hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        org.hibernate.Transaction tx = null;

        try
        {
            tx=session.beginTransaction();
        
            TblProcess c =new TblProcess();
            
            Plant_handler ph=new Plant_handler();
            TblPlant plant= ph.get_tuple(plant_id);
         
            if(plant!=null)
                   c.setTblPlant(plant);
            else    throw new Exception();
            
            c.setIProcessId(BigDecimal.ZERO);
            c.setTProcessType(processname);
            
            //System.out.println(c.);
            
            
            session.save(c);
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
    
    
    public TblProcess get_tuple(int processid) {
        session=hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblProcess c = new TblProcess();
        try
        {
           
            tx=session.beginTransaction();
            c=(TblProcess) session.get(TblProcess.class,new BigDecimal(processid));
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
             return c;
        }     
    }
    
    public hibernate.pojo.TblProcess get_tuple_by_plant(int id, String name) {
        session=hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblProcess c = new TblProcess();
        hibernate.pojo.TblProcess list = null;
        try
        {
           
            tx=session.beginTransaction();
            //c=(TblProcess) session.get(TblProcess.class,new BigDecimal(id));
            System.out.println(name);
            Query query = session.createQuery("FROM hibernate.pojo.TblProcess where tblPlant="+ id + " and TProcessType='" + name + "'");
            list = (hibernate.pojo.TblProcess) query.uniqueResult();
            System.out.println(list.getTProcessType());
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
             return list;
        }     
    }
    
    public static void main(String[] args)
    {
        Process_handler t = new Process_handler();
        //t.insert_into_table(23,"raj");
        t.update_in_table(151,23,"ankit");
    }
    public String update_in_table(int process_id,int plant_id, String processname)
    {
        session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();
       
        boolean error_flag=false;
        
        Transaction tx = null;
        try
        {   
            TblProcess t = (TblProcess) session.get(TblProcess.class,new BigDecimal(process_id));
            Plant_handler ph=new Plant_handler();
            TblPlant plant= ph.get_tuple(plant_id);
            
            tx=session.beginTransaction();
            
            if(plant==null)  throw  new Exception();
           
            t.setTblPlant(plant);
            t.setTProcessType(processname);
            
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
