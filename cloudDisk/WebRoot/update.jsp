<%@ page language="java" import="java.util.*,java.sql.*,dbutil.*" pageEncoding="gbk"%>
<%
	//�����ͨ�û��Ƿ��¼
	String id = (String)session.getAttribute("user");
    if (null==id || id.equals("")) {
        out.print("<script language='javascript'>alert('���ȵ�¼ϵͳ��');window.location = 'login.jsp';</script>");
        
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
    <title>�û������޸�</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    
  </head>
  
  <body>
    <font color="#ff0000">
    	<strong>���μ��޸ĺ������</strong>
    </font>
    <form id="studentForm" action="update_do.jsp">
    	<input type="hidden" name="isEdit" value="<%=isEdit %>"/>
    	<input type="hidden" id="id" value="<%=(isEdit?rs.getString("id"):"") %>"/>
    	�û�����<input type="text" name="userName" value="<%=user %>"/><br>
    	���룺<input type="text" name="userPassword" value="<%=(isEdit?rs.getString("userPassword"):"") %>"/><br/>
    	<input type="submit" value="�ύ"/>
    	<a href="welcome.jsp">����</a>
    </form>
  </body>
</html>
