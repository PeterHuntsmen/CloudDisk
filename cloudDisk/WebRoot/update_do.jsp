<%@ page language="java" import="java.util.*,java.sql.*,dbutil.DBHelper" pageEncoding="gbk"%>
<%
	//检查普通用户是否登录
    String id = (String)session.getAttribute("user");
    if (null==id || id.equals("")) {
        out.print("<script language='javascript'>alert('请先登录系统！');window.location = 'login.jsp';</script>");
        
    }
    
    String isEdit=request.getParameter("isEdit");
    String id1=request.getParameter("id");
    String userName=request.getParameter("userName");
    String userPassword=request.getParameter("userPasswrod");
    DBHelper.createConnection();
    String sql;
    if(isEdit.equals(true))
    {
    	sql="update userInfo set userPassword='"+userPassword+"'where id="+id1;
    }
    else
    {
    	sql="insert into userInfo(userName,userPassword) values("+userName+","+userPassword+")";
    }
%>

<html>
  <head>
	<title>用户修改</title>
	<link rel="stylesheet" type="text/css" href="styles.css">
	
  </head>
  
  <body>
    	修改成功！<br/>
		<a href="welcome.jsp">点击返回</a>
  </body>
</html>
