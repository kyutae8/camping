<%@page import="site.semi.dao.SorderDAO"%>
<%@page import="site.semi.dto.SorderDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %>   
<%
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	SmemberDTO loginMember2=(SmemberDTO)session.getAttribute("loginMember");

	int num=Integer.parseInt(request.getParameter("num"));
	String oname=request.getParameter("oname");
	String name=request.getParameter("Name");
	String color=request.getParameter("category2");
	String zipcode=request.getParameter("zipcode");
	String address1=request.getParameter("address1");
	String address2=request.getParameter("address2");
	String address3=request.getParameter("address3");
	String message=request.getParameter("productDetail");
	int qty=Integer.parseInt(request.getParameter("productQty"));
	int price=Integer.parseInt(request.getParameter("productPrice"));
	
	SorderDTO sorder=new SorderDTO();
	sorder.setNum(num);
	sorder.setOname(oname);
	sorder.setName(name);
	sorder.setColor(color);
	sorder.setZipcode(zipcode);
	sorder.setAddress1(address1);
	sorder.setAddress2(address2);
	sorder.setAddress3(address3);
	sorder.setMessage(message);
	sorder.setQty(qty);
	sorder.setPrice(price);
	sorder.setOid(loginMember2.getId());
	
	SorderDAO.getDAO().updateStatusSorder(sorder);
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=admin&work=sorder_detail&num="+num+"';");
	out.println("</script>");
%>