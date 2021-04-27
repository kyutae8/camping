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

	String pname=request.getParameter("pname");
	String pcolor=request.getParameter("pcolor");
	int pprice=Integer.parseInt(request.getParameter("pprice"));
	int pqty=Integer.parseInt(request.getParameter("qty"));
	String gname=request.getParameter("gname");
	String omessage=request.getParameter("omessage");
	String oname=request.getParameter("oname");
	String gmail=request.getParameter("email1")+"@"+request.getParameter("email2");
	String gmobile=request.getParameter("mobile1")+"-"+request.getParameter("mobile2")+"-"+request.getParameter("mobile3");
	String zipcode=request.getParameter("zipcode");
	String address1=request.getParameter("address1");
	String address2=Utility.stripTag(request.getParameter("address2"));
	String address3=Utility.stripTag(request.getParameter("address3")); 
	
	
	
	GuestDTO guest=new GuestDTO(); 
	guest.setPname(pname);
	guest.setPcolor(pcolor);
	guest.setPprice(pprice);
	guest.setPqty(pqty);
	guest.setGname(gname);
	guest.setGmail(gmail);
	guest.setGmobile(gmobile);
	guest.setOmessage(omessage);
	guest.setOname(oname);
	guest.setAddress1(address1);
	guest.setAddress2(address2);
	guest.setAddress3(address3);
	guest.setZipcode(zipcode);	
	
	//DTO 인스턴스를 전달하여 MEMBER 테이블에 삽입하는 DAO 클래스의 메소드 호출
	GuestDAO.getDAO().insertGuest(guest);
	
	int num=GuestDAO.getDAO().fg(zipcode);
	
	//로그인 입력페이지 이동
	out.println("<script type='text/javascript'>");
	out.println(num);
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=sproduct&work=sproduct_list';");
	out.println("</script>");
	
%>
