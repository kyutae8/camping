<%@page import="site.semi.util.Utility"%>
<%@page import="site.semi.dao.SproductDAO"%>
<%@page import="site.semi.dto.SproductDTO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %>    
<%
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	//전달된 파일(제품이미지)을 저장하기 위한 서버 디렉토리의 시스템 경로를 반환받아 저장
	// => WorkSpace 디렉토리가 아닌 WebApps 디렉토리의 시스템 경로를 반환
	String saveDirectory=request.getServletContext().getRealPath("/sproduct_image");
	
	//cos.jar 파일의 MultipartRequest 클래스로 인스턴스 생성
	// => 모든 전달파일을 서버 디렉토리에 자동으로 업로드 처리하여 저장 - 제한용량, 인코딩, 이름중복시
	MultipartRequest mr=new MultipartRequest(request, saveDirectory, 30*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
	
	//전달값과 전달 파일명을 반환받아 저장
	String code=mr.getParameter("category");
	String name=mr.getParameter("productName");
	String image=mr.getFilesystemName("mainImage");
	String detail=Utility.escapeTag(mr.getParameter("productName"));
	String color=mr.getParameter("category2");
	int qty=Integer.parseInt(mr.getParameter("productQty"));
	int price=Integer.parseInt(mr.getParameter("productPrice"));
	
	//DTO 인스턴스 생성 및 전달값으로 필드값 변경
	SproductDTO sproduct=new SproductDTO();
	sproduct.setCode(code);
	sproduct.setName(name);
	sproduct.setImage(image);
	sproduct.setDetail(detail);
	sproduct.setColor(color);
	sproduct.setQty(qty);
	sproduct.setPrice(price);
	
	if(SproductDAO.getDAO().selectCodeSproduct(code)!=null){
		new File(saveDirectory, image).delete();
		session.setAttribute("message", "이미 등록된 제품코드입니다.");
		session.setAttribute("product", sproduct);
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=admin&work=sproduct_add';");
		out.println("</script>");		
	}
	
	
	SproductDAO.getDAO().insertSproduct(sproduct);
	
	//제품목록 출력페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=admin&work=sproduct_manager';");
	out.println("</script>");
	
	
%>