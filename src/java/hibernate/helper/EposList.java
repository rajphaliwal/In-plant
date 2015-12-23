/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate.helper;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Raj-HP
 */
public class EposList {
    Session session = null;

    public EposList() {
    }
    
    private List<hibernate.pojo.TblEpos> eposList = null;
    
    public List<hibernate.pojo.TblEpos> getEposList(String Id){
        this.session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        try 
        {
            Query q = session.createQuery ("FROM hibernate.pojo.TblEpos where i_plant_id=" + Id);
            eposList = (List<hibernate.pojo.TblEpos>) q.list();
            
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        finally
        {
            this.session.close();
        }
       return eposList;
    }
    public static void main(String args[])
    {
        EposList t = new EposList();
        
    }
}
