/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package menu;

/**
 *
 * @author rahul
 */
public class GenerateMenuHtml {
    private String html;
    public GenerateMenuHtml(String userName) 
    {
        html="";
        Generate g = new Generate(userName);
        Permissions root = g.getMenu();
        html+="<div id='cssmenu'>";
        html += GenRecr(root,0);
        html+="</div>";
    }
    private String GenRecr(Permissions ptr,int depth){
        String s = "<ul>";
        for(Permissions i : ptr.getChildList())
        {
            if(i.getChildList() == null)
            {
                if(i.isCanView())
                    s += "<li><a href='"+ i.getHref() +"'><span>"+ i.getName() + "</span></a></li>";
            }
            else if(depth == 0)
            {
                if(i.isCanView())
                {
                    s += "<li class='active has-sub' id='"+depth+"'><a href='"+ i.getHref() +"'><span>"+ i.getName() + "</span></a>";
                    s += GenRecr(i,depth++);
                    s += "</li>";
                }
            }
            else if(!ptr.getHref().equals("#"))
            {
                if(i.isCanView())
                {
                    s += "<li class='last' id='"+depth+"'><a href='"+ i.getHref() +"'><span>"+ i.getName() + "</span></a>";
                    s += GenRecr(i,depth++);
                    s += "</li>";
                }
            }
            else
            {
                if(i.isCanView())
                {
                    s += "<li class='has-sub' id='"+depth+"'><a href='"+ i.getHref() +"'><span>"+ i.getName() + "</span></a>";
                    s += GenRecr(i,depth++);
                    s += "</li>";
                }
            }
            
        }
        s += "</ul>";
        return s;
    }

    public String getHtml() 
    {
        return html;
    }
    
}