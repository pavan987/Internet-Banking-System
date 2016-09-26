<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
if(null==session.getAttribute("username"))
	response.sendRedirect("session.htm");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<link rel="stylesheet" href="../css/style.css" type="text/css" />
<title>forgot password</title>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript">
window.history.forward(0);
function validate(form)
{
if(validateEmpty(form.que)==false)return false;
if(validateEmpty(form.ans)==false)return false;
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
    <td><span class="style4">You Are Here </span>: Profile&gt;<span class="style2">Forgot Profile Password </span></td>
  </tr>  
</table>
<table width="100%" border="2" cellpadding="3" cellspacing="0" bordercolor="#000000" bgcolor="#F4FBFB">
  <tr>
    <td style="border:0;"><span class="style2">Select Question and Answer </span></td>
  </tr>
    <tr>
    <td style="border:0;">
    <form name="form1" method="post" action="VerifySecurityAnswer.jsp" onSubmit="return validate(this);">
           <table width="96%" border="1" align="center" cellpadding="4" cellspacing="0" bgcolor="#FFFFFF">
          <tr>
            <td colspan="2" style="border:0;">Mandatory fields are marked with an asterisk (*)</td>
          </tr>
          <tr>
            <td colspan="2" style="border:0;">&nbsp;</td>
            </tr>
          <tr>
            <td  style="border:0;" width="32%">Select Security Question * </td>
            <td  style="border:0;" width="68%"><select name="que" id="que">
              <option value="" selected="selected">Select one question</option>
              <option value="what is the website that you rarely visit?">what is the website that you rarely visit?</option>
              <option value="what adventuorous sport your father like?">what adventuorous sport your father like?</option>
              <option value="what is the book your children like?">what is the book your children like?</option>
              <option value="which company shares you bought first?">which company shares you bought first?</option>
              <option value="who is your favourite sport columnist?">who is your favourite sport columnist?</option>
              <option value="which company you would like to work in future?">which company you would like to work in future?</option>
              <option value="which is the flower you like/dislike most?">which is the flower you like/dislike most?</option>
            </select> </td>
            </tr>
          <tr>
            <td  style="border:0;">Select Security Answer * </td>
            <td style="border:0;"><input name="ans" type="text" size="40" maxlength="40" /></td>
            </tr>
          <tr>
            <td style="border:0;">&nbsp;</td>
            <td style="border:0;"><input type="submit" name="Submit" value="Submit" />
              <input type="reset" name="Submit2" value="Reset" /></td>
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
<jsp:include page="footer.jsp"/>

</body>
</html>
