<%@ page language="java" import="java.util.*,java.sql.*,dbutil.*" pageEncoding="gbk"%>
<%
	//������Ա�Ƿ��¼
    String admin_id = (String)session.getAttribute("admin");
    if (null==admin_id || admin_id.equals("")) 
    {
		out.print("<script language='javascript'>alert('���ȵ�¼ϵͳ��');window.location = 'admin_login.jsp';</script>");        
    }
%>

<html>
	<head>
		<title>��ӭʹ������Ӳ�̺�̨ϵͳ��</title>
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
			<h3>��������Ҫ�����û����û���:</h3>
			<center>
				<input type="text" name=userName>
				<input type="submit" value="����">
			</center>
		</form>
		<a href="register.jsp">
			����
		</a></br>
		<a href="admin.jsp">
			����
		</a></br>
		<hr>
		<table style="border-style:solid";align="center">
			<tr align="center">
				<td>�û�����</td>
				<td>�� �룺</td>
			</tr>
			<tr>
				<%
					while(rs.next())
					{
				%>
				<td><%=rs.getString("userName") %></td>
				<td><%=rs.getString("userPassword") %></td>
				<td>
					<a href="userDelete.jsp?id=<%=rs.getString("id") %>">ɾ��</a>
					<a href="userEdit.jsp?id=<%=rs.getString("id")%>">�༭</a>
				</td>
				<%
					}
				%>
			</tr>
		</table>
	</body>
</html>
