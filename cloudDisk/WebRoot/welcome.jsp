<%@ page language="java" import="java.util.*,java.sql.*,java.io.*,service.config" pageEncoding="gbk"%>

<% 
	//检查普通用户是否登录
    String id = (String)session.getAttribute("user");
    if (id==null||id.equals("")) 
    {
        out.print("<script language='javascript'>alert('请先登录系统！');window.location = 'login.jsp';</script>");
    }
    //获取程序文件夹的绝对路径
	String dirPath=application.getRealPath(request.getRequestURI());
	dirPath=dirPath.substring(0,dirPath.lastIndexOf('\\')+1);
	dirPath=dirPath.substring(0,dirPath.lastIndexOf('\\'));
	dirPath=dirPath.substring(0,dirPath.lastIndexOf('\\')+1);
	
	
	//当用户登入此页时，到根目录box目录新建一个以此用户名为命名的目录
	String Save_Location=getServletContext().getRealPath("/")+"box//";
    try
    {
		if (!(new java.io.File(Save_Location).isDirectory())) //如果文件夹不存在
		{
			new java.io.File(Save_Location).mkdir();      //不存在 文件夹，则建立此文件夹
			new java.io.File((Save_Location)+id+"//").mkdir();    //创建文件夹,命名为当前用户的名字
    	}
		else  //存在excel文件夹，则直接建立此文件夹   
		{ 
			new java.io.File((Save_Location)+id+"//").mkdir();      //创建文件夹,命名为当前用户的名字
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();        //创建文件夹失败   
		out.print("error");
		return;
    }
    File userBox=new File((Save_Location)+id+"//");
    File userBoxfile[]=userBox.listFiles();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>欢迎使用网络硬盘</title>

		<link rel="stylesheet" type="text/css" href="styles.css">
	</head>
<body>

		<br/>
	<table width="809" height="204" border="1" align="center">
		<tr>
			<td height="26" align="left">
				<font color="red">欢迎<%=session.getAttribute("user")%>的到来！</font>
				<font color="#0000ff"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</font>
				 	&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
				 	<a href="update.jsp?userName=<%=session.getAttribute("user")%>">修改密码</a>
				 	<a href="logout.jsp">退出登录</a>
					<br>
		    </td>
	    </tr>
		<tr>
			<td height="58" align="left" valign="top">
			<a href="box_upload.jsp">
				<img src="images/box-upload.jpg" width="131" height="45">
			</a>
				<% for(int i=0;i<userBoxfile.length;i++){%>
		<tr>
			<td height="22">
				<p>
					<font color="#FF00FF"><%=userBoxfile[i].getName()%></font>
				</p>
			</td>
			<td height="25">
				<span style="font-size: 9pt">
					<a href="box_download.jsp?filename=<%=userBoxfile[i].getName()%>" target=_top>
						<font color="#0A9EE4">下载</font>
					</a>
				</span>
			</td>
			<td height="25">
				<span style="font-size: 9pt">
					<a href="box_del.jsp?action=confirm&filename=<%=userBoxfile[i].getName()%>" target=_top>
						<font color="#0A9EE4">删除</font>
					</a>
				</span>
			</td>	
		</tr>
		<% } %>
		<tr align="center">
			<td height="26" align="center">&nbsp; 
				<font color="#c0c0c0"> 版本信息：上海电力学院刘水</font>
			</td>
		</tr>
    </table>


	</body>
</html>
