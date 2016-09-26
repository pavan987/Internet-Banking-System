var ab;
function submitLogin()
{var username = document.loginForm.uname.value;
var password= document.loginForm.pwd.value;
	
	if(username==""){
		alert("Enter username");
		document.loginForm.uname.focus();
		return false;
	}
	else if(password=="")
	{
		alert("Enter password");
		document.loginForm.pwd.focus();
		return false;
	}  
	else if( password.length>20){
			alert("Password length should not be more than 20 characters");
			document.loginForm.pwd.value="";
			document.loginForm.pwd.focus();
			return false;
		}
			
	return true;
}
//disable right click
var message="This function is not allowed here.";
               function clickIE4(){

                             if (event.button==2){
                             alert(message);
                             return false;
                             }
               }

               function clickNS4(e){
                             if (document.layers||document.getElementById&&!document.all){
                                            if (e.which==2||e.which==3){
                                                      alert(message);
                                                      return false;
                                            }
                                    }
               }

               if (document.layers){
                             document.captureEvents(Event.MOUSEDOWN);
                             document.onmousedown=clickNS4;
               }

               else if (document.all&&!document.getElementById){
                             document.onmousedown=clickIE4;
               }

               document.oncontextmenu=new Function("alert(message);return false;")
               
               //disable right click
