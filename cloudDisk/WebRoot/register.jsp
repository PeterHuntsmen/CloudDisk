<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<html>
  <head> 
    <title>�û�ע��</title>
    <script type="text/javascript">
    	function checkform()
		{
	         flag=1;           
             if (document.info.userName.value=="")
             {
             	alert("�������û���");
             	document.info.userName.focus();
             	flag=0;
             	return false;
             }
             if(document.info.userPassword.value=="")
             {
              	alert("����������");
              	document.info.userPassword.focus();
              	flag=0;
              	return false;
             }
             if(document.info.repeatUserPassword.value=="")
             {
               	alert("������ȷ������");
               	document.info.repeatUserPassword.focus();
               	flag=0;
               	return false;
             }
			 if(document.info.userPassword.value!=document.info.repeatUserPassword.value)
             {
                alert("�������벻ͬ,");
                document.info.userPassword.value="";
                document.info.repeatUserPassword.value="";
                flag=0;
             }
			 if(flag==1)
             {
                document.info.submit();
             }
               
		}
    </script>
    <link rel="stylesheet" type="text/css" href="styles.css">
  </head>
  
  <body>
    <h1 align="center">ע��</h1>
    <form action="register_Post.jsp" name="info" method="post">
    	<table align="center" bgcolor="#8000FF">
    		<tr>
    			<td>�û�����</td>
    			<td><input type="text" name="userName" value=""></td>
    		</tr>
    		<tr>
    			<td>���룺</td>
    			<td><input type="password" name="userPassword" value=""></td>
    		</tr>
    		<tr>
    			<td>ȷ�����룺</td>
    			<td><input type="password" name="repeatUserPassword" value=""></td>
    		</tr>
    		<tr>
    			<td colspan="2"><input type="submit" value="�ύ" />
    			&nbsp;&nbsp;
    			<input type="reset" value="����" />
  			</tr>
    	</table>
    </form>
  </body>
</html>
