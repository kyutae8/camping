<%@page import="site.semi.dao.SorderDAO"%>
<%@page import="site.semi.dao.SmemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 아이디와 상태를 전달받아 MEMBER 테이블에 저장된 해당 회원의 상태를 변경하고 회원목록 
출력페이지(member_manager.jsp)로 이동하는 JSP 문서 --%>
<%-- => 로그인 상태의 관리자만 접근 가능하도록 권한 설정 --%>
<%@include file="/security/admin_check.jspf" %>    
<%


	//전달값을 반환받아 저장
	String oid=request.getParameter("oid");
	int status=Integer.parseInt(request.getParameter("status"));
	
	//아이디와 상태를 이용하여 MEMBER 테이블에 저장된 해당 아이디의 상태를 변경하는 DAO 클래스의 메소드 호출
	SorderDAO.getDAO().updateStatus(oid, status);
	
	//회원목록 출력페이지로 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=admin&work=sorder_manager';");
	out.println("</script>");
%>








