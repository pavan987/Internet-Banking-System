<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="SQLBean.DbBean" scope="request" />
<jsp:setProperty name="db" property="*" />
<% 
if(null==session.getAttribute("username"))
	response.sendRedirect("session.htm");%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Statements</title>
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
    <td><span class="style4">You Are Here</span> : Statements &gt; Account Statements </td>
  </tr>
</table>
<% String accno=request.getParameter("accno");
String month=request.getParameter("Month");
String year=request.getParameter("Year");
ResultSet rs=null;
db.connect();
rs=db.execSQL("select id,balance,branch,type,name from acholder_info where accno='"+accno+"'");
rs.next();
String id=rs.getString(1);
String balance=rs.getString(2);
String branch=rs.getString(3);
String type=rs.getString(4);
String name=rs.getString(5);
rs=db.execSQL("select addr from reg_info where id="+id);
rs.next();
String address=rs.getString(1);
%>
<table width="100%" border="2" cellpadding="3" cellspacing="0" bordercolor="#000000" bgcolor="#F4FBFB">
  <tr>
    <td style="border:0;"><span class="style2">Mini Statements</span></td>
  </tr>
  <tr>
    <td style="border:0;">&nbsp; </td>
  </tr>
  <tr>
    <td style="border:0;"><table width="96%" border="2" align="center" cellpadding="4" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td colspan="2" style="border:0"><span class="style4">Account Details</span></td>
        </tr>
      <tr>
        <td width="27%" style="border:0">Account Number </td>
        <td width="73%" style="border:0"><%=accno%></td>
      </tr>
      <tr>
        <td style="border:0">Address</td>
        <td style="border:0"><%=address%></td>
      </tr>
      <tr>
        <td style="border:0">Account Name</td>
        <td style="border:0"><%=name%></td>
      </tr>
      <tr>
        <td style="border:0">Balance</td>
        <td style="border:0"><%=balance%></td>
      </tr>
      <tr>
        <td style="border:0">Branch</td>
        <td style="border:0"><%=branch%></td>
      </tr>
      <tr>
        <td style="border:0">Account Type </td>
        <td style="border:0"><%=type%></td>
      </tr>
        </table></td>
  </tr>
  <tr>
    <td style="border:0;"><table width="96%" border="1" align="center" cellpadding="4" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td colspan="5"><span class="style4">Transactions </span></td>
      </tr>
      <tr>
        <td width="25%" bgcolor="#F3F3F3">Date</td>
        <td width="30%" bgcolor="#F3F3F3">Narration</td>
        <td width="15%" bgcolor="#F3F3F3">Debit</td>
        <td width="15%" bgcolor="#F3F3F3">Credit</td>
		<td width="15%" bgcolor="#F3F3F3">Balance</td>
      </tr>
  <% 
rs=db.execSQL("select issue_date,narration,debit,credit,balance from trans_info where (accno='"+accno+"') and ( MONTH (issue_date) = "+month+" ) and ( YEAR (issue_date) = "+year+" )");
String date="";
while(rs.next()){
date=rs.getString(1);
String narration=rs.getString(2);
String debit=rs.getString(3);
String credit=rs.getString(4);
String bal=rs.getString(5);
if(debit==null)
	debit="&nbsp;";
if(credit==null)
	credit="&nbsp;";
%>	  <tr>
        <td><%=date %></td>
        <td><%=narration %></td>
        <td><%=debit%></td>
        <td><%=credit%></td>
        <td><%=bal%></td>
     </tr>
  <%} db.close();
  if(date=="")
  {
  %> 
  <tr><td colspan="5" align="center">There Are no transactions</td></tr>
  <%} %>
 </table></td>
  </tr>
  <tr><td style="border:0">&nbsp;</td></tr>
  <tr><td style="border:0" align="center"><form><input type="button" value="Print" onClick="window.print()"></form></td></tr>
</table>
</div>
</div>
</body>
<jsp:include page="footer.jsp"/>
</html>