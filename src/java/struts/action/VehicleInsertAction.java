/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package struts.action;

import hibernate.helper.Vehicle_handler;
import hibernate.pojo.TblPlant;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Raj-HP
 */
public class VehicleInsertAction {
     private String Id;
     private String vid;
     private String TChasisNo;
     private String TVehicleType;
     private String ILoadCapacity;
     private String TOwner;
     private String TNationalPermit;
     private Date dtLicenseExpiryDate;

    public VehicleInsertAction() {
    }

    public String execute() throws Exception{
        Vehicle_handler v=new Vehicle_handler();
        String result=v.insert_into_table(vid, Integer.parseInt(Id), TChasisNo, TVehicleType, Long.parseLong(ILoadCapacity),Integer.parseInt(TOwner), TNationalPermit, dtLicenseExpiryDate);
        if(result.equals("Success"))
        {
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpServletResponse response = ServletActionContext.getResponse();
            
            request.setAttribute("status", result);
    
            RequestDispatcher rd = request.getRequestDispatcher("/jsp/ViewVehicle.jsp");
            rd.forward(request, response);
        }
        return result;
    }

    public String getVid() {
        return vid;
    }

    public void setVid(String vid) {
        this.vid = vid;
    }
    
    
    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public String getTChasisNo() {
        return TChasisNo;
    }

    public void setTChasisNo(String TChasisNo) {
        this.TChasisNo = TChasisNo;
    }

    public String getTVehicleType() {
        return TVehicleType;
    }

    public void setTVehicleType(String TVehicleType) {
        this.TVehicleType = TVehicleType;
    }

    public String getILoadCapacity() {
        return ILoadCapacity;
    }

    public void setILoadCapacity(String ILoadCapacity) {
        this.ILoadCapacity = ILoadCapacity;
    }

    public String getTOwner() {
        return TOwner;
    }

    public void setTOwner(String TOwner) {
        this.TOwner = TOwner;
    }

    public String getTNationalPermit() {
        return TNationalPermit;
    }

    public void setTNationalPermit(String TNationalPermit) {
        this.TNationalPermit = TNationalPermit;
    }

    public Date getDtLicenseExpiryDate() {
        return dtLicenseExpiryDate;
    }

    public void setDtLicenseExpiryDate(Date dtLicenseExpiryDate) {
        this.dtLicenseExpiryDate = dtLicenseExpiryDate;
    }

    
     
}
