<%@ page language="java" import="java.util.*,controller.*" pageEncoding="gbk"%>
<jsp:useBean id="check" class="controller.checkLogin"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>注册</title>
	<link rel="stylesheet" type="text/css" href="styles.css">
  </head>
  
  <body>
    <%
    	request.setCharacterEncoding("gbk");
    	String username=request.getParameter("userName");
    	String userpassword=request.getParameter("userPassword");
    	String loginMessage=check.checkLogin(username,userpassword);
    	if(loginMessage.equals("Login Success"))
    	{
    		out.print("success");
    	}
    	else if(loginMessage.equals("Wrong Password"))
    	{
    		out.print("fail");
    	}
    	else if (loginMessage.equals("No such user"))
    	{
    		boolean sf=check.saveToDatabase(username, userpassword);
    		if(sf)
    		{
    			out.print("注册成功");
    			%>
    			<br>
    			<a href="login.jsp">返回登陆</a>
    			<%
    		}
    	}
    	else
    	{
    		out.print("用户名已存在，请重新注册");
    	}
     %>
  </body>
</html>
