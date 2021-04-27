<%@page import="site.semi.dto.SaleCartDTO"%>
<%@page import="site.semi.dao.ItemBuyDAO"%>
<%@page import="site.semi.dto.ItemBuyDTO"%>
<%@page import="site.semi.dao.ItemDAO"%>
<%@page import="site.semi.dto.ItemDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %>    

	<%
	String category=request.getParameter("category");
	if(category==null) category="ALL";
	List<ItemBuyDTO> list = ItemBuyDAO.getDAO().selectAll2(category);
	
	
	%>
<style type="text/css">
table {
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	border: 1px solid black;
	padding: 3px;
	text-align: center;
	font-size: 12px;
}

th {
	background: black;
	color: white;
}
.item_num{width: 100px; height: 30px;}
.item_name{width: 120px;}
.item_price{width: 120px;}
.item_reg{width: 120px;}
.item_count{width: 120px;}
.item_brand{width: 120px;}
.item_info{width: 170px;}
/item_up or de{width: 120px;}
</style>

<h2 style="text-align: center;">구매기록!</h2>
<form method="post" id="orderForm">
<table>
	<tr>
		<th>상품번호</th>
		<th>상품명</th>
		<th>상품 원가</th>
		<th>상품 구매일</th>
		<th>상품 구매갯수</th>
		<th>구매 아이디</th>
	</tr> 
	<%if(list.size()==0){ %>
		<tr>
		<td colspan="6">구매내역이 없어요.</td>
		</tr>
	<%}else{ %>
	<% for(int i=0;i<list.size();i++)
	{ItemBuyDTO item = list.get(i);
	%>
	<tr>
		<td class="item_num"><%=item.getItem_num() %></td>
		<td class="item_name"><%=item.getItem_name()%></td>
		<td class="item_price"><%=item.getItem_price()%></td>
		<td class="item_reg"><%=item.getItem_buyreg()%></td>
		<td class="item_count"><%=item.getItem_buycount() %></td>
		<td class="item_brand"><%=item.getLogin_id() %></td>
	</tr>
	<% } }%>
</table>
<center>
<div>아이디검색
<input type="text" value="<%=category%>" id="search">
<button type="button" id="search" onclick="goSearch();">검색</button>
</div>
</center>
</form>
<script type="text/javascript">
function goSearch() {
	var search=document.getElementById('search').value;	
	location.href='<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=order_search&id='+search;
}
</script>