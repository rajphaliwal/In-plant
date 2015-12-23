/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package struts.action;

import hibernate.helper.Driver_handler;
import java.math.BigDecimal;
import java.util.Date;

/**
 *
 * @author Raj-HP
 */
public class DriverInsertAction {
     private String Id;
     private String TDriverName;
     private String TDriverAddr1;
     private String TDriverAddr2;
     private String TDriverCity;
     private String TStateId;
     private String IDriverPin;
     private String TCountryId;
     private String TDriverEmailId;
     private String TLicenceNo;
     private String TOwner;
     private String dtLicenseExpiryDate;
     
     public String execute() throws Exception{
        Driver_handler d=new Driver_handler();
        String result=d.insert_into_table(Integer.parseInt(TOwner), Integer.parseInt(Id),1, TDriverName, TDriverAddr1,TDriverAddr2, TDriverCity, TStateId, IDriverPin,TCountryId,TDriverEmailId,TLicenceNo);
        return result;
    }

    public String getDtLicenseExpiryDate() {
        return dtLicenseExpiryDate;
    }

    public void setDtLicenseExpiryDate(String dtLicenseExpiryDate) {
        this.dtLicenseExpiryDate = dtLicenseExpiryDate;
    }

    public String getTOwner() {
        return TOwner;
    }

    public void setTOwner(String TOwner) {
        this.TOwner = TOwner;
    }

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public String getTDriverName() {
        return TDriverName;
    }

    public void setTDriverName(String TDriverName) {
        this.TDriverName = TDriverName;
    }

    public String getTDriverAddr1() {
        return TDriverAddr1;
    }

    public void setTDriverAddr1(String TDriverAddr1) {
        this.TDriverAddr1 = TDriverAddr1;
    }

    public String getTDriverAddr2() {
        return TDriverAddr2;
    }

    public void setTDriverAddr2(String TDriverAddr2) {
        this.TDriverAddr2 = TDriverAddr2;
    }

    public String getTDriverCity() {
        return TDriverCity;
    }

    public void setTDriverCity(String TDriverCity) {
        this.TDriverCity = TDriverCity;
    }

    public String getTStateId() {
        return TStateId;
    }

    public void setTStateId(String TStateId) {
        this.TStateId = TStateId;
    }

    public String getIDriverPin() {
        return IDriverPin;
    }

    public void setIDriverPin(String IDriverPin) {
        this.IDriverPin = IDriverPin;
    }

    public String getTCountryId() {
        return TCountryId;
    }

    public void setTCountryId(String TCountryId) {
        this.TCountryId = TCountryId;
    }

    public String getTDriverEmailId() {
        return TDriverEmailId;
    }

    public void setTDriverEmailId(String TDriverEmailId) {
        this.TDriverEmailId = TDriverEmailId;
    }

    public String getTLicenceNo() {
        return TLicenceNo;
    }

    public void setTLicenceNo(String TLicenceNo) {
        this.TLicenceNo = TLicenceNo;
    }
     
     
     
}
