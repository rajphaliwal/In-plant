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
public class TypeList {
    Session session = null;

    public TypeList() {
    }
    
    private List<hibernate.pojo.TblType> typeList = null;
    
    public List<hibernate.pojo.TblType> getTypeList(String Id){
        this.session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        try 
        {
            Query q = session.createQuery ("FROM hibernate.pojo.TblType where i_plant_id=" + Id);
            typeList = (List<hibernate.pojo.TblType>) q.list();
            
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        finally
        {
            this.session.close();
        }
       return typeList;
    }
    public static void main(String[] args) {
        TypeList t = new TypeList();
        List<hibernate.pojo.TblType> list = t.getTypeList("157");
        for(hibernate.pojo.TblType i : list)
            System.out.println(i.getTName());
    }
}
