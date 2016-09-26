<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="SQLBean.DbBean" scope="request" />
<jsp:setProperty name="db" property="*" />
<% 
if(null==session.getAttribute("username"))
	response.sendRedirect("session.htm");
String uname=(String)session.getAttribute("username");
String message=request.getParameter("message");
if(message==null)
	message="";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transfer Funds</title>
<script type="text/javascript" src="../js/validateform.js"></script>
<script type="text/javascript">
window.history.forward(0);
function validateFund(form)
	{
	var reason="";
	if(form.fromacc.checked==false)
	{
		document.getElementById("message").innerHTML="select Account number";
		form.fromacc.focus();
		return false;
	}
	if(form.password.value==""){
		document.getElementById("message").innerHTML="Enter profile password";
		form.password.focus();
		return false;}
	 if(form.toacc.value==""){
		document.getElementById("message").innerHTML="Enter Account number";
		form.toacc.focus();
		return false;
		}
	if(form.amount.value==""){
		document.getElementById("message").innerHTML="Enter Amount";
		form.amount.focus();
		return false;
		}
		if(form.toacc.value==form.fromacc.value){
		document.getElementById("message").innerHTML="Debit Account number and Credit Account Number Are same";
		form.toacc.focus();
		return false;
		}
	reason = validateNumber(form.amount);
	if(reason!="")
	{
		document.getElementById("message").innerHTML="you have entered invalid amount";
		form.amount.focus();
		return false;
	}
return true;
}
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="container">
	<div id="content-container">
<table width="100%" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td><span class="style4">You Are Here </span>: Transfer Funds </td>
  </tr>
  
</table>
<table width="100%" border="2" cellpadding="3" cellspacing="0" bordercolor="#000000" bgcolor="#F4FBFB">
  <tr>
    <td style="border:0;"><span class="style2">Transfer Funds </span></td>
  </tr>
  <tr>
  <td style="border:0;" align="center"><span id="message" class="style2"><%=message %></span></td>
  </tr>
  <tr>
    <td style="border:0;">
    <form name="form1" method="post" action="transferEvaluate.jsp" onSubmit="return validateFund(this);">
      <p>&nbsp;</p>
      <table width="96%" border="1" align="center" cellpadding="4" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td colspan="3"><span class="style4">Select an  Account </span></td>
        </tr>
        <tr>
          <td width="32%" bordercolor="#ECE9D8" bgcolor="#EBEBEB">Account Number </td>
          <td width="37%" bordercolor="#ECE9D8" bgcolor="#EBEBEB">Branch</td>
          <td width="31%" bordercolor="#ECE9D8" bgcolor="#EBEBEB">Balance</td>
        </tr>
        <%
      db.connect();
      ResultSet rs=db.execSQL("select accno,branch,balance from acholder_info where uname='"+uname+"'");
      int id=0;
      while(rs.next()){
    	  id++;
    	  String accno=rs.getString(1);
    	  String branch=rs.getString(2);
		  String balance=rs.getString(3);
    	
      %>
        <tr>
          <td><input name="fromacc" type="radio" value=<%=accno%>><%=accno%></td>
          <td><%=branch%></td>
          <td><%=balance%></td>
        </tr>
        <%}%>
      </table>
        <p>&nbsp;</p>
        <table width="96%" border="1" align="center" cellpadding="4" cellspacing="0" bgcolor="#feFeFe">
          <tr>
            <td style="border:0;" colspan="2"><span class="style4">Transfer Fund </span></td>
          </tr>
          <tr>
            <td style="border:0;" width="27%">Profile Password</td>
            <td style="border:0;" width="73%"><input type="password" name="password" maxlength="20"></td>
          </tr>
          <tr>
            <td style="border:0;">Account Number </td>
            <td style="border:0;"><input type="text" name="toacc"></td>
          </tr>
          <tr>
            <td style="border:0;">Amount</td>
            <td style="border:0;"><input type="text" name="amount"></td>
          </tr>
          <tr>
            <td style="border:0;">&nbsp;</td>
            <td style="border:0;"><input type="submit" name="Submit" value="Submit"></td>
          </tr>
          
        </table>
        
    </form></td>
  </tr>
  <tr>
    <td style="border:0;">&nbsp;</td>
  </tr>
  <tr>
    <td style="border:0;">&nbsp;</td>
  </tr>
</table>
</div>
</div>
</body>
<jsp:include page="footer.jsp"/>
</html>
