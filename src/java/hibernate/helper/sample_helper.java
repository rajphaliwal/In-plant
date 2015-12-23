/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate.helper;

import java.math.BigDecimal;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;



/*

public List run_query(String HQl_Query);                     --runs hql query and returns the list pointing to database objects
    
*/

// N represents number of objects to return;

public class sample_helper {
     private Session session;

    /**
     *
     * @param HQL_Query
     * @param n
     * @return
     */
    public List run_query(String HQL_Query, int n)  {
          
 
   boolean error_flag=false;
       Session  session=hibernate.folder.HibernateUtil.getSessionFactory().openSession();
    
        org.hibernate.Transaction tx = null;
        List emp=null;
        //Iterator it=null;
        try
        {
    if(n<0)   throw new Exception("Insert positive number");     
    // org.hibernate.Transaction tx=session.beginTransaction();
            tx=session.beginTransaction();
            /*
            String HQL_query="from TblPlant where T_Plant_Name= :TPlantName";
             String HQL_query="from TblPlant where T_Plant_Name= :TPlantName or t_plant_owner= :t_plant_owner";
            org.hibernate.Query query = session.createQuery(HQL_query);
            
            query.setParameter("TPlantName",plant_name);
            query.setParameter("t_plant_owner", plant_owner);
            */           
          
        Query query=session.createQuery(HQL_Query);
       emp= query.setMaxResults(n).list();
        
        //emp = session.createQuery(HQL_Query).list();                      
            
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
            return emp;
          //return (it);
        }
  }    

}