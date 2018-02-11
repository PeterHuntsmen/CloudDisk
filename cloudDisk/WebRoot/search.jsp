<%@ page language="java" import="java.util.*,java.sql.*,dbutil.*" pageEncoding="gbk"%>
<%
	//检查管理员是否登录
    String admin_id = (String)session.getAttribute("admin");
    if (null==admin_id || admin_id.equals("")) 
    {
		out.print("<script language='javascript'>alert('请先登录系统！');window.location = 'admin_login.jsp';</script>");        
    }
%>

<html>
	<head>
		<title>欢迎使用网络硬盘后台系统！</title>
		<%
			String user=request.getParameter("userName");
			DBHelper.createConnection();
			String sql="select * from userinfo where userName='"+user+"'";
			ResultSet rs=DBHelper.executeQuery(sql);
		%>
		<link rel="stylesheet" type="text/css" href="styles.css">
	</head>
  
	<body>
		<form action="search.jsp" method="get">
			<h3>请输入所要查找用户的用户名:</h3>
			<center>
				<input type="text" name=userName>
				<input type="submit" value="查找">
			</center>
		</form>
		<a href="register.jsp">
			新增
		</a></br>
		<a href="admin.jsp">
			返回
		</a></br>
		<hr>
		<table style="border-style:solid";align="center">
			<tr align="center">
				<td>用户名：</td>
				<td>密 码：</td>
			</tr>
			<tr>
				<%
					while(rs.next())
					{
				%>
				<td><%=rs.getString("userName") %></td>
				<td><%=rs.getString("userPassword") %></td>
				<td>
					<a href="userDelete.jsp?id=<%=rs.getString("id") %>">删除</a>
					<a href="userEdit.jsp?id=<%=rs.getString("id")%>">编辑</a>
				</td>
				<%
					}
				%>
			</tr>
		</table>
	</body>
</html>
