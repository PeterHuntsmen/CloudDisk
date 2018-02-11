<%@ page language="java" import="java.util.*,java.sql.*,dbutil.*" pageEncoding="gbk"%>
<%
	
    String admin_id = (String)session.getAttribute("admin");
    if (null==admin_id || admin_id.equals("")) 
    {
        out.print("<script language='javascript'>alert('请先登录系统！');window.location = 'admin_login.jsp';</script>");        
    }
    //检查管理员是否登录
    
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
		删除成功！<br/>
		<a href="admin.jsp">点击返回</a>
	</body>
</html>
