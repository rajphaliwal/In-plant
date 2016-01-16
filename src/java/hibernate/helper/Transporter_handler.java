/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate.helper;

import java.util.Collections;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import hibernate.pojo.TblPlant;
import hibernate.pojo.TblTransporter;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author ani
 */
public class Transporter_handler extends sample_helper
{

    private Session session;

    /**
     *
     * @param plant_id
     * @param transporter_id
     * @return
     */
    /*public String insert_into_table( int transporter_id,int plant_id)
     {
     boolean error_flag=false;
     session=hibernate.NewHibernateUtil.getSessionFactory().openSession();
    
     org.hibernate.Transaction tx = null;
     try
     {
           
     tx=session.beginTransaction();
            
     TblTransporter trp=new TblTransporter();
     trp.setITransporterId(new BigDecimal(1));
            
     {
     Plant_handler ph=new Plant_handler();
     TblPlant plant= ph.get_tuple(plant_id);
           
     if(plant!=null)
     trp.setTblPlant(plant);
     else    throw new Exception("Foreign Key Plant_id Dependency Failed ");
            
     }
            
     session.save(trp);
            
     tx.commit();                               
     //throw new Exception("Method Not Overwritten Yet");
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
        
     //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
     }
     */
    public String insert_into_table(int plant_id, String tr_name, String tr_mob_no, String tr_address, String tr_city, String tr_state, String tr_pin, String tr_email_id)
    {
        boolean error_flag = false;
        session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();

        org.hibernate.Transaction tx = null;
        try
        {

            tx = session.beginTransaction();

            TblTransporter trp = new TblTransporter();
            
            Plant_handler ph = new Plant_handler();
            TblPlant plant = ph.get_tuple(plant_id);

            if (plant != null)
            {
                trp.setTblPlant(plant);
            }
            else
            {
                throw new Exception("Foreign Key Plant_id Dependency Failed ");
            }

            trp.setTTransporterName(tr_name);
            trp.setTTransporterMobileNo(tr_mob_no);
            trp.setTTransporterAddr(tr_address);
            trp.setTTransporterCity(tr_city);
            trp.setTTransporterState(tr_state);
            trp.setITransporterPin(tr_pin);
            trp.setTTransporterEmailId(tr_email_id);
            
            ValueStack stack = ActionContext.getContext().getValueStack();
            HashMap<String, Object> context = new HashMap<String, Object>();
            context.put("transporter", trp);
            stack.push(context);

            session.save(trp);

            tx.commit();
            //throw new Exception("Method Not Overwritten Yet");
        }
        catch (Exception e)
        {
            error_flag = true;
            if (tx != null)
            {
                tx.rollback();
                e.printStackTrace();
            }
        }
        finally
        {
            session.close();
            if (error_flag == false)
            {
                return "Success";
            }
            else
            {
                return "Failure";
            }
        }

    }
    
    
    
    public List<hibernate.pojo.TblTransporter> get_transporter_List()
    {
        session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        List<hibernate.pojo.TblTransporter> transporterList = null;
        try
        {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createQuery("FROM hibernate.pojo.TblTransporter");
            transporterList = (List<hibernate.pojo.TblTransporter>) q.list();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            this.session.close();
        }
        return transporterList;
    }

    /**
     *
     * @param id
     * @return
     */
    //@Override
    public String delete_from_table(int id)
    {

        session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();

        boolean error_flag = false;

        Transaction tx = null;
        try
        {
            Transporter_handler t = new Transporter_handler();
            TblTransporter trp = t.get_tuple(id);
            if (trp == null)
            {
                throw new Exception();
            }

            tx = session.beginTransaction();

            trp = new TblTransporter();
            //TblCard card=new TblCard();
            trp.setITransporterId(new BigDecimal(id));
            session.delete(trp);
            tx.commit();

            //throw new Exception("Method Not Overwritten Yet");
        }
        catch (Exception e)
        {
            error_flag = true;
            if (tx != null)
            {
                tx.rollback();
                e.printStackTrace();
            }
        }
        finally
        {
            session.close();
            if (error_flag == false)
            {
                return "Success";
            }
            else
            {
                return "Failure";
            }
        }

    }
    public static void main(String[] args)
    {
        Transporter_handler t = new Transporter_handler();
        t.update_in_table(149,23,"trans_567","89","kolkata","kolkata","WB","700006","mail@gmail.com");
    }
    public String update_in_table(int tr_id, int plant_id, String tr_name, String tr_mob_no, String tr_address, String tr_city, String tr_state, String tr_pin, String tr_email_id)
    {
        session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();

        boolean error_flag = false;

        Transaction tx = null;
        try
        {
            TblTransporter trp = (TblTransporter) session.get(TblTransporter.class, new BigDecimal(tr_id));
            //  TblCard Card=(TblCard) session.get(TblCard.class,new BigDecimal(card_id));

            Plant_handler ph = new Plant_handler();
            TblPlant plant = ph.get_tuple(plant_id);

            tx = session.beginTransaction();

            //if(FLAG==true)   
            {
                if (plant == null)
                {
                    throw new Exception();
                }
            }

            trp.setTblPlant(plant);
            trp.setTTransporterName(tr_name);
            trp.setTTransporterMobileNo(tr_mob_no);
            trp.setTTransporterAddr(tr_address);
            trp.setTTransporterCity(tr_city);
            trp.setTTransporterState(tr_state);
            trp.setITransporterPin(tr_pin);
            trp.setTTransporterEmailId(tr_email_id);

            tx.commit();

            // throw new Exception("Method Not Overwritten Yet");
        }
        catch (Exception e)
        {
            error_flag = true;
            if (tx != null)
            {
                tx.rollback();
                e.printStackTrace();
            }
        }
        finally
        {
            session.close();
            if (error_flag == false)
            {
                return "Success";
            }
            else
            {
                return "Failure";
            }
        }

    }
    /* 
     public String update_in_table(int transporter_id,int plant_id) {
     
     session = hibernate.NewHibernateUtil.getSessionFactory().openSession();
       
     boolean error_flag=false;
        
     Transaction tx = null;
     try
     {   
        
     TblTransporter trp=(TblTransporter) session.get(TblTransporter.class,new BigDecimal(transporter_id));
     //  TblCard Card=(TblCard) session.get(TblCard.class,new BigDecimal(card_id));
            
     Plant_handler ph=new Plant_handler();
     TblPlant plant= ph.get_tuple(plant_id);
        
            
     tx=session.beginTransaction();
           
     if(FLAG==true)   
     {
     if(plant==null)  throw  new Exception();
     }
           
     trp.setTblPlant(plant);
            
     tx.commit();       
           
     // throw new Exception("Method Not Overwritten Yet");
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
     */

    //@Override

    public TblTransporter get_tuple(int id)
    {
        session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblTransporter plant = null;
        try
        {
            // org.hibernate.Transaction tx=session.beginTransaction();
            tx = session.beginTransaction();
            plant = (TblTransporter) session.get(TblTransporter.class, new BigDecimal(id));
        }
        catch (Exception e)
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
//throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public TblTransporter get_tuple(String name)
    {
        session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblTransporter plant = null;
        try
        {
            // org.hibernate.Transaction tx=session.beginTransaction();
            tx = session.beginTransaction();
            plant = (TblTransporter) session.get(TblTransporter.class, name);
            System.out.println(plant.getITransporterId());
        }
        catch (Exception e)
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
//throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
