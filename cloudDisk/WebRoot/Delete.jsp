<%@ page language="java" import="java.util.*,java.sql.*,java.io.*,service.config" pageEncoding="gbk"%>
<%
	//�����ͨ�û��Ƿ��¼
    String id = (String)session.getAttribute("user");
    if (null==id || id.equals("")) 
    {
        out.print("<script language='javascript'>alert('���ȵ�¼ϵͳ��');window.location = 'login.jsp';</script>");
        
    }
    //��ȡ�����ļ��еľ���·��

	String dirPath=application.getRealPath(request.getRequestURI());
	dirPath=dirPath.substring(0,dirPath.lastIndexOf('\\')+1);
	dirPath=dirPath.substring(0,dirPath.lastIndexOf('\\'));
	dirPath=dirPath.substring(0,dirPath.lastIndexOf('\\')+1);

	String cqutroot=dirPath.replace("\\", "/");//��dirPath��"\\"ȫ�滻Ϊ"/"
	try
	{
		//�滻Ϊ�����ַ�
		
		String filename=service.config.codeToString(request.getParameter("filename"));
		String action=service.config.codeToString(request.getParameter("action"));
		if(filename==null)
		{
			out.print("<script> alert('filename����');location.href='welcome.jsp';</script>");
		}
		if(action==null)
		{
			out.print("<script> alert('action����');location.href='box.jsp';</script>");
			
		}
		action=request.getParameter("action");
		if(action.equals("del"))
		{
			File deleteFile=new File(cqutroot+"box/"+id+"/"+filename);
			deleteFile.delete();
			out.print("<script>alert('ɾ���ɹ���');location.href='welcome.jsp';</script>");
		}
		if(action.equals("confirm"))
		{
%>

<html>
	<title>ȷ��ɾ���ļ���</title>
	<link rel="stylesheet" type="text/css" href="styles.css">
	<head>
	
	</head>
  
	<body>
    	<table width="650" height="350" border="1" align="center">
    		<tr>
    			<td>
    				<p align="center">
    					<font color="#FF0000">
    						<strong>ȷ��ɾ��<%=filename%>��</strong>
    					</font>
    				</p>
    			</td>
    		</tr>
    		<tr>
    			<td>
    				<div align="center">
    					<input type="button" value="�ύ" name="B1" onClick="javascript:location.href='Delete.jsp?action=del&filename=<%=filename%>';">
    					&nbsp;&nbsp;&nbsp;&nbsp;
    					<input type="button" value="����" name="B2" onClick="javascript:location.href='welcome.jsp';">
    				</div>
    			</td>
    		</tr>
    	</table>
	</body>
</html>
<% 
	}	
	else
	{
		out.print("<script>location.href='welcome.jsp';</script>");
	}
}
	catch(Exception e)
	{
		out.print("<script>location.href='welcome.jsp';</script>");
	}
%>