/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
String.prototype.replaceAt=function(index, character) 
{
    return this.substr(0, index) + character + this.substr(index+character.length);
}

jQuery(document).ready(function() {
  jQuery(".content").hide();
  //toggle the componenet with class msg_body
  jQuery(".heading").click(function()
  {
        var str = jQuery(this).text().trim();
        if(str.charAt(0)=="+")
            str = str.replaceAt(0, "-");
        else if(str.charAt(0)=="-")
            str = str.replaceAt(0, "+");
        jQuery(this).text(str);
        jQuery(this).next(".content").slideToggle(500);
  });
});


