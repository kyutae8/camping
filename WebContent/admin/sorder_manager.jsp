<%@page import="site.semi.dao.SorderDAO"%>
<%@page import="site.semi.dto.SorderDTO"%>
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
	
	List<SorderDTO> sorderList=SorderDAO.getDAO().sco(category);
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
.title {
	background: black;
	color: white;
	text-align: center;
}

.pname { width: 400px; 
		background: black;
		color: white;
}

td a, td a:visited {
	text-decoration: none;
}

td a:hover {
	text-decoration: underline;
	color: blue;
}
</style>


<div id="product">
	<h2>주문목록</h2>
	<div>
	</div>
	<div id="btnDiv">
	</div>
	
	<table>
		<tr>
			<td class="title">주문아이디</td>
			<td class="pname" class="title">제품명</td>
			<td class="title">제품수량</td>
			<td class="title">제품색상</td>
			<td class="title">제품가격</td>
			<td class="title">주문상태</td>
		</tr>
		
		<%-- if(productList.size()==0) { //같은말 --%>
		<% if(sorderList.isEmpty()) { %>
		<tr>
			<td colspan="4">등록된 제품이 하나도 없습니다.</td>
		</tr>
		<% } else {%>
			<% for(SorderDTO sorder:sorderList) { %>
			<tr>
				<td><%=sorder.getOid() %></td> 
				<td>
					<a href="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=sorder_detail&num=<%=sorder.getNum()%>">
					<%=sorder.getName() %></a>
				</td>
				<td><%=DecimalFormat.getInstance().format(sorder.getQty()) %></td>
				<td><%=sorder.getColor() %></td>
				<td><%=DecimalFormat.getCurrencyInstance().format(sorder.getPrice()) %></td>
			
			<td class="member_status">
			<select class="status" name="<%=sorder.getOid()%>">
				<option value="1" <% if(sorder.getStatus()==1) { %> selected="selected" <% } %>>
					주문중
				</option>
				<option value="2" <% if(sorder.getStatus()==2) { %> selected="selected" <% } %>>
					주문완료
				</option>
				<option value="3" <% if(sorder.getStatus()==3) { %> selected="selected" <% } %>>
					배송중
				</option>
				<option value="4" <% if(sorder.getStatus()==4) { %> selected="selected" <% } %>>
					배송완료
				</option>
			</select>
			</td>
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
			<option value="2" <% if(category.equals("2")) { %> selected="selected" <% } %>>
				주문완료
			</option>		
			<option value="3" <% if(category.equals("3")) { %> selected="selected" <% } %>>
				배송중
			</option>		
			<option value="4" <% if(category.equals("4")) { %> selected="selected" <% } %>>
				배송완료
			</option>		
		</select>
	</form>
</div>


<script type="text/javascript">
$(".status").change(function() {
	var oid=$(this).attr("name");//고유값
	var status=$(this).val();//변경값
	alert(oid+" = "+status);
	location.href="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=sorder_status_action&oid="+oid+"&status="+status;
});
 

$("#category").change(function() {
	$("#categoryForm").submit();
});

</script>











