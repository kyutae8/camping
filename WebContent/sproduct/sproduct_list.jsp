<%@page import="site.semi.dao.SproductDAO"%>
<%@page import="site.semi.dto.SproductDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- PRODUCT 테이블에 저장된 제품정보를 검색하여 클라이언트에게 제품목록을 전달하는 JSP 문서 --%>
<%
	String category=request.getParameter("category");
	if(category==null) category="ALL";
	List<SproductDTO> sproductList=SproductDAO.getDAO().selectCategoryProductList(category);
%>
<style type="text/css">
#productList {
	width: 1000px;
	margin: 0 auto;
}

.product {
	padding: 10px 5px;
	border: 1px solid black;
	width: 300px;
	margin: 10px;
	text-align: center;
	float: left;
}

</style>
<div id="catalog_page">
	<div class="search_nav">
		&nbsp;&nbsp;메인페이지<a class="home" href="<%=request.getContextPath()%>/index.jsp">&nbsp;&nbsp;홈</a>
		<form method="post" id="categoryForm">
		&nbsp;&nbsp;카테고리&nbsp;&nbsp;
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
</div>

	<div class="category_edit_area mobile_img_adjust">
		<p xss="removed">
			<img src="<%=request.getContextPath()%>/sproduct_image/mountainLogo.jpg" class="txc-image" xss="removed" >
		</p>
	</div>
	<form name="goodsSearchForm" id="goodsSearchForm" method="post">
		<input type="hidden" name="osearchtext">
		<input type="hidden" name="ship_grp_seq">
		<input type="hidden" name="event">
		<input type="hidden" name="gift">
		<input type="hidden" name="page" value="1">
		<input type="hidden" name="searchMode" value="catalog">
		<div id="filterResultCount"><%=sproductList.size()%></div>
		<div class="search_filter_wrap" data-ezmark="undo">
			<ul id="searchFilter" class="search_filter no_filter devide0" style=""></ul>

			<ul id="filteredItemSorting" class="filtered_item_sorting">
				<li class="item_total"><a href="javascript:void(0)"id="btnFilterOpen" class="total"> <span class="num"><%=sproductList.size()%></span>개</a></li>
			</ul>
		</div>
	</form>
	

	<script type="text/javascript">
		$("#category").change(function() {
			$("#categoryForm").submit();
		});
</script>
<div id="productList">
<% for(SproductDTO sproduct:sproductList) { %>

	<div class="product">
		<div><%=sproduct.getName() %></div>
		<div>[<%=sproduct.getCode() %>]<%=sproduct.getColor() %></div>
		<div>
			<a href=" <%=request.getContextPath()%>/index.jsp?workgroup=sproduct&work=sproduct_action&num=<%=sproduct.getNum()%>">
				<img src="<%=request.getContextPath() %>/sproduct_image/mheader<%=sproduct.getNum() %>.png" width="200">
			</a>
		</div>
		<div>
			<%=DecimalFormat.getCurrencyInstance().format(sproduct.getPrice()) %>
		</div>
	</div>
<% } %>
</div>

<div style="clear:both;"></div>





