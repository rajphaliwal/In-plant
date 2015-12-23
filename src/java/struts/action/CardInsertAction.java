/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package struts.action;

import hibernate.helper.Card_handler;
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
