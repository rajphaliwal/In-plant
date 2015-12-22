/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate.helper;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import hibernate.pojo.TblEpos;
import hibernate.pojo.TblPaths;
import hibernate.pojo.TblPlant;
import java.io.ByteArrayOutputStream;
import java.io.ObjectOutputStream;
import static java.lang.System.out;
import java.math.BigDecimal;
import java.sql.Array;
import java.sql.Blob;
import java.sql.CallableStatement;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.NClob;
import java.sql.PreparedStatement;
import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.sql.SQLWarning;
import java.sql.SQLXML;
import java.sql.Savepoint;
import java.sql.Statement;
import java.sql.Struct;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.Executor;
import javax.resource.spi.work.Work;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Raj-HP
 */
public class Path_handler extends sample_helper{

    public String insert_into_table(int plant_id, String TName, String path)
  {
        boolean error_flag=false;
        Session session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();
    
        org.hibernate.Transaction tx = null;
        try
        {
           
            tx=session.beginTransaction();

            /*List<Object[]> r = null;
            String sql = "select * from pr_inplant.fn_path_entry("+plant_id+",Array["+path+"] , '"+ TName +"')"; 
            r = session.createSQLQuery(sql).list();*/
            TblPaths p =new TblPaths();
            
            Plant_handler ph=new Plant_handler();
            TblPlant plant= ph.get_tuple(plant_id);
         
            if(plant!=null)
                   p.setTblPlant(plant);
            else    throw new Exception();
            
            p.setTName(TName);
            p.setIPathId(BigDecimal.ZERO);
            p.setTArrPath(path);
            
            
            session.save(p);
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
        
//throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String update_in_table(int path_id,int plant_id, String TName, String path)
    {
        Session session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();
       
        boolean error_flag=false;
        
        Transaction tx = null;
        try
        {   
            TblPaths t = (TblPaths) session.get(TblPaths.class,new BigDecimal(path_id));
            Plant_handler ph=new Plant_handler();
            TblPlant plant= ph.get_tuple(plant_id);
            
            tx=session.beginTransaction();
            
            if(plant==null)  throw  new Exception();
           
            t.setTblPlant(plant);
            t.setTName(TName);
            t.setTArrPath(path);
            
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
    
    TblPaths get_tuple(int path_id) {
        Session session=hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblPaths c = new TblPaths();
        try
        {
           
            tx=session.beginTransaction();
            c=(TblPaths) session.get(TblPaths.class,new BigDecimal(path_id));
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
            session.flush();
            session.close();
            return c;
        }     
    }
    
}
