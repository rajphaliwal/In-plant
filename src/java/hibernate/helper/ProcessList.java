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
public class ProcessList {
    Session session = null;

    public ProcessList() {
    }
    
    private List<hibernate.pojo.TblProcess> processList = null;
    
    public List<hibernate.pojo.TblProcess> getProcessList(String Id){
        this.session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        try 
        {
            Query q = session.createQuery ("FROM hibernate.pojo.TblProcess where i_plant_id=" + Id);
            processList = (List<hibernate.pojo.TblProcess>) q.list();
            
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        finally
        {
            this.session.close();
        }
       return processList;
    }
    public static void main(String args[])
    {
        
    }
}
