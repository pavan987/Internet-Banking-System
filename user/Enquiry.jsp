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
<title>Enquiry</title>
<script type="text/javascript" src="../js/calender.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="container">
	<div id="content-container">
<table width="100%" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td><span class="style4">You Are Here </span>: Enquiry &gt; Transactions  </td>
  </tr>
  
</table>
<table width="100%" border="2" cellpadding="3" cellspacing="0" bordercolor="#000000" bgcolor="#F4FBFB">
  <tr>
    <td style="border:0;"><span class="style2">Find Transactions</span></td>
  </tr>
  <tr>
  <td style="border:0;" align="center"><span id="message" class="style2"><%=message %></span></td>
  </tr>
  <tr>
    <td style="border:0;">
    <form name="form1" method="post" action="EnquiryResult.jsp" onSubmit="return validateEnquiry(this);">
      
      <table width="96%" border="1" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td><span class="style4">Select an  Account </span></td>
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
              <td><input name="accno" type="radio" value="<%=accno%>" />
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
                <td colspan="2" bgcolor="#EBEBEB"><span class="style4">Specify the range of dates or amounts for which you wish to view transaction details</span></td>
                </tr>
              <tr>
                <td colspan="2">Date Range </td>
             </tr>
              <tr>
                <td>Start Date </td>
                <td><input type="text" name="startDate" id="startDate"  title="startdate" value="dd-mmm-yyyy"  size="12" readonly/>
                  <a href="javascript:NewCal('startDate','ddmmmyyyy',true,24)"><img src="../images/calender_icon.gif" width="20" height="22" border="0"/></a></td>
                              
              </tr>
              <tr>
                <td>End Date </td>
                <td><input type="text" name="endDate" id="endDate"  title="enddate" value="dd-mmm-yyyy" size="12" readonly/>
                  <a href="javascript:NewCal('endDate','ddmmmyyyy',true,24)"><img src="../images/calender_icon.gif" width="20" height="22" border="0"/></a></td>
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
    <td style="border:0;">&nbsp;</td>
  </tr>
  
</table>
</div>
</div>
<jsp:include page="footer.jsp"/>

</body>
</html>
