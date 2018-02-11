<%@ page contentType="text/html; charset=gbk"  language="java" import="java.util.*,com.jspsmart.upload.*,service.config" pageEncoding="gbk"%>
<%
	//检查普通用户是否登录
    String id = (String)session.getAttribute("user");
    if (null==id || id.equals("")) {
        out.print("<script language='javascript'>alert('请先登录系统！');window.location = 'login.jsp';</script>");
        
    }
    
    
    //获取程序文件夹的绝对路径

	String dirPath=application.getRealPath(request.getRequestURI());
	dirPath=dirPath.substring(0,dirPath.lastIndexOf('\\')+1);
	dirPath=dirPath.substring(0,dirPath.lastIndexOf('\\'));
	dirPath=dirPath.substring(0,dirPath.lastIndexOf('\\')+1);
	
	
	SmartUpload su=new SmartUpload();
	
	//上传初始化
	su.initialize(pageContext);
	
	//set Restrictions
	su.setMaxFileSize(5000000);
	su.setTotalMaxFileSize(150000000);
	su.setAllowedFilesList("rar,zip,txt");
	su.setDeniedFilesList("exe,bat,jsp,html,asp,php,htm");
	su.upload();
	
	// 将上传文件全部保存到指定目录
	String cqutroot =dirPath.replace('\\', '/');
	su.save(cqutroot+"box/"+id);
	out.print("<script> alert('文件上传成功！')；location.href='welcome.jsp;</script>'");
%>


