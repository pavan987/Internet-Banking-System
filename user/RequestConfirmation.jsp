<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="SQLBean.DbBean" scope="request" />
<jsp:setProperty name="db" property="*" />
<% 
if(null==session.getAttribute("username"))
	response.sendRedirect("session.htm");
String accno=request.getParameter("txt_accno");
String multicity=request.getParameter("txt_multicity");
String cbooks=request.getParameter("txt_cbooks");
String cleaves=request.getParameter("txt_cleaves");
String category=request.getParameter("txt_category");
ResultSet rs=null;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Request Confirmation</title>
<link rel="stylesheet" href="../css/style.css" type="text/css" />
<script type="text/javascript">
function validateForm(theForm) {
if(theForm.txt_addr.value=="New")
for(i=9;i<=12;i++)
{
if(theForm.elements[i].value.length==0)
{
 alert("* Mandatory fields can not be empty");
  theForm.elements[i].focus();
  return false;
}
}
theForm.txt_name.disabled=false;
return true;
}
function showAddress(option)
{
if(option=="RegisteredAddress")
{
document.getElementById("RegisteredAddress").style.display="";
document.getElementById("NewAddress").style.display="none";
}
if(option=="NewAddress")
{
document.getElementById("RegisteredAddress").style.display="none";
document.getElementById("NewAddress").style.display="";
}
}
window.history.forward(0);
function submitBack(formname)
	{
	var test=eval("document."+formname);
	test.action="ChequeBook.jsp";
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
    <td><span class="style4">You Are Here </span>: Requests &gt; ChequeBook </td>
  </tr>
</table>
<table width="100%" border="2" cellpadding="3" cellspacing="0" bordercolor="#000000" bgcolor="#F4FBFB">
  <tr>
    <td style="border:0;"><span class="style2">Cheque Book</span></td>
  </tr>
  <tr>
    <td style="border:0;">&nbsp; </td>
  </tr>
  <tr>
  <td style="border:0;"><table id="result" width="96%" align="center" cellpadding="4" cellspacing="0" border="0" bgcolor="#FFFFFF">
      <tr>
        <td colspan="2"><h2>Please verify the details of your request.</h2></td>
      </tr>
      <tr>
      <td colspan=2>&nbsp;</td> 
        </tr>
<% 
db.connect();
rs=db.execSQL("select branch,id from acholder_info where accno='"+accno+"' ");
rs.next();
String branch=rs.getString(1);
String id=rs.getString(2);
 %>        
     <tr>
<td width="28%"><strong>Account Number</strong></td>
<td width="72%"><%=accno %></td>             
</tr>
<tr>
  <td><strong>Multi City Option </strong></td>
  <td><%=multicity %></td>
</tr>
<tr>
  <td><strong>Branch Name</strong></td>
  <td><%=branch %></td>
</tr>
<tr>
  <td><strong>Number of cheque books </strong></td>
  <td><%=cbooks %></td>
</tr>
<tr>
  <td><strong>Number of cheque leaves</strong></td>
  <td><%=cleaves %></td>
</tr>
<tr>
  <td><strong>Instrument Sub category</strong></td>
  <td><%=category %></td>
</tr>
<tr>
  <td colspan="2"><span style="{align:center;}" class="style4">Select the delivery address at which the Cheque book will be sent</span></td>
  </tr>
<tr>
  <td colspan="2"><form name="form1" method="post" action="RequestResult.jsp" onSubmit="return validateForm(this)">
  <input type="hidden" name="accno" value="<%=accno%>">
  <input type="hidden" name="multicity" value="<%=multicity%>">
  <input type="hidden" name="cbooks" value="<%=cbooks %>">
  <input type="hidden" name="cleaves" value="<%=cleaves %>">
  <input type="hidden" name="category" value="<%=category %>">
    <table width="69%"  cellspacing="0" cellpadding="3" border="0">
      <tr>
        <td width="47%"><strong><input name="txt_addr" type="radio" value="Registered" checked onClick="javascript: showAddress('RegisteredAddress')">
          Registered Address</strong>
        <td width="53%"><strong>
        <input name="txt_addr" type="radio" value="New" onClick="javascript: showAddress('NewAddress')">
        New Address</strong>              </tr>
      <tr>
      <td colspan="2">
      <div id="RegisteredAddress">
      <%
      rs=db.execSQL("select name,addr,city,state from reg_info where id="+id+" ");
      rs.next();
      String name=rs.getString(1);
      String addr=rs.getString(2);
      String city=rs.getString(3);
      String state=rs.getString(4);
      String address=name+" "+addr+" "+city+" "+state;
      %>
      <input type="hidden" name="address" value="<%=address%>">
 <strong><%=name %><br />
  <%=addr %><br />
    <%=city %><br />
      <%=state %><br /></strong>
      </div>
      <div id="NewAddress" style="display:none">
      <table width="100%"  cellspacing="0" cellpadding="3" border="0">
  <tr>
    <td colspan="2"><span class="style4">Enter the delivery address at which the Cheque book will be sent.</span></td>
  </tr>
  <tr>
    <td width="31%"><strong>Customer Name</strong></td>
    <td width="69%"><input type="text" name="txt_name" value=<%=name%> readonly disabled=disabled /></td>
  </tr>
  <tr>
    <td><strong>Address *</strong></td>
    <td><input name="txt_address" type="text" id="txt_addr" /></td>
  </tr>
  <tr>
    <td><strong>City  *</strong></td>
    <td><input name="txt_city" type="text" id="txt_city" /></td>
  </tr>
  <tr>
    <td><strong>State  *</strong></td>
    <td><input name="txt_state" type="text" id="txt_state" /></td>
  </tr>
</table>
      </div>
      </td>
        
        </tr>
      <tr>
        <td><div align="right">
          <input type="submit" name="Submit" value="Submit">
        </div></td>
        <td><input type="button" name="Submit2" value="Cancel" onClick="javascript: submitBack('form1');"></td>
      </tr>
    </table>
  </form>  </td>
  </tr>
<tr>
  <td colspan="2">&nbsp;</td>
</tr>
 </table>
  <tr><td style="border:0">&nbsp;</td></tr>
    <tr><td style="border:0">&nbsp;</td></tr>
</table>
</div>
</div>
</body>
<%db.close(); %>
<jsp:include page="footer.jsp"/>
</html>