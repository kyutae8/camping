<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		
	String itemno = request.getParameter("itemno");
	if(itemno!=null){
		%>
		<script type="text/javascript">  
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=order&work=order_item&itemno=<%=itemno%>";
		</script>
		<%
	}else{%>
			<script type="text/javascript">  
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=error&work=error400";
		</script>
		<%
	}
%>