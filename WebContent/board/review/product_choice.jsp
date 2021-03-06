<%@page import="site.semi.dao.SproductDAO"%>
<%@page import="site.semi.dto.SproductDTO"%>
<%@page import="site.semi.dao.SboardDAO"%>
<%@page import="java.util.List"%>
<%@page import="site.semi.dto.ItemDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String category="ALL";
	ItemDTO item=new ItemDTO();
	
	List<ItemDTO> itemList=SboardDAO.getDAO().selectAllItem();
	List<SproductDTO> sproductList=SproductDAO.getDAO().selectCategoryProductList(category);
	if(request.getParameter("itemname")!=null) {//동이름이 전달된 경우
		itemList=SboardDAO.getDAO().selectSearchItem(request.getParameter("itemname"));
		sproductList=SboardDAO.getDAO().selectSearchItem2(request.getParameter("itemname"));
	}
%>

<%-- 
<img src="<%=request.getContextPath()%>/images/goods/<%=dto.getItem_img()%>.png">
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
td{
	height: 100px;
	width: 140px;
}
input{
	height: 32px;
	width: 530px;
}
</style>
</head>
<body>
	<div class="container text-center">
		<h3>상품선택</h3>
		<form name="item_choice" method="post">
	    <input type="text" name="itemname" placeholder="상품 이름 검색123" height="50px">
	    <button class="btn btn-default" style="margin-bottom: 2px" id="searchBtn">검색</button><br><br>
		</form>
		<table class="table table-bordered text-center">
			<thead>
				<tr>
					<th class="text-center">이미지</th>
					<th class="text-center" colspan="4">상품이름</th>

				</tr>
			</thead>
			<tbody>
				<% for(ItemDTO itemall:itemList) { %>
				<tr>
					<td>
					<img src="<%=request.getContextPath()%>/images/goods/<%=itemall.getItem_img()%>.png" width="100px">
					</td>
					<td colspan="4" style="padding-top: 40px;">
					<a href="javascript:searchClose('<%=itemall.getItem_num()%>','<%=itemall.getItem_name() %>');">
					<%=itemall.getItem_name() %>
					</a>
					</td>
				</tr>
				<%} %>
				<% for(SproductDTO sproduct:sproductList) { %>
				<tr>
					<td>
					<%-- <img src="<%=request.getContextPath()%>/sproduct_image/<%=sproduct.getImage()%>" width="100px"> --%>
					<img src="<%=request.getContextPath() %>/sproduct_image/mheader<%=sproduct.getNum() %>.png" width="200">
					</td>
					<td colspan="4" style="padding-top: 40px;">
					<a href="javascript:searchClose('<%=sproduct.getNum()%>','<%=sproduct.getName() %>');">
					<%=sproduct.getName() %>
					</a>
					</td>
				</tr>
				<%} %>
				
			</tbody>
		</table>
	</div>
</body>
<script type="text/javascript">
item_choice.itemname.focus();

document.getElementById("searchBtn").onclick=function() {
	if(item_choice.itemname.value=="") {
		item_choice.itemname.focus();
		return;
	}
	postForm.submit();
}

function searchClose(num, name) {
	opener.writeform.itemnum.value=num;
	opener.writeform.itemname.value=name;
	window.close();		
}

</script>
</html>