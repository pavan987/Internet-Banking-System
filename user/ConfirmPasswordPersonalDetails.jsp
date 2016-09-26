<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="SQLBean.DbBean" scope="request" />
<jsp:setProperty name="db" property="*" />
<% 
if(null==session.getAttribute("username"))
	response.sendRedirect("session.htm");
String uname=(String)session.getAttribute("username");
String message=request.getParameter("message");
if(message==null)
	message="";
db.connect();
ResultSet rs=db.execSQL("select name,email,mob from login_info where uname='"+uname+"'");
rs.next();
String displayName=rs.getString(1);
String email=rs.getString(2);
String mobile=rs.getString(3);
db.close();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<title>change personal details</title>
<script type="text/javascript">
function change(field)
{
field.disabled=false;
document.form1.submit.disabled=false;
document.form1.reset.disabled=false;
}
function Activate(form)
{
form.displayName.disabled=false;
form.mobile.disabled=false;
form.email.disabled=false;
}
window.history.forward(0);
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="container">
	<div id="content-container">
<table width="100%" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td><span class="style4">You Are Here </span>: Profile&gt;Personal Details </td>
  </tr>
  
</table>
<table width="100%" border="2" cellpadding="3" cellspacing="0" bordercolor="#000000" bgcolor="#F4FBFB">
  <tr>
    <td style="border:0;"><span class="style2">Personal Details</span></td>
  </tr>
    <tr>
    <td style="border:0;"><span id="message"></span></td>
  </tr>
    <tr>
    <td style="border:0;">
    <form name="form1" method="post" action="SetPersonalDetails.jsp" onSubmit="Activate(this)">
           <table width="96%" border="1" align="center" cellpadding="4" cellspacing="0" bgcolor="#FFFFFF">
          <tr>
            <td colspan="3" style="border:0">Mandatory fields are marked with an asterisk (*)</td>
          </tr>
          <tr>
            <td colspan="3" style="border:0">Display name is your name as it should appear in all online banking pages</td>
            </tr>
          <tr>
            <td width="27%" style="border:0">Display Name *</td>
            <td width="36%" style="border:0"><input type="text" name="displayName" maxlength="40" value="<%=displayName%>" disabled="disabled" /> </td>
            <td width="37%" style="border:0"><a href="#" onclick="javascript: change(form1.displayName);">change</a></td>
          </tr>
          <tr>
            <td style="border:0">Email ID *</td>
            <td style="border:0"><input type="text" name="email" maxlength="40" disabled="disabled" value="<%=email%>"/></td>
            <td style="border:0"><a href="#" onclick="javascript: change(form1.email);">change</a></td>
          </tr>
          <tr>
            <td style="border:0">Mobile Number * </td>
            <td style="border:0"><input type="text" name="mobile" maxlength="10" disabled="disabled" value="<%=mobile%>"/></td>
            <td style="border:0"><a href="#" onclick="javascript: change(form1.mobile);">change</a></td>
          </tr>
          <tr>
            <td style="border:0">&nbsp;</td>
            <td style="border:0" colspan="2"><input type="submit" name="submit" value="Submit" disabled="disabled" />
              <input type="reset" name="reset" value="Reset" disabled="disabled" /></td>
            </tr>
        </table>
        
    </form></td>
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