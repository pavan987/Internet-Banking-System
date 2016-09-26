<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="SQLBean.DbBean" scope="request" />
<jsp:setProperty name="db" property="*" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Summary</title>
<script type="text/javascript">
window.history.forward(0);
function submitBack(formname)
	{
	var test=eval("document."+formname);
	test.action="Accounts.jsp";
	test.submit();
	}
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="container">
	<div id="content-container">
<table width="100%" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td><span class="style4">You Are Here</span> : My Accounts &gt; Account Summary </td>
  </tr>
</table>
<% String accno=request.getParameter("accno");
ResultSet rs=null;
db.connect();
rs=db.execSQL("select id,balance,branch from acholder_info where accno='"+accno+"'");
rs.next();
String id=rs.getString(1);
String balance=rs.getString(2);
String branch=rs.getString(3);
rs=db.execSQL("select name from reg_info where id="+id);
rs.next();
String name=rs.getString(1);
%>
<table width="100%" border="2" cellpadding="3" cellspacing="0" bordercolor="#000000" bgcolor="#F4FBFB">
  <tr>
    <td style="border:0;"><span class="style2">Account Information</span></td>
  </tr>
  <tr>
    <td style="border:0;">&nbsp; </td>
  </tr>
  <tr>
    <td style="border:0;"><table width="96%" border="1" align="center" cellpadding="4" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td colspan="2"><span class="style4">Account Details  </span></td>
        </tr>
      <tr>
        <td width="27%">Account Number </td>
        <td width="73%"><%=accno%></td>
      </tr>
      <tr>
        <td>Branch</td>
        <td><%=branch%></td>
      </tr>
      <tr>
        <td>Name</td>
        <td><%=name%></td>
      </tr>
      <tr>
        <td>Balance</td>
        <td><%=balance%></td>
      </tr>
      <tr>
        <td>Currency</td>
        <td>INR</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form action="Accounts.jsp" method="post"><input type="submit" value="back" /></form></td>
      </tr>
        </table></td>
  </tr>
  <tr>
    <td style="border:0;"><table width="96%" border="1" align="center" cellpadding="4" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td colspan="4"><span class="style4">Last 10 Transactions </span></td>
      </tr>
      <tr>
        <td width="33%" bgcolor="#F3F3F3">Date</td>
        <td width="34%" bgcolor="#F3F3F3">Narration</td>
        <td width="17%" bgcolor="#F3F3F3">Debit</td>
        <td width="16%" bgcolor="#F3F3F3">Credit</td>
      </tr>
  <% 
rs=db.execSQL("select issue_date,narration,debit,credit from (select id,issue_date,narration,debit,credit from trans_info where accno='"+accno+"' order by id desc fetch first 10 rows only) as t1  order by id asc");
while(rs.next()){
String date=rs.getString(1);
String narration=rs.getString(2);
String debit=rs.getString(3);
String credit=rs.getString(4);
if(debit==null)
	debit="&nbsp;";
if(credit==null)
	credit="&nbsp;";
%>	  <tr>
        <td><%=date %></td>
        <td><%=narration %></td>
        <td><%=debit%></td>
        <td><%=credit%></td>
        
     </tr>
  <%} db.close();%> 
  
 </table></td>
  </tr>
  <tr><td style="border:0">&nbsp;</td></tr>
</table>
</div>
</div>
</body>
<jsp:include page="footer.jsp"/>
</html>