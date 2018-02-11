<%@ page language="java" import="java.util.*,java.sql.*,dbutil.*" pageEncoding="gbk"%>
<%
	//检查管理员是否登录
    String admin_id = (String)session.getAttribute("admin");
    if (null==admin_id || admin_id.equals("")) 
    {
		out.print("<script language='javascript'>alert('请先登录系统！');window.location = 'admin_login.jsp';</script>");    
    }
    String id=request.getParameter("id");
    ResultSet rs=null;boolean isEdit=false;
    if(id!=null)
    {
    	DBHelper.createConnection();
    	String sql="select * from userInfo where id="+id;
    	rs=DBHelper.executeQuery(sql);
    	if(rs.next())
    	{
    		isEdit=true;
    	}
    }
%>
<html>
	<head>
	    <title>用户密码修改</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	</head>
  
	<body>
		<form id="studentForm" action="userSave.jsp">
			<input type="hidden" name="isEdit" value=<%=isEdit %>/>
			ID:<input type="text" id="id" value="<%=(isEdit?rs.getString("id"):"")%>"/><br>
			用户名：<input type="text" id="id" name="id" value=<%=(isEdit?rs.getString("userName"):"")%>/><br>
			密码：<input type="text" name="userPassword" value="<%=(isEdit?rs.getString("userPassword"):"")%>"/><br>
			<input type="submit" value="提交"/>
		</form>
	</body>
</html>
