/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package struts.action;

import hibernate.helper.Link_handler;

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
