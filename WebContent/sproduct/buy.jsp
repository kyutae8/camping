<%@page import="site.semi.dao.SproductDAO"%>
<%@page import="site.semi.dto.SproductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>구매페이지</h1>
 <%@include file="/security/login_check.jspf" %> 
 <%
 	int num=Integer.parseInt(request.getParameter("num"));

 	SproductDTO sproduct=SproductDAO.getDAO().selectNumSproduct(num);
 %>   


	<div class="detail_title_area">
		<h3 class="name"><%=sproduct.getName()%></h3>	
			<div><p class="summary"><%=sproduct.getDetail()%></p></div>
	</div>
	<h3><%=loginMember.getAddress1() %></h3>
	<h3><%=loginMember.getAddress2() %></h3>
	<h3><%=loginMember.getAddress3() %></h3>