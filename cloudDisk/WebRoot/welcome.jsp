<%@ page language="java" import="java.util.*,java.sql.*,java.io.*,service.config" pageEncoding="gbk"%>

<% 
	//�����ͨ�û��Ƿ��¼
    String id = (String)session.getAttribute("user");
    if (id==null||id.equals("")) 
    {
        out.print("<script language='javascript'>alert('���ȵ�¼ϵͳ��');window.location = 'login.jsp';</script>");
    }
    //��ȡ�����ļ��еľ���·��
	String dirPath=application.getRealPath(request.getRequestURI());
	dirPath=dirPath.substring(0,dirPath.lastIndexOf('\\')+1);
	dirPath=dirPath.substring(0,dirPath.lastIndexOf('\\'));
	dirPath=dirPath.substring(0,dirPath.lastIndexOf('\\')+1);
	
	
	//���û������ҳʱ������Ŀ¼boxĿ¼�½�һ���Դ��û���Ϊ������Ŀ¼
	String Save_Location=getServletContext().getRealPath("/")+"box//";
    try
    {
		if (!(new java.io.File(Save_Location).isDirectory())) //����ļ��в�����
		{
			new java.io.File(Save_Location).mkdir();      //������ �ļ��У��������ļ���
			new java.io.File((Save_Location)+id+"//").mkdir();    //�����ļ���,����Ϊ��ǰ�û�������
    	}
		else  //����excel�ļ��У���ֱ�ӽ������ļ���   
		{ 
			new java.io.File((Save_Location)+id+"//").mkdir();      //�����ļ���,����Ϊ��ǰ�û�������
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();        //�����ļ���ʧ��   
		out.print("error");
		return;
    }
    File userBox=new File((Save_Location)+id+"//");
    File userBoxfile[]=userBox.listFiles();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>��ӭʹ������Ӳ��</title>

		<link rel="stylesheet" type="text/css" href="styles.css">
	</head>
<body>

		<br/>
	<table width="809" height="204" border="1" align="center">
		<tr>
			<td height="26" align="left">
				<font color="red">��ӭ<%=session.getAttribute("user")%>�ĵ�����</font>
				<font color="#0000ff"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</font>
				 	&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
				 	<a href="update.jsp?userName=<%=session.getAttribute("user")%>">�޸�����</a>
				 	<a href="logout.jsp">�˳���¼</a>
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
						<font color="#0A9EE4">����</font>
					</a>
				</span>
			</td>
			<td height="25">
				<span style="font-size: 9pt">
					<a href="box_del.jsp?action=confirm&filename=<%=userBoxfile[i].getName()%>" target=_top>
						<font color="#0A9EE4">ɾ��</font>
					</a>
				</span>
			</td>	
		</tr>
		<% } %>
		<tr align="center">
			<td height="26" align="center">&nbsp; 
				<font color="#c0c0c0"> �汾��Ϣ���Ϻ�����ѧԺ��ˮ</font>
			</td>
		</tr>
    </table>


	</body>
</html>
