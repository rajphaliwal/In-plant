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
public class LinkList {
    Session session = null;
    private List<hibernate.pojo.TblLinks> linkList = null;
    
    public List<hibernate.pojo.TblLinks> getLinkList(String Id){
        this.session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        try 
        {
            /*Query q = session.createQuery ("FROM hibernate.pojo.TblCard where i_plant_id=" + Id +
                                        "and c_card_id not in" + 
                                        "(FROM hibernate.pojo.TblMapping where i_plant_id=" + Id + "and b_is_active='true')");*/
            Query q = session.createQuery ("FROM hibernate.pojo.TblLinks where i_plant_id=" + Id);
            linkList = (List<hibernate.pojo.TblLinks>) q.list();
            
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        finally
        {
            this.session.close();
        }
       return linkList;
    }
}
