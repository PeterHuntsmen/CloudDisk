<%@ page contentType="text/html; charset=gbk"  language="java" import="java.util.*,com.jspsmart.upload.*,service.config" pageEncoding="gbk"%>
<%
	//�����ͨ�û��Ƿ��¼
    String id = (String)session.getAttribute("user");
    if (null==id || id.equals("")) {
        out.print("<script language='javascript'>alert('���ȵ�¼ϵͳ��');window.location = 'login.jsp';</script>");
        
    }
    
    
    //��ȡ�����ļ��еľ���·��

	String dirPath=application.getRealPath(request.getRequestURI());
	dirPath=dirPath.substring(0,dirPath.lastIndexOf('\\')+1);
	dirPath=dirPath.substring(0,dirPath.lastIndexOf('\\'));
	dirPath=dirPath.substring(0,dirPath.lastIndexOf('\\')+1);
	
	
	SmartUpload su=new SmartUpload();
	
	//�ϴ���ʼ��
	su.initialize(pageContext);
	
	//set Restrictions
	su.setMaxFileSize(5000000);
	su.setTotalMaxFileSize(150000000);
	su.setAllowedFilesList("rar,zip,txt");
	su.setDeniedFilesList("exe,bat,jsp,html,asp,php,htm");
	su.upload();
	
	// ���ϴ��ļ�ȫ�����浽ָ��Ŀ¼
	String cqutroot =dirPath.replace('\\', '/');
	su.save(cqutroot+"box/"+id);
	out.print("<script> alert('�ļ��ϴ��ɹ���')��location.href='welcome.jsp;</script>'");
%>


