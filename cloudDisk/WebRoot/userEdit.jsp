<%@ page language="java" import="java.util.*,java.sql.*,dbutil.*" pageEncoding="gbk"%>
<%
	//������Ա�Ƿ��¼
    String admin_id = (String)session.getAttribute("admin");
    if (null==admin_id || admin_id.equals("")) 
    {
		out.print("<script language='javascript'>alert('���ȵ�¼ϵͳ��');window.location = 'admin_login.jsp';</script>");    
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
	    <title>�û������޸�</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	</head>
  
	<body>
		<form id="studentForm" action="userSave.jsp">
			<input type="hidden" name="isEdit" value=<%=isEdit %>/>
			ID:<input type="text" id="id" value="<%=(isEdit?rs.getString("id"):"")%>"/><br>
			�û�����<input type="text" id="id" name="id" value=<%=(isEdit?rs.getString("userName"):"")%>/><br>
			���룺<input type="text" name="userPassword" value="<%=(isEdit?rs.getString("userPassword"):"")%>"/><br>
			<input type="submit" value="�ύ"/>
		</form>
	</body>
</html>
