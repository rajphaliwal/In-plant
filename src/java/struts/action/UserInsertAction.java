/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package struts.action;

import hibernate.helper.Users_handler;
import permission.PermissionHandler;

/**
 *
 * @author Raj-HP
 */
public class UserInsertAction {
    private String SUsername;
     private String Id;
     private String SPassword;
     private String BRemoveTrip;
     private String BViewTrip;
     private String BNodeView;
     private String BAddTrip;
     private String BViewException;
     private String BEndException;
     private String BViewHistory;
     private String BSetupNewPlant;
     private String BPlantModify;
     private String BAddUser;
     private String BModifyUser;
     private String BChangeCurrentPlant;
     private String BAddVehicle;
     private String BModifyVehicle;
     private String BModifyDriver;
     private String BAddDriver;
     private String BViewDo;
     private String BLoggedIn;
     private String BAddTransporter;
     private String BAddCard;
     private String BAddPath;
     private String BAddEpos;
     private String BAddProcess;
     private String BModifyCard;
     private String BModifyPath;
     private String BModifyEpos;
     private String BModifyProcess;
     private String BAddLink;
     private String BModifyLink;
     private String BModifyTransporter;

     private permission.PermissionHandler p;
     
     
     public String execute() throws Exception
     {
         p = new permission.PermissionHandler();
         p.setBAddDriver ( Integer.parseInt(BAddDriver) == 1);
         p.setBAddTrip(Integer.parseInt(BAddTrip)== 1);
         p.setBAddUser(Integer.parseInt(BAddUser)== 1);
         p.setBAddVehicle(Integer.parseInt(BAddVehicle) == 1);
         p.setBChangeCurrentPlant(Integer.parseInt(BChangeCurrentPlant) == 1);
         p.setBEndException(Integer.parseInt(BEndException) == 1);
         p.setBLoggedIn(Integer.parseInt(BLoggedIn) == 1);
         p.setBModifyDriver(Integer.parseInt(BModifyDriver) == 1);
         p.setBModifyUser(Integer.parseInt(BModifyUser) == 1);
         p.setBModifyVehicle(Integer.parseInt(BModifyVehicle) == 1);
         p.setBNodeView(Integer.parseInt(BNodeView) == 1);
         p.setBPlantModify(Integer.parseInt(BPlantModify) == 1);
         p.setBRemoveTrip(Integer.parseInt(BRemoveTrip) == 1);
         p.setBSetupNewPlant(Integer.parseInt(BSetupNewPlant) == 1);
         p.setBViewDo(Integer.parseInt(BViewDo) == 1);
         p.setBViewException(Integer.parseInt(BViewException) == 1);
         p.setBViewHistory(Integer.parseInt(BViewHistory) == 1);
         p.setBViewTrip(Integer.parseInt(BViewTrip) == 1);
         p.setBAddCard(Integer.parseInt(BAddCard) == 1);
         p.setBAddEpos(Integer.parseInt(BAddEpos) == 1);
         p.setBAddPath(Integer.parseInt(BAddPath) == 1);
         p.setBAddProcess(Integer.parseInt(BAddProcess) == 1);
         p.setBAddTransporter(Integer.parseInt(BAddTransporter) == 1);
         p.setBAddLink(Integer.parseInt(BAddLink) == 1);
         p.setBModifyCard(Integer.parseInt(BModifyCard) == 1);
         p.setBModifyEpos(Integer.parseInt(BModifyEpos) == 1);
         p.setBModifyLink(Integer.parseInt(BModifyLink) == 1);
         p.setBModifyPath(Integer.parseInt(BModifyPath) == 1);
         p.setBModifyProcess(Integer.parseInt(BModifyProcess) == 1);
         p.setBModifyTransporter(Integer.parseInt(BModifyTransporter) == 1);
         
         Users_handler u = new Users_handler();
         String result =u.insert_into_table(SUsername, Integer.parseInt(Id), SPassword, security.MD5.crypt(SPassword), p);
         return result;
     }

    public String getBModifyCard() {
        return BModifyCard;
    }

    public void setBModifyCard(String BModifyCard) {
        this.BModifyCard = BModifyCard;
    }

    public String getBModifyPath() {
        return BModifyPath;
    }

    public void setBModifyPath(String BModifyPath) {
        this.BModifyPath = BModifyPath;
    }

    public String getBModifyEpos() {
        return BModifyEpos;
    }

    public void setBModifyEpos(String BModifyEpos) {
        this.BModifyEpos = BModifyEpos;
    }

    public String getBModifyProcess() {
        return BModifyProcess;
    }

    public void setBModifyProcess(String BModifyProcess) {
        this.BModifyProcess = BModifyProcess;
    }

    public String getBAddLink() {
        return BAddLink;
    }

    public void setBAddLink(String BAddLink) {
        this.BAddLink = BAddLink;
    }

