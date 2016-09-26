<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="SQLBean.DbBean" scope="request" />
<jsp:setProperty name="db" property="*" />
<% 
if(null==session.getAttribute("username"))
	response.sendRedirect("session.htm");
String uname=(String)session.getAttribute("username");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cheque Book</title>
<link rel="stylesheet" href="../css/style.css" type="text/css" />
<script type="text/javascript">
function validateForm(theForm) {
if(theForm.txt_multicity.value=="")
{
alert("* Mandatory fields can not be empty");
return false;
}
if(theForm.txt_cbooks.value=="")
{
alert("* Mandatory fields can not be empty");
return false;
}
if(theForm.txt_cleaves.value=="")
{
alert("* Mandatory fields can not be empty");
return false;
}
return true;
}

window.history.forward(0);
</script>

</head>
<body>
<jsp:include page="header.jsp"/>
<div id="container" >
	<div id="content-container">
<table width="100%" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td><span class="style4">You Are Here </span>: Requests &gt; CheckBook  </td>
  </tr>
  
</table>
<table width="100%" border="2" cellpadding="3" cellspacing="0" bordercolor="#000000" bgcolor="#F4FBFB">
  <tr>
    <td style="border:0;"><span class="style2">CheckBook</span></td>
  </tr>
  <tr>
  <td style="border:0;" align="center"><span id="message" class="style2"></span></td>
  </tr>
  <tr>
    <td style="border:0;">
    <form name="form1" method="post" action="RequestConfirmation.jsp" onSubmit="return validateForm(this);">
      
      <table width="96%" border="1" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td><span class="style4">Select the account for which you require a cheque book *</span></td>
        </tr>
        <tr>
          <td><table width="100%" border="1" cellspacing="0" cellpadding="3">
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
              <td><input name="txt_accno" type="radio" value="<%=accno%>" checked="checked" />
                  <%=accno%></td>
              <td><%=branch%></td>
              <td><%=balance%></td>
            </tr>
             <%}
      db.close();

             %>
          </table></td>
        </tr>
        <tr>
          
         <td rowspan="3"><table width="100%" border="0" cellspacing="0" cellpadding="3">
                <tr>
                <td colspan="2" bgcolor="#EBEBEB"><div align="left"><span class="style4">Enter the number of books and select the number of leaves in each book</span></div></td>
                </tr>
              <tr>
                <td width="27%">Multi City Option * </td>
                <td width="73%"><input name="txt_multicity" type="radio" value="Yes">
                  Yes
                    <input name="txt_multicity" type="radio" value="No" checked="checked">
                    No</td>
              </tr>
              <tr>
                <td>Number of cheque Books *</td>
                <td>
                  <select name="txt_cbooks" id="txt_cbooks">
                    <option value="">Select Number Of Cheque Books</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                  </select>
                </td>
              </tr>
              <tr>
                <td>Number of cheque Leaves * 	</td>
                <td>
                  <select name="txt_cleaves" id="txt_cleaves">
                    <option>Select Number Of Cheque Leaves</option>
                    <option value="25">25</option>
                    <option value="50">50</option>
                  </select>
                </td>
               </tr>
              <tr>
                <td>Instrument Sub Category * 	</td>
                <td><input name="txt_category" type="radio" value="bearer cheque" checked="checked">
                  Bearer Cheque 
                  <input name="txt_category" type="radio" value="order cheque">
                  Order Cheque </td>
              </tr>
              <tr>
                 <td colspan="2"><input type="submit" name="Submit2" value="view" />
                 <input type="reset" name="Submit3" value="cancel" /></td>
                </tr>
            </table></td>
        </tr>
    </table>
        </form></td>
  </tr>
  <tr>
    <td style="border:0;"><p>&nbsp;</p>
      <table width="80%" border="1" align="center" cellpadding="3" cellspacing="0">
        <tr>
          <td>Note : </td>
          </tr>
        <tr>
          <td class="notecls"><ul type="square">
            <li>You can request for a cheque book for any of your accounts  					(Savings, Current, Cash Credit, Over Draft)</li>
            <li><strong>Bearer Cheque:</strong> A person holding the cheque can collect the amount if it is a bearer cheque.</li>
            <li><strong>Order Cheque:</strong> The payee (i.e. the person in whose   favour the cheque is issued) only or his authorized  person only can   collect the amount of the cheque if it is an order cheque.</li>
            <li>Mandatory fields are marked with an asterisk (<strong>*</strong>) </li>
          </ul></td>
          </tr>
      </table>      
      <p>&nbsp;</p></td>
  </tr>
</table>
</div>
</div>
<jsp:include page="footer.jsp"/>

</body>
</html>