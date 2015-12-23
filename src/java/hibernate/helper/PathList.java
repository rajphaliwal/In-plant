/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate.helper;

import hibernate.pojo.TblEpos;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Raj-HP
 */
public class PathList {
    Session session = null;
    private List<hibernate.pojo.TblPaths> pathList = null;
    
    public PathList() {
    }
        
    public List<hibernate.pojo.TblPaths> getPathList(String Id){
        
        this.session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        try 
        {
            /*Query q = session.createQuery ("FROM hibernate.pojo.TblCard where i_plant_id=" + Id +
                                        "and c_card_id not in" + 
                                        "(FROM hibernate.pojo.TblMapping where i_plant_id=" + Id + "and b_is_active='true')");*/
            Query q = session.createQuery ("FROM hibernate.pojo.TblPaths where i_plant_id=" + Id);
            pathList = (List<hibernate.pojo.TblPaths>) q.list();
            
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        finally
        {
            this.session.close();
        }
       return pathList;
    }
    public static void main(String[] args) {
        PathList p =new PathList();
        List<hibernate.pojo.TblPaths> pl = p.getPathList("23");
        Epos_handler e = new Epos_handler();
        for(int i=0;i<pl.size();i++)
        {
            System.out.println(pl.get(i).getTName() + " " + pl.get(i).getTArrPath());
            String[] s = pl.get(i).getTArrPath().split(",");
            for(int j=0 ; j<s.length ; j++)
            {
                TblEpos epos = e.get_tuple(Integer.parseInt(s[j]));
                System.out.println(epos.getIGateNo());
            }
        }
    }
}
