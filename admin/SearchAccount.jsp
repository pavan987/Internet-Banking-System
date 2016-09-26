<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="SQLBean.DbBean" scope="request" />
<jsp:setProperty name="db" property="*" />
<%
if(null==session.getAttribute("aname"))
	response.sendRedirect("session.htm");
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Account</title>
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
				Search Account </h2>
	        <table width="70%"  border="0" align="right" cellpadding="2" cellspacing="0">
	<tr>
	<td style="border:0" align="center">&nbsp;</td>
	</tr>
  <tr>
    <td>
  <form action="SearchAccount.jsp" method="post" enctype="application/x-www-form-urlencoded"  onsubmit="return validateForm(this)">
  <input type="hidden" name="flag" value="">
			  <table width="100%" border="1" align="right" cellpadding="0" cellspacing="0" background="images/table-background.gif">
               <tr>
                  <td><div align="right">Enter Account number  :</div></td>
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
     rs=db.execSQL("select id,branch,balance,type from acholder_info where accno='"+data+"' ");
  if(rs.next())
  {
     String id=rs.getString(1);
     String branch=rs.getString(2);
     String bal=rs.getString(3);
     String type=rs.getString(4);
     rs=db.execSQL("select name,sex,email,dob,addr,city,state,mob from reg_info where id="+id+" ");
     rs.next();
     String name=rs.getString(1);
     String sex=rs.getString(2);
     String email=rs.getString(3);
     String dob=rs.getString(4);
     String addr=rs.getString(5);
     String city=rs.getString(6);
     String state=rs.getString(7);
     String mob=rs.getString(8);
     db.close();
     %>
     <table width="100%" border="1" align="center" cellpadding="3" cellspacing="0">
      <tr>
        <td>Full Name :</td>
        <td><%=name %></td>
      </tr>
      <tr> 
        <td>Sex :</td><td><%=sex %></td>
      </tr>
      <tr>
        <td>Email Address :</td><td><%=email%></td>
     </tr>
     <tr>    
        <td>Date Of Birth(mm/dd/yyyy) :</td> <td><%=dob %></td>
     </tr>
     <tr> 
        <td>Branch :</td><td><%=branch %></td>
     </tr> 
     <tr>
        <td>Account Number :</td><td><%=data %></td>
     </tr>
     <tr> 
        <td>Balance :</td> <td><%=bal %></td>
     </tr>
     <tr> 
        <td>Account Type :</td><td><%=type%></td>
     </tr>
     <tr> 
        <td>Address : </td><td><%=addr %></td>
     </tr>
     <tr> 
        <td>City :</td><td><%=city %></td>
      </tr>
      <tr> 
        <td>State</td><td><%=state %></td>
      </tr>
      <tr> 
        <td>Mobile Number :</td> <td><%=mob %></td>
      </tr>
     </table>
     <%} 
else
{
	out.print("<span class='style2'>Account number Doesnt Exist</span>");
}}


     %>
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