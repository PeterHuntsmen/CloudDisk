<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<script language="javascript">
		function check()
		{
			if(document.form1.userName.value=='')
			{
				alert("用户昵称不可为空！");
				document.form1.userName.focus();
				return false;
			}
			else if(document.form1.userPassword.value=='')
			{
				alert("密码不可为空！");
				document.form1.userPassword.focus();
				return false;
			}
			else
				return false;
		}
	</script>
  </head>
  
  <body>
	<form action="checkLogin.jsp" name="form1" method="post" onSubmit="return check()">
		<table align="center" bgcolor="#FF8800">
			<tr>
				<td>用户名：</td>
				<td><input type="text" name="userName"></td>
			</tr></br>
			<tr>
				<td>密码：</td>
				<td><input type="password" name="userPassword"></td>
			</tr></br>
		
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="登录">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="重置">
				</td>
			</tr></br>
			<tr>
				<td colspan="2"><a href="register.jsp">请注册！</a>
			</tr>
		</table>
	</form>
  </body>
</html>
