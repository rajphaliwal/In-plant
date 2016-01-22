/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate.helper;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import hibernate.pojo.TblPlant;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;
import hibernate.pojo.TblCard;
import org.hibernate.Transaction;
/**
 *
 * @author Raj-HP
 */
public class Card_handler {
    private Session session;
    
    
    public String insert_into_table(int plant_id, String cardid){
        
        boolean error_flag=false;
        String result = "Success";
        String resultDetail = null;
        
        session=hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        org.hibernate.Transaction tx = null;

        try
        {
            tx=session.beginTransaction();
            Card_handler card = new Card_handler();
            
            if(cardid.length() == 0)
            {
                System.out.println("hellloooooo                     " + cardid);
                resultDetail = "Card Number required";
                result = "Failure";
            }
            
            
            else if(card.get_tuple(cardid) != null)
            {
                System.out.println("hellloooooo                     " + cardid);
                result = "Failure";
                resultDetail = "Card already exist";
            }
            else
            {
                TblCard c =new TblCard();

                Plant_handler ph=new Plant_handler();
                TblPlant plant= ph.get_tuple(plant_id);

                if(plant!=null)
                       c.setTblPlant(plant);
                else    throw new Exception();

                c.setCCardId(cardid);
                session.save(c);
                tx.commit();
            }
        }
        catch(Exception e)
        {
            error_flag=true; 
            result = "Failure";
            if (tx != null) {
                tx.rollback();
            //e.printStackTrace();
        }
        }
        finally
        {
            session.flush();
            session.close();
           /*if(error_flag==false) return "Success";
           else         return "Failure";*/
        }
        if(resultDetail != null && result.equals("Failure"))
        {
            result = "Failed: "+resultDetail;
        }
        return result;
    }

    public TblCard get_tuple(String cardid) {
        session=hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblCard c = new TblCard();
        try
        {
           
            tx=session.beginTransaction();
            c=(TblCard) session.get(TblCard.class,cardid);
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
