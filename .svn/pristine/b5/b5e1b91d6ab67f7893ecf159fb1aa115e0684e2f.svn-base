<%@page import="site.semi.dao.ItemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/security/login_url.jspf" %>
<%
	String color = request.getParameter("color");
	String itemno = request.getParameter("itemno");
	String itemcount = request.getParameter("itemcount");
	int rows = ItemDAO.getDAO().updateItemColor(color,Integer.parseInt(itemno));
	if(rows==0){%>
		<script type="text/javascript">
	location.href="<%=request.getContextPath() %>/index.jsp?workgroup=error&work=error400";
</script>
		
<% 	}else{%>
	<Script type="text/javascript">
 location.href = "<%=request.getContextPath() %>/index.jsp?workgroup=order&work=order_page2&itemcount=<%=itemcount%>&itemno=<%=itemno%>";
</Script> 
	<% }
%>
