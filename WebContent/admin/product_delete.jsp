<%@page import="site.semi.dao.ItemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int itemno = Integer.parseInt(request.getParameter("itemno"));
	
	int row = ItemDAO.getDAO().deleteItem(itemno);
	if(row==0){%>
	<script type="text/javascript">
		alert("삭제할 상품이 없습니다.");		
	</script>	
<%	return;}else{%>
		<script type="text/javascript">
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=product_manager";
		</script>		
<%}%>