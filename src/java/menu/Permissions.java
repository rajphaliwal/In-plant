package menu;

import java.util.ArrayList;

/**
 *
 * @author rahul
 */
public class Permissions 
{
    private boolean canView;
    private final String name;
    private ArrayList <Permissions> childList;
    private final String href;

    public Permissions(boolean canView, String name, String href) 
    {
        this.canView = canView;
        this.name = name;
        this.href = href;
        this.childList=null;
    }

    public void insertChild(Permissions child)
    {
        if(childList==null)
        {
            childList=new ArrayList<Permissions>();
        }
        childList.add(child);
    }

    public ArrayList<Permissions> getChildList() {
        return childList;
    }

    public boolean isCanView() {
        return canView;
    }

    public String getName() {
        return name;
    }

    public String getHref() {
        return href;
    }

    public void setCanView(boolean canView) {
        this.canView = canView;
    }
    
    
}
