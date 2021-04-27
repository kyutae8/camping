<%@page import="site.semi.dao.SproductDAO"%>
<%@page import="site.semi.dto.SproductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");
	if(num!=null){
		%>
		<script type="text/javascript">  
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=sproduct&work=sproduct_page&num=<%=num %>";
		</script>
		<%
	}else{%>
			<script type="text/javascript">  
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=error&work=error400";
		</script>
		<%
	}
%>