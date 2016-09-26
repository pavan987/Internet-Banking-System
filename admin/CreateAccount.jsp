<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
if(null==session.getAttribute("aname"))
	response.sendRedirect("session.htm");
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>create Account</title>
<link rel="stylesheet" href="../css/style.css" type="text/css" />
<script type="text/javascript" src="common.js"></script>
<script type="text/javascript">
function validateEmpty(fld) {
       if (fld.value.length == 0) 
       {
       alert("* Mandatory fields can not be empty");
       return false;
        }
       return true;
}
function validateForm(theForm) {
for(i=0;i<=11;i++)
{
if(validateEmpty(theForm.elements[i])==false)
{
  theForm.elements[i].focus();
  return false;
}
}
  if(validateEmail(theForm.txt_email)==false)return false;
  if(validateDate(theForm)==false)return false;
  if(validateBalance(theForm.txt_bal)==false)return false;
  if(validatePhone(theForm.txt_mob)==false)return false;
   return true; 
}

</script>
</head>
<body>
<jsp:include page="header.jsp" />
<div id="container">
	<div id="content-container">
		
			<h2 align="center">
				Create an Account </h2>
	        <table width="70%"  border="0" align="right" cellpadding="2" cellspacing="0">
	<tr>
	<td style="border:0" align="center">&nbsp;</td>
	</tr>
  <tr>
    <td>
  <form action="AccountCreationProcess.jsp" method="post" enctype="application/x-www-form-urlencoded"  onsubmit="return validateForm(this)">
			  <table width="100%" border="1" align="right" cellpadding="0" cellspacing="0" background="images/table-background.gif">
                         
                <tr>
                  <td colspan="2"><div align="right">Full Name *: </div></td>
                  <td colspan="2"><div align="left">
                    <input name="txt_name" type="text" id="txt_name" maxlength="40" />
                  </div></td>
                </tr>
                   <tr>
                  <td colspan="2"><div align="right">Sex *: </div></td>
                  <td colspan="2"><div align="left">
                      <label>
                      <select name="txt_sex" id="txt_sex">
                        <option>select</option>
                        <option value="M" selected="selected">Male</option>
                        <option value="F">Female</option>
                                            </select>
                      </label>
                  </div></td>
                </tr>
                   <tr>
                  <td colspan="2"><div align="right">Email Address *: </div></td>
                  <td colspan="2"><div align="left">
                    <label>
                    <input name="txt_email" type="text" id="txt_email" maxlength="40" />
                    </label>
                  </div></td>
                </tr>
                <tr>
                  <td colspan="2"><div align="right">Date Of Birth <strong>(mm/dd/yyyy)</strong> :   *: </div></td>
                  <td colspan="2"><input name="txt_dob" type="text" id="txt_dob" /></td>
                </tr>

                
                <tr>
                  <td colspan="2"><div align="right">Branch *: </div></td>
                  <td colspan="2"><div align="left">
                    <label>
                    <select name="txt_branch" id="txt_branch">
                      <option selected="selected">Select</option>
                      <option value="Banglore">Banglore</option>
                      <option value="Chennai">Chennai</option>
                      <option value="Hyderabad">Hyderabad</option>
                    </select>
                    </label>
                  </div></td>
                </tr>
                <tr>
                  <td colspan="2">
                    <div align="right">Account Number *: </div></td>
                  <td colspan="2"><div align="left">
                    <input name="txt_accno" type="text" id="txt_accno" maxlength="10" />
                  </div></td>
                </tr>
                <tr>
                  <td colspan="2"><div align="right">Opening Balance *: </div></td>
                  <td colspan="2"><input name="txt_bal" type="text" id="txt_bal" />
                  (Min-500Rs/-)</td>
                </tr>
                <tr>
                  <td colspan="2"><div align="right">Account Type *: </div></td>
                  <td colspan="2"><select name="txt_type" id="txt_type">
                    <option selected="selected">Select</option>
                    <option value="Savings">Savings</option>
                    <option value="Current">Current</option>
                    <option value="Fixed">Fixed</option>
                  </select>                  </td>
                </tr>
                
                <tr>
                  <td colspan="2"><div align="right">Address *: </div>
                      <div align="right"></div></td>
                  <td colspan="2"><div align="left">
                      <label>
                      <textarea name="txt_addr" cols="40" rows="3" id="txt_addr"></textarea>
                      </label>
                    </div>
                      <div align="left"></div></td>
                </tr>
                 <tr>
                  <td colspan="2"><div align="right">City *: </div></td>
                  <td colspan="2"><div align="left">
                      <input name="txt_city" type="text" id="txt_city" maxlength="20" />
                  </div></td>
                </tr>
                 <tr>
                  <td colspan="2"><div align="right">State *: </div></td>
                  <td colspan="2"><div align="left">
                      <label>
                      <input name="txt_state" type="text" id="txt_state" maxlength="20" />
                      </label>
                  </div></td>
                </tr>
                <tr>
                  <td colspan="2"><div align="right">PinCode *: </div></td>
                  <td colspan="2"><div align="left">
                   <input name="txt_pin" type="text" id="txt_pin" maxlength="10" />       
                  </div></td>
                </tr>
                 <tr>
                   <td colspan="2"><div align="right">Mobile Number *:  </div></td>
                   <td colspan="2"><div align="left">
                     <input name="txt_mob" type="text" id="txt_mob" maxlength="10" />
                   </div></td>
                 </tr>
                <tr>
                  <td width="111">&nbsp;</td>
                  <td width="134">
                    <div align="center">
                      <input type="submit" name="Submit" value="Submit" />                  
                    </div></td>
                  <td width="160">
                    <div align="center">
                      <input type="reset" name="Submit2" value="Reset" />                  
                    </div></td>
                  <td width="106">&nbsp;</td>
                </tr>
              </table>
	  </form>
	</td>
  </tr>
</table>
<table width="27%" border="0" align="left" cellpadding="5" cellspacing="0">
  <tr>
    <td><div align="center"><a href="SearchAccount.jsp">Search Account</a></div></td>
  </tr>
  <tr>
    <td> <div align="center"><a href="CreateAccount.jsp">Create Account</a></div></td>
  </tr>
	</table>
	</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>