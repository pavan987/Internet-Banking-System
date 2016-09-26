<%@ page language="java" import="java.sql.*"contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="SQLBean.DbBean" scope="request" />
<jsp:setProperty name="db" property="*" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../css/style.css" type="text/css" />
<title>Transfer Evaluate</title>
</head>
<body>
<%! String message; %>
<% 
String uname=(String)session.getAttribute("username");
message=" Transaction UnSuccessfull<br/>";
int flag=0;
String password=request.getParameter("password");
String fromacc=request.getParameter("fromacc");
String toacc=request.getParameter("toacc");
String amnt=request.getParameter("amount");
int amount=Integer.parseInt(amnt);
ResultSet rs=null;
db.connect();
rs=db.execSQL("select profilepwd from login_info where uname='"+uname+"'");
rs.next();
if(password.equals(rs.getString(1)))
{
rs=db.execSQL("select balance from acholder_info where accno='"+toacc+"'");
if(!rs.next())
	message+="Account Number Doesn't Exist";
else
{
	int tobal=rs.getInt(1);
	rs=db.execSQL("select balance from acholder_info where accno='"+fromacc+"'");
	rs.next();
	int frombal=rs.getInt(1);
	int minbal=500;
	if(frombal>amount)
	{
		frombal=frombal-amount;
		tobal=tobal+amount;
		if(frombal>=minbal)
		{
			db.autoCommit(false);
			db.updateSQL("update acholder_info set balance="+frombal+" where accno='"+fromacc+"'");
			db.updateSQL("update acholder_info set balance="+tobal+" where accno='"+toacc+"'");
			db.updateSQL("insert into trans_info (accno,narration,credit,balance) values('"+toacc+"','Tranfer Fund "+fromacc+"',"+amount+","+frombal+") ");
			db.updateSQL("insert into trans_info (accno,narration,debit,balance) values('"+fromacc+"','Tranfer Fund "+toacc+"',"+amount+","+tobal+") ");
			db.commit();
			flag=1;
			message="Transaction Completed SuccessFully";
		}
		else
			message+="After Transaction Minimum Balance should be greater than 500 Rs";
	}
	else
	 message+="Entered Amount is greater than Balance Amount";

}
}
else
	message+="Profile Password Invalid";
db.close();
%>
<jsp:forward page="transferFunds.jsp">
<jsp:param name="message" value="<%=message%>" />
</jsp:forward>
</body>
</html>