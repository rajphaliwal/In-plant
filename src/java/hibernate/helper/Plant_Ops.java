/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate.helper;

import hibernate.pojo.TblPlant;
import java.math.BigDecimal;
import java.math.BigInteger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

/**
 Handles operations of plant objects;
  public void insert_into_Plant(int ,String ,String )  --inserts data into tbl_plant
  public void insert_into_Plant_test()                 --inserts random/test data in tbl_plant
  public void delete_from_Plant(int)                    --deletes data from tbl_plant
  public void delete_from_Plant_test()                  --deletes test data from tbl_plant
 */


public class Plant_Ops 
{
    private Session session;
    public Plant_Ops()
    {
    }
   
    
  public void insert_into_Plant_test()
    {  
        insert_into_Plant(20,"ani","aniruddha" ); }
  
    /**
     *
     * @param id
     * @param name
     * @param owner
     */
    public void insert_into_Plant(int id,String name,String owner)
    {  
        session=hibernate.folder.HibernateUtil.getSessionFactory().openSession();
    
        org.hibernate.Transaction tx = null;
        try
        {
           // org.hibernate.Transaction tx=session.beginTransaction();
            tx=session.beginTransaction();
            hibernate.pojo.TblPlant plant= new hibernate.pojo.TblPlant();  //(new BigDecimal(3), "babu", "kochu");
           //plant.setIPlantId(new BigDecimal(id));
            plant.setTPlantName(name);
            plant.setTPlantOwner(owner);
            
            session.save(plant);
            tx.commit();
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
        }
    }
     
     public void delete_from_Plant_test()
     {
            delete_from_Plant(10);
     }
    
   
    public void delete_from_Plant(int id)
    {  
        session=hibernate.folder.HibernateUtil.getSessionFactory().openSession();
    
        org.hibernate.Transaction tx = null;
        try
        {
           // org.hibernate.Transaction tx=session.beginTransaction();
            tx=session.beginTransaction();
            TblPlant plant= new TblPlant();  //(new BigDecimal(3), "babu", "kochu");
           plant.setIPlantId(new BigDecimal(id));
            //plant.setTPlantName("ja khusi");
            //plant.setTPlantOwner("ami");          
            session.delete(plant);
            tx.commit();
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
        }
    }
    public void update_in_Plant_test()
    {
        update_in_Plant(5,null,"btr");
    }
   
    public void update_in_Plant(int id,String name,String owner)
    {  
        session=hibernate.folder.HibernateUtil.getSessionFactory().openSession();
    
        org.hibernate.Transaction tx = null;
        try
        {
           // org.hibernate.Transaction tx=session.beginTransaction();
            tx=session.beginTransaction();
            TblPlant plant= new TblPlant();  //(new BigDecimal(3), "babu", "kochu");
           plant.setIPlantId(new BigDecimal(id));
          
           if(name==null)   name=plant.getTPlantName();
          
           if(owner==null)   owner=plant.getTPlantOwner();    
           //plant.setTPlantName(name);
          
           plant.setTPlantName(name);  
           plant.setTPlantOwner(owner);
                   
            session.saveOrUpdate(plant);
            tx.commit();
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
        }
    }
}
