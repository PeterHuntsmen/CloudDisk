<%@ page language="java" import="java.util.*,java.sql.*,dbutil.*" pageEncoding="gbk"%>
<%
	//������Ա�Ƿ��¼
    String admin_id = (String)session.getAttribute("admin");
    if (null==admin_id || admin_id.equals("")) 
    {
        out.print("<script language='javascript'>alert('���ȵ�¼ϵͳ��');window.location = 'admin_login.jsp';</script>");       
    }
    String isEdit=request.getParameter("isEdit");
    String id=request.getParameter("id");
    String userName=request.getParameter("userName");
    String userPassword=request.getParameter("userPassword");
    DBHelper.createConnection();
    String sql;
    if(true)
    	sql="update userinfo set userPassword='"+userPassword+"'where id="+id;
    else
    	sql="insert into userinfo (userName,userPassword) values("+userName+",'"+userPassword+"')";
    DBHelper.executeQuery(sql);
%>

<html>
	<head>
    	<title>�û��޸�</title>
    	<link rel="stylesheet" type="text/css" href="styles.css">
	</head>
  
	<body>
		�޸ĳɹ���<br>
		<a href="admin.jsp">������أ�</a>
	</body>
</html>
