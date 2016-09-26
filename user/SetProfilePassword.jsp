<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="SQLBean.DbBean" scope="request" />
<jsp:setProperty name="db" property="*" />
<%! 
String message;
%>
<% 
if(null==session.getAttribute("username"))
	response.sendRedirect("session.htm");
java.util.Date date,date1;
String uname=(String)session.getAttribute("username");
String oldpassword=request.getParameter("password");
String newpassword=request.getParameter("newpassword");
db.connect();
ResultSet rs=null;
rs=db.execSQL("select pwd,profilepwd,profileattempts,profileblock from login_info where uname= '"+uname+"'");
rs.next();
String pwd=rs.getString(1);
String profilepwd=rs.getString(2);
int pattempts=rs.getInt(3);
String blockdate=rs.getString(4);
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
  if(oldpassword.equals(profilepwd))
  {
	  if(!newpassword.equals(pwd))
	  {
	   int i=db.updateSQL("update login_info set profilepwd='"+newpassword+"' where uname='"+uname+"'");
	   if(i!=0)
	    response.sendRedirect("ProfileMessage.jsp");
	  }
	  else
		  message="Login Password and Profile Password should not be same";  
  }
  else
   {
    int c=pattempts;
    
	if(c==0)
	 {
		message="Old profile Password Invalid";
		db.updateSQL("update login_info set profileattempts=1 where uname='"+uname+"'");
	 }
	else if(c==1)
	 {
		message="Profile Password Invalid.Note: Your Profile will be locked for aday on next wrong attempt";
		db.updateSQL("update login_info set profileattempts=2 where uname='"+uname+"'");
	 }
	else if(c==2)
	 {
		message="Profile Password Invalid.Your Profile have been Locked out For a day due to 3 invalid attempts";
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
<title>set profile password</title>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript">
window.history.forward(0);
function validate(form)
{
if(validateEmpty(form.password)==false)return false;
if(validateEmpty(form.newpassword)==false)return false;
if(validateEmpty(form.newpassword1)==false)return false;
var newpassword=form.newpassword.value;
var newpassword1=form.newpassword1.value;
var passed = validatePassword(newpassword, {
length:   [8, 20],
alpha:	  1,
numeric:  1,
special:  1
});
if(passed==false)
{
document.getElementById("message").innerHTML="Invalid New Login Password read the Note Below";
form.newpassword.focus();
return false;
}
if(!(newpassword==newpassword1))
{
document.getElementById("message").innerHTML="New Login Passwords Doesnt Match";
form.newpassword1.focus();
return false;
}
return true;
}
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="container">
	<div id="content-container">
<table width="100%" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td><span class="style4">You Are Here </span>: Profile&gt;Change Passwords&gt;Login </td>
  </tr>
  
</table>
<table width="100%" border="2" cellpadding="3" cellspacing="0" bordercolor="#000000" bgcolor="#F4FBFB">
  <tr>
    <td style="border:0;"><span class="style2">Change Passwords </span></td>
  </tr>
  <tr>
    <td style="border:0;" align="center"><span id="message" class="style2"><%=message %></span></td>
  </tr>
    <tr>
    <td style="border:0;">
    <form name="form1" method="post" action="SetProfilePassword.jsp" onSubmit="return validate(this);">
           <table width="96%" border="1" align="center" cellpadding="4" cellspacing="0" bgcolor="#FFFFFF">
          <tr>
            <td bgcolor="#B6D3C1"><a href="ConfirmPasswordLoginPassword.jsp">Login Password </a></td>
            <td><a href="ConfirmPasswordProfilePassword.jsp">Profile Password </a></td>
            <td bgcolor="#F4FBFB">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="3">Mandatory fields are marked with an asterisk (*)</td>
            </tr>
          <tr>
            <td width="30%">Old Login Password  *</td>
            <td width="24%"><input name="password" type="password" size="20" maxlength="20" /> </td>
            <td width="46%"></td>
          </tr>
          <tr>
            <td>New Login Password *</td>
            <td><input name="newpassword" type="password" size="20" maxlength="20" /></td>
            
          </tr>
          <tr>
            <td>Retype New Login Password * </td>
            <td><input name="newpassword1" type="password" size="20" maxlength="20" /></td>
            
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td colspan="2"><input type="submit" name="Submit" value="Submit" />
              <input type="reset" name="Submit2" value="Reset" /></td>
            </tr>
        </table>
        
    </form></td>
  </tr>
  <tr>
    <td style="border:0;"><table width="96%" border="1" align="center" cellpadding="3" cellspacing="0" bgcolor="#F3F5F5">
      <tr>
        <td>Note : </td>
      </tr>
      <tr>
        <td><ul>
          <li>Profile password should not match the login password</li>
          <li>Password length should be greater than 8 and less than 20 characters</li>
          <li>Password should contain at least one digit [0-9], one alphabet [A-Z] [a-z] and one special character such as [@#&amp;*!]</li>
          <li>Please avoid choosing a password that is generic in nature, guessable or inferable</li>
          <li>Avoid password from your personal data such name, date of birth, address, telephone number and car number</li>
          <li>It is good practice to commit your password to memory rather than to write it down somewhere</li>
          <li>For security reasons, keep changing your password at regular intervals</li>
        </ul></td>
      </tr>
    </table></td>
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


