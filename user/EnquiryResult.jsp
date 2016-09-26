<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="SQLBean.DbBean" scope="request" />
<jsp:setProperty name="db" property="*" />
<% 
if(null==session.getAttribute("username"))
	response.sendRedirect("session.htm");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EnquiryResult</title>
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
    <td><span class="style4">You Are Here</span> : Enquiry &gt; Transaction Result </td>
  </tr>
</table>
<table width="100%" border="2" cellpadding="3" cellspacing="0" bordercolor="#000000" bgcolor="#F4FBFB">
  <tr>
    <td style="border:0;"><span class="style2">Transaction Information</span></td>
  </tr>
  <tr>
    <td style="border:0;">&nbsp; </td>
  </tr>
  <tr>
  <td style="border:0;"><table id="result" width="96%" border="1" align="center" cellpadding="4" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td colspan="4"><span class="style4">Transactions </span></td>
      </tr>
      <tr>
        <td width="33%" bgcolor="#F3F3F3">Date</td>
        <td width="34%" bgcolor="#F3F3F3">Narration</td>
        <td width="17%" bgcolor="#F3F3F3">Debit</td>
        <td width="16%" bgcolor="#F3F3F3">Credit</td>
      </tr>
      <% 
if(null==session.getAttribute("username"))
	response.sendRedirect("session.htm");
String uname=(String)session.getAttribute("username");
String accno=request.getParameter("accno");
String startDate=request.getParameter("startDate");
String endDate=request.getParameter("endDate");
db.connect();
ResultSet rs=db.execSQL("select issue_date,narration,debit,credit from trans_info where (accno='"+accno+"') and (issue_date between '"+startDate+"' and '"+endDate+"') ");
while(rs.next())
{
	String date=rs.getString(1);
	String narration=rs.getString(2);
	String debit=rs.getString(3);
	String credit=rs.getString(4);
	if(debit==null)
		debit="&nbsp;";
	if(credit==null)
		credit="&nbsp;";
%>
<tr>
        <td><%=date %></td>
        <td><%=narration %></td>
        <td><%=debit%></td>
        <td><%=credit%></td>
        
     </tr>
  <%}db.close();
 %> 
 </table>
  <tr><td style="border:0">&nbsp;</td></tr>
  <tr><td style="border:0" align="center"><form action="Enquiry.jsp"><input type="submit" value="back"/></form></td></tr>
  <tr><td style="border:0">&nbsp;</td></tr>
</table>
</div>
</div>
</body>
<jsp:include page="footer.jsp"/>
</html>