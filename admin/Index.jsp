<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
if(null==session.getAttribute("aname"))
	response.sendRedirect("session.htm");
session.setMaxInactiveInterval(600); 
String message=request.getParameter("r");
if(message==null)
	message="";
else
	message="Check Account Numbers";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<jsp:include page="header.jsp" />
<div id="container">
	<div id="content-container" align="center">
	<h2>Welcome Administrator</h2>
	</div>
	</div>
</body>
</html>