<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	
%>
<script type="text/javascript">
location.href='<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=order_manager&category=<%=id%>';
</script>