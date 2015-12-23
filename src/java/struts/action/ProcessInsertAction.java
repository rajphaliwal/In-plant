/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package struts.action;

import hibernate.helper.Process_handler;

/**
 *
 * @author Raj-HP
 */
public class ProcessInsertAction {
    private String Id;
    private String processname;
    
    public String execute() throws Exception
    {
        Process_handler c = new Process_handler();
        String result = c.insert_into_table(Integer.parseInt(Id),processname);
        return result;
    }

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public String getProcessname() {
        return processname;
    }

    public void setProcessname(String processname) {
        this.processname = processname;
    }
    
    
}
