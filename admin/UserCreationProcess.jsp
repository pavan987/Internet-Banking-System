<%@ page language="java" import="java.sql.*"contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="SQLBean.DbBean" scope="request" />
<jsp:setProperty name="db" property="*" />
<%!String generatePassword()
{
	double randomNumber;
	char randomCharacter;
	String password="";
	for(int j=0;j<8;j++)
	{
	randomNumber=Math.random() * 26 + 'a';
	randomCharacter = (char)randomNumber ;
	password=password+randomCharacter;
	}
	return password;
	} %>
<%
if(null==session.getAttribute("aname"))
	response.sendRedirect("session.htm");
String name=request.getParameter("txt_name");
String email=request.getParameter("txt_email");
String dob=request.getParameter("txt_dob");
String mob=request.getParameter("txt_mob");
String Account=request.getParameter("txt_accno");
String[] accnos = Account.split(",");
String accno[] = new String[10];
int i=0;
for (String acc : accnos)
{
accno[i++]=acc.trim();
}
ResultSet rs=null;
db.connect();
//username generation
String username="";
String password;
rs=db.execSQL("select uname from login_info");
int c=0;
while(true)
{		   
	   for(int k=0;k<8;k++)
		username=username+Math.round(Math.random()*9);
while(rs.next())
{
	   String uname1=rs.getString(1);
	 if(username.equals(uname1))
	 {
		 c++;
		 break;
	 }
}
if(c==0)
	   break;
}
//password generation
password=generatePassword();
db.autoCommit(false);
for(int j=0;j<i;j++)
{
int l=db.updateSQL("update acholder_info set uname='"+username+"' where accno='"+accno[j]+"'");
if(l==0)
response.sendRedirect("AddUser.jsp?r=0");
}
db.commit();
db.autoCommit(true);
String q1="insert into login_info values('"+username+"','"+password+"','"+password+"','"+name+"','"+email+"','user','f','que','ans',0,0,null,null,"+mob+",'"+dob+"')";
db.updateSQL(q1);
db.close();

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>create User</title>
<link rel="stylesheet" href="../css/style.css" type="text/css" />
<script type="text/javascript" src="common.js"></script>
</head>
<body>
<jsp:include page="header.jsp" />
<div id="container">
	<div id="content-container">
		
			<h2 align="center">
				Status </h2>
	        <table width="70%"  border="0" align="center" cellpadding="2" cellspacing="0">
	<tr>
	<td style="border:0" align="center">&nbsp;</td>
	</tr>
	<tr>
	<td style="border:0" align="center"><span class="style2">User Successfully Created</span></td>
	</tr>
	</table> 
	<br />
	<div class="style2" align="center">
	UserName : <%=username %><br />
	Password : <%=password %> <br /><br />
	
	<form>
<input type="button" value="Print this page" onClick="window.print()">
</form>
</div>
	</div>
	</div>
<jsp:include page="footer.jsp" />
</body>
</html>