<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="SQLBean.DbBean" scope="request" />
<jsp:setProperty name="db" property="*" />
<% 
String username=request.getParameter("username");
String password=request.getParameter("password");
String olduname=(String)session.getAttribute("username");
db.connect();
db.autoCommit(false);
int i=db.updateSQL("update login_info set uname='"+username+"' , pwd='"+password+"', status='p' where uname='"+olduname+"'");
int j=db.updateSQL("update acholder_info set uname='"+username+"' where uname='"+olduname+"'");
db.commit();
db.close();
if(i!=0&&j!=0)
{
session.setAttribute("username",username);
String url =response.encodeRedirectURL("SetProfileFirst.jsp");  
response.sendRedirect(url);
}
else
response.sendRedirect("session.htm");

%>