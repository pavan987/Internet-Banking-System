<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
if(null==session.getAttribute("aname"))
	response.sendRedirect("session.htm"); 
String message=request.getParameter("r");
if(message==null)
	message="";
else
	message="Check Account Numbers";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add User</title>
<link rel="stylesheet" href="../css/style.css" type="text/css" />
<script type="text/javascript" src="common.js"></script>
<script type="text/javascript">
window.history.forward(0);
function validateForm(theForm) {
var count=0;
for(i=0;i<=4;i++)
{
if(validateEmpty(theForm.elements[i])==false)
{
  theForm.elements[i].focus();
  return false;
}
}
  if(validateEmail(theForm.txt_email)==false)return false;
  if(validateDate(theForm)==false)return false;
  if(validatePhone(theForm.txt_mob)==false)return false;
   return true; 
}

</script>
</head>
<body>
<jsp:include page="header.jsp" />
<div id="container">
	<div id="content-container">
		
			<h2 align="center">
				Add User </h2>
	        <table width="70%"  border="0" align="right" cellpadding="2" cellspacing="0">
	<tr>
	<td style="border:0" align="center">&nbsp;</td>
	</tr>
	<tr>
	<td style="border:0" align="center"><span class="style2"><%=message %></span></td>
	</tr>
  <tr>
    <td>
  <form action="UserCreationProcess.jsp" method="post" enctype="application/x-www-form-urlencoded"  onsubmit="return validateForm(this)">
  			  <table width="100%" border="1" align="right" cellpadding="0" cellspacing="0" background="images/table-background.gif">
                         
                <tr>
                  <td colspan="4"><div align="center">Username and Password are Automatically generated </div></td>
                </tr>
                <tr>
                  <td colspan="2"><div align="right">Full Name *: </div></td>
                  <td colspan="2"><div align="left">
                    <input name="txt_name" type="text" id="txt_name" maxlength="20" />
                  </div></td>
                </tr>
                    <tr>
                  <td colspan="2"><div align="right">Email Address * : </div></td>
                  <td colspan="2"><div align="left">
                    <input name="txt_email" type="text" id="txt_email" maxlength="40" />
                   
                  </div></td>
                </tr>
                <tr>
                  <td colspan="2"><div align="right">Date of Birth (mm/dd/yyyy) * : </div></td>
                  <td colspan="2"><div align="left">
                      <input name="txt_dob" type="text" maxlength="10" />
                  </div></td>
                </tr>
               <tr>
                  <td colspan="2"><div align="right">Mobile Number * </div></td>
                  <td colspan="2"><div align="left">
                    <label></label>
                    <input name="txt_mob" type="text" id="txt_mob" maxlength="10" />
                  </div></td>
                </tr>
                <tr>
                  <td colspan="2">
                    <div align="center">Enter Account Numbers (seperated by commas): </div></td>
                  <td colspan="2"><textarea name="txt_accno" rows="4"></textarea></td>
                </tr>

                <tr>
                  <td width="111">&nbsp;</td>
                  <td width="134">
                    <div align="center">
                      <input type="submit" name="Submit" value="Submit" />                  
                    </div></td>
                  <td width="160">
                    <div align="center">
                      <input type="reset" name="Submit2" value="Reset" />                  
                    </div></td>
                  <td width="106">&nbsp;</td>
                </tr>
              </table>
	  </form>
	</td>
  </tr>
</table>
<table width="27%" border="0" align="left" cellpadding="5" cellspacing="0">
  <tr>
    <td> <div align="center"><a href="AddUser.jsp">Add User </a></div></td>
  </tr>
  <tr>
    <td> <div align="center"><a href="RemoveUser.jsp">Remove User</a></div></td>
  </tr>
	</table>
	</div>
	</div>
<jsp:include page="footer.jsp" />
</body>
</html>