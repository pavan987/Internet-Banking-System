<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db" class="SQLBean.DbBean" scope="request" />
<jsp:setProperty name="db" property="*" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Secure Login</title>
<script type="text/javascript">
window.history.forward();
</script>
</head>
<body>
</body>
</html>
<%! String message;
String url;
%>
<% 
java.util.Date date,date1;
url="login1.jsp";
ResultSet rs=null;
db.connect();
String uname = request.getParameter("uname");
String pwd = request.getParameter("pwd");
rs=db.execSQL("select pwd,role,status,loginblock from login_info where uname= '"+uname+"'");
if(rs.next())
{
	
	String pwd1 = rs.getString(1);
	String role = rs.getString(2);
	String status = rs.getString(3);
	String blockdate=rs.getString(4);
	int block=0;
	if(role.equals("user"))
	{
		if(blockdate!=null)
		{
			rs=db.execSQL("SELECT current date FROM sysibm.sysdummy1");
			rs.next();
			date=rs.getDate(1);
			rs=db.execSQL("select loginblock from login_info where uname= '"+uname+"'");
			rs.next();
			date1=rs.getDate(1);
			if(date.compareTo(date1)==0)
			{
				message="You have been locked out for the day because of three invalid attempts during the day. ";
			    block=1;
			}
			 
			else
				db.updateSQL("update login_info set loginblock=null where uname='"+uname+"'");
			
		}
		if(block==0)
		{
		if(pwd.equals(pwd1))
		{
			
			rs=db.execSQL("select name from login_info where uname= '"+uname+"'");
			rs.next();
			String name=rs.getString(1);
		    session.setAttribute("name",name);
		    session.setAttribute("username",uname);
		    if(status.equals("a"))
		     url="user/Accounts.jsp";
		    else if(status.equals("f"))
		     url="user/SetUsernameFirst.jsp";
		    else if(status.equals("p"))
		     url="user/SetProfileFirst.jsp";
		    
		}
		else
		{
			//code for Account locking after 3 wrong attempts
			int c;
			rs=db.execSQL("select loginattempts from login_info where uname='"+uname+"'");
			rs.next();
			c =rs.getInt(1);
			
			if(c==0)
			{
				message="Username/Password Invalid";
				db.updateSQL("update login_info set loginattempts=1 where uname='"+uname+"'");
			}
			else if(c==1)
				{
					message="Note: Your will be locked out for the day on next wrong attempt";
					db.updateSQL("update login_info set loginattempts=2 where uname='"+uname+"'");
				}
			else if(c==2)
				{
					message="You have been locked out for the day because of three invalid attempts during the day. ";
					rs=db.execSQL("SELECT current date FROM sysibm.sysdummy1");
					rs.next();
					date=rs.getDate(1);
					db.updateSQL("update login_info set loginblock='"+date+"',loginattempts=0 where uname='"+uname+"'");
					
				}
		   }
		}
	}
	else if(role.equals("admin"))
	{
		if(pwd.equals(pwd1))
		 {
		session.setAttribute("aname",uname);
		url="admin/Index.jsp";
		 }
		else
			message="Username/Password Invalid";
	}
	
}
else
{
					
	message="Username/Password Invalid";
	
}
 %>
 <% 
 db.close();
 if(url.equals("login1.jsp")){ %>
<jsp:forward page="<%=url%>">
<jsp:param name="message" value="<%=message%>" />
</jsp:forward>
<% }
else
response.sendRedirect(url);
%>
