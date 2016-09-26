<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Secure Login</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
<script type="text/javascript" src="eBankscripts/virtualkb.js"></script>
<script type="text/javascript" src="eBankscripts/login.js"></script>
<script type="text/javascript">
window.history.forward();
function init()
{
document.getElementById("userName").focus();
constructKeyboard();
}
</script>
</head>
<body onLoad="init();">
<% String message=request.getParameter("message");
if(message==null)
	message="";
%>
<jsp:include page="header.jsp"></jsp:include>
<div id="container">
  <div id="content-container">
 
<div id="logonBodyContent">
<form name="loginForm" method="post" action="loginSubmit.jsp">
<table align="center">
<tr>
<td><span class="style2"><%=message%></span></td></tr></table>
  <table width="100%" border="2" cellpadding="10" cellspacing="0" bordercolor="#333333">
     <tr>
      <td style="border:0;" colspan="2">
	  <table width="100%" border="0" align="center" cellpadding="5" cellspacing="0">
          <tr>
            <td width="58%" class="vkb_aligntop" >
			    <table width="100%"  border="0" align="left" cellpadding="0" cellspacing="0" class="vkb_tbl">
                  <tr>
                    <td colspan="2">to access your accounts... </td>
                  </tr>
                  <tr>
                    <td colspan="2"><span class="style1">Login to SB</span> </td>
                  </tr>
                  <tr>
                    <td>User Name : </td>
                    <td><input type="text" id="userName" name="uname" autocomplete="off" onfocus="getFocus(this.id);" onCut="return false" onCopy="return false" onPaste="return false" onKeyPress="return disableCtrlKeyCombination(event);" onKeyDown="return disableCtrlKeyCombination(event);" /></td>
                  </tr>
                  <tr>
                    <td>Password:</td>
                    <td><input type="password" id="password" name="pwd" autocomplete="off" onfocus="getFocus(this.id);" onCut="return false" onCopy="return false" onPaste="return false"  /></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td><input id="chkbox" type="checkbox" name="checkbox" value="checkbox" onClick="constructKeyboard()"/>
                      Enable Virtual Keyboard </td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td><input type="submit" name="Submit" value="Submit" onclick="return submitLogin();" />
                    <input type="reset" name="reset" title="reset" value="Reset" onclick="constructKeyboard(false)"/></td>
                  </tr>
              </table></td>
				<td width="42%" class="vkb_aligntop" ><table class="vkb_content">
                  <tr>
                    <td class="kbd_heading">Online Virtual Keyboard </td>
                  </tr>
                  <tr>
                    <td><span id='kbplaceholder'></span></td>
                  </tr>
                </table>
				</td>
          </tr>
        </table>
      </td>
    </tr>
          <tr>
            <td style="border:0;" colspan="2"><table width="80%" border="0" align="center" cellpadding="3" cellspacing="0">
                <tr>
                  <td><strong><span class="style3">Important:</span> Secure Bank or any of its   representatives never sends you email/SMS or calls you over phone to get   your personal information, password or one time SMS (high security)   password. Any such e-mail/SMS or phone call is an attempt to   fraudulently withdraw money from your account through Internet Banking.   Never respond to such email/SMS or phone call. Please report immediately   on <strong>report.phishing@sbi.co.in</strong> if you receive any such email/SMS   or Phone call. Change your passwords immediately if you have   accidentally revealed your credentials.</strong></td>
                </tr>
                <tr>
                  <td ><a href="PasswordManagement.jsp">Password Management</a> | </td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td style="border:0;" colspan="2"><table width="80%" border="2" align="center" cellpadding="3" cellspacing="0">
                <tr>
                  <td style="border:0;">Note:</td>
                </tr>
                <tr>
                  <td style="border:0;" class="notecls"><ul>
                      <li> Mandatory fields are marked with an asterisk (*)</li>
                    <li>Do not provide your username and password anywhere other than in this page</li>
                    <li>Your user name and password are highly confidential. Never part with them.SB will never ask for this Information</li>
                  </ul></td>
                </tr>
            </table></td>
          </tr>
  </table>
</form>
</div>
  </div>
</div>
<jsp:include page="footer.htm"></jsp:include>
</body>
</html>