<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	request.setCharacterEncoding("UTF-8");	
	
	//workgroup : 작업디렉토리 / work : 파일명 
	String workgroup=request.getParameter("workgroup");
	if(workgroup==null) workgroup="base";
	
	String work=request.getParameter("work");
	if(work==null) work="print";
	
	
	
	String contentPath=workgroup+"/"+work+".jsp";
	
	String headerPath="header2.jsp";
	if(workgroup.equals("admin")) {
		headerPath="admin/header.jsp";
	} 
	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<div id="header">
		<jsp:include page="<%=headerPath %>"/>
	</div>
	
	<div id="content">
		<jsp:include page="<%=contentPath %>"/>		
	</div>
	
	<div id="footer">
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>