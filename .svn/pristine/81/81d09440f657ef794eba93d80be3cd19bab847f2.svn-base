<%@page import="site.semi.dao.ScartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %>    
<%	
//비정상적인 요청에 대한 응답
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	//삭제하고자 선택된 회원정보의 아이디 목록을 반환받아 저장
	// => 같은 이름으로 전달된 값이 여러개 있는 경우 request.getParameterValues() 메소드 호출
	String[] scart_num=request.getParameterValues("scart_num") ;

	//반복문으로 배열요소에 저장된 아이디를 이용하여 MEMBER 테이블에 저장된 해당 아이디의
	//회원정보를 삭제하는 DAO 클래스의 메소드를 호출
	for(String scart:scart_num) {
	 
		ScartDAO.getDAO().deleteScart(scart);
	}
	
	//회원목록 출력페이지로 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=sproduct&work=sproduct_cart';");
	out.println("</script>");
%>