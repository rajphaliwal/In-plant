/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package struts.action;

import hibernate.helper.Users_handler;
import org.hibernate.Session;

/**
 *
 * @author Ankit
 */
public class ChangePasswordAction {
    private String old;
    private String newpass;
    private String renewpass;
    private String plantid;
    private String username;
    //static hibernate.pojo.TblUsers user;
    
    public ChangePasswordAction() {
    }

    public String getOld() {
        return old;
    }

    public void setOld(String old) {
        this.old = old;
    }

    public String getNewpass() {
        return newpass;
    }

    public void setNewpass(String newpass) {
        this.newpass = newpass;
    }

    public String getRenewpass() {
        return renewpass;
    }

    public void setRenewpass(String renewpass) {
        this.renewpass = renewpass;
    }

    public String getPlantid() {
        return plantid;
    }

    public void setPlantid(String plantid) {
        this.plantid = plantid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public String execute() throws Exception
    {
        Users_handler u = new Users_handler();
        hibernate.pojo.TblUsers user;
        
        Session s=hibernate.helper.NewHibernateUtil.getSessionFactory().openSession();
        user=(hibernate.pojo.TblUsers)s.get(hibernate.pojo.TblUsers.class, username);

        if(security.MD5.crypt(old).equals(user.getSPasswordMd5()))
        {
            if(newpass.equals(renewpass))
            {
                u.update_in_table(username, Integer.parseInt(plantid), newpass, security.MD5.crypt(newpass));
                return "success";
            }
            else
                return "failure";
        }
        else
            return "failure";
    }
    public static void main(String[] args) throws Exception {
        ChangePasswordAction c = new ChangePasswordAction();
        c.setOld("ankit");
        c.setNewpass("a");
        c.setRenewpass("a");
        c.setUsername("Ankit");
        c.setPlantid("23");
        String res = c.execute();
        System.out.println(res);
    }
}
