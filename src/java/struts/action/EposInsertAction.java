/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package struts.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import hibernate.pojo.TblPlant;
import hibernate.helper.Epos_handler;
import hibernate.helper.InsertPlant;
import hibernate.pojo.TblEpos;
import java.math.BigDecimal;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Raj-HP
 */

public class EposInsertAction {
     private String IMachineId;
     private String ITerminalId;
     private String IGateNo;
     private String TGatewayName;
     private String TLocation;
     private String ITimeInBetween;
     private String IPlantId;
     private String Bothway;
     private String ITypeId;
     
    public String execute() throws Exception{
        InsertPlant i=new InsertPlant();
        Epos_handler e = new Epos_handler();
        String result;
        boolean b;
        b = Integer.parseInt(Bothway) == 1 ;
        if(b)
        {
            result=e.insert_into_table(Integer.parseInt(IMachineId),
                Integer.parseInt(IPlantId),Integer.parseInt(ITypeId),
                Integer.parseInt(ITerminalId),TGatewayName,Integer.parseInt(IGateNo),
                TLocation,true,Integer.parseInt(ITimeInBetween));
            int macid=Integer.parseInt(IMachineId);
            macid*=(-1);
            String name=TGatewayName + " Exit";
            result=e.insert_into_table(macid,
                Integer.parseInt(IPlantId),Integer.parseInt(ITypeId),
                Integer.parseInt(ITerminalId),name,Integer.parseInt(IGateNo),
                TLocation,true,Integer.parseInt(ITimeInBetween));
        } 
        else
        {
            result=e.insert_into_table(Integer.parseInt(IMachineId),
                Integer.parseInt(IPlantId),Integer.parseInt(ITypeId),
                Integer.parseInt(ITerminalId),TGatewayName,Integer.parseInt(IGateNo),
                TLocation,false,0);
        }
        if(result.equals("Success"))
        {
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpServletResponse response = ServletActionContext.getResponse();
            
            request.setAttribute("status", result);
    
            RequestDispatcher rd = request.getRequestDispatcher("/jsp/AddEpos.jsp");
            rd.forward(request, response);
        }
        return result;
    }

    public String getITypeId() {
        return ITypeId;
    }

    public void setITypeId(String ITypeId) {
        this.ITypeId = ITypeId;
    }

    public String getBothway() {
        return Bothway;
    }

    public void setBothway(String Bothway) {
        this.Bothway = Bothway;
    }

    
    public String getIPlantId() {
        return IPlantId;
    }

    public void setIPlantId(String IPlantId) {
        this.IPlantId = IPlantId;
    }
    
    
    public String getIMachineId() {
        return IMachineId;
    }

    public void setIMachineId(String IMachineId) {
        this.IMachineId = IMachineId;
    }

    public String getITerminalId() {
        return ITerminalId;
    }

    public void setITerminalId(String ITerminalId) {
        this.ITerminalId = ITerminalId;
    }

    public String getIGateNo() {
        return IGateNo;
    }

    public void setIGateNo(String IGateNo) {
        this.IGateNo = IGateNo;
    }

    public String getTGatewayName() {
        return TGatewayName;
    }

    public void setTGatewayName(String TGatewayName) {
        this.TGatewayName = TGatewayName;
    }

    public String getTLocation() {
        return TLocation;
    }

    public void setTLocation(String TLocation) {
        this.TLocation = TLocation;
    }

    public String getITimeInBetween() {
        return ITimeInBetween;
    }

    public void setITimeInBetween(String ITimeInBetween) {
        this.ITimeInBetween = ITimeInBetween;
    }

 
}
