package hibernate.pojo;
// Generated 3 Jun, 2015 5:12:49 PM by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

/**
 * TblLivePath generated by hbm2java
 */
public class TblLivePath  implements java.io.Serializable {


     private BigDecimal IPathId;
     private TblPlant tblPlant;
     private String TCurrPath;
     private String TNext;
     private Set<TblMapping> tblMappings = new HashSet<TblMapping>(0);

    public TblLivePath() {
    }

	
    public TblLivePath(BigDecimal IPathId, TblPlant tblPlant) {
        this.IPathId = IPathId;
        this.tblPlant = tblPlant;
    }
    public TblLivePath(BigDecimal IPathId, TblPlant tblPlant, String TCurrPath, String TNext, Set<TblMapping> tblMappings) {
       this.IPathId = IPathId;
       this.tblPlant = tblPlant;
       this.TCurrPath = TCurrPath;
       this.TNext = TNext;
       this.tblMappings = tblMappings;
    }
   
    public BigDecimal getIPathId() {
        return this.IPathId;
    }
    
    public void setIPathId(BigDecimal IPathId) {
        this.IPathId = IPathId;
    }
    public TblPlant getTblPlant() {
        return this.tblPlant;
    }
    
    public void setTblPlant(TblPlant tblPlant) {
        this.tblPlant = tblPlant;
    }
    public String getTCurrPath() {
        return this.TCurrPath;
    }
    
    public void setTCurrPath(String TCurrPath) {
        this.TCurrPath = TCurrPath;
    }
    public String getTNext() {
        return this.TNext;
    }
    
    public void setTNext(String TNext) {
        this.TNext = TNext;
    }
    public Set<TblMapping> getTblMappings() {
        return this.tblMappings;
    }
    
    public void setTblMappings(Set<TblMapping> tblMappings) {
        this.tblMappings = tblMappings;
    }




}


