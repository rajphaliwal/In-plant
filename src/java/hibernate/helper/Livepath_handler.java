/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate.helper;

import hibernate.pojo.TblLivePath;
import hibernate.pojo.TblPaths;
import hibernate.pojo.TblPlant;
import java.math.BigDecimal;
import org.hibernate.Session;

/**
 *
 * @author Raj-HP
 */
public class Livepath_handler {

    public Livepath_handler() {
    }
    
    public TblLivePath insert_into_table(int plant_id, String path)
  {
        
        Session session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        TblLivePath p =new TblLivePath();
        org.hibernate.Transaction tx = null;
        try
        {
            tx=session.beginTransaction();
            
            
            Plant_handler ph=new Plant_handler();
            TblPlant plant= ph.get_tuple(plant_id);
         
            if(plant!=null)
                   p.setTblPlant(plant);
            else    throw new Exception();
            
            p.setIPathId(BigDecimal.ZERO);
            p.setTCurrPath(path);
            String[] s = path.split(",");
            p.setTNext(s[0]);
            
            session.save(p);
            tx.commit();
        }
        catch(Exception e)
        {
             
            if (tx != null) {
                tx.rollback();
            //e.printStackTrace();
        }
        }
        finally
        {
            session.close();
            return p;
        }
  }
    public static void main(String[] args) {
        
    }
}
