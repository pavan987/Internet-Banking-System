<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
if(null==session.getAttribute("username"))
	response.sendRedirect("session.htm");
session.setMaxInactiveInterval(120); 
%>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Set Username</title>
<link rel="stylesheet" href="../css/style.css" type="text/css" />
<script type="text/javascript" src="../js/validateform.js"></script>
<script type="text/javascript">
window.history.forward();
function Validateit(form)
{
var reason="";
reason=validateUsername(form.username);
if(reason!="")
{
alert(reason);
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
    <td><span class="style1"><strong>Welcome to Secure Bank </strong></span></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="4">
    <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><span style="color: #FF0000">You have logged in for the first time</span><br />
Kindly enter a Username of your choice for your future use in SB Internet Banking</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><form id="form1" name="form1" method="post" action="SetPasswordFirst.jsp" onsubmit="return Validateit(this)">
        <p align="center">UserName :
          <input type="text" name="username" />
        </p>
      <p align="center">
          <input type="submit" name="Submit" value="Submit" />
        </p>
    </form></td>
  </tr>
  <tr>
    <td>Note : </td>
  </tr>
  <tr>
    <td class="notecls"><ul>
      <li>Your Username can be upto a maximum of 20 characters and can be a combination of <br />alphabets and numbers only ( Example-ravisharma, rajiv123)</li>
      <li> User names are case sensitive</li>
      <li>Please remember your Username and note that your Username cannot be changed in future</li>
      <li>Your new Username should not be identical to the User ID you received from the branch</li>
    </ul></td>
  </tr>
  </table>
  </div>
  </div>
<jsp:include page="footer.jsp"/>
</body>
</html>
