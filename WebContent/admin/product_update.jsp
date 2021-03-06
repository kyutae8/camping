<%@page import="site.semi.dto.ItemDTO"%>
<%@page import="site.semi.dao.ItemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		int itemno = Integer.parseInt(request.getParameter("itemno"));
		ItemDTO item = ItemDAO.getDAO().selectItem(itemno);
	%>
	<style type="text/css">
#공백잼{
	margin: 0 auto;
	text-align: center;
}

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
</style>
	<div style="height: 50px;" id="공백잼"><h1>상품 업데이트!</h1></div>
		<form method="post" name="updateItemForm" action="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=product_update_action">
	<Table>
	<tr>
		<th>상품번호</th>
		<th>상품명</th>
		<th>상품 원가</th>
		<th>상품 재고</th>
		<th>상품 브랜드</th>
		<th>상품 정보</th>
		<th>수정</th>
	</tr> 
		<tr>
		<td class="item_num"><input type="text" value="<%=item.getItem_num()%>" name="item_num" readonly="readonly"></td>
		<td class="item_name"><input type="text" value="<%=item.getItem_name()%>" name="item_name"></td>
		<td class="item_price"><input type="text" value="<%=item.getItem_price()%>" name ="item_price"></td>
		<td class="item_count"><input type="text" value="<%=item.getItem_count() %>" name="item_count"></td>
		<td class="item_brand"><input type="text" value="<%=item.getItem_brand() %>" name="item_brand"></td>
		<td class="item_info"><input type="text" value="<%=item.getItem_info() %>" name="item_info"></td>
		<td class="updateItem"><button type="submit">수정해버리기</button></td>
	</tr>
	</Table>
		</form>
	