<%@ page language="java" import="java.sql.*,dbutil.DBHelper" pageEncoding="gbk"%>
<html>
  <head>
    <title>欢迎使用网络硬盘后台系统！</title>
	
  </head>
  <link rel="stylesheet" type="text/css" href="styles.css">
  <body>
    <form action="search.jsp" method ="get">
    	<h3>请输入查找的用户名：</h3>
    	<center>
    		<input type="text" name="userName">
    		<input type="submit" value="查找">
    	</center>
    </form>
    <a href="register.jsp">新增</a>
    <br>
    <br>
    <a href="logout.jsp">退出登录</a><br>
    <hr>
    <table style="border-style:solid;"align="center">
    	<tr align="center">
    		<td>用户名：</td>
    		<td>密码：</td>
    	</tr>
    	<%
		DBHelper.createConnection();
		String sql="select * from userinfo";
		ResultSet rs=DBHelper.executeQuery(sql);
		while(rs.next()) { %>
    	<tr>
    		<td><%=rs.getString("userName") %></td>
    		<td><%=rs.getString("userPassword") %></td>
    		<td>
    			<a href="user_del.jsp?id=<%= rs.getString("id") %>">删除</a>
    			<a href="user_edit.jsp?id=<%=rs.getString("id") %>">编辑</a> 
    		</td>
    	</tr>
    	<% } %>
    </table>
  </body>
</html>
