<%@ page language="java" import="java.util.*,com.jspsmart.upload.*,java.sql.*,java.io.*,service.*" pageEncoding="gbk"%>
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
	
	//利用BufferedInputStream和BufferedOutputStream进行输入输出
	java.io.BufferedInputStream bis=null;
	java.io.BufferedOutputStream  bos=null;
	try
	{
		String filename=request.getParameter("filename");
		filename=new String(filename.getBytes("iso8859-1"),"gb2312");	//将"iso8859-1"强制转换为"gb2312"
		response.setContentType("application/x-msdownload");
		response.setHeader("Content-disposition","attachment; filename="+new String(filename.getBytes("gb2312"),"iso8859-1"));
		bis =new java.io.BufferedInputStream(new java.io.FileInputStream(config.getServletContext().getRealPath("box/"+id+"/" + filename)));
		bos=new java.io.BufferedOutputStream(response.getOutputStream()); 
		byte[] buff = new byte[2048];
		int bytesRead;
 		while(-1 != (bytesRead = bis.read(buff, 0, buff.length))) 
 		{
			bos.write(buff,0,bytesRead);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally 
	{
		if (bis != null)
			bis.close();	//关闭bis和bos
		if (bos != null)
			bos.close();
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
	<link rel="stylesheet" type="text/css" href="styles.css">
  </head>
  
  <body>
    
  </body>
</html>