    public String getBModifyLink() {
        return BModifyLink;
    }

    public void setBModifyLink(String BModifyLink) {
        this.BModifyLink = BModifyLink;
    }

    public String getBModifyTransporter() {
        return BModifyTransporter;
    }

    public void setBModifyTransporter(String BModifyTransporter) {
        this.BModifyTransporter = BModifyTransporter;
    }

    public String getBAddTransporter() {
        return BAddTransporter;
    }

    public void setBAddTransporter(String BAddTransporter) {
        this.BAddTransporter = BAddTransporter;
    }

    public String getBAddCard() {
        return BAddCard;
    }

    public void setBAddCard(String BAddCard) {
        this.BAddCard = BAddCard;
    }

    public String getBAddPath() {
        return BAddPath;
    }

    public void setBAddPath(String BAddPath) {
        this.BAddPath = BAddPath;
    }

    public String getBAddEpos() {
        return BAddEpos;
    }

    public void setBAddEpos(String BAddEpos) {
        this.BAddEpos = BAddEpos;
    }

    public String getBAddProcess() {
        return BAddProcess;
    }

    public void setBAddProcess(String BAddProcess) {
        this.BAddProcess = BAddProcess;
    }
     
     
    public String getSUsername() {
        return SUsername;
    }

    public void setSUsername(String SUsername) {
        this.SUsername = SUsername;
    }

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public String getSPassword() {
        return SPassword;
    }

    public void setSPassword(String SPassword) {
        this.SPassword = SPassword;
    }

    public String getBRemoveTrip() {
        return BRemoveTrip;
    }

    public void setBRemoveTrip(String BRemoveTrip) {
        this.BRemoveTrip = BRemoveTrip;
    }

    public String getBViewTrip() {
        return BViewTrip;
    }

    public void setBViewTrip(String BViewTrip) {
        this.BViewTrip = BViewTrip;
    }

    public String getBNodeView() {
        return BNodeView;
    }

    public void setBNodeView(String BNodeView) {
        this.BNodeView = BNodeView;
    }

    public String getBAddTrip() {
        return BAddTrip;
    }

    public void setBAddTrip(String BAddTrip) {
        this.BAddTrip = BAddTrip;
    }

    public String getBViewException() {
        return BViewException;
    }

    public void setBViewException(String BViewException) {
        this.BViewException = BViewException;
    }

    public String getBEndException() {
        return BEndException;
    }

    public void setBEndException(String BEndException) {
        this.BEndException = BEndException;
    }

    public String getBViewHistory() {
        return BViewHistory;
    }

    public void setBViewHistory(String BViewHistory) {
        this.BViewHistory = BViewHistory;
    }

    public String getBSetupNewPlant() {
        return BSetupNewPlant;
    }

    public void setBSetupNewPlant(String BSetupNewPlant) {
        this.BSetupNewPlant = BSetupNewPlant;
    }

    public String getBPlantModify() {
        return BPlantModify;
    }

    public void setBPlantModify(String BPlantModify) {
        this.BPlantModify = BPlantModify;
    }

    public String getBAddUser() {
        return BAddUser;
    }

    public void setBAddUser(String BAddUser) {
        this.BAddUser = BAddUser;
    }

    public String getBModifyUser() {
        return BModifyUser;
    }

    public void setBModifyUser(String BModifyUser) {
        this.BModifyUser = BModifyUser;
    }

    public String getBChangeCurrentPlant() {
        return BChangeCurrentPlant;
    }

    public void setBChangeCurrentPlant(String BChangeCurrentPlant) {
        this.BChangeCurrentPlant = BChangeCurrentPlant;
    }

    public String getBAddVehicle() {
        return BAddVehicle;
    }

    public void setBAddVehicle(String BAddVehicle) {
        this.BAddVehicle = BAddVehicle;
    }

    public String getBModifyVehicle() {
        return BModifyVehicle;
    }

    public void setBModifyVehicle(String BModifyVehicle) {
        this.BModifyVehicle = BModifyVehicle;
    }

    public String getBModifyDriver() {
        return BModifyDriver;
    }

    public void setBModifyDriver(String BModifyDriver) {
        this.BModifyDriver = BModifyDriver;
    }

    public String getBAddDriver() {
        return BAddDriver;
    }

    public void setBAddDriver(String BAddDriver) {
        this.BAddDriver = BAddDriver;
    }

    public String getBViewDo() {
        return BViewDo;
    }

    public void setBViewDo(String BViewDo) {
        this.BViewDo = BViewDo;
    }

    public String getBLoggedIn() {
        return BLoggedIn;
    }

    public void setBLoggedIn(String BLoggedIn) {
        this.BLoggedIn = BLoggedIn;
    }

    public PermissionHandler getP() {
        return p;
    }

    public void setP(PermissionHandler p) {
        this.p = p;
    }

    
     
     
     
}
