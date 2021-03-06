<%@page import="java.util.List"%>
<%@page import="site.semi.dto.ItemDTO"%>
<%@page import="site.semi.dao.ItemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	List<ItemDTO> list = ItemDAO.getDAO().selectAllItem();
	int k = ItemDAO.getDAO().maxColumn();
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
	width: 50px;
}

th {
	background: black;
	color: white;
}
</style>
	<div style="height: 50px;" id="공백잼"><h1>상품 업데이트!</h1></div>
		<form method="post" id="insertItemForm"  action="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=product_add_action">
	<Table>
	<tr>
		<th>상품번호</th>
		<th>상품명</th>
		<th>상품 원가</th>
		<th>상품 분류</th>
		<th>상품 정보</th>
		<th>이미지</th>
		<th>상품 재고량</th>
		<th>할인율</th>
		<th>상품 브랜드</th>
	</tr> 
		<tr>
		<td class="item_num"><input id="item_num" style="width: 40px;" type="text" value="<%=k+1%>" name="item_num" readonly="readonly"></td>
		<td class="item_name"><input id="item_name" style="width: 80px;" value="" name="item_name"></td>
		<td class="item_price"><input id="item_price" style="width: 80px;" value="" name ="item_price"></td>
		<td class="item_category"><input id="item_category" style="width: 80px;" value="캠핑" name ="item_category" readonly="readonly"></td>
		<td class="item_info"><input id="item_info" style="width: 180px;" value="" name="item_info"></td>
		<td class="item_img"><input id="item_img" style="width: 80px" value="goods<%=k+1%>" name="item_img" readonly="readonly"></td>		
		<td class="item_count"><input id="item_count" style="width: 80px;" value="" name="item_count"></td>
		<td class="item_sale"><input id="item_sale" style="width: 80px;" value="" name="item_sale"></td>
		<td class="item_brand"><input id="item_brand" style="width: 80px;" value="" name="item_brand"></td>
		<td class="insertItem"><button type="submit">추가!</button></td>
	</tr>
	</Table>
		</form>
		<center>
		<H2>이미지 업로드시 주의사항!</H2>
		<h3>이미지형은 goods숫자.png로 할것!</h3>
		<a href="https://jpg2png.com/ko/">jpg파일 png로 바꾸기</a>
		<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=imgup">
<input type="file" name="filename1" size=40 style="border: 1px solid black;"> 
<input type="submit" value="업로드">
		</form>
		</center>
		<script type="text/javascript">
		$("#insertItemForm").submit(function() {
			if($("#item_num").val()=="") {
				alert("다 입력해!");
				$("#item_num").focus();
				return false;
			}
			if($("#item_name").val()=="") {
				alert("다 입력해!");
				$("#item_name").focus();
				return false;
			}
			if($("#item_price").val()=="") {
				alert("다 입력해!");
				$("#item_price").focus();
				return false;
			}
			if($("#item_category").val()=="") {
				alert("다 입력해!");
				$("#item_category").focus();
				return false;
			}
			if($("#item_info").val()=="") {
				alert("다 입력해!");
				$("#item_info").focus();
				return false;
			}
			if($("#item_img").val()=="") {
				alert("다 입력해!");
				$("#item_img").focus();
				return false;
			}
			if($("#item_count").val()=="") {
				alert("다 입력해!");
				$("#item_count").focus();
				return false;
			}
			if($("#item_sale").val()=="") {
				alert("다 입력해!");
				$("#item_sale").focus();
				return false;
			}
			if($("#item_brand").val()=="") {
				alert("다 입력해!");
				$("#item_brand").focus();
				return false;
			}
		});
		</script>
		
	