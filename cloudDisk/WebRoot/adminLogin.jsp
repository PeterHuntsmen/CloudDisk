<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<html>
  <head>
    <title>欢迎管理员登陆！</title>
    <script type="text/javascript">
     function check()
	 {
	  	if(document.form1.adminName.value=='')
	  	{
	   		alert("用户昵称不能为空!");
	   		document.form1.adminName.focus();
	   		return false;
	  	}
	  	else if(document.form1.adminPassword.value=='')
	  	{
	   		alert("登录密码不能为空");
	   		document.form1.adminPassword.focus();
	   		return false;
	  	}	
	  	else
	   	return true;
	 }
    </script>
    <link rel="stylesheet" type="text/css" href="styles.css">
  </head>
  
  <body>
    <form action="admin_check.jsp" name="form1" method="post" onSubmit="return check(this);">
    	<table align="center" bgcolor="#FF8800">
    		<tr>
    			<td>用户名：</td>
    			<td><input type="text" name="adminName"></td>
    		</tr></br>
    		<tr>
    			<td>密码：</td>
    			<td><input type="password" name="adminPassword"></td>
    		</tr></br>
    		<tr>
    			<td colspan="2" align="center">
    				<input type="submit" value="登陆">
    					&nbsp;&nbsp;
    				<input type="reset" value="重置">
    			</td>
    		</tr></br>
    		<tr>
    			<td colspan="2" align="center" bgcolor="#FF0000"><font color="#FFFF00">管理员登陆</font></td>
    		</tr></br>
    	</table>
    </form>
    <a href="index.jsp" title="非管理员请返回！">返回首页</a>
  </body>
</html>
