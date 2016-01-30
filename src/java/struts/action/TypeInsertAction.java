/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package struts.action;

import hibernate.helper.Type_handler;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Raj-HP
 */
public class TypeInsertAction {
    private String Id;
    private String typename;
    
    public String execute() throws Exception
    {
        Type_handler t = new Type_handler();
        String result = t.insert_into_table(Integer.parseInt(Id),typename);
        if(result.equals("Success"))
        {
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpServletResponse response = ServletActionContext.getResponse();
            
            request.setAttribute("status", result);
    
            RequestDispatcher rd = request.getRequestDispatcher("/jsp/ViewType.jsp");
            rd.forward(request, response);
        }
        return result;
    }

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }
    
}
