<%@page import="site.semi.dto.SmemberDTO"%>
<%@page import="site.semi.dto.SorderDTO"%>
<%@page import="site.semi.dao.SorderDAO"%>
<%@page import="site.semi.dto.GuestDTO"%>
<%@page import="site.semi.util.Utility"%>
<%@page import="site.semi.dao.GuestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	if(request.getMethod().equals("GET")){
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
	SmemberDTO loginMember=(SmemberDTO)session.getAttribute("loginMember");


	

	int num=Integer.parseInt(request.getParameter("num"));
	int qty=Integer.parseInt(request.getParameter("qty"));
	int price=Integer.parseInt(request.getParameter("price"));

	String name=request.getParameter("name");
	String color=request.getParameter("color");

	String message=request.getParameter("message");
	String oname=request.getParameter("oname");
	String ophone=request.getParameter("mobile1")+"-"+request.getParameter("mobile2")+"-"+request.getParameter("mobile3");
	String address1=request.getParameter("address1");
	String address2=Utility.stripTag(request.getParameter("address2"));
	String address3=Utility.stripTag(request.getParameter("address3")); 
	String zipcode=request.getParameter("zipcode");
	String id=loginMember.getId();

	SorderDTO sorder=new SorderDTO(); 
	sorder.setNum(num);
	sorder.setQty(qty);
	sorder.setPrice(price);
	sorder.setName(name);
	sorder.setColor(color);
	sorder.setOid(id);
	sorder.setMessage(message);
	sorder.setOname(oname);
	sorder.setOphone(ophone);
	sorder.setAddress1(address1);
	sorder.setAddress2(address2);
	sorder.setAddress3(address3);
	sorder.setZipcode(zipcode);	
	
	
	//DTO 인스턴스를 전달하여 MEMBER 테이블에 삽입하는 DAO 클래스의 메소드 호출
	SorderDAO.getDAO().insertSorder(sorder);
	
	//로그인 입력페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=sproduct&work=sproduct_list';");
	out.println("</script>");
	

%>