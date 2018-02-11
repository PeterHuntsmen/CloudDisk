<%@ page language="java" import="java.util.*,java.sql.*,dbutil.*" pageEncoding="gbk"%>
<%
	//检查普通用户是否登录
	String id = (String)session.getAttribute("user");
    if (null==id || id.equals("")) {
        out.print("<script language='javascript'>alert('请先登录系统！');window.location = 'login.jsp';</script>");
        
    }
%>
<%
	ResultSet rs=null;
	boolean isEdit=false;
	String user=request.getParameter("userName");
	user=new String(user.getBytes("ISO-8859-1"),"gbk");
	DBHelper.createConnection();
	String sql="select * from userInfo where userName='"+user+"'";
	rs=DBHelper.executeQuery(sql);
	if(rs.next())
	{
		isEdit=true;
	}
 %>
<html>
  <head>
    <title>用户密码修改</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    
  </head>
  
  <body>
    <font color="#ff0000">
    	<strong>请牢记修改后的密码</strong>
    </font>
    <form id="studentForm" action="update_do.jsp">
    	<input type="hidden" name="isEdit" value="<%=isEdit %>"/>
    	<input type="hidden" id="id" value="<%=(isEdit?rs.getString("id"):"") %>"/>
    	用户名：<input type="text" name="userName" value="<%=user %>"/><br>
    	密码：<input type="text" name="userPassword" value="<%=(isEdit?rs.getString("userPassword"):"") %>"/><br/>
    	<input type="submit" value="提交"/>
    	<a href="welcome.jsp">返回</a>
    </form>
  </body>
</html>
