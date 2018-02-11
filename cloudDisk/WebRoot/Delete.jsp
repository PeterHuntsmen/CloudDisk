<%@ page language="java" import="java.util.*,java.sql.*,java.io.*,service.config" pageEncoding="gbk"%>
<%
	//检查普通用户是否登录
    String id = (String)session.getAttribute("user");
    if (null==id || id.equals("")) 
    {
        out.print("<script language='javascript'>alert('请先登录系统！');window.location = 'login.jsp';</script>");
        
    }
    //获取程序文件夹的绝对路径

	String dirPath=application.getRealPath(request.getRequestURI());
	dirPath=dirPath.substring(0,dirPath.lastIndexOf('\\')+1);
	dirPath=dirPath.substring(0,dirPath.lastIndexOf('\\'));
	dirPath=dirPath.substring(0,dirPath.lastIndexOf('\\')+1);

	String cqutroot=dirPath.replace("\\", "/");//将dirPath的"\\"全替换为"/"
	try
	{
		//替换为中文字符
		
		String filename=service.config.codeToString(request.getParameter("filename"));
		String action=service.config.codeToString(request.getParameter("action"));
		if(filename==null)
		{
			out.print("<script> alert('filename错误');location.href='welcome.jsp';</script>");
		}
		if(action==null)
		{
			out.print("<script> alert('action错误');location.href='box.jsp';</script>");
			
		}
		action=request.getParameter("action");
		if(action.equals("del"))
		{
			File deleteFile=new File(cqutroot+"box/"+id+"/"+filename);
			deleteFile.delete();
			out.print("<script>alert('删除成功！');location.href='welcome.jsp';</script>");
		}
		if(action.equals("confirm"))
		{
%>

<html>
	<title>确认删除文件？</title>
	<link rel="stylesheet" type="text/css" href="styles.css">
	<head>
	
	</head>
  
	<body>
    	<table width="650" height="350" border="1" align="center">
    		<tr>
    			<td>
    				<p align="center">
    					<font color="#FF0000">
    						<strong>确认删除<%=filename%>？</strong>
    					</font>
    				</p>
    			</td>
    		</tr>
    		<tr>
    			<td>
    				<div align="center">
    					<input type="button" value="提交" name="B1" onClick="javascript:location.href='Delete.jsp?action=del&filename=<%=filename%>';">
    					&nbsp;&nbsp;&nbsp;&nbsp;
    					<input type="button" value="返回" name="B2" onClick="javascript:location.href='welcome.jsp';">
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