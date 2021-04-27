<%@page import="site.semi.util.Utility"%>
<%@page import="site.semi.dao.CommentDAO"%>
<%@page import="site.semi.dto.CommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	String category=request.getParameter("category"); 
	
	int bnum=Integer.parseInt(request.getParameter("bnum"));
	String cid=request.getParameter("cid");
	String cwriter=request.getParameter("cwriter");
	String ccontent=Utility.escapeTag(request.getParameter("ccontent"));
	
	CommentDTO comment=new CommentDTO();
	comment.setBnum(bnum);
	comment.setCid(cid);
	comment.setCwriter(cwriter);
	comment.setCcontent(ccontent);
	
	CommentDAO.getDAO().insertComment(comment);
	
	if(category.equals("1")){
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=board&work=board_detail&num="+num+"&pageNum="+pageNum+"&search="+search+"&keyword="+keyword+"&category="+category+"';");
		out.println("</script>");
	}else if(category.equals("2")){
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=board/review&work=review_detail&num="+num+"&pageNum="+pageNum+"&search="+search+"&keyword="+keyword+"&category="+category+"';");
		out.println("</script>");
	}else if(category.equals("3")){
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=board/question&work=question_detail&num="+num+"&pageNum="+pageNum+"&search="+search+"&keyword="+keyword+"&category="+category+"';");
		out.println("</script>");
	}
	

%>