<%@page import="site.semi.dao.SboardDAO"%>
<%@page import="site.semi.dto.SboardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/security/admin_check.jspf" %> 
<%
	int num=Integer.parseInt(request.getParameter("num"));
	String answer=request.getParameter("answer");
	
	SboardDTO board=new SboardDTO();
	board.setNum(num);
	board.setAnswer(answer);

	SboardDAO.getDAO().updateAnswer(board);
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=admin&work=board_answernull';");
	out.println("</script>"); 
%>