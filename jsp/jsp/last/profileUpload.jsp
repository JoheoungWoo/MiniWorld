<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
 
<%
	String realFolder = "";
	String test2="";
	String test1 ="/ftpserver/userProfile"; // out폴더에 fileSave 폴더 생성
	String saveFolder="/userProfile";
	String encType = "utf-8";
	int maxSize = 5*1024*1024; // 최대 업로드 5mb
 
	ServletContext context = request.getServletContext();

	test2 = context.getRealPath(saveFolder);
	realFolder = context.getRealPath(test1);
	out.println("real " + realFolder + " test2 " + test2);
 
	try {
	    MultipartRequest multi = null;
	    //multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());new name
	    multi = new MultipartRequest(request, realFolder, maxSize, encType);//덮어쓰기
	    Enumeration params = multi.getParameterNames();
		out.println("요청받은값 : " +request);
 

	    while(params.hasMoreElements()) {
	        String name = (String) params.nextElement();
	        String value = multi.getParameter(name);
	        out.println(name + " = " + value + "<br>");
	    }

 
	    out.println("-------------------<br>");
 
	    Enumeration files = multi.getFileNames();
 
	    while(files.hasMoreElements()) {
	        String name = (String)files.nextElement();
	        String filename = multi.getFilesystemName(name);
	        String original = multi.getOriginalFileName(name);
	        String type = multi.getContentType(name);
	        File file = multi.getFile(name);
 
 
	        out.println("파라미터 이름" + name + "<br>");
	        out.println("실제 파일 이름" + original + "<br>");
	        out.println("저장된 파일 이름" + filename + "<br>");
	        out.println("파일 타입 이름" + type + "<br>");
 
		    if(file!= null) {
		        out.println("크기: " + file.length() + "<br>");
		    }
	    }
 
	}catch (IOException ioe) {
		out.println("에러");
	} catch (Exception ex) {
		out.println("에러");
	}
	finally{
		
	}
%>

<html>
<head>
<script>
function load() {
alert("새창을 닫습니다.");

opener.location.reload();
self.close();
}
</script>
</head>
<body onload="load()">
</body>
</html>