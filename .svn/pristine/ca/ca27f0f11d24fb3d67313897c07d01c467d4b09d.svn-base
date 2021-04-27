<%@page import="site.semi.dao.SproductDAO"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 제품번호를 전달받아 PRODUCT 테이블에 저장된 해당 제품번호의 제품정보를 삭제하고 
제품목록 출력페이지(product_manager.jsp)로 이동하는 JSP 문서 --%>
<%-- => 로그인 상태의 관리자만 접근 가능하도록 권한 설정 --%>
<%@include file="/security/admin_check.jspf" %>   
<%
	//전달값(제품번호)을 반환받아 저장
	int num=Integer.parseInt(request.getParameter("num"));


	//제품이미지가 저장된 서버 디렉토리의 시스템 경로를 반환받아 저장
	String saveDirectory=request.getServletContext().getRealPath("/sproduct_image");
	
	//삭제할 제품의 이미지 파일명을 반환받아 저장
	// => 제품번호를 이용하여 PRODUCT 테이블에 저장된 해당 제품번호의 제품정보를 검색하여 반환하는 DAO 클래스의 메소드 호출
	String image=SproductDAO.getDAO().selectNumSproduct(num).getImage();
	
	//제품번호를 이용하여 PRODUCT 테이블에 저장된 해당 제품정보를 삭제하는 DAO 클래스의 메소드 호출
	SproductDAO.getDAO().deleteSproduct(num);
	
	//제품이미지 파일 삭제
	new File(saveDirectory, image).delete();
	
	//제품목록 출력페이지로 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=admin&work=sproduct_manager';");
	out.println("</script>");
	out.println();
%>
