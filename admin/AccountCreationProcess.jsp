<%@ page language="java" import="java.sql.*"contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="SQLBean.DbBean" scope="request" />
<jsp:setProperty name="db" property="*" />
<%
if(null==session.getAttribute("aname"))
	response.sendRedirect("session.htm");
String name=request.getParameter("txt_name");
String sex=request.getParameter("txt_sex");
String email=request.getParameter("txt_email");
String dob=request.getParameter("txt_dob");
String branch=request.getParameter("txt_branch");
String accno=request.getParameter("txt_accno");
String bal=request.getParameter("txt_bal");
String type=request.getParameter("txt_type");
String addr=request.getParameter("txt_addr");
String city=request.getParameter("txt_city");
String state=request.getParameter("txt_state");
String pin=request.getParameter("txt_pin");
String mob=request.getParameter("txt_mob");
ResultSet rs=null;
int id=0;
db.connect();
	rs=db.execSQL("select max(id) from reg_info");
	if(!rs.next())
		id=0;
	else
		id=rs.getInt(1);
	id=id+1;
	db.autoCommit(true);
String q1="insert into reg_info values("+id+",'"+name+"','"+sex+"','"+email+"','"+dob+"','"+addr+"','"+city+"','"+state+"',"+pin+","+mob+")";
String q2="insert into acholder_info values('"+accno+"',"+id+",'"+name+"','"+type+"',null,'"+branch+"',"+bal+",'a')";
String q3="insert into trans_info (accno,narration,credit,balance) values('"+accno+"','Opening Balance',"+bal+","+bal+")";
db.updateSQL(q1);
db.updateSQL(q2);
db.updateSQL(q3);
db.close();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>create Account</title>
<link rel="stylesheet" href="../css/style.css" type="text/css" />
<script type="text/javascript"">
window.history.forward(0);
</script>
</head>
<body>
<jsp:include page="header.jsp" />
<div id="container">
	<div id="content-container">
		
			<h2 align="center">
				Status </h2>
	        <table width="70%"  border="0" align="center" cellpadding="2" cellspacing="0">
	<tr>
	<td style="border:0" align="center">&nbsp;</td>
	</tr>
	<tr>
	<td style="border:0" align="center"><span class="style2">Account Successfully Created</span></td>
	</tr>
	</table>
	</div>
	</div>
<jsp:include page="footer.jsp" />
</body>
</html>
