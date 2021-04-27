<%@page import="site.semi.dto.SmemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@include file="/security/login_check.jspf" %> --%>

<%
	SmemberDTO loginMember=(SmemberDTO)session.getAttribute("loginMember");
	String pageNum="1";
	//System.out.println(loginMember.getId());
	if(loginMember==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=member&work=login';");
		out.println("</script>");
		return;
	}else{		
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=cart&work=cart_list';");
		out.println("</script>");
		return;
	}
	%>