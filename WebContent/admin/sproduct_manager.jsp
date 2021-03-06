<%@page import="site.semi.dao.SproductDAO"%>
<%@page import="site.semi.dto.SproductDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 카테고리를 전달받아 PRODUCT 테이블에 저장된 해당 카테고리의 제품정보를 검색하여 
클라이언트에게 제품목록을 전달하는 JSP 문서 --%>    
<%-- => 로그인 상태의 관리자만 접근 가능하도록 권한 설정 --%>
<%-- => [카테고리]를 변경한 경우 제품목록 출력페이지(product_manager.jsp)로 이동 카테고리 전달 --%>
<%-- => [제품등록]을 클릭한 경우 제품정보 입력페이지(product_add.jsp)로 이동 --%>
<%-- => [제품명]을 클릭한 경우 제품정보 상세 출력페이지(product_detail.jsp)로 이동 - 제품번호 전달 --%>
<%@include file="/security/admin_check.jspf" %>    
<% 
	String category=request.getParameter("category");
	if(category==null) category="ALL";
	
	List<SproductDTO> sproductList=SproductDAO.getDAO().selectCategoryProductList(category);
	%>

<style type="text/css">
#product {
	width: 800px;
	margin: 10px auto;
}	

#btnDiv {
	text-align: right;
	margin-bottom: 5px;
}

table {
	border: 1px solid black;
	border-collapse: collapse;
}

td {
	border: 1px solid black;
	text-align: center;
	width: 200px;
}

.pname { width: 400px; }

td a, td a:visited {
	text-decoration: none;
}

td a:hover {
	text-decoration: underline;
	color: blue;
}
</style>


<div id="product">
	<h2>제품목록</h2>
	
	<div id="btnDiv">
		<button type="button" id="addBtn">제품등록</button>
	</div>
	
	<table>
		<tr>
			<td>제품코드</td>
			<td class="pname">제품명</td>
			<td>제품수량</td>
			<td>제품색상</td>
			<td>제품가격</td>
		</tr>
		
		<%-- if(productList.size()==0) { //같은말 --%>
		<% if(sproductList.isEmpty()) { %>
		<tr>
			<td colspan="4">등록된 제품이 하나도 없습니다.</td>
		</tr>
		<% } else {%>
			<% for(SproductDTO sproduct:sproductList) { %>
			<tr>
				<td><%=sproduct.getCode() %></td>
				<td>
					<a href="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=sproduct_detail&num=<%=sproduct.getNum()%>">
					<%=sproduct.getName() %></a>
				</td>
				<td><%=DecimalFormat.getInstance().format(sproduct.getQty()) %></td>
				<td><%=sproduct.getColor() %></td>
				<td><%=DecimalFormat.getCurrencyInstance().format(sproduct.getPrice()) %></td>
			</tr>
			<% } %>
		<% } %>
	</table>
	<div>&nbsp;</div>
	
	<!-- action 속성이 생략된 경우 현재 URL 주소의 웹문서를 재요청(자기자신) -->
	<form method="post" id="categoryForm">
		<select name="category" id="category">
			<option value="ALL" <% if(category.equals("ALL")) { %> selected="selected" <% } %>>
				전체
			</option>	
			<option value="TENT" <% if(category.equals("TENT")) { %> selected="selected" <% } %>>
				텐트
			</option>		
			<option value="BAG" <% if(category.equals("BAG")) { %> selected="selected" <% } %>>
				침낭
			</option>		
			<option value="TOOL" <% if(category.equals("TOOL")) { %> selected="selected" <% } %>>
				식기
			</option>		
		</select>
	</form>
</div>


<script type="text/javascript">
$("#addBtn").click(function() {
	location.href="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=sproduct_add";
});

$("#category").change(function() {
	$("#categoryForm").submit();
});

</script>











