/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package struts.action;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Raj-HP
 */
public class MappingInsertAction {
    public String Id;
    public String cardid;
    public String pathid;
    public String transporterid;
    public String vehicleid;
    public String driverid;
    public String processid;
    public String tdate;
    public String drivername;
    public String bname;
    
    public String execute() throws Exception
    {
        hibernate.helper.Mapping_handler m = new hibernate.helper.Mapping_handler();
        String result;
        boolean b;
        b = Integer.parseInt(bname) == 1;
        if(b)
        {
            result = m.insert_into_handler(Integer.parseInt(Id) ,cardid,Integer.parseInt(transporterid)
                ,vehicleid,drivername,Integer.parseInt(processid),tdate,Integer.parseInt(pathid));
        }
        else
        {
            result = m.insert_into_table(Integer.parseInt(Id) ,cardid,Integer.parseInt(transporterid)
                ,vehicleid,Integer.parseInt(driverid),Integer.parseInt(processid),tdate,Integer.parseInt(pathid));
        }
        if(result.equals("Success"))
        {
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpServletResponse response = ServletActionContext.getResponse();
            
            request.setAttribute("status", result);
    
            RequestDispatcher rd = request.getRequestDispatcher("/jsp/AddTrip.jsp");
            rd.forward(request, response);
        }
        return result;
    }

    public String getPathid() {
        return pathid;
    }

    public void setPathid(String pathid) {
        this.pathid = pathid;
    }

    public String getDrivername() {
        return drivername;
    }

    public void setDrivername(String drivername) {
        this.drivername = drivername;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
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

    public String getTransporterid() {
        return transporterid;
    }

    public void setTransporterid(String transporterid) {
        this.transporterid = transporterid;
    }

    public String getVehicleid() {
        return vehicleid;
    }

    public void setVehicleid(String vehicleid) {
        this.vehicleid = vehicleid;
    }

    public String getDriverid() {
        return driverid;
    }

    public void setDriverid(String driverid) {
        this.driverid = driverid;
    }

    public String getProcessid() {
        return processid;
    }

    public void setProcessid(String processid) {
        this.processid = processid;
    }

    public String getTdate() {
        return tdate;
    }

    public void setTdate(String tdate) {
        this.tdate = tdate;
    }
    
}
