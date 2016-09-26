<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
if(null==session.getAttribute("username"))
	response.sendRedirect("session.htm");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<link rel="stylesheet" href="../css/style.css" type="text/css" />
<title>Profile Landing Page</title>

<script type="text/javascript">
window.history.forward(0);
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="container">
	<div id="content-container">
<table width="100%" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td><span class="style4">You Are Here </span>: Profile&gt;Profile Landing Page </td>
  </tr>
  
</table>
<table width="100%" border="2" cellpadding="3" cellspacing="0" bordercolor="#000000" bgcolor="#F4FBFB">
  <tr>
    <td style="border:0;"><span class="style2">Profile</span></td>
  </tr>
    <tr>
    <td style="border:0;">
         <table width="96%" border="1" align="center" cellpadding="4" cellspacing="0" bgcolor="#FFFFFF">
          <tr>
            <td colspan="2" style="border:0;">The profile tab enables you to set your display name, email ID, mobile number and change your passwords.</td>
          </tr>
          <tr>
            <td colspan="2" style="border:0;">&nbsp;</td>
            </tr>
          <tr>
            <td width="27%" style="border:0;">&nbsp;</td>
            <td width="73%" style="border:0;"><a href="PersonalDetails.jsp">&gt; Personal Details </a></td>
          </tr>
          <tr>
            <td style="border:0;">&nbsp;</td>
            <td style="border:0;"><a href="ChangePasswords.jsp">&gt; Change Passwords </a></td>
          </tr>
          <tr>
            <td colspan="2" style="border:0;">&nbsp;</td>
            </tr>
        </table>
        
    </td>
  </tr>
  <tr>
    <td style="border:0;">&nbsp;</td>
  </tr>
  <tr>
    <td style="border:0;">&nbsp;</td>
  </tr>
</table>
</div>
</div>
<jsp:include page="footer.jsp"/>

</body>
</html>