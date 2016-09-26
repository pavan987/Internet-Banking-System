<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="SQLBean.DbBean" scope="request" />
<jsp:setProperty name="db" property="*" />
<% 
if(null==session.getAttribute("username"))
	response.sendRedirect("session.htm");
session.setMaxInactiveInterval(300); 
String uname=(String)session.getAttribute("username");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<title>Account Information</title>
<script type="text/javascript">
window.history.forward(0);
function submitForm(accno)
{
document.form1.accno.value=accno;
document.form1.submit();
}
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
<form action="quicklook.jsp" name="form1" method="post">
<input type="hidden" name="accno" value="">
<input type="hidden" name="branch" value="">
</form>
<div id="container">
	<div id="content-container">
<table width="100%" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td><span class="style4">You Are Here </span>: My Accounts &gt; Account Summary </td>
  </tr>
</table>

<table width="100%" border="2" cellpadding="3" cellspacing="0" bordercolor="#000000" bgcolor="#F4FBFB">
  <tr>
    <td style="border:0;"><span class="style2">Account Summary </span></td>
  </tr>
  <tr>
    <td style="border:0;">&nbsp; </td>
  </tr>
  <tr>
    <td style="border:0;"><table width="96%" border="1" align="center" cellpadding="4" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td colspan="3"><span class="style4">Transaction Accounts </span></td>
      </tr>
      <tr>
        <td width="32%" bordercolor="#ECE9D8" bgcolor="#EBEBEB">Account Number </td>
        <td width="37%" bordercolor="#ECE9D8" bgcolor="#EBEBEB">Branch</td>
        <td width="31%" bordercolor="#ECE9D8" bgcolor="#EBEBEB">Balance</td>
      </tr>
      
      <%
      db.connect();
      ResultSet rs=db.execSQL("select accno,branch from acholder_info where uname='"+uname+"'");
      int id=0;
      while(rs.next()){
    	  id++;
    	  String accno=rs.getString(1);
    	  String branch=rs.getString(2);
    	
      %>
      <tr>
        <td><a href="javascript: submitForm(<%= accno%>)"><%=accno%></a></td>
        <td><%=branch%></td>
        <td><a href="javascript: submitForm(<%= accno%>)">Click here or Account No For balance</a></td>
      </tr>
     <%}
     db.close();
     %>
     
    </table></td>
  
</table>  
</div>
</div>
</body>
<jsp:include page="footer.jsp"/>
</html>