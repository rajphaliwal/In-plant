package hibernate.pojo;
// Generated 3 Jun, 2015 5:12:49 PM by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

/**
 * TblPlant generated by hbm2java
 */
public class TblPlant  implements java.io.Serializable {


     private BigDecimal IPlantId;
     private String TPlantName;
     private String TPlantOwner;
     private Set<TblLivePath> tblLivePaths = new HashSet<TblLivePath>(0);
     private Set<TblEpos> tblEposes = new HashSet<TblEpos>(0);
     private Set<TblPaths> tblPathses = new HashSet<TblPaths>(0);
     private Set<TblExceptions> tblExceptionses = new HashSet<TblExceptions>(0);
     private Set<TblUsers> tblUserses = new HashSet<TblUsers>(0);
     private Set<TblLinks> tblLinkses = new HashSet<TblLinks>(0);
     private Set<TblDriver> tblDrivers = new HashSet<TblDriver>(0);
     private Set<TblDo> tblDos = new HashSet<TblDo>(0);
     private Set<TblVehicle> tblVehicles = new HashSet<TblVehicle>(0);
     private Set<TblMapping> tblMappings = new HashSet<TblMapping>(0);
     private Set<TblCard> tblCards = new HashSet<TblCard>(0);
     private Set<TblTransporter> tblTransporters = new HashSet<TblTransporter>(0);
     private Set<TblProcess> tblProcesses = new HashSet<TblProcess>(0);

    public TblPlant() {
    }

	
    public TblPlant(BigDecimal IPlantId) {
        this.IPlantId = IPlantId;
    }
    public TblPlant(BigDecimal IPlantId, String TPlantName, String TPlantOwner, Set<TblLivePath> tblLivePaths, Set<TblEpos> tblEposes, Set<TblPaths> tblPathses, Set<TblExceptions> tblExceptionses, Set<TblUsers> tblUserses, Set<TblLinks> tblLinkses, Set<TblDriver> tblDrivers, Set<TblDo> tblDos, Set<TblVehicle> tblVehicles, Set<TblMapping> tblMappings, Set<TblCard> tblCards, Set<TblTransporter> tblTransporters, Set<TblProcess> tblProcesses) {
       this.IPlantId = IPlantId;
       this.TPlantName = TPlantName;
       this.TPlantOwner = TPlantOwner;
       this.tblLivePaths = tblLivePaths;
       this.tblEposes = tblEposes;
       this.tblPathses = tblPathses;
       this.tblExceptionses = tblExceptionses;
       this.tblUserses = tblUserses;
       this.tblLinkses = tblLinkses;
       this.tblDrivers = tblDrivers;
       this.tblDos = tblDos;
       this.tblVehicles = tblVehicles;
       this.tblMappings = tblMappings;
       this.tblCards = tblCards;
       this.tblTransporters = tblTransporters;
       this.tblProcesses = tblProcesses;
    }
   
    public BigDecimal getIPlantId() {
        return this.IPlantId;
    }
    
    public void setIPlantId(BigDecimal IPlantId) {
        this.IPlantId = IPlantId;
    }
    public String getTPlantName() {
        return this.TPlantName;
    }
    
    public void setTPlantName(String TPlantName) {
        this.TPlantName = TPlantName;
    }
    public String getTPlantOwner() {
        return this.TPlantOwner;
    }
    
    public void setTPlantOwner(String TPlantOwner) {
        this.TPlantOwner = TPlantOwner;
    }
    public Set<TblLivePath> getTblLivePaths() {
        return this.tblLivePaths;
    }
    
    public void setTblLivePaths(Set<TblLivePath> tblLivePaths) {
        this.tblLivePaths = tblLivePaths;
    }
    public Set<TblEpos> getTblEposes() {
        return this.tblEposes;
    }
    
    public void setTblEposes(Set<TblEpos> tblEposes) {
        this.tblEposes = tblEposes;
    }
    public Set<TblPaths> getTblPathses() {
        return this.tblPathses;
    }
    
    public void setTblPathses(Set<TblPaths> tblPathses) {
        this.tblPathses = tblPathses;
    }
    public Set<TblExceptions> getTblExceptionses() {
        return this.tblExceptionses;
    }
    
    public void setTblExceptionses(Set<TblExceptions> tblExceptionses) {
        this.tblExceptionses = tblExceptionses;
    }
    public Set<TblUsers> getTblUserses() {
        return this.tblUserses;
    }
    
    public void setTblUserses(Set<TblUsers> tblUserses) {
        this.tblUserses = tblUserses;
    }
    public Set<TblLinks> getTblLinkses() {
        return this.tblLinkses;
    }
    
    public void setTblLinkses(Set<TblLinks> tblLinkses) {
        this.tblLinkses = tblLinkses;
    }
    public Set<TblDriver> getTblDrivers() {
        return this.tblDrivers;
    }
    
    public void setTblDrivers(Set<TblDriver> tblDrivers) {
        this.tblDrivers = tblDrivers;
    }
    public Set<TblDo> getTblDos() {
        return this.tblDos;
    }
    
    public void setTblDos(Set<TblDo> tblDos) {
        this.tblDos = tblDos;
    }
    public Set<TblVehicle> getTblVehicles() {
        return this.tblVehicles;
    }
    
    public void setTblVehicles(Set<TblVehicle> tblVehicles) {
        this.tblVehicles = tblVehicles;
    }
    public Set<TblMapping> getTblMappings() {
        return this.tblMappings;
    }
    
    public void setTblMappings(Set<TblMapping> tblMappings) {
        this.tblMappings = tblMappings;
    }
    public Set<TblCard> getTblCards() {
        return this.tblCards;
    }
    
    public void setTblCards(Set<TblCard> tblCards) {
        this.tblCards = tblCards;
    }
    public Set<TblTransporter> getTblTransporters() {
        return this.tblTransporters;
    }
    
    public void setTblTransporters(Set<TblTransporter> tblTransporters) {
        this.tblTransporters = tblTransporters;
    }
    public Set<TblProcess> getTblProcesses() {
        return this.tblProcesses;
    }
    
    public void setTblProcesses(Set<TblProcess> tblProcesses) {
        this.tblProcesses = tblProcesses;
    }




}


