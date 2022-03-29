<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 추가 -->
<!-- 
MultipartRequest  => 업로드 
DefaultFileRenamePolicy  => 덮어쓰기 방지 -->
<%@ page import="com.oreilly.servlet.MultipartRequest,
				 com.oreilly.servlet.multipart.DefaultFileRenamePolicy, 
				 java.util.*,
				 java.io.*" %>
<% //자바 코드 
	String savePath = "C:/FileUpload/filestorage";
	String encType = "UTF-8";
	int maxSize = 20 * 1024 * 1024; //50MB 제한 
	
	try{
		MultipartRequest multi = null;
		//MultipartRequest 객체 생성
		multi = new MultipartRequest(request,
									savePath,
									maxSize,
									encType,
									new DefaultFileRenamePolicy());
		String name = multi.getParameter("name");			 //작성자
		String subject = multi.getParameter("subject");		 //제목
		out.println("작성자:"+ name +"<br>");
		out.println("제   목:"+ subject +"<br>");
		out.println("<br>");
		
		
		Enumeration files = multi.getFileNames();
		
		while(files.hasMoreElements()){
			String file = (String)files.nextElement();
			String filename = multi.getFilesystemName(file);
			out.println("업로드된 파일명:" + filename + "<br>");
			}
		
		
	}catch(Exception e){
			System.out.println(e);
		}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

</body>
</html>