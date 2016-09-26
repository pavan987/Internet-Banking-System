<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="SQLBean.DbBean" scope="request" />
<jsp:setProperty name="db" property="*" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove User</title>
<link rel="stylesheet" href="../css/style.css" type="text/css" />
<script type="text/javascript" src="common.js"></script>
<script type="text/javascript">
function validateForm(theForm) {
var count=0;
if(validateEmpty(theForm.elements[1])==false)
  return false;
theForm.flag.value="true";
return true; 
}

</script>
</head>
<body>
<jsp:include page="header.jsp" />
<div id="container">
	<div id="content-container">
		
			<h2 align="center">
				Remove User </h2>
	        <table width="70%"  border="0" align="right" cellpadding="2" cellspacing="0">
	<tr>
	<td style="border:0" align="center">&nbsp;</td>
	</tr>
  <tr>
    <td>
  <form action="RemoveUser.jsp" method="post" enctype="application/x-www-form-urlencoded"  onsubmit="return validateForm(this)">
  <input type="hidden" name="flag" value="">
			  <table width="100%" border="1" align="right" cellpadding="0" cellspacing="0">
               <tr>
                  <td><div align="right">Enter UserName  :</div></td>
                  <td><input type="text" name="searchdata" />
                  <input type="submit" name="Submit" value="Go" /></td>
                </tr>
              </table>
	  </form>
	</td>
  </tr>
  <tr>
  <td>
    <p>&nbsp;</p>
<% 
String flag=request.getParameter("flag");
if(flag!=null)
{
String data=request.getParameter("searchdata");
db.connect();
ResultSet rs=null;
     rs=db.execSQL("select name,email,mob,dob from login_info where uname='"+data+"' and role='user' ");
  if(rs.next())
  {
     String name=rs.getString(1);
     String email=rs.getString(2);
     String mob=rs.getString(3);
     String dob=rs.getString(4);
     db.close();
     %>
     <table width="100%" border="1" align="center" cellpadding="3" cellspacing="0">
      <tr>
        <td>Full Name :</td>
        <td><%=name %></td>
      </tr>
      <tr>
        <td>Email Address :</td><td><%=email%></td>
     </tr>
     <tr>    
        <td>Date Of Birth(mm/dd/yyyy) :</td> <td><%=dob %></td>
     </tr>
     <tr>
        <td>Mobile Number :</td> <td><%=mob %></td>
      </tr>
      <tr>
      <td colspan=2 align="center"><form action="RemoveUserProcess.jsp" method="post">
      <input type="hidden" name="uname" value="<%= data %>" />
      <input type="submit" value="Delete"/></form></td></tr>
     </table>
     <%} 
else
{
	out.print("Username Doesnt Exist");
}}
     %>
	</td>
	</tr>
</table>
<table width="27%" border="0" align="left" cellpadding="5" cellspacing="0">
  <tr>
    <td> <div align="center"><a href="AddUser.jsp">Add User </a></div></td>
  </tr>
  <tr>
    <td> <div align="center"><a href="RemoveUser.jsp">Remove User</a></div></td>
  </tr>
	</table>
	</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>