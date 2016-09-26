<%@ page language="java" import="java.sql.*" contentType="application/vnd-msexcel" %>
    <% response.setHeader("Content-Disposition", "attachment; filename=\"Statements.xls\""); %>
<jsp:useBean id="db" class="SQLBean.DbBean" scope="request" />
<jsp:setProperty name="db" property="*" />
<% 
if(null==session.getAttribute("username"))
	response.sendRedirect("session.htm");%>
<html>
<head>
<title>Account Statements</title>
<script type="text/javascript">
window.history.forward(0);
</script>
</head>
<body>
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
    <td style="border:0;"><table width="96%" border="1" align="center" cellpadding="4" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td colspan="2"><span class="style4">Account Details</span></td>
        </tr>
      <tr>
        <td width="27%">Account Number </td>
        <td width="73%"><%=accno%></td>
      </tr>
      <tr>
        <td>Address</td>
        <td><%=address%></td>
      </tr>
      <tr>
        <td>Account Name</td>
        <td><%=name%></td>
      </tr>
      <tr>
        <td>Balance</td>
        <td><%=balance%></td>
      </tr>
      <tr>
        <td>Branch</td>
        <td><%=branch%></td>
      </tr>
      <tr>
        <td>Account Type </td>
        <td><%=type%></td>
      </tr>
        </table></td>
  </tr>
  <tr>
    <td style="border:0;"><table width="96%" border="1" align="center" cellpadding="4" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td colspan="5"><span class="style4">Transactions</span></td>
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
</table>
</body>
</html>