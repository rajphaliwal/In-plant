package hibernate.pojo;
// Generated 3 Jun, 2015 5:12:49 PM by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.Date;

/**
 * TblVehicleFlight generated by hbm2java
 */
public class TblVehicleFlight  implements java.io.Serializable, Comparable<TblVehicleFlight> {


     private BigDecimal IVfid;
     private TblCard tblCard;
     private TblEpos tblEpos;
     private TblMapping tblMapping;
     private Date dtTime;
     private String TModelNo;
     private String TDataStatus;
     private String TEvent;
     private BigDecimal IPlantId;
     private BigDecimal ICardId;

    public TblVehicleFlight() {
    }

	
    public TblVehicleFlight(BigDecimal IVfid, TblCard tblCard, TblEpos tblEpos, TblMapping tblMapping, BigDecimal IPlantId, BigDecimal ICardId) {
        this.IVfid = IVfid;
        this.tblCard = tblCard;
        this.tblEpos = tblEpos;
        this.tblMapping = tblMapping;
        this.IPlantId = IPlantId;
        this.ICardId = ICardId;
    }
    public TblVehicleFlight(BigDecimal IVfid, TblCard tblCard, TblEpos tblEpos, TblMapping tblMapping, Date dtTime, String TModelNo, String TDataStatus, String TEvent, BigDecimal IPlantId, BigDecimal ICardId) {
       this.IVfid = IVfid;
       this.tblCard = tblCard;
       this.tblEpos = tblEpos;
       this.tblMapping = tblMapping;
       this.dtTime = dtTime;
       this.TModelNo = TModelNo;
       this.TDataStatus = TDataStatus;
       this.TEvent = TEvent;
       this.IPlantId = IPlantId;
       this.ICardId = ICardId;
    }
   
    public BigDecimal getIVfid() {
        return this.IVfid;
    }
    
    public void setIVfid(BigDecimal IVfid) {
        this.IVfid = IVfid;
    }
    public TblCard getTblCard() {
        return this.tblCard;
    }
    
    public void setTblCard(TblCard tblCard) {
        this.tblCard = tblCard;
    }
    public TblEpos getTblEpos() {
        return this.tblEpos;
    }
    
    public void setTblEpos(TblEpos tblEpos) {
        this.tblEpos = tblEpos;
    }
    public TblMapping getTblMapping() {
        return this.tblMapping;
    }
    
    public void setTblMapping(TblMapping tblMapping) {
        this.tblMapping = tblMapping;
    }
    public Date getDtTime() {
        return this.dtTime;
    }
    
    public void setDtTime(Date dtTime) {
        this.dtTime = dtTime;
    }
    public String getTModelNo() {
        return this.TModelNo;
    }
    
    public void setTModelNo(String TModelNo) {
        this.TModelNo = TModelNo;
    }
    public String getTDataStatus() {
        return this.TDataStatus;
    }
    
    public void setTDataStatus(String TDataStatus) {
        this.TDataStatus = TDataStatus;
    }
    public String getTEvent() {
        return this.TEvent;
    }
    
    public void setTEvent(String TEvent) {
        this.TEvent = TEvent;
    }
    public BigDecimal getIPlantId() {
        return this.IPlantId;
    }
    
    public void setIPlantId(BigDecimal IPlantId) {
        this.IPlantId = IPlantId;
    }
    public BigDecimal getICardId() {
        return this.ICardId;
    }
    
    public void setICardId(BigDecimal ICardId) {
        this.ICardId = ICardId;
    }
    
    public int compareTo(TblVehicleFlight e)
    {
        return this.IVfid.compareTo(e.IVfid);
    }



}


