<%@page import="site.semi.util.Utility"%>
<%@page import="site.semi.dao.SmemberDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 비밀번호를 전달받아 로그인 사용자의 비밀번호와 비교하여 같은 경우 MEMBER 테이블에 저장된 
로그인 사용자의 회원정보를 삭제하고 로그아웃 처리페이지(member_logout_action.jsp)로 이동--%>
<%-- => 비로그인 사용자가 요청한 경우 에러페이지 이동 - 비정상적인 요청 --%>
<%-- => 전달받은 비밀번호가 로그인 사용자의 비밀번호와 같지 않은 경우 비밀번호 입력페이지(password_confirm.jsp)로 이동 --%>    
<%@include file="/security/login_check.jspf" %>
<%
	//비정상적인 요청에 대한 응답 - 에러페이지 이동 
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
	

	//전달값을 반환받아 저장
	String id=loginMember.getId();
	String passwd=Utility.encrypt(request.getParameter("passwd"));
	
	//전달받은 비밀번호와 로그인 사용자의 비밀번호가 같지 않은 경우
	if(!loginMember.getPasswd().equals(passwd)) {
		session.setAttribute("message", "비밀번호가 맞지 않습니다.");
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=member&work=passwordconfirm&action=remove';");
		out.println("</script>");
		return;
	}
	
	//아이디를 전달받아 MEMBER 테이블에 저장된 해당 아이디의 회원정보를 삭제하는 DAO 클래스의 메소드 호출
	SmemberDAO.getDAO().udstatus(id, 2);
	
	//로그아웃 처리페이지 이동
	
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=member&work=logout';");
	out.println("</script>");
%>









