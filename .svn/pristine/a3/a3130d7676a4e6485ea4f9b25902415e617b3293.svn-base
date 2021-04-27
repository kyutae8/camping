<%@page import="site.semi.dao.SorderDAO"%>
<%@page import="site.semi.dao.ScartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %>  
<%
	int num=Integer.parseInt(request.getParameter("num"));
	String oid=loginMember.getId();
	SorderDAO.getDAO().deleteSorder(oid);
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=admin&work=sorder_manager&num="+num+"';");
	out.println("</script>");


%> 