<%@page import="site.semi.dao.ItemDAO"%>
<%@page import="site.semi.dto.ItemDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %>    

<%List<ItemDTO> itemlist = ItemDAO.getDAO().selectAllItem(); %>
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

<h2 style="text-align: center;">제품목록</h2>
<table>
	<tr>
		<th>상품번호</th>
		<th>상품명</th>
		<th>상품 원가</th>
		<th>상품 등록일</th>
		<th>상품 재고</th>
		<th>상품 브랜드</th>
		<th>상품정보</th>
		<th>상품 수정일</th>
		<th>수정/삭제</th>
	</tr> 
	
	<% for(ItemDTO item:itemlist) { 
	%>
	<tr>
		<td class="item_num"><%=item.getItem_num() %></td>
		<td class="item_name"><%=item.getItem_name()%></td>
		<td class="item_price"><%=item.getItem_price()%></td>
		<td class="item_reg"><%=item.getItem_reg()%></td>
		<td class="item_count"><%=item.getItem_count() %></td>
		<td class="item_brand"><%=item.getItem_brand() %></td>
		<td class="item_info"><%=item.getItem_info() %></td>
		<td class="item_updatereg"><%=item.getItem_updatereg()%></td>
		<td class="item_up or de">
		<button type="button" onclick="location.href='<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=product_update&itemno=<%=item.getItem_num()%>'">수정</button>/
		<button type="button" onclick="location.href='<%=request.getContextPath()%>/admin/product_delete.jsp?itemno=<%=item.getItem_num()%>'">삭제</button>
		</td>
	</tr>
	<% } %>
</table>
	<div style="text-align: center;" class="additem"><button type="button" onclick="location.href='<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=product_add'" style="font-size: 25px;">추가</button></div>

