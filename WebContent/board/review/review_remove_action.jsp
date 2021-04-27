<%@page import="site.semi.dao.SboardDAO"%>
<%@page import="site.semi.dto.SboardDTO"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>
<%
	//비정상적인 요청
	if(request.getParameter("num")==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
	int num=Integer.parseInt(request.getParameter("num"));
	String category=request.getParameter("category");

	SboardDTO board=SboardDAO.getDAO().selectNumBoard(num);
	
	//검색된 게시글이 없거나 삭제된 게시글인 경우 - 비정상적인 요청 
	if(board==null || board.getStatus()==9) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
	
	if(category.equals("1")){//공지사항일경우
		if(loginMember.getStatus()!=9) {
			out.println("<script type='text/javascript'>");
			out.println("alert('관리자만 글 삭제가 가능합니다')");
			out.println("history.go(-1);");//이전 페이지 이동
			out.println("</script>");
			return;
			/* out.println("<script type='text/javascript'>");
			out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
			out.println("</script>");
			return; */
		}
	}else{
		//로그인 사용자가 작성자가 아니거나 관리자가 아닌 경우 - 비정상적인 요청
		if(!loginMember.getId().equals(board.getId()) && loginMember.getStatus()!=9) {
			out.println("<script type='text/javascript'>");
			out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
			out.println("</script>");
			return;
		}
	}
	
		//게시글 번호를 이용하여 BOADR 테이블에 저장된 해당 게시글을 삭제하는 DAO 클래스의 메소드 호출
		SboardDAO.getDAO().deleteBoard(num); 
		
		//게시글 목록 출력페이지 이동
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=board/review&work=review_list';");
		out.println("</script>");
		
		
	


%>