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
<title>Account Statements</title>
<script type="text/javascript" src="../js/calender.js"></script>
<script type="text/javascript">
window.history.forward(0);
function validateStatement(form)
{
if(form.accno.checked==false)
{
document.getElementById("message").innerHTML="select Account number";
return false;
}
if(form.view.checked){

	form.action = "StatementbyDate.jsp";

	} else if(form.excelformat.checked){

		form.action = "downloadExcel.jsp";

	} 
return true;
}
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="container">
	<div id="content-container">
	<form name="form1" method="post" onSubmit="return validateStatement(this);">
<table width="100%" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td><span class="style4">You Are Here </span>: Statements &gt; AccountStatements  </td>
  </tr>
  
</table>
<table width="100%" border="2" cellpadding="3" cellspacing="0" bordercolor="#000000" bgcolor="#F4FBFB">
  <tr>
    <td style="border:0;"><span class="style2">Account Statements </span></td>
  </tr>
  <tr>
  <td style="border:0;" align="center"><span id="message" class="style2"><%=message %></span></td>
  </tr>
  <tr>
    <td style="border:0;">
       
      <table width="96%" border="1" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td><span class="style4">Select an  Account </span></td>
        </tr>
        <tr>
          <td><table width="100%" border="1" cellspacing="0" cellpadding="3">
            <tr>
              <td width="32%" bordercolor="#ECE9D8" bgcolor="#EBEBEB">Account Number </td>
              <td width="37%" bordercolor="#ECE9D8" bgcolor="#EBEBEB">Account Type</td>
              <td width="31%" bordercolor="#ECE9D8" bgcolor="#EBEBEB">Balance</td>
            </tr>
            <%
      db.connect();
      ResultSet rs=db.execSQL("select accno,type,balance from acholder_info where uname='"+uname+"'");
      int id=0;
      while(rs.next()){
    	  id++;
    	  String accno=rs.getString(1);
    	  String type=rs.getString(2);
		  String balance=rs.getString(3);
    	
      %>
            <tr>
              <td><input name="accno" type="radio" value="<%=accno%>" checked/>
                  <%=accno%></td>
              <td><%=type%></td>
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
                <td colspan="4" bgcolor="#EBEBEB">Select options for the statement period</td>
                </tr>
              <tr>
                
                <td>Year</td>
                <td><label>
                  <select name="Year" title="year" id="year">
			  <script>
			 			 for(i=new Date().getFullYear()-8;i<=new Date().getFullYear();i++)
						 document.write("<option selected='"+new Date().getFullYear()+"' value='" + i + "'>"+i+"</option>");

			</script>
		    </select>
                </label></td>
              </tr>
              <tr>
                
                <td>Month</td>
                <td><select name="Month" title="month" id="date">

									<option value="01" selected>January</option>
									<option value="02">February </option>
									<option value="03">March</option>
									<option value="04">April</option>
									<option value="05">May</option>
									<option value="06">June</option>
									<option value="07">July</option>
									<option value="08">August</option>
									<option value="09">September</option>
									<option value="10">October</option>
									<option value="11">November</option>
									<option value="12">December</option>

					  </select></td>
              </tr>
              <tr>
                <td colspan="4" bgcolor="#EBEBEB">Select appropriate options to view, print or download the statement</td>
              </tr>
              <tr>
                <td colspan="4"><input name="format" type="radio" id="view" checked>
                  View</td>
                </tr>
              <tr>
                <td colspan="4"><input name="format" type="radio" id="excelformat">
                  Download in MS Excel format</td>
              </tr>
              <tr>
                 <td colspan="4"><input type="submit" name="Submit2" value="Go" /></td>
                </tr>
            </table></td>
        </tr>
    </table>
       </td>
  </tr>
  <tr>
    <td style="border:0;">&nbsp;</td>
  </tr>
  
</table>
 </form>
</div>
</div>
<jsp:include page="footer.jsp"/>

</body>
</html>
