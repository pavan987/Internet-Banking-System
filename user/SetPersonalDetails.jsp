<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="SQLBean.DbBean" scope="request" />
<jsp:setProperty name="db" property="*" />
<%! 
String url;
%>
<% 
if(null==session.getAttribute("username"))
	response.sendRedirect("session.htm");
String uname=(String)session.getAttribute("username");
String name=request.getParameter("displayName");
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");
db.connect();
int i=db.updateSQL("update login_info set name='"+name+"',email='"+email+"',mob="+mobile+" where uname='"+uname+"'");
db.close();
if(i!=0)
{
	session.setAttribute("name",name);
	response.sendRedirect("ProfileMessage.jsp");
}
else
{
%>
<jsp:forward page="ConfirmPasswordPersonalDetails.jsp">
<jsp:param name="message" value="Check the values again"/>
</jsp:forward>
<%} %>	



