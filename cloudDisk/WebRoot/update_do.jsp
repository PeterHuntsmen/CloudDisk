<%@ page language="java" import="java.util.*,java.sql.*,dbutil.DBHelper" pageEncoding="gbk"%>
<%
	//�����ͨ�û��Ƿ��¼
    String id = (String)session.getAttribute("user");
    if (null==id || id.equals("")) {
        out.print("<script language='javascript'>alert('���ȵ�¼ϵͳ��');window.location = 'login.jsp';</script>");
        
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
	<title>�û��޸�</title>
	<link rel="stylesheet" type="text/css" href="styles.css">
	
  </head>
  
  <body>
    	�޸ĳɹ���<br/>
		<a href="welcome.jsp">�������</a>
  </body>
</html>
