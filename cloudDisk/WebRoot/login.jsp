<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<script language="javascript">
		function check()
		{
			if(document.form1.userName.value=='')
			{
				alert("�û��ǳƲ���Ϊ�գ�");
				document.form1.userName.focus();
				return false;
			}
			else if(document.form1.userPassword.value=='')
			{
				alert("���벻��Ϊ�գ�");
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
				<td>�û�����</td>
				<td><input type="text" name="userName"></td>
			</tr></br>
			<tr>
				<td>���룺</td>
				<td><input type="password" name="userPassword"></td>
			</tr></br>
		
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="��¼">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="����">
				</td>
			</tr></br>
			<tr>
				<td colspan="2"><a href="register.jsp">��ע�ᣡ</a>
			</tr>
		</table>
	</form>
  </body>
</html>
