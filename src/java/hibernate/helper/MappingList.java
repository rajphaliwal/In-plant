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
public class MappingList {
    Session session = null;

    public MappingList() {
    }
    
    private List<hibernate.pojo.TblMapping> mappingList = null;
    
    public List<hibernate.pojo.TblMapping> getMappingList(String Id){
        this.session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        try 
        {
            /*Query q = session.createQuery ("FROM hibernate.pojo.TblCard where i_plant_id=" + Id +
                                        "and c_card_id not in" + 
                                        "(FROM hibernate.pojo.TblMapping where i_plant_id=" + Id + "and b_is_active='true')");*/
            Query q = session.createQuery ("FROM hibernate.pojo.TblMapping where i_plant_id=" + Id + "and b_is_active='true'" );
            mappingList = (List<hibernate.pojo.TblMapping>) q.list();
            
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        finally
        {
            this.session.close();
        }
       return mappingList;
    }
}
