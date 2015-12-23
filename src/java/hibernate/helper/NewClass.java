/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate.helper;

import hibernate.pojo.TblPaths;
import hibernate.pojo.TblPlant;
import org.hibernate.Session;

/**
 *
 * @author Raj-HP
 */
public class NewClass extends sample_helper{
    
    public static void main(String args[])
    {
    Session session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();
    
    org.hibernate.Transaction tx = null;
    tx = session.beginTransaction();
    
    TblPaths ep=new TblPaths();
    
    ep.setTName("A");
    
    Plant_handler ph=new Plant_handler();
    TblPlant plant= ph.get_tuple(17);
    
    ep.setTblPlant(plant);
    
    session.save(ep);
    tx.commit();
    session.close();
    }
    
}
