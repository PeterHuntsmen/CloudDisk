<%@ page language="java" import="java.util.*,java.sql.*,service.config" pageEncoding="gbk"%>
<html>
	<%	//检查普通用户是否登录
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
					alert("对不起，只能上传以下格式的文件:  " + (extArray.join("  ")) + "\n请重新选择符合条件的文件"+"再上传.");
			}
		}
		/*
		验证大小检查是否可以上传
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
				alert("附件不可大于5M");
			}
		}
	</script>
	<link rel="stylesheet" type="text/css" href="styles.css">
	<head>
	</head>
	<body>
    	<div align="center">
    		文件上传
    	</div>
    	<table width="810" height="240" border="1" align="center">
    		<tr>
    			<td ailgn="center">
    				<form method="post" name="upform" action="upload_do.jsp" enctype="multipart/form-data">
    					<input type="file" name="uploadFile" onchange="fileChange(this);"/>
    					<p>
    						<input type="button" name="Submit" value="上传" onClick="LimitAttach(this.form, this.form.uploadfile.value)"/>
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
    									说明：</br>
    									1、请上传法律规定的文件；<br/> 
          								2、为了安全起见，只允许上传rar和zip压缩包文件，请您在上传非rar或zip文件前将其打包后再上传；<br/> 
          								3、单个文件最大容量为5MB
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
