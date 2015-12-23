/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate.helper;

//import static hibernate.helper.sample_helper.FLAG;
import hibernate.pojo.TblPlant;
import hibernate.pojo.TblUsers;
import java.math.BigDecimal;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import permission.PermissionHandler;

/**
 *
 * @author ani
 */public class Users_handler extends sample_helper{
     private Session session;
     
    /**
     *
     * @param User_name
     * @param plant_id
     * @param password
     * @param password_md5
     * @param transporter_id
     * @return
     */
  /*  public String insert_into_table( int transporter_id,int plant_id)
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
    public String insert_into_table(String User_name,int plant_id,String password,String password_md5, PermissionHandler p)/* String tr_mob_no,String tr_address,String tr_city,String tr_state,String tr_pin,String  tr_email_id) */
    {
        boolean error_flag=false;
        session=hibernate.folder.HibernateUtil.getSessionFactory().openSession();
    
        org.hibernate.Transaction tx = null;
        try
        {
           
            tx=session.beginTransaction();
            
            TblUsers u=new TblUsers();//TblTransporter();
            u.setSUsername(User_name);
            
            {
                Plant_handler ph=new Plant_handler();
                TblPlant plant= ph.get_tuple(plant_id);
           
            if(plant!=null)
                    u.setTblPlant(plant);
            else    throw new Exception("Foreign Key Plant_id Dependency Failed ");
            
            }
            u.setSUsername(User_name);
            u.setSPassword(password);
            u.setSPasswordMd5(password_md5);
            // adding permissions as in the permissionHandler object
            u.setBAddDriver(p.getBAddDriver());
            u.setBAddTrip(p.getBAddTrip());
            u.setBAddUser(p.getBAddUser());
            u.setBAddVehicle(p.getBAddVehicle());
            u.setBChangeCurrentPlant(p.getBChangeCurrentPlant());
            u.setBEndException(p.getBEndException());
            u.setBLoggedIn(p.getBLoggedIn());
            u.setBModifyDriver(p.getBModifyDriver());
            u.setBModifyUser(p.getBModifyUser());
            u.setBModifyVehicle(p.getBModifyVehicle());
            u.setBNodeView(p.getBNodeView());
            u.setBPlantModify(p.getBPlantModify());
            u.setBRemoveTrip(p.getBRemoveTrip());
            u.setBSetupNewPlant(p.getBSetupNewPlant());
            u.setBViewDo(p.getBViewDo());
            u.setBViewException(p.getBViewException());
            u.setBViewHistory(p.getBViewHistory());
            u.setBViewTrip(p.getBViewTrip());
            u.setBAddCard(p.getBAddCard());
            u.setBAddEpos(p.getBAddEpos());
            u.setBAddPath(p.getBAddEpos());
            u.setBAddProcess(p.getBAddProcess());
            u.setBAddTransporter(p.getBAddTransporter());
            u.setBAddLink(p.getBAddLink());
            u.setBModifyCard(p.getBModifyCard());
            u.setBModifyEpos(p.getBModifyEpos());
            u.setBModifyLink(p.getBModifyLink());
            u.setBModifyPath(p.getBModifyPath());
            u.setBModifyProcess(p.getBModifyProcess());
            u.setBModifyTransporter(p.getBModifyTransporter());
            
            session.save(u);
            
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
        
    }
    
    public String delete_from_table(String username) {
                   
        session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        
        boolean error_flag=false;
        
        Transaction tx = null;
        try
        {   
            Users_handler t=new Users_handler();
            TblUsers tblUs=t.get_tuple(username);
            if(tblUs==null)   throw  new Exception();
            
            tx=session.beginTransaction();
          
         TblUsers  u=new TblUsers();
         u.setSUsername(username);
            //TblCard card=new TblCard();
           // trp.setITransporterId(new BigDecimal(id));  
            session.delete(u);
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
        
    }
       
    public String update_in_table(String User_name,int plant_id,String password,String password_md5)// String tr_mob_no,String tr_address,String tr_city,String tr_state,String tr_pin,String  tr_email_id) 
    {
              session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();
       
        boolean error_flag=false;
        
        Transaction tx = null;
        try
        {         
            TblUsers u=(TblUsers) session.get(TblUsers.class,User_name);
            //  TblCard Card=(TblCard) session.get(TblCard.class,new BigDecimal(card_id));
            
           Plant_handler ph=new Plant_handler();
           TblPlant plant= ph.get_tuple(plant_id);
        
            
           tx=session.beginTransaction();
           
           //if(FLAG==true)   
           {
           if(plant==null)  throw  new Exception();
           }
                   u.setSUsername(User_name);
            u.setSPassword(password);
            u.setSPasswordMd5(password_md5);
    
             
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
    
  /*public String update_in_table(int transporter_id,int plant_id) {
     
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
    public TblUsers get_tuple(String id) {
           session=hibernate.folder.HibernateUtil.getSessionFactory().openSession();
    Transaction tx = null;
    TblUsers plant = null;
        try
        {
           // org.hibernate.Transaction tx=session.beginTransaction();
            tx=session.beginTransaction();
             plant=(TblUsers) session.get(TblUsers.class ,id);
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
             return plant;
        }      
//throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public static void main(String[] args) {
        Users_handler u = new Users_handler();
        System.out.println(u.get_tuple("Admin"));
    }

    
}
