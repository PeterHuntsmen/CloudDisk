<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<html>
  <head>
    <title>��ӭ����Ա��½��</title>
    <script type="text/javascript">
     function check()
	 {
	  	if(document.form1.adminName.value=='')
	  	{
	   		alert("�û��ǳƲ���Ϊ��!");
	   		document.form1.adminName.focus();
	   		return false;
	  	}
	  	else if(document.form1.adminPassword.value=='')
	  	{
	   		alert("��¼���벻��Ϊ��");
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
    			<td>�û�����</td>
    			<td><input type="text" name="adminName"></td>
    		</tr></br>
    		<tr>
    			<td>���룺</td>
    			<td><input type="password" name="adminPassword"></td>
    		</tr></br>
    		<tr>
    			<td colspan="2" align="center">
    				<input type="submit" value="��½">
    					&nbsp;&nbsp;
    				<input type="reset" value="����">
    			</td>
    		</tr></br>
    		<tr>
    			<td colspan="2" align="center" bgcolor="#FF0000"><font color="#FFFF00">����Ա��½</font></td>
    		</tr></br>
    	</table>
    </form>
    <a href="index.jsp" title="�ǹ���Ա�뷵�أ�">������ҳ</a>
  </body>
</html>
