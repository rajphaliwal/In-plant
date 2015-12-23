
package hibernate.helper;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Raj-HP
 */
public class CardList {
    Session session = null;

    public CardList() {
    }
    
    private List<hibernate.pojo.TblCard> cardList = null;
    
    public List<hibernate.pojo.TblCard> getCardList(String Id){
        this.session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        try 
        {
            /*Query q = session.createQuery ("FROM hibernate.pojo.TblCard where i_plant_id=" + Id +
                                        "and c_card_id not in" + 
                                        "(FROM hibernate.pojo.TblMapping where i_plant_id=" + Id + "and b_is_active='true')");*/
            Query q = session.createQuery ("FROM hibernate.pojo.TblCard where i_plant_id=" + Id);
            cardList = (List<hibernate.pojo.TblCard>) q.list();
            
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        finally
        {
            this.session.close();
        }
       return cardList;
    }
    public static void main(String args[])
    {
        
    }
}
