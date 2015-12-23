/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package struts.action;

import hibernate.helper.Path_handler;
import java.util.ArrayList;

/**
 *
 * @author Raj-HP
 */
public class PathInsertAction {

    private String TName;
    private String addepos;
    private String Id;

    public String execute() throws Exception {
        Path_handler p = new Path_handler();
        //System.out.println(Id + TName + addepos);
        String result = p.insert_into_table(Integer.parseInt(Id), TName, addepos);
        return result;
    }

    public String getTName() {
        return TName;
    }

    public void setTName(String TName) {
        this.TName = TName;
    }

    public String getAddepos() {
        return addepos;
    }

    public void setAddepos(String addepos) {
        this.addepos = addepos;
    }

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public static void main(String[] args) throws Exception {

        PathInsertAction p = new PathInsertAction();
        p.setAddepos("300,301,");
        p.setId("23");
        p.setTName("A");
        String str = p.execute();
        System.err.println(str);
    }
}
