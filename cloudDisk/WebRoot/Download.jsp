<%@ page language="java" import="java.util.*,com.jspsmart.upload.*,java.sql.*,java.io.*,service.*" pageEncoding="gbk"%>
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
	
	//����BufferedInputStream��BufferedOutputStream�����������
	java.io.BufferedInputStream bis=null;
	java.io.BufferedOutputStream  bos=null;
	try
	{
		String filename=request.getParameter("filename");
		filename=new String(filename.getBytes("iso8859-1"),"gb2312");	//��"iso8859-1"ǿ��ת��Ϊ"gb2312"
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
			bis.close();	//�ر�bis��bos
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
