/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package struts.action;

import hibernate.helper.Card_handler;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
/**
 *
 * @author Raj-HP
 */
public class CardInsertAction {
    private String Id;
    private String cardid;

    
    public String execute() throws Exception
    {
        Card_handler c = new Card_handler();
        String result = c.insert_into_table(Integer.parseInt(Id),cardid);
        System.out.println(result);
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();

        request.setAttribute("status", result);

        RequestDispatcher rd = request.getRequestDispatcher("/jsp/AddCard.jsp");
        rd.forward(request, response);
        return result;
    }

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public String getCardid() {
        return cardid;
    }

    public void setCardid(String cardid) {
        this.cardid = cardid;
    }
    
    
}
