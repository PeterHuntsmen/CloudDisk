<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<jsp:useBean id="check" class=controller.checkLogin></jsp:useBean>
<%
	request.setCharacterEncoding("gbk");
	String userName=request.getParameter("userName");
	String userPassword=request.getParameter("userPassword");
	String loginMessage=check.checkLogin(userName,userPassword);
	if(loginMessage.equals("Login Succcess"))
	{
		session.setAttribute("user", userName);
		response.sendRedirect("welcome.jsp");
	}
	else if(loginMessage.equals("Wrong Password"))
	{
		out.print("密码输入错误！");
	}
	else if(loginMessage.equals("No such user"))
	{
		out.print("无此用户！");	
	}
 %>
<html>
	
  <head>
    <link rel="stylesheet" type="text/css" href="styles.css">
  </head>
  
  <body>
    <a href=login.jsp>返回</a>
  </body>
</html>
