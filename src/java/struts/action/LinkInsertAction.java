/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package struts.action;

import hibernate.helper.Link_handler;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Raj-HP
 */
public class LinkInsertAction {
    private String Id;
    private String from;
    private String to;
    private String timeinbetween;
    
    public String execute()throws Exception{
        Link_handler l = new Link_handler();
        String result=l.insert_into_table(Integer.parseInt(Id),Integer.parseInt(from),Integer.parseInt(to),Integer.parseInt(timeinbetween));
        if(result.equals("Success"))
        {
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpServletResponse response = ServletActionContext.getResponse();
            
            request.setAttribute("status", result);
    
            RequestDispatcher rd = request.getRequestDispatcher("/jsp/AddLink.jsp");
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

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getTimeinbetween() {
        return timeinbetween;
    }

    public void setTimeinbetween(String timeinbetween) {
        this.timeinbetween = timeinbetween;
    }
    
    
}
