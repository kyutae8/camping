<%@page import="java.text.DecimalFormat"%>
<%@page import="site.semi.dao.SproductDAO"%>
<%@page import="site.semi.dto.SproductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %>  

<%
	int num=Integer.parseInt(request.getParameter("num"));

	SproductDTO sproduct=SproductDAO.getDAO().selectNumSproduct(num);
%>

<style type="text/css">
table {
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
}

td {
	border: 1px solid black;
}

.title {
	background: black;
	color: white;
	text-align: center;
	width: 100px;
}

.value {
	padding: 3px;
	text-align: left;
	width: 400px;
}
</style>

<h2>제품상세정보</h2>
<table>
	<tr>
		<td class="title">제품코드</td>
		<td class="value"><%=sproduct.getCode() %></td>
	</tr>
	<tr>
		<td class="title">제품명</td>
		<td class="value"><%=sproduct.getName() %></td>
	</tr>
	<tr>
		<td class="title">제품색상</td>
		<td class="value"><%=sproduct.getColor() %></td>
	</tr>
	<tr>
		<td class="title">제품이미지</td>
		<td class="value"><img src="<%=request.getContextPath() %>/sproduct_image/<%=sproduct.getImage() %>" width="200"></td>
	</tr>
	<tr>
		<td class="title">상세설명</td>
		<td class="value"><%=sproduct.getDetail().replace("\n", "<br>") %></td>
	</tr>
	<tr>
		<td class="title">제품수량</td>
		<td class="value"><%=DecimalFormat.getInstance().format(sproduct.getQty()) %></td>
	</tr>
	<tr>
		<td class="title">제품가격</td>
		<td class="value"><%=DecimalFormat.getCurrencyInstance().format(sproduct.getPrice()) %></td>
	</tr>
</table>

<p>
	<button type="button" id="modifyBtn">제품정보변경</button>
	<button type="button" id="removeBtn">제품정보삭제</button>
</p>

<script type="text/javascript">
$("#modifyBtn").click(function() {
	location.href="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=sproduct_modify&num=<%=sproduct.getNum()%>";	
});

$("#removeBtn").click(function() {
	if(confirm("현재 제품정보를 삭제 하겠습니까?")) {
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=sproduct_remove_action&num=<%=sproduct.getNum()%>";
	}
});
</script>