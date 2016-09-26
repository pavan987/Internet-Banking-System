<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
if(null==session.getAttribute("username"))
	response.sendRedirect("session.htm");
String username=request.getParameter("username");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Set Password</title>
<script type="text/javascript" src="../js/abc.js"></script>
<script type="text/javascript">
window.history.forward();
function validate(form)
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
alert("invalid password read the note below");
return false;
}
if(!(password==password1))
{
alert("Passwords doesnt match");
return false;
}
return true;
}
</script>
</head>
<body>
<div id="container">
	<div id="header"><img src="../images/logo.gif" alt="SecureBank"  />
	<div align="right" style="color: #660000;font-weight: bold;"=>Welcome Mr.<%= session.getAttribute("name") %></div>
	</div>
	<div id="navigation">
		<ul>
			<li><a href="logout.jsp">Logout</a></li>
		</ul>
		</div>
	<div id="content-container">
<table width="100%" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td><span class="style1"><strong>Choose Login Password</strong></span></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="4">
  
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><span style="color: #FF0000">Please enter a new password for logging into the site</span>
    <br />For accessing your Internet Banking account(s), you need to maintain two passwords</td>
  </tr>
  <tr>
    <td><p>Login Password for getting access to your accounts details etc.,<br />
      Profile Password to update your profile, adding third party beneficiary etc.<br />
      Please read the footnotes to select an appropriate password of your choice and carefully memorize your password.</p></td>
  </tr>
  <tr>
    <td><form id="form1" name="form1" method="post" action="SetUPFirst.jsp" onsubmit="return validate(this)">
    <input type="hidden" name="username" value=<%=username%>>
      <table width="100%" border="0" cellspacing="0" cellpadding="3">
        <tr>
          <td><div align="right">Password : </div></td>
          <td><div align="left">
            <input type="password" name="password" />
          </div></td>
        </tr>
        <tr>
          <td><div align="right">Confirm Password : </div></td>
          <td><div align="left">
            <input type="password" name="password1" />
          </div></td>
        </tr>
         <tr>
          <td><div align="right"></div></td>
          <td><div align="left">
            <input type="submit" name="Submit" value="Submit" />
          </div></td>
        </tr>
      </table>
        </form>
    </td>
  </tr>
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
</body>
<jsp:include page="footer.jsp"/>
</html>
