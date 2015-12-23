/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function pop(div) 
            {
                document.getElementById(div).style.display = 'block';
                document.getElementById('page-top').style.overflow="hidden";
                //temp.style.opacity="0.6"
            }
            function hide(div) 
            {
                /*var x = document.getElementsByName("pathlist");
                var a = document.getElementById("link");
                for(var i = 0; i < x.length; i++)
                    if(x[i].checked)
                        a.innerHTML = x[i].value;*/
                document.getElementById(div).style.display = 'none';
                document.getElementById('page-top').style.overflow="scroll";
                //temp.style.opacity="1"
            }
            document.onkeydown = function(evt) 
            {
                evt = evt || window.event;
                if (evt.keyCode === 27) {
                        hide('popDiv');
                }
            };
            window.addEventListener('mouseup', function(event)
            {
                var e = document.getElementById('popup');
                
                if(event.target !== e && event.target.parentNode !== e)
                {
                    document.getElementById('popDiv').style.display = 'none';
                }
                document.getElementById('page-top').style.overflow="scroll";
            });

