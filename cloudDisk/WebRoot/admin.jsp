<%@ page language="java" import="java.sql.*,dbutil.DBHelper" pageEncoding="gbk"%>
<html>
  <head>
    <title>��ӭʹ������Ӳ�̺�̨ϵͳ��</title>
	
  </head>
  <link rel="stylesheet" type="text/css" href="styles.css">
  <body>
    <form action="search.jsp" method ="get">
    	<h3>��������ҵ��û�����</h3>
    	<center>
    		<input type="text" name="userName">
    		<input type="submit" value="����">
    	</center>
    </form>
    <a href="register.jsp">����</a>
    <br>
    <br>
    <a href="logout.jsp">�˳���¼</a><br>
    <hr>
    <table style="border-style:solid;"align="center">
    	<tr align="center">
    		<td>�û�����</td>
    		<td>���룺</td>
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
    			<a href="user_del.jsp?id=<%= rs.getString("id") %>">ɾ��</a>
    			<a href="user_edit.jsp?id=<%=rs.getString("id") %>">�༭</a> 
    		</td>
    	</tr>
    	<% } %>
    </table>
  </body>
</html>
