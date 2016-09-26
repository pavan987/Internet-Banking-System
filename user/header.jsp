<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Header</title>
<link rel="stylesheet" href="../css/style.css" type="text/css" />
</head>
<body>
<div id="container">
	<div id="header"><img src="../images/logo.gif" alt="SecureBank"  />
	<div align="right" style="color: #660000;font-weight: bold;"=>Welcome Mr.<%= session.getAttribute("name") %></div>
	
	</div>
	<div id="navigation">
		<ul>
			<li><a href="Accounts.jsp">Home</a></li>
			<li><a href="logout.jsp">Logout</a></li>
		</ul>
		</div>
		<div id="navigation1">
		<ul>
			<li><a href="Accounts.jsp">My Accounts</a></li>
			<li><a href="AccountStatements.jsp">Statements</a></li>
			<li><a href="transferFunds.jsp">Transfer Funds</a></li>
			<li><a href="ProfileLandingPage.jsp">Profile</a></li>
			<li><a href="Enquiry.jsp">Enquiry</a></li>
			<li><a href="ChequeBook.jsp">Requests</a></li>
		</ul>
		</div>
	</div>
</body>
</html>