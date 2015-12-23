/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function endexception(button)
{
    
    button.disabled = true;
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }
    else
    {
        // code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    
    xmlhttp.onreadystatechange=function()
        {
               
                if(xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    if(xmlhttp.responseText.trim()=="success")
                    {                        
                        var i = button.parentNode.parentNode.rowIndex;
                        document.getElementById("exceptionTable").deleteRow(i);
                    }
                    else
                    {
                        button.disabled = false;
                    }
                }
        };
    
    xmlhttp.open("GET","jsp/endException.jsp?exceptionId="+button.id,true);
    xmlhttp.send();
    
};


