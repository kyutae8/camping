<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("utf-8");
String filename1="";
int maxSize = 1024*1024*5; 
String encType = "utf-8"; 
String savefile = "/images/goods"; 
String realFolder=request.getServletContext().getRealPath(savefile);
 
try{ 
MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy()); 
Enumeration<?> files = multi.getFileNames(); 
String file1 = (String)files.nextElement(); 
filename1 = multi.getFilesystemName(file1); 
} catch(Exception e) { 
e.printStackTrace(); 
} 
if(!filename1.substring(0,5).equals("goods")){%>
<script type="text/javascript">
	alert("이미지명을 제대로 입력해주세요");
	</script>
<%return;}else{%>
	<script type="text/javascript">
	alert("성공");
	location.href='<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=product_manager';
	</script>
<% }
%>
