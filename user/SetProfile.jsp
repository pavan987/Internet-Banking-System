<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
if(null==session.getAttribute("username"))
	response.sendRedirect("session.htm");
session.setMaxInactiveInterval(120); 
String message=request.getParameter("message");
if(message==null)
	message="";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../css/style.css" type="text/css" />
<title>Profile</title>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript">
window.history.forward(0);
function validateProfile(form)
{
var password=form.password.value;
var password1=form.password1.value;
var passed = validatePassword(password, {
length:   [8, 20],
alpha:	  1,
numeric:  1,
special:  1
});
if(passed==false)
{
document.getElementById("message").innerHTML="Invalid Password read the Note Below";
form.password.focus();
return false;
}
if(!(password==password1))
{
document.getElementById("message").innerHTML="Passwords Doesnt Match";
form.password1.focus();
return false;
}
if(form.que.value=="")
{
document.getElementById("message").innerHTML="Select Security Question";
form.que.focus();
return false;
}
if(form.ans.value=="")
{
document.getElementById("message").innerHTML="Enter Security Answer";
form.ans.focus();
return false;
}
return true;
}
</script>
</head>
<body >
<jsp:include page="header.jsp"/>
<div id="container">
	<div id="content-container">
<table width="100%" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td>You Are Here : Profile &gt; Set Password</td>
  </tr>
</table>
<form id="form1" name="form1" method="post" action="ValidateProfile.jsp" onSubmit="return validateProfile(this)">
  <table width="100%" border="2" cellpadding="3" cellspacing="0" bordercolor="#000000" bgcolor="#F4FBFB">
    <tr>
      <td style="border:0"><span class="style2">Profile Details </span></td>
    </tr>
    <tr>
      <td style="border:0;"><table width="80%" border="1" align="center" cellpadding="3" cellspacing="0">
          <tr>
            <td><span class="style4">Set your profile password, and select a hint question and answer. </span></td>
          </tr>
          <tr>
            <td><span class="style4">Ensure that your profile password is different from your login password.</span></td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td style="border:0;" align="center"><span id="message" class="style2"><%=message%></span></td>
    </tr>
    <tr>
      <td style="border:0;">&nbsp;</td>
    </tr>
    <tr>
      <td style="border:0;"><table width="96%" border="1" align="center" cellpadding="4" cellspacing="0" bgcolor="#FFFFFF">
          <tr>
            <td colspan="2" style="border:0;"><span class="style9">Enter Profile Details : </span></td>
          </tr>
          <tr>
            <td width="27%" style="border:0;">Enter Profile Password *</td>
            <td width="73%" style="border:0;"><input name="password" type="password" id="password" maxlength="20" /></td>
          </tr>
          <tr>
            <td style="border:0;">Confirm Profile Password *</td>
            <td style="border:0;"><input name="password1" type="password" id="password1" maxlength="20" /></td>
          </tr>
          <tr>
            <td style="border:0;">Hint Question * </td>
            <td style="border:0;"><select name="que" id="que">
              <option value="" selected="selected">Select one question</option>
              <option value="what is the website that you rarely visit?">what is the website that you rarely visit?</option>
              <option value="what adventuorous sport your father like?">what adventuorous sport your father like?</option>
              <option value="what is the book your children like?">what is the book your children like?</option>
              <option value="which company shares you bought first?">which company shares you bought first?</option>
              <option value="who is your favourite sport columnist?">who is your favourite sport columnist?</option>
              <option value="which company you would like to work in future?">which company you would like to work in future?</option>
              <option value="which is the flower you like/dislike most?">which is the flower you like/dislike most?</option>
            </select>            </td>
          </tr>
          <tr>
            <td style="border:0;">Hint Answer *</td>
            <td style="border:0;"><input name="ans" type="text" id="ans" size="40" maxlength="40" /></td>
          </tr>
          <tr>
            <td style="border:0;">&nbsp;</td>
            <td style="border:0;"><input type="submit" name="Submit" value="Submit" /></td>
          </tr>
       </table></td>
    </tr>
    
  </table>
</form>
<table width="96%" border="1" align="center" cellpadding="4" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>Note : </td>
  </tr>
  <tr>
    <td class="notecls"><ul>
      <li>Passwords are case sensitive</li>
      <li> This password should have more than 8 and less than 20 characters</li>
      <li>It should be combination of Alphabets - Digits - Special Characters</li>
      <li>Password should contain atleast one digit [0-9]</li>
      <li>It should contain atleast one Alphabet [A-Z] [a-z]</li>
      <li>It should contain one Special Character like [`~!@#\$%^&amp;*]</li>
    </ul></td>
  </tr>
</table>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
