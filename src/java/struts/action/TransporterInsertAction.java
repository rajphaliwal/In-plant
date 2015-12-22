/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package struts.action;

import hibernate.helper.InsertPlant;
import hibernate.helper.Transporter_handler;
import hibernate.helper.Users_handler;
import hibernate.pojo.TblPlant;
import hibernate.pojo.TblTransporter;
import java.lang.*;
import permission.PermissionHandler;

/**
 *
 * @author Ankit
 */
public class TransporterInsertAction {
    private String TTransporterName;
    private String TTransporterMobileNo;
    private String TTransporterAddr;
    private String TTransporterCity;
    private String TTransporterState;
    private String ITransporterPin;
    private String TTransporterEmailId;
    private String Id;
    private String SUsername;
    private String SPassword;

    public TransporterInsertAction() {
    }
    public String execute() throws Exception{
        /*int num;
        num = Integer.parseInt(Id);
        
        InsertPlant i = new InsertPlant();
        TblPlant plant = i.get_tuple(num);*/
        System.out.println(Id + "   " + TTransporterName);
        Transporter_handler t = new Transporter_handler();
        String result1 = t.insert_into_table(Integer.parseInt(Id), TTransporterName, TTransporterMobileNo, TTransporterAddr, TTransporterCity, TTransporterState, ITransporterPin, TTransporterEmailId);
        
        Users_handler u = new Users_handler();
        String result2=u.insert_into_table(SUsername, Integer.parseInt(Id), SPassword, security.MD5.crypt(SPassword),
                                            new PermissionHandler("transporter"));
        
        return result1;
    }
    public static void main(String[] args) throws Exception
    {
        TransporterInsertAction t= new TransporterInsertAction();
        t.TTransporterName = "hulalah";
        t.TTransporterAddr = "Kolkata";
        t.TTransporterCity = "Kolkata";
        t.TTransporterEmailId = "hulalah@gmail.com";
        t.TTransporterMobileNo = "8989898989";
        t.TTransporterState = "WB";
        t.Id = "23";
        t.SUsername = "hulalah";
        t.SPassword = "hulalah";
        t.execute();
    }
    public String getSUsername() {
        return SUsername;
    }

    public void setSUsername(String SUsername) {
        this.SUsername = SUsername;
    }

    public String getSPassword() {
        return SPassword;
    }

    public void setSPassword(String SPassword) {
        this.SPassword = SPassword;
    }
    
    
    public String getTTransporterName() {
        return TTransporterName;
    }

    public void setTTransporterName(String TTransporterName) {
        this.TTransporterName = TTransporterName;
    }

    public String getTTransporterMobileNo() {
        return TTransporterMobileNo;
    }

    public void setTTransporterMobileNo(String TTransporterMobileNo) {
        this.TTransporterMobileNo = TTransporterMobileNo;
    }

    public String getTTransporterAddr() {
        return TTransporterAddr;
    }

    public void setTTransporterAddr(String TTransporterAddr) {
        this.TTransporterAddr = TTransporterAddr;
    }

    public String getTTransporterCity() {
        return TTransporterCity;
    }

    public void setTTransporterCity(String TTransporterCity) {
        this.TTransporterCity = TTransporterCity;
    }

    public String getTTransporterState() {
        return TTransporterState;
    }

    public void setTTransporterState(String TTransporterState) {
        this.TTransporterState = TTransporterState;
    }

    public String getITransporterPin() {
        return ITransporterPin;
    }

    public void setITransporterPin(String ITransporterPin) {
        this.ITransporterPin = ITransporterPin;
    }

    public String getTTransporterEmailId() {
        return TTransporterEmailId;
    }

    public void setTTransporterEmailId(String TTransporterEmailId) {
        this.TTransporterEmailId = TTransporterEmailId;
    }

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }
    
    

}
