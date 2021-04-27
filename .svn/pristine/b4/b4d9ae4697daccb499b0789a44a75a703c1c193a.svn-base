<%@page import="site.semi.dao.SboardDAO"%>
<%@page import="site.semi.dto.SboardDTO"%>
<%@page import="site.semi.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>
<%
	//비정상적인 요청에 대한 응답
	if(request.getMethod().equals("GET")) {		
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	//전달값을 반환받아 저장
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	
	String title=Utility.escapeTag(request.getParameter("title"));
	int status=0;//전달값이 없는 경우 : 일반글 -  0(초기값)   
	if(request.getParameter("secret")!=null) {//전달값이 있는 경우 : 비밀글 - 1
		status=Integer.parseInt(request.getParameter("secret"));
	}
	String content=Utility.escapeTag(request.getParameter("content"));
	
	SboardDTO board=new SboardDTO();
	board.setNum(num);
	board.setTitle(title);
	board.setContent(content);
	board.setStatus(status);
	
	//게시글을 이용하여 BOARD 테이블에 저장된 해당 게시글을 변경하는 DAO 클래스의 메소드 호출
	SboardDAO.getDAO().updateBoard(board);
	
	//게시글 상세 출력페이지 이동 - 페이지 관련 값 전달
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()
		+"/index.jsp?workgroup=board&work=board_detail&num="+num+"&pageNum="
		+pageNum+"&search="+search+"&keyword="+keyword+"';");
	out.println("</script>");
	
%>