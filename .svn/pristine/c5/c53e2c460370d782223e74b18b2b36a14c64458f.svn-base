<%@page import="site.semi.dao.SboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %> 
<%
	//비정상적인 요청에 대한 응답
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}	
/* 
	String[] checkId=request.getParameterValues("checkId");
	
	for(String id:checkId) {
		SboardDAO.getDAO().deleteBoard(id);
	}
 */
 	String category = request.getParameter("category");
 
 	String[] checkId=request.getParameterValues("checkId");
 	int[] checkNum=new int[checkId.length];
 	//System.out.println(checkId.length);
 	
 	//받아온 String을 정수값으로 변경
 	for(int i=0; i<checkId.length; i++){
 		checkNum[i]=Integer.parseInt(checkId[i]);
 		//System.out.println(checkNum[i]);
 		SboardDAO.getDAO().deleteBoard(checkNum[i]);
 	}
 	
 	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=admin&work=board_manager&category="+category+"';");
	out.println("</script>");
	
%>