<%@page import="java.text.DecimalFormat"%>
<%@page import="site.semi.dao.SproductDAO"%>
<%@page import="site.semi.dto.SproductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 제품번호를 전달받아 PRODUCT 테이블에 저장된 해당 제품번호의 제품정보를 검색하여 입력태그의
초기값으로 설정하고 변경값을 입력받는 JSP 문서 --%>
<%-- => 로그인 상태의 관리자만 접근 가능하도록 권한 설정 --%>
<%-- => [제품변경]을 클릭한 경우 제품정보 변경 처리페이지(product_modify_action.jsp)로 이동 - 입력값(제품정보) 전달 --%>
<%@include file="/security/admin_check.jspf" %>  

<%
	int num=Integer.parseInt(request.getParameter("num"));

	SproductDTO sproduct=SproductDAO.getDAO().selectNumSproduct(num);
%>

<style type="text/css">
#product {
	width: 800px;
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
	<h2>제품변경</h2>
	<%-- 파일을 입력받아 전달하기 위해 method 속성값을 [post]로 설정하고 enctype 속성값을
	[multipart/form-data]로 반드시 설정 --%>
	<form action="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=sproduct_modify_action"
		method="post" enctype="multipart/form-data" id="productForm">
	<input type="hidden" name="productNum" value="<%=sproduct.getNum()%>">
	<%-- 제품이미지를 변경하지 않을 경우 기존 제품이미지 사용을 위해 전달하거나 제품이미지를
	변경할 경우 기존 제품이미지 파일을 제거하기 위해 전달 --%>	
	<input type="hidden" name="currentMainImage" value="<%=sproduct.getImage()%>">	
	<table>
		<tr>
			<td>제품코드</td>
			<td>
				<select name="category">
					<option value="TENT" <% if(sproduct.getCode().split("_")[0].equals("TENT")) { %> selected="selected" <% } %>>텐트(TENT)</option>
					<option value="BAG" <% if(sproduct.getCode().split("_")[0].equals("BAG")) { %> selected="selected" <% } %>>침낭(BAG)</option>
					<option value="TOOL" <% if(sproduct.getCode().split("_")[0].equals("TOOL")) { %> selected="selected" <% } %>>식기(TOOL)</option>
				</select>
				<input type="text" name="productCode" id="productCode" value="<%=sproduct.getCode()%>">
			</td>
		<tr>
		<tr>
			<td>제품명</td>
			<td>
				<input type="text" name="productName" id="productName" maxlength="20" value="<%=sproduct.getName()%>">
			</td>
		</tr>
		<tr>
			<td>제품색상</td>
			<td>
				<select name="category2">
					<option value="RED" <% if(sproduct.getColor().split("_")[0].equals("TENT")) { %> selected="selected" <% } %>>빨강(RED)</option>
					<option value="GREEN" <% if(sproduct.getColor().split("_")[0].equals("BAG")) { %> selected="selected" <% } %>>초록(GREEN)</option>
					<option value="YELLOW" <% if(sproduct.getColor().split("_")[0].equals("TOOL")) { %> selected="selected" <% } %>>노랑(YELLOW)</option>
				</select>
			</td>
		<tr>
		<tr>
			<td>제품이미지</td>
			<td>
				<img src="<%=request.getContextPath() %>/sproduct_image/<%=sproduct.getImage() %>" width="200">
				<br>
				<input type="file" name="mainImage" id="mainImage">
			</td>
		</tr>
		<tr>
			<td>제품상세설명</td>
			<td>
				<textarea rows="7" cols="60" name="productDetail" id="productDetail"><%=sproduct.getDetail()%></textarea>
			</td>
		</tr>
		<tr>
			<td>제품수량</td>
			<td>
				<input type="text" name="productQty" id="productQty" value="<%=sproduct.getQty()%>">
			</td>
		</tr>
		<tr>
			<td>제품가격</td>
			<td>
				<input type="text" name="productPrice" id="productPrice" value="<%=sproduct.getPrice()%>">
			</td>
		</tr>
		<tr>
			<td colspan="2"><button type="submit">제품변경</button></td>
		</tr>
	</table>
	</form>
	
	<div id="message" style="color: red;"></div>
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
	$("#message").text("제품이미지를 선택해 주세요.");
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