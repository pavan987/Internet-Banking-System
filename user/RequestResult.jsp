<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="SQLBean.DbBean" scope="request" />
<jsp:setProperty name="db" property="*" />
<% 
if(null==session.getAttribute("username"))
	response.sendRedirect("session.htm");
String accno=request.getParameter("accno");
String multicity=request.getParameter("multicity");
String cbooks=request.getParameter("cbooks");
String cleaves=request.getParameter("cleaves");
String category=request.getParameter("category");
String addr=request.getParameter("txt_addr");
String address;
if(addr.equals("New"))
{
	String name=request.getParameter("txt_name");
	String address1=request.getParameter("txt_address");
	String city=request.getParameter("txt_city");
	String state=request.getParameter("txt_state");
	address=name+" "+address1+" "+city+" "+state;
}
else
	address=request.getParameter("address");
db.connect();
ResultSet rs=null;
db.updateSQL("insert into cheque_req (accno,books,leaves,category,multicity,address)values ('"+accno+"',"+cbooks+","+cleaves+",'"+category+"','"+multicity+"','"+address+"')");
db.close();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<title>Request Result</title>
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
    <td><span class="style4">You Are Here </span>: Request&gt;Status</td>
  </tr>
  
</table>
<table width="100%" border="2" cellpadding="3" cellspacing="0" bordercolor="#000000" bgcolor="#F4FBFB">
  <tr>
    <td style="border:0;">Status</td>
  </tr>
    <tr>
    <td style="border:0;">
    
           <table width="96%" border="1" align="center" cellpadding="4" cellspacing="0" bgcolor="#FFFFFF">
          <tr>
            <td colspan="2"><div align="center">Cheque Book Will be Sent Soon To The Specified Address</div></td>
          </tr>
          
        </table>
        
   </td>
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