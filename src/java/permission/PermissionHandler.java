/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package permission;

import hibernate.pojo.TblPlant;
import java.math.BigDecimal;

/**
 *
 * @author Ankit
 */
public class PermissionHandler {
    
     private Boolean BRemoveTrip;
     private Boolean BViewTrip;
     private Boolean BNodeView;
     private Boolean BAddTrip;
     private Boolean BViewException;
     private Boolean BEndException;
     private Boolean BViewHistory;
     private Boolean BSetupNewPlant;
     private Boolean BPlantModify;
     private Boolean BAddUser;
     private Boolean BModifyUser;
     private Boolean BChangeCurrentPlant;
     private Boolean BAddVehicle;
     private Boolean BModifyVehicle;
     private Boolean BModifyDriver;
     private Boolean BAddDriver;
     private Boolean BViewDo;
     private Boolean BLoggedIn;
     private Boolean BModifyTransporter;
     private Boolean BAddTransporter;
     private Boolean BAddCard;
     private Boolean BModifyLink;
     private Boolean BAddLink;
     private Boolean BModifyProcess;
     private Boolean BAddProcess;
     private Boolean BModifyEpos;
     private Boolean BAddEpos;
     private Boolean BModifyPath;
     private Boolean BAddPath;
     private Boolean BModifyCard;

    public PermissionHandler() {
    }

    public PermissionHandler(String s) {
        if(s.equals("admin")){
            this.BRemoveTrip = true;
            this.BViewTrip = true;
            this.BNodeView = true;
            this.BAddTrip = true;
            this.BViewException = true;
            this.BEndException = true;
            this.BViewHistory = true;
            this.BSetupNewPlant = true;
            this.BPlantModify = true;
            this.BAddUser = true;
            this.BModifyUser = true;
            this.BChangeCurrentPlant = true;
            this.BAddVehicle = true;
            this.BModifyVehicle = true;
            this.BModifyDriver = true;
            this.BAddDriver = true;
            this.BViewDo = true;
            this.BLoggedIn = true;
            this.BAddCard = true;
            this.BAddEpos = true;
            this.BAddPath = true;
            this.BAddProcess = true;
            this.BAddTransporter = true;
            this.BAddLink = true;
            this.BModifyCard = true;
            this.BModifyEpos = true;
            this.BModifyLink = true;
            this.BModifyPath = true;
            this.BModifyProcess = true;
            this.BModifyTransporter = true;
        }
        if(s.equals("transporter")){
            this.BRemoveTrip = false;
            this.BViewTrip = false;
            this.BNodeView = false;
            this.BAddTrip = false;
            this.BViewException = false;
            this.BEndException = false;
            this.BViewHistory = false;
            this.BSetupNewPlant = false;
            this.BPlantModify = false;
            this.BAddUser = false;
            this.BModifyUser = false;
            this.BChangeCurrentPlant = false;
            this.BAddVehicle = true;
            this.BModifyVehicle = true;
            this.BModifyDriver = true;
            this.BAddDriver = true;
            this.BViewDo = true;
            this.BLoggedIn = true;
            this.BAddCard = false;
            this.BAddEpos = false;
            this.BAddPath = false;
            this.BAddProcess = false;
            this.BAddTransporter = false;
            this.BAddLink = false;
            this.BModifyCard = false;
            this.BModifyEpos = false;
            this.BModifyLink = false;
            this.BModifyPath = false;
            this.BModifyProcess = false;
            this.BModifyTransporter = false;
        }
    }

    public Boolean getBModifyTransporter() {
        return BModifyTransporter;
    }

    public void setBModifyTransporter(Boolean BModifyTransporter) {
        this.BModifyTransporter = BModifyTransporter;
    }

    public Boolean getBModifyLink() {
        return BModifyLink;
    }

    public void setBModifyLink(Boolean BModifyLink) {
        this.BModifyLink = BModifyLink;
    }

    public Boolean getBAddLink() {
        return BAddLink;
    }

    public void setBAddLink(Boolean BAddLink) {
        this.BAddLink = BAddLink;
    }

    public Boolean getBModifyProcess() {
        return BModifyProcess;
    }

    public void setBModifyProcess(Boolean BModifyProcess) {
        this.BModifyProcess = BModifyProcess;
    }

    public Boolean getBModifyEpos() {
        return BModifyEpos;
    }

    public void setBModifyEpos(Boolean BModifyEpos) {
        this.BModifyEpos = BModifyEpos;
    }

    public Boolean getBModifyPath() {
        return BModifyPath;
    }

    public void setBModifyPath(Boolean BModifyPath) {
        this.BModifyPath = BModifyPath;
    }

    public Boolean getBModifyCard() {
        return BModifyCard;
    }

    public void setBModifyCard(Boolean BModifyCard) {
        this.BModifyCard = BModifyCard;
    }

    
    public Boolean getBAddTransporter() {
        return BAddTransporter;
    }

    public void setBAddTransporter(Boolean BAddTransporter) {
        this.BAddTransporter = BAddTransporter;
    }

    public Boolean getBAddCard() {
        return BAddCard;
    }

    public void setBAddCard(Boolean BAddCard) {
        this.BAddCard = BAddCard;
    }

    public Boolean getBAddPath() {
        return BAddPath;
    }

    public void setBAddPath(Boolean BAddPath) {
        this.BAddPath = BAddPath;
    }

    public Boolean getBAddEpos() {
        return BAddEpos;
    }

    public void setBAddEpos(Boolean BAddEpos) {
        this.BAddEpos = BAddEpos;
    }

    public Boolean getBAddProcess() {
        return BAddProcess;
    }

    public void setBAddProcess(Boolean BAddProcess) {
        this.BAddProcess = BAddProcess;
    }
     
    
     
    public Boolean getBRemoveTrip() {
        return BRemoveTrip;
    }

    public void setBRemoveTrip(Boolean BRemoveTrip) {
        this.BRemoveTrip = BRemoveTrip;
    }

    public Boolean getBViewTrip() {
        return BViewTrip;
    }

    public void setBViewTrip(Boolean BViewTrip) {
        this.BViewTrip = BViewTrip;
    }

    public Boolean getBNodeView() {
        return BNodeView;
    }

    public void setBNodeView(Boolean BNodeView) {
        this.BNodeView = BNodeView;
    }

    public Boolean getBAddTrip() {
        return BAddTrip;
    }

    public void setBAddTrip(Boolean BAddTrip) {
        this.BAddTrip = BAddTrip;
    }

    public Boolean getBViewException() {
        return BViewException;
    }

    public void setBViewException(Boolean BViewException) {
        this.BViewException = BViewException;
    }

    public Boolean getBEndException() {
        return BEndException;
    }

    public void setBEndException(Boolean BEndException) {
        this.BEndException = BEndException;
    }

    public Boolean getBViewHistory() {
        return BViewHistory;
    }

    public void setBViewHistory(Boolean BViewHistory) {
        this.BViewHistory = BViewHistory;
    }

    public Boolean getBSetupNewPlant() {
        return BSetupNewPlant;
    }

    public void setBSetupNewPlant(Boolean BSetupNewPlant) {
        this.BSetupNewPlant = BSetupNewPlant;
    }

    public Boolean getBPlantModify() {
        return BPlantModify;
    }

    public void setBPlantModify(Boolean BPlantModify) {
        this.BPlantModify = BPlantModify;
    }

    public Boolean getBAddUser() {
        return BAddUser;
    }

    public void setBAddUser(Boolean BAddUser) {
        this.BAddUser = BAddUser;
    }

    public Boolean getBModifyUser() {
        return BModifyUser;
    }

    public void setBModifyUser(Boolean BModifyUser) {
        this.BModifyUser = BModifyUser;
    }

    public Boolean getBChangeCurrentPlant() {
        return BChangeCurrentPlant;
    }

    public void setBChangeCurrentPlant(Boolean BChangeCurrentPlant) {
        this.BChangeCurrentPlant = BChangeCurrentPlant;
    }

    public Boolean getBAddVehicle() {
        return BAddVehicle;
    }

    public void setBAddVehicle(Boolean BAddVehicle) {
        this.BAddVehicle = BAddVehicle;
    }

    public Boolean getBModifyVehicle() {
        return BModifyVehicle;
    }

    public void setBModifyVehicle(Boolean BModifyVehicle) {
        this.BModifyVehicle = BModifyVehicle;
    }

    public Boolean getBModifyDriver() {
        return BModifyDriver;
    }

    public void setBModifyDriver(Boolean BModifyDriver) {
        this.BModifyDriver = BModifyDriver;
    }

    public Boolean getBAddDriver() {
        return BAddDriver;
    }

    public void setBAddDriver(Boolean BAddDriver) {
        this.BAddDriver = BAddDriver;
    }

    public Boolean getBViewDo() {
        return BViewDo;
    }

    public void setBViewDo(Boolean BViewDo) {
        this.BViewDo = BViewDo;
    }

    public Boolean getBLoggedIn() {
        return BLoggedIn;
    }

    public void setBLoggedIn(Boolean BLoggedIn) {
        this.BLoggedIn = BLoggedIn;
    }
    
}
