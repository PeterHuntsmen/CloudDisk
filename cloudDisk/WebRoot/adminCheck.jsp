<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<jsp:useBean id="check" class="controller.checkAdmin"/>
<%
	request.setCharacterEncoding("gbk");
	String adminName=request.getParameter("adminName");
	String adminPassword=request.getParameter("adminPassword");
	String loginMessage=check.checkLogin(adminName, adminPassword);
	if(loginMessage.equals("Login Success"))
	{
		session.setAttribute("admin", adminName);
		response.sendRedirect("admin.jsp");
	}
	else if(loginMessage.equals("Wrong Password"))
	{
		out.println("用户名或密码错误！");
	}
	else if(loginMessage.equals("No such user"))
	{
		out.println("用户不存在！");
	}
 %>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="styles.css">
  </head>
  
  <body>
    <a href="admin_login.jsp">返回</a>
  </body>
</html>
