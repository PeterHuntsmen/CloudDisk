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
		out.println("�û������������");
	}
	else if(loginMessage.equals("No such user"))
	{
		out.println("�û������ڣ�");
	}
 %>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="styles.css">
  </head>
  
  <body>
    <a href="admin_login.jsp">����</a>
  </body>
</html>
