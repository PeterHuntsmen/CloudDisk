<%@ page language="java" import="java.util.*,java.sql.*,service.config" pageEncoding="gbk"%>
<html>
	<%	//�����ͨ�û��Ƿ��¼
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
	%>
	
	<script language="Javascript">
		extArray=new array(".rar",".zip","txt");
		function LimitAttach(form,file)
		{
			allowSubmit=false;
			if(!file)
				return;
			while(file.indexOf("\\")!=-1)
			{
				file=file.slice(file.indexOf("\\")+1);
				ext=file.slice(file.indexOf(".")).toLowerCase();
			}
			for(var i=0;i<extArray.length;i++)
			{
				if(extArray[i]==ext)
				{
					allowSubmit=true;
					break;
				}
				if(allowSubmit)
					form.submit();
				else
					alert("�Բ���ֻ���ϴ����¸�ʽ���ļ�:  " + (extArray.join("  ")) + "\n������ѡ������������ļ�"+"���ϴ�.");
			}
		}
		/*
		��֤��С����Ƿ�����ϴ�
		*/
		var isIE=/msie/i.test(navigator.userAgent)&&!window.opera;
		function fileChange(target)
		{
			var fileSize=0;
			if(isIE&&!target.files)
			{
				var filePath=target.value;
				var fileSystem=new ActiveObject("Scripting.FileSystemObject");
				var file=fileSystem.GetFile(filePath);
				fileSize=file.Size;
			}
			else
			{
				fileSize=target.files[0].size;
			}
			var size=fileSize/1024;
			if(size>5000)
			{
				alert("�������ɴ���5M");
			}
		}
	</script>
	<link rel="stylesheet" type="text/css" href="styles.css">
	<head>
	</head>
	<body>
    	<div align="center">
    		�ļ��ϴ�
    	</div>
    	<table width="810" height="240" border="1" align="center">
    		<tr>
    			<td ailgn="center">
    				<form method="post" name="upform" action="upload_do.jsp" enctype="multipart/form-data">
    					<input type="file" name="uploadFile" onchange="fileChange(this);"/>
    					<p>
    						<input type="button" name="Submit" value="�ϴ�" onClick="LimitAttach(this.form, this.form.uploadfile.value)"/>
    					</p>
    				</form>
    			</td>
    		</tr>
    		<tr>
    			<td align="center">
    				<table cellspacing="0" cellpadding="0">
    					<tr>
    						<td height="16">
    							<p>
    								<font color="#FF0000">
    									˵����</br>
    									1�����ϴ����ɹ涨���ļ���<br/> 
          								2��Ϊ�˰�ȫ�����ֻ�����ϴ�rar��zipѹ�����ļ����������ϴ���rar��zip�ļ�ǰ�����������ϴ���<br/> 
          								3�������ļ��������Ϊ5MB
    								</font>
    							</p>
    						</td>
    					</tr>
    				</table>
    			</td>
    		</tr>
    	</table>
	</body>
</html>
