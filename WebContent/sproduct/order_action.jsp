<%@page import="site.semi.dao.SproductDAO"%>
<%@page import="site.semi.dto.SproductDTO"%>
<%@page import="site.semi.dto.SmemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String num = request.getParameter("num");
	SmemberDTO loginMember=(SmemberDTO)session.getAttribute("loginMember");
	if(loginMember==null){
		%>
		<script type="text/javascript">  
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=sproduct&work=guest&num=<%=num %>";
		</script>
		<%
	}else{%>
			<script type="text/javascript">  
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=sproduct&work=sorder2&num=<%=num %>";
		</script>
		<%
	}
%>