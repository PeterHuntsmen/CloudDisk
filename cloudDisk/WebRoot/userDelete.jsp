<%@ page language="java" import="java.util.*,java.sql.*,dbutil.*" pageEncoding="gbk"%>
<%
	
    String admin_id = (String)session.getAttribute("admin");
    if (null==admin_id || admin_id.equals("")) 
    {
        out.print("<script language='javascript'>alert('���ȵ�¼ϵͳ��');window.location = 'admin_login.jsp';</script>");        
    }
    //������Ա�Ƿ��¼
    
    String id=request.getParameter("id");
    DBHelper.createConnection();
    String sql="delete from userinfo where id="+id;
    DBHelper.executeQuery(sql);
%>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="styles.css">
	</head>
  
	<body>
		ɾ���ɹ���<br/>
		<a href="admin.jsp">�������</a>
	</body>
</html>
