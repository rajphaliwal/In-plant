/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate.helper;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import hibernate.pojo.TblDriver;
import hibernate.pojo.TblPlant;
import hibernate.pojo.TblTransporter;
import hibernate.pojo.TblMapping;
import hibernate.pojo.TblCard;
import hibernate.pojo.TblPaths;
import hibernate.pojo.TblProcess;
import hibernate.pojo.TblVehicle;
import hibernate.pojo.TblLivePath;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;

/**
 *
 * @author Raj-HP
 */
public class Mapping_handler extends sample_helper
{

    
    private Session session;
    
    
    
    public String insert_into_table(int plant_id,String cardid,int tr_id,String vehicleid,int driverid,int processid,String tdate,int path_id)
    {
        boolean error_flag = false;
        session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();

        org.hibernate.Transaction tx = null;
        try
        {

            tx = session.beginTransaction();

            TblMapping drv = new TblMapping();
            drv.setITripId(new BigDecimal(1));
            drv.setICardId(new BigDecimal(Integer.parseInt(cardid)));
            drv.setBIsActive(true);

            {
                Plant_handler ph = new Plant_handler();
                TblPlant plant = ph.get_tuple(plant_id);

                Transporter_handler tr = new Transporter_handler();
                TblTransporter transporter = tr.get_tuple(tr_id);
                
                Driver_handler d = new Driver_handler();
                TblDriver driver = d.get_tuple(driverid);
                
                Vehicle_handler v = new Vehicle_handler();
                TblVehicle vehicle = v.get_tuple(vehicleid);
                
                Card_handler c = new Card_handler();
                TblCard Card = c.get_tuple(cardid);
                
                Process_handler p = new Process_handler();
                TblProcess process = p.get_tuple(processid);
                
                Path_handler pth = new Path_handler();
                TblPaths path = pth.get_tuple(path_id);
                
                Livepath_handler l =new Livepath_handler();
                TblLivePath lp = l.insert_into_table(plant_id, path.getTArrPath());

                if (plant != null)
                {
                    drv.setTblPlant(plant);
                    /*ValueStack stack = ActionContext.getContext().getValueStack();
                    Map<String, Object> context = new HashMap<String, Object>();
                    context.put("current_session", plant);
                    stack.push(context);*/
                }
                else
                {
                    throw new Exception("Foreign Key Plant_id Dependency Failed ");
                }

                if (transporter != null)
                {
                    drv.setTblTransporter(transporter);//Transp(plant);
                }
                else
                {
                    throw new Exception("Foreign Key Plant_id Dependency Failed ");
                }
                
                if (vehicle != null)
                {
                    drv.setTblVehicle(vehicle);//Transp(plant);
                }
                else
                {
                    throw new Exception("Foreign Key Plant_id Dependency Failed ");
                }
                
                if (driver != null)
                {
                    drv.setTblDriver(driver);//Transp(plant);
                }
                else
                {
                    throw new Exception("Foreign Key Plant_id Dependency Failed ");
                }
                
                if (Card != null)
                {
                    drv.setTblCard(Card);//Transp(plant);
                }
                else
                {
                    throw new Exception("Foreign Key Plant_id Dependency Failed ");
                }
                if (lp != null)
                {
                    drv.setTblLivePath(lp);//Transp(plant);
                }
                else
                {
                    throw new Exception("Foreign Key Plant_id Dependency Failed ");
                }
                
                if (process != null)
                {
                    drv.setTblProcess(process);//Transp(plant);
                }
                else
                {
                    throw new Exception("Foreign Key Plant_id Dependency Failed ");
                }
                
            }

            session.save(drv);

            tx.commit();
            //throw new Exception("Method Not Overwritten Yet");
        }
        catch (Exception e)
        {
            error_flag = true;
            if (tx != null)
            {
                tx.rollback();
                e.printStackTrace();
            }
        }
        finally
        {
            session.close();
            if (error_flag == false)
            {
                return "Success";
            }
            else
            {
                return "Failure";
            }
        }

    }

    public String insert_into_handler(int plant_id, String cardid, int tr_id, String vehicleid, String drivername, int processid, String tdate,int path_id) {
        boolean error_flag = false;
        session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();

        org.hibernate.Transaction tx = null;
        try
        {

            tx = session.beginTransaction();

            TblMapping drv = new TblMapping();
            drv.setITripId(new BigDecimal(1));
            drv.setICardId(new BigDecimal(Integer.parseInt(cardid)));
            drv.setBIsActive(true);
            drv.setTDriverName(drivername);

            {
                Plant_handler ph = new Plant_handler();
                TblPlant plant = ph.get_tuple(plant_id);

                Transporter_handler tr = new Transporter_handler();
                TblTransporter transporter = tr.get_tuple(tr_id);
                
                Vehicle_handler v = new Vehicle_handler();
                TblVehicle vehicle = v.get_tuple(vehicleid);
                
                Card_handler c = new Card_handler();
                TblCard Card = c.get_tuple(cardid);
                
                Process_handler p = new Process_handler();
                TblProcess process = p.get_tuple(processid);
                
                Path_handler pth = new Path_handler();
                TblPaths path = pth.get_tuple(path_id);
                
                Livepath_handler l =new Livepath_handler();
                TblLivePath lp = l.insert_into_table(plant_id, path.getTArrPath());

                if (plant != null)
                {
                    drv.setTblPlant(plant);
                    /*ValueStack stack = ActionContext.getContext().getValueStack();
                    Map<String, Object> context = new HashMap<String, Object>();
                    context.put("current_session", plant);
                    stack.push(context);*/
                }
                else
                {
                    throw new Exception("Foreign Key Plant_id Dependency Failed ");
                }

                if (transporter != null)
                {
                    drv.setTblTransporter(transporter);//Transp(plant);
                }
                else
                {
                    throw new Exception("Foreign Key Plant_id Dependency Failed ");
                }
                
                if (vehicle != null)
                {
                    drv.setTblVehicle(vehicle);//Transp(plant);
                }
                else
                {
                    throw new Exception("Foreign Key Plant_id Dependency Failed ");
                }
                
                if (Card != null)
                {
                    drv.setTblCard(Card);//Transp(plant);
                }
                else
                {
                    throw new Exception("Foreign Key Plant_id Dependency Failed ");
                }
                if (lp != null)
                {
                    drv.setTblLivePath(lp);
                }
                else
                {
                    throw new Exception("Foreign Key Plant_id Dependency Failed ");
                }
                
                if (process != null)
                {
                    drv.setTblProcess(process);//Transp(plant);
                }
                else
                {
                    throw new Exception("Foreign Key Plant_id Dependency Failed ");
                }
                
            }

            session.save(drv);

            tx.commit();
            //throw new Exception("Method Not Overwritten Yet");
        }
        catch (Exception e)
        {
            error_flag = true;
            if (tx != null)
            {
                tx.rollback();
                e.printStackTrace();
            }
        }
        finally
        {
            session.close();
            if (error_flag == false)
            {
                return "Success";
            }
            else
            {
                return "Failure";
            }
        }

    }
    
    
}
