<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="SQLBean.DbBean" scope="request" />
<jsp:setProperty name="db" property="*" />
<%
if(null==session.getAttribute("aname"))
	response.sendRedirect("session.htm");
String accno=request.getParameter("accno");
String amnt=request.getParameter("txt_amount");
String bal=request.getParameter("bal");
int balance=Integer.parseInt(bal);
int amount=Integer.parseInt(amnt);
int updatedBal=balance+amount;
db.connect();
db.updateSQL("update acholder_info set balance="+updatedBal+" where accno='"+accno+"'");
db.updateSQL("insert into trans_info (accno,narration,credit,balance) values('"+accno+"','Deposit Money',"+amount+","+updatedBal+")");
db.close();

 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deposit</title>
<link rel="stylesheet" href="../css/style.css" type="text/css" />
<script type="text/javascript">
window.history.forward(0);
</script>
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
	<td style="border:0" align="center"><span class="style2">Amount Deposited Successfully</span></td>
	</tr>
	</table>
	</div>
	</div>
<jsp:include page="footer.jsp" />
</body>
</html>