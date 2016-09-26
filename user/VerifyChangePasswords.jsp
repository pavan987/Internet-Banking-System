<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="SQLBean.DbBean" scope="request" />
<jsp:setProperty name="db" property="*" />
<%! String message; %>
<% 
if(null==session.getAttribute("username"))
	response.sendRedirect("session.htm");
java.util.Date date,date1;
String uname=(String)session.getAttribute("username");
String pass=request.getParameter("password");
db.connect();
ResultSet rs=null;
rs=db.execSQL("select profilepwd,profileattempts,profileblock from login_info where uname= '"+uname+"'");
rs.next();
String pwd=rs.getString(1);
String pattempts=rs.getString(2);
String blockdate=rs.getString(3);
int block=0;
if(blockdate!=null)
{
	rs=db.execSQL("SELECT current date FROM sysibm.sysdummy1");
	rs.next();
	date=rs.getDate(1);
	rs=db.execSQL("select profileblock from login_info where uname= '"+uname+"'");
	rs.next();
	date1=rs.getDate(1);
	if(date.compareTo(date1)==0)
	{
		message="Your Profile Password have been Locked out For a day due to 3 invalid attempts";
	    block=1;
    }
}
if(block==0)
 {
  if(pass.equals(pwd))
	response.sendRedirect("ConfirmPasswordLoginPassword.jsp");
  else
   {
    int c;
    rs=db.execSQL("select profileattempts from login_info where uname='"+uname+"'");
    rs.next();
	c =rs.getInt(1);
	if(c==0)
	 {
		message="Password Invalid";
		db.updateSQL("update login_info set profileattempts=1 where uname='"+uname+"'");
	 }
	else if(c==1)
	 {
		message="Note: Your profile password will be locked for aday on next wrong attempt";
		db.updateSQL("update login_info set profileattempts=2 where uname='"+uname+"'");
	 }
	else if(c==2)
	 {
		message="Your Profile Password have been Locked out For a day due to 3 invalid attempts";
		rs=db.execSQL("SELECT current date FROM sysibm.sysdummy1");
		rs.next();
		date=rs.getDate(1);
		db.updateSQL("update login_info set profileblock='"+date+"',profileattempts=0 where uname='"+uname+"'");
	 }
   }
 }
db.close();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<link rel="stylesheet" href="../css/style.css" type="text/css" />
<title>Profile</title>
<script type="text/javascript" src="../js/common.js"></script>
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
    <td><span class="style4">You Are Here </span>: Profile&gt;Verify Password </td>
  </tr>
  
</table>
<table width="100%" border="2" cellpadding="3" cellspacing="0" bordercolor="#000000" bgcolor="#F4FBFB">
  <tr>
    <td style="border:0;"><span class="style2">Change Passwords</span></td>
  </tr>
  <tr>
    <td style="border:0;" align="center"><span class="style2"><%=message %></span></td>
  </tr>
    <tr>
    <td style="border:0;">
    <form name="form1" method="post" action="VerifyChangePasswords.jsp" onSubmit="return validateEmpty(this.password);">
           <table width="96%" border="1" align="center" cellpadding="4" cellspacing="0" bgcolor="#FFFFFF">
          <tr>
            <td colspan="2">Mandatory fields are marked with an asterisk (*)</td>
          </tr>
          <tr>
            <td>Profile Password * : </td>
            <td><input name="password" type="password" maxlength="20" /></td>
          </tr>
          <tr>
            <td width="27%">&nbsp;</td>
            <td width="73%">
              <input type="submit" name="Submit" value="Submit" />
              <input type="reset" name="Submit2" value="Reset" />
            </td>
          </tr>
          </table>
        
    </form></td>
  </tr>
  <tr>
    <td style="border:0;" align="center"><a href="ForgotProfilePassword.jsp">Forgot Password?</a></td>
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
