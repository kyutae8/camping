<%@page import="site.semi.dao.SproductDAO"%>
<%@page import="java.io.File"%>
<%@page import="site.semi.dto.SproductDTO"%>
<%@page import="site.semi.util.Utility"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %>   
<%
	//비정상적인 요청에 대한 응답
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
	String saveDirectory= request.getServletContext().getRealPath("sproduct_image");
	
	MultipartRequest mr=new MultipartRequest(request, saveDirectory, 30*1024*1024, "utf-8"
			, new DefaultFileRenamePolicy());
	
	int num=Integer.parseInt(mr.getParameter("productNum"));
	String currentMainImage=mr.getParameter("currentMainImage");
	String code=mr.getParameter("category")+"_"+mr.getParameter("productCode");
	String name=mr.getParameter("productName");
	String color=mr.getParameter("category2");
	String image=mr.getFilesystemName("mainImage");
	String detail=Utility.escapeTag(mr.getParameter("productDetail"));
	int qty=Integer.parseInt(mr.getParameter("productQty"));
	int price=Integer.parseInt(mr.getParameter("productPrice"));
	
	//DTO 인스턴스 생성 및 전달값으로 필드값 변경
	SproductDTO sproduct=new SproductDTO();
	sproduct.setNum(num);
	sproduct.setCode(code);
	sproduct.setName(name);
	sproduct.setColor(color);
	if(image!=null) {//제품이미지를 변경할 경우
		sproduct.setImage(image);
		//기존 제품이미지 파일 삭제
		new File(saveDirectory,currentMainImage).delete();
	} else {//제품이미지를 변경하지 않을 경우
		sproduct.setImage(currentMainImage);
	}
	sproduct.setDetail(detail);
	sproduct.setQty(qty);
	sproduct.setPrice(price);
	
	//전달된 제품정보를 이용하여 PRODUCT 테이블에 저장된 해당 제품정보를 변경하는 DAO 클래스의 메소드 호출
	SproductDAO.getDAO().updateSproduct(sproduct);
	
	//제품정보 상세 출력페이지 이동	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=admin&work=sproduct_detail&num="+num+"';");
	out.println("</script>");
%>