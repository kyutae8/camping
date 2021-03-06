<%@page import="site.semi.dao.CommentDAO"%>
<%@page import="site.semi.dto.CommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	int cnum=Integer.parseInt(request.getParameter("cnum"));
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	String category=request.getParameter("category"); 

	// 전달된 cnum 없을경우
	if(request.getParameter("cnum")==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
	CommentDTO comment=CommentDAO.getDAO().selectNumComment(cnum);
	if(comment==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
	
	if(!loginMember.getId().equals(comment.getCid()) && loginMember.getStatus()!=9) {
		out.println("<script type='text/javascript'>");
		out.println("alert('댓글 작성자나 관리자만 삭제가 가능합니다')");
		out.println("history.go(-1);");//이전 페이지 이동
		out.println("</script>");
		return;
	}
	
	CommentDAO.getDAO().deleteComment(cnum);
	
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
	
	

// 아이디 불일치거나 관리자가 아닌 경우
//검색된 게시글이 없거나 삭제된 게시글인 경우 - 비정상적인 요청 

	
%>
<h1>코멘트삭제</h1>dasd