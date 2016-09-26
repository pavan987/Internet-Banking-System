// JavaScript Document
//validate email

function trim1(s)
{
  return s.replace(/^\s+|\s+$/, '');
}

function validateEmail(fld) {
    var error="";
    var tfld = trim1(fld.value);                        // value of field with whitespace trimmed off
    var emailFilter = /^[^@]+@[^@.]+\.[^@]*\w\w$/ ;
    var illegalChars= /[\(\)\<\>\,\;\:\\\"\[\]]/ ;
   
    if (fld.value == "") {
        
        
    } else if (!emailFilter.test(tfld)) {              //test email for illegal characters
        
        error = "Please enter a valid email address.\n";
    } else if (fld.value.match(illegalChars)) {
        
        error = "The email address contains illegal characters.\n";
    } else {
        fld.style.background = 'White';
    }
    return error;
 }
//validate password
function validatePassword(fld) {
    var error = "";
    var illegalChars = /[\W_]/; // allow only letters and numbers 
 
    if (fld.value == "") {
        
        
    } else if ((fld.value.length < 4) || (fld.value.length > 15)) {
        error = "The password is the wrong length. \n";
        
    } else if (illegalChars.test(fld.value)) {
        error = "The password contains illegal characters.\n";
        
    } else if (!((fld.value.search(/(a-z)+/)) && (fld.value.search(/(0-9)+/)))) {
        error = "The password must contain at least one numeral.\n";
        
    } else {
        fld.style.background = 'White';
    }
   return error;
}  
//validate username
function validateUsername(fld) {
    var error = "";
    var illegalChars = /\W/; // allow letters, numbers, and underscores
 
    if (fld.value == "") {
         
       error = "The username is Empty\n";
    } else if ((fld.value.length < 5) || (fld.value.length > 15)) {
         
        error = "The username is the wrong length.\n";
    } else if (illegalChars.test(fld.value)) {
         
        error = "The username contains illegal characters.\n";
    } else {
        fld.style.background = 'White';
    }
    return error;
}
//validate empty
function validateEmpty(fld) {
    var error = "";
 
    if (fld.value.length == 0) {
         
        error = "The required field has not been filled in.\n";
    } else {
        fld.style.background = 'White';
    }
    return error;  
}


     //validate mobile
function validatePhone(fld) {
    var error = "";
    var stripped = fld.value.replace(/[\(\)\.\-\ ]/g, '');    

   if (fld.value == "") {
        
        
    } else if (isNaN(parseInt(stripped))) {
        error = "The phone number contains illegal characters.\n";
        
    } else if (!(stripped.length == 10)) {
        error = "The phone number is the wrong length. Make sure you included an area code.\n";
        
    }
    return error;
}
function validateNumber(fld)
{
var checkOk="0123456789"

	var checkStr = fld.value;
	var allValid = true;
	var error="";
		if(fld.value.length==0)
		{
		
		}
		else
		{
			
			for (i = 0;  i < checkStr.length;  i++)
				{
					ch = checkStr.charAt(i);
					for (j = 0;  j < checkOk.length;  j++)
						if (ch == checkOk.charAt(j))
						break;
						if (j == checkOk.length)
						{
							allValid = false;
							break;
						}
				}			
					if (!allValid)
					{
					 
					error = "You have entered Invalid Amount\n";
										
					}
					
					else { 
					if(fld.value<100)
					{
					error = "Amount Should be greater than 100";
					
					}
					fld.style.background = 'white';
					 }
		}
		return error;
}




