<%@page import="site.semi.dto.SproductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %>   
<%
	String message=(String)session.getAttribute("message");
	if(message==null) {
		message="";
	} else {
		session.removeAttribute("message");
	}
	
	SproductDTO sproduct=(SproductDTO)session.getAttribute("sproduct");
	if (sproduct!=null) {
		session.removeAttribute("product");
	}
%>

<style type="text/css">
#product {
	width : 800px;
	margin: 0 auto;
}

table {
	margin: 0 auto;
}

td {
	text-align: left;
}
</style>

<div id="product">
	<h2>제품등록</h2>
	<form action="<%=request.getContextPath() %>/index.jsp?workgroup=admin&work=sproduct_add_action"
		method="post" enctype="multipart/form-data" id="productForm">
	<table>
		<tr>
			<td>제품코드</td>
			<td>
				<select name="category">
					<option value="TENT" selected="selected">텐트</option>
					<option value="BAG">침낭</option>
					<option value="TOOL">식기</option>
				</select>
			</td>
		</tr>
		<tr>	
			<td>제품명</td>
			<td>
				<input type="text" name="productName"  id="productName"
					<% if(sproduct!=null){ %> value="<%=sproduct.getName() %>" <% } %>>
			</td>
		</tr>	
		<tr>
			<td>제품색상</td>
			<td>
				<select name="category2">
					<option value="RED" selected="selected">빨강</option>
					<option value="GREEN">초록</option>
					<option value="YELLOW">노랑</option>
				</select>
			</td>
		</tr>		
		<tr>	
			<td>제품이미지</td>
			<td>
				<input type="file" name="mainImage"  id="mainImage">
			</td>
		</tr>
		<tr>	
			<td>제품상세설명</td>
			<td>
				<textarea rows="7" cols="60" name="productDetail" id="productDetail"><% if(sproduct!=null) { %><%=sproduct.getDetail()%><% } %></textarea>
			</td>
		</tr>
		<tr>
			<td>제품수량</td>
			<td>
				<input type="text" name="productQty" id="productQty" 
					<% if(sproduct!=null) { %> value="<%=sproduct.getQty()%>" <% } %>>
			</td>
		</tr>
		<tr>
			<td>제품가격</td>
			<td>
				<input type="text" name="productPrice" id="productPrice" 
					<% if(sproduct!=null) { %> value="<%=sproduct.getPrice()%>" <% } %>>
			</td>
		</tr>
		<tr>
			<td colspan="2"><button type="submit">제품등록</button></td>
		</tr>
	</table>
	</form>
	
	<div id="message" style="color:red;"><%=message %></div>
</div>

<script type="text/javascript">
$("#productForm").submit(function() {
	if($("#productCode").val()=="") {
		$("#message").text("제품코드를 입력해 주세요.");
		$("#productCode").focus();
		return false;
	}
	if($("#productName").val()=="") {
		$("#message").text("제품명을 입력해 주세요.");
		$("#productName").focus();
		return false;
	}
	if($("#mainImage").val()=="") {
		$("#message").text("제품이미지를 입력해 주세요.");
		$("#mainImage").focus();
		return false;
	}
	if($("#productDetail").val()=="") {
		$("#message").text("제품상세설명을 입력해 주세요.");
		$("#productDetail").focus();
		return false;
	}
	if($("#productQty").val()=="") {
		$("#message").text("제품수량을 입력해 주세요.");
		$("#productQty").focus();
		return false;
	}
	if($("#productPrice").val()=="") {
		$("#message").text("제품가격을 입력해 주세요.");
		$("#productPrice").focus();
		return false;
	}
});

</script>


