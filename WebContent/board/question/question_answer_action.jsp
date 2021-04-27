<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	//관리자만 가능
	if(loginMember.getStatus()!=9){
		out.println("<script type='text/javascript'>");
		out.println("alert('관리자만 답변이 가능합니다')");
		out.println("history.go(-1);");//이전 페이지 이동
		out.println("</script>");
		return;
	} 


	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	
	int itemnum=Integer.parseInt(request.getParameter("itemnum"));
	String answer=request.getParameter("answer");
	int status=0;//전달값이 없는 경우 : 일반글 -  0(초기값)   
	if(request.getParameter("secret")!=null) {//전달값이 있는 경우 : 비밀글 - 1
		status=Integer.parseInt(request.getParameter("secret"));
	} 

	
	SboardDTO board=new SboardDTO();
	board.setNum(num);
	board.setAnswer(answer);
	board.setStatus(status);
	
	//게시글을 이용하여 BOARD 테이블에 저장된 해당 게시글을 변경하는 DAO 클래스의 메소드 호출
	SboardDAO.getDAO().updateAnswer(board);
	
	//게시글 상세 출력페이지 이동 - 페이지 관련 값 전달
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()
		+"/index.jsp?workgroup=board/question&work=question_detail&num="+num+"&pageNum="
		+pageNum+"&search="+search+"&keyword="+keyword+"';");
	out.println("</script>");
	
%>