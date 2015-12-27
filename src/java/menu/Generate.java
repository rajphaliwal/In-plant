/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package menu;

import org.hibernate.Session;

/**
 *
 * @author Jonty
 */
public class Generate 
{
    static hibernate.pojo.TblUsers user;
    
    public Generate(String username) 
    {
        Session s=hibernate.helper.NewHibernateUtil.getSessionFactory().openSession();
        user=(hibernate.pojo.TblUsers)s.get(hibernate.pojo.TblUsers.class, username);
    }
    
    public Permissions getMenu()
    {
        boolean temporary_canView=false;
        //Root Menu
        Permissions root=new Permissions(true, "root", "#");
        
        //Plant Operation
        Permissions plantOp=new Permissions(false, "Plant Operation", "#");
        root.insertChild(plantOp);
        
        //TripManagement
        Permissions tripManagament=new Permissions(false, "Trip Management", "#");
        plantOp.insertChild(tripManagament);
        
        temporary_canView=user.getBAddTrip();
        Permissions addTrip=new Permissions(temporary_canView, "Add New Trip", "loggedIn-AddTrip");
        tripManagament.insertChild(addTrip);
        
        temporary_canView=user.getBViewTrip();
        Permissions viewTrip=new Permissions(temporary_canView, "View Ongoing Trips", "loggedIn-ViewTrips");
        tripManagament.insertChild(viewTrip);
        
        //Exceptions
        temporary_canView=user.getBViewException();
        Permissions viewException=new Permissions(temporary_canView, "View Ongoing Exceptions", "loggedIn-ViewExceptions");
        
        plantOp.insertChild(viewException);
        
        //Plant History
        temporary_canView=user.getBViewHistory();
        Permissions viewHistory=new Permissions(temporary_canView, "View Plant History", "loggedIn-ViewHistory");
        
        root.insertChild(viewHistory);
        
        //Settings
        Permissions settings=new Permissions(false, "Settings", "#");
        root.insertChild(settings);
        
        
        //PlantSetup
        Permissions plantSetup=new Permissions(false, "Plant Setup", "#");
        settings.insertChild(plantSetup);
        
        temporary_canView=user.getBPlantModify();
        Permissions plantModify=new Permissions(temporary_canView, "Modify Plant", "loggedIn-ModifyPlant");
        plantSetup.insertChild(plantModify);
        
        /*temporary_canView=user.getBSetupNewPlant();
        Permissions plantCreate=new Permissions(temporary_canView, "Create new Plant", "loggedIn-SetupPlant");
        plantSetup.insertChild(plantCreate);*/
        
        //UserManagerment
        Permissions userManagement=new Permissions(false, "User Management", "#");
        settings.insertChild(userManagement);
        
        temporary_canView=user.getBAddUser();
        Permissions addUser=new Permissions(temporary_canView, "Create New User", "loggedIn-AddUser");
        userManagement.insertChild(addUser);
        
        temporary_canView=user.getBModifyUser();
        Permissions modifyUser=new Permissions(temporary_canView, "View User", "loggedIn-ViewUser");
        userManagement.insertChild(modifyUser);
        
        //Vehicle Management
        Permissions vehicleManagement=new Permissions(false, "Vehicle Management", "#");
        settings.insertChild(vehicleManagement);
        
        temporary_canView=user.getBAddVehicle();
        Permissions addVehicle=new Permissions(temporary_canView, "Add Vehicle", "loggedIn-AddVehicle");
        vehicleManagement.insertChild(addVehicle);
        
        temporary_canView=user.getBModifyVehicle();
        Permissions modifyVehicle=new Permissions(temporary_canView, "View Vehicle", "loggedIn-ViewVehicle");
        vehicleManagement.insertChild(modifyVehicle);
        
        //Driver Management
        Permissions driverManagement=new Permissions(false, "Driver Management", "#");
        settings.insertChild(driverManagement);
        
        temporary_canView=user.getBAddVehicle();
        Permissions addDriver=new Permissions(temporary_canView, "Add Driver", "loggedIn-AddDriver");
        driverManagement.insertChild(addDriver);
        
        temporary_canView=user.getBModifyVehicle();
        Permissions modifyDriver=new Permissions(temporary_canView, "View Driver", "loggedIn-ViewDriver");
        driverManagement.insertChild(modifyDriver);
        
        //Transporter Management
        Permissions transporterManagement=new Permissions(false, "Transporter Management", "#");
        settings.insertChild(transporterManagement);
        
        temporary_canView=user.getBAddTransporter();
        Permissions addTransporter=new Permissions(temporary_canView, "Add Transporter", "loggedIn-AddTransporter");
        transporterManagement.insertChild(addTransporter);
        
        temporary_canView=user.getBModifyTransporter();
        Permissions modifyTransporter=new Permissions(temporary_canView, "View Transporter", "loggedIn-ViewTransporter");
        transporterManagement.insertChild(modifyTransporter);
        
        //Epos Management
        Permissions eposManagement=new Permissions(false, "Epos Management", "#");
        settings.insertChild(eposManagement);
        
        temporary_canView=user.getBAddEpos();
        Permissions addEpos=new Permissions(temporary_canView, "Add Epos", "loggedIn-AddEpos");
        eposManagement.insertChild(addEpos);
        
        temporary_canView=user.getBModifyEpos();
        Permissions modifyEpos=new Permissions(temporary_canView, "View Epos", "loggedIn-ViewEpos");
        eposManagement.insertChild(modifyEpos);
        
        //Link Management
        Permissions linkManagement=new Permissions(false, "Link Management", "#");
        settings.insertChild(linkManagement);
        
        temporary_canView=user.getBAddEpos();
        Permissions addLink=new Permissions(temporary_canView, "Add Link", "loggedIn-AddLink");
        linkManagement.insertChild(addLink);
        
        temporary_canView=user.getBModifyEpos();
        Permissions modifyLink=new Permissions(temporary_canView, "View Link", "loggedIn-ViewLink");
        linkManagement.insertChild(modifyLink);
        
        //Path Management
        Permissions pathManagement=new Permissions(false, "Path Management", "#");
        settings.insertChild(pathManagement);
        
        temporary_canView=user.getBAddPath();
        Permissions addPath=new Permissions(temporary_canView, "Add Path", "loggedIn-AddPath");
        pathManagement.insertChild(addPath);
        
        temporary_canView=user.getBModifyPath();
        Permissions modifyPath=new Permissions(temporary_canView, "View Path", "loggedIn-ViewPath");
        pathManagement.insertChild(modifyPath);
        
        //Process Management
        Permissions processManagement=new Permissions(false, "Process Management", "#");
        settings.insertChild(processManagement);
        
        temporary_canView=user.getBAddProcess();
        Permissions addProcess=new Permissions(temporary_canView, "Add Process", "loggedIn-AddProcess");
        processManagement.insertChild(addProcess);
        
        temporary_canView=user.getBModifyProcess();
        Permissions modifyProcess=new Permissions(temporary_canView, "View Process", "loggedIn-ViewProcess");
        processManagement.insertChild(modifyProcess);
        
        //Card Management
        Permissions cardManagement=new Permissions(false, "Card Management", "#");
        settings.insertChild(cardManagement);
        
        temporary_canView=user.getBAddProcess();
        Permissions addCard=new Permissions(temporary_canView, "Add Card", "loggedIn-AddCard");
        cardManagement.insertChild(addCard);
        
        temporary_canView=user.getBModifyProcess();
        Permissions modifyCard=new Permissions(temporary_canView, "View Card", "loggedIn-ViewCard");
        cardManagement.insertChild(modifyCard);
        
        //Change Plant
        temporary_canView=user.getBChangeCurrentPlant();
        Permissions changePlant=new Permissions(temporary_canView, "Change Current Plant", "loggedIn-ChangePlant");
        settings.insertChild(changePlant);
        
        // reports
        Permissions reports = new Permissions(false,"Reports","#");
        root.insertChild(reports);
        
        temporary_canView=true;
        Permissions aberrationReport = new Permissions(temporary_canView,"Aberration Report","loggedIn-ReportAberrationForm");
        reports.insertChild(aberrationReport);
        
        temporary_canView=true;
        Permissions MISDetentionReport = new Permissions(temporary_canView,"MIS Detention Report","loggedIn-ReportMISDetentionForm");
        reports.insertChild(MISDetentionReport);
        
        temporary_canView=true;
        Permissions dailyReport = new Permissions(temporary_canView,"Daily Report","loggedIn-ReportDailyForm");
        reports.insertChild(dailyReport);
        
        //Home
        Permissions home=new Permissions(true, "Home", "Home");
        root.insertChild(home);
        
        //Username
        Permissions username=new Permissions(true, user.getSUsername(), "#");
        root.insertChild(username);
        
        //Change Password
        Permissions changePassword=new Permissions(true, "Change Password", "loggedIn-ChangePassword");
        username.insertChild(changePassword);
        
        //Logout
        Permissions logout = new Permissions(true, "Logout", "Logout");
        username.insertChild(logout);
        
        make_permissions(root);
        
        return root;
    }
    
    public boolean make_permissions(Permissions root)
    {
        if(root.getChildList()==null)
            return root.isCanView();
        boolean perm=false;
        for(Permissions i: root.getChildList())
        {
            if(make_permissions(i)==true)
                perm=true;
        }
        root.setCanView(perm);
        return root.isCanView();
    }
}
