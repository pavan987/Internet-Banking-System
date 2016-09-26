<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="SQLBean.DbBean" scope="request" />
<jsp:setProperty name="db" property="*" />
<%! String message;
String url;
%>
<%
if(null==session.getAttribute("username"))
	response.sendRedirect("session.htm");
session.setMaxInactiveInterval(300); 
String uname=(String)session.getAttribute("username");
String password=request.getParameter("password");
String que=request.getParameter("que");
String ans=request.getParameter("ans");
db.connect();
ResultSet rs=db.execSQL("select pwd from login_info where uname='"+uname+"' ");
rs.next();
String password1=rs.getString(1);
if(password.equals(password1))
{
message="Profile Password And Login Password shouln't be same";
url="SetProfileFirst.jsp";
}
else
{
int i=db.updateSQL("update login_info set status='a',profilepwd='"+password+"',que='"+que+"',ans='"+ans+"' where uname='"+uname+"'");
db.close();
if(i!=0)
	url="Accounts.jsp";
else
	url="session.htm";
}
if(url.equals("SetProfileFirst.jsp")){ %>
<jsp:forward page="SetProfileFirst.jsp">
<jsp:param name="message" value="<%=message%>" />
</jsp:forward>
<% }
else
response.sendRedirect(url);
%>

