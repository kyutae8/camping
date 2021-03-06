<%@page import="site.semi.dao.SorderDAO"%>
<%@page import="site.semi.dto.SorderDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="site.semi.dao.SproductDAO"%>
<%@page import="site.semi.dto.SproductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %>  

<%
	int num=Integer.parseInt(request.getParameter("num"));
	int Num=Integer.parseInt(request.getParameter("num"));

	SorderDTO sorder=SorderDAO.getDAO().sns(num);
	SproductDTO sproduct=SproductDAO.getDAO().selectNumSproduct(Num);
%>

<style type="text/css">
#product {
	width: 400px;
	margin: 10px auto;
}	
table {
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
}
#btnDiv {
	text-align: right;
	margin-bottom: 5px;
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
<div id="product">
<h2>제품상세정보</h2>
<table>
	<tr>
		<td class="title">주문자</td>
		<td class="value"><%=sorder.getOname() %></td>
	</tr>
	<tr>
		<td class="title">제품명</td>
		<td class="value"><%=sorder.getName() %></td>
	</tr>
	<tr>
		<td class="title">제품색상</td>
		<td class="value"><%=sorder.getColor() %></td>
	</tr>
	<tr>
		<td class="title">배송지</td>
		<td class="value"><%=sorder.getZipcode() %>, <%=sorder.getAddress1() %> <%=sorder.getAddress2() %> <%=sorder.getAddress3() %></td>
	</tr>
	<tr>
		<td class="title">배송요청사항</td>
		<td class="value"><%=sorder.getMessage() %></td>
	</tr>
	<tr>
		<td class="title">제품수량</td>
		<td class="value"><%=DecimalFormat.getInstance().format(sorder.getQty()) %></td>
	</tr>
	<tr>
		<td class="title">제품가격</td>
		<td class="value"><%=DecimalFormat.getCurrencyInstance().format(sorder.getPrice()) %></td>
	</tr>
</table>

<p>
<div id="btnDiv">
	<button type="button" id="modifyBtn">주문정보변경&nbsp;&nbsp;&nbsp;|</button>
	<button type="button" id="removeBtn">&nbsp;주문정보삭제</button>
</div>
</p>

<script type="text/javascript">
$("#modifyBtn").click(function() {
	location.href="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=sorder_detail_modify&num=<%=sorder.getNum()%>";	
});

$("#removeBtn").click(function() {
	if(confirm("현재 제품정보를 삭제 하겠습니까?")) {
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=sorder_detail_remove&num=<%=sorder.getNum()%>";
	}
});
</script>