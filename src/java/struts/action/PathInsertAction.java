/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package struts.action;

import hibernate.helper.Path_handler;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;

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
        System.out.println(Id + TName + addepos);
        String result = p.insert_into_table(Integer.parseInt(Id), TName, addepos);
        
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        //if(result.equals("Success"))
        //{
            request.setAttribute("status", result);
            RequestDispatcher rd = request.getRequestDispatcher("/jsp/ViewPath.jsp");
            rd.forward(request, response);
        //}
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
        p.setAddepos("151,152,");
        p.setId("157");
        p.setTName("test");
        String str = p.execute();
        System.out.println(str);
    }
}
