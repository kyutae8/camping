<%@page import="site.semi.dao.ItemDAO"%>
<%@page import="java.util.List"%>
<%@page import="site.semi.dto.ItemDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<ItemDTO> list = ItemDAO.getDAO().selectAllItem();
%>
<div id="layout_body" class="layout_body">
<div id="catalog_page">
	<div class="search_nav">
		<a class="home" href="<%=request.getContextPath()%>/index.jsp">홈</a> <span
			class="navi_linemap"> <select name="navi_0"
			class="navi-select" onchange="link_navi(this,'catalog')">
				<option value="0003" selected="selected">상품&nbsp;</option>

		</select>
		</span>
	</div>
	<div class="category_edit_area mobile_img_adjust">
		<p xss="removed">
			<img src="<%=request.getContextPath()%>/images/common/상품대표.jpg"
				class="txc-image" xss="removed">
		</p>
	</div>
	<form name="goodsSearchForm" id="goodsSearchForm" method="post">
		<input type="hidden" name="osearchtext"> <input type="hidden"
			name="ship_grp_seq"> <input type="hidden" name="event">
		<input type="hidden" name="gift"> <input type="hidden"
			name="page" value="1"> <input type="hidden" name="searchMode"
			value="catalog">
		<div id="filterResultCount"><%=list.size()%></div>
		<div class="search_filter_wrap" data-ezmark="undo">
			<ul id="searchFilter" class="search_filter no_filter devide0"
				style="">
			</ul>

			<ul id="filteredItemSorting" class="filtered_item_sorting">
				<li class="item_total"><a href="javascript:void(0)"
					id="btnFilterOpen" class="total"> <span class="num"><%=list.size()%></span>
						개
				</a></li>
			</ul>
		</div>
	</form>
	<script type="text/javascript">
		var brand_best_icon = "";
		$(document)
				.ready(
						function() {
							filterDisplay();
							$("#searchFilterSelected").hide();
							// 상품 색상 코드값 디자인 white --> border
							if ($('.displaY_color_option').length > 0) {
								$('.displaY_color_option .areA')
										.filter(
												function() {
													return ($(this).css(
															'background-color') == 'rgb(255, 255, 255)');
												}).addClass('border');
							}
							var aParams = {
								'category' : '',
								'brand' : '',
								'location' : '',
								'delivery' : '',
								'color' : '',
								'provider' : '',
								're_search' : '',
								'min_price' : '',
								'max_price' : ''
							};
							aParams['category'] = load_seleted_filter(
									'category', 'category', 'category_0003',
									'c0003', '텐트/타프', 'category', 'c0003');
							$('#searchFilterSelected .selected_item_area')
									.append(aParams['category']);
							set_classification('0003', '');
							displaySearchFilter();

							goodsSearch('auto');
						});
	</script>
	<div id="searchedItemDisplay" class="searched_item_display"
		data-displaytype="list">
		<ul>
			<%--여기서부터 db가 들어갈 시간! --%>
			<%
			for (int i = 0; i < list.size(); i++) {
				ItemDTO dto = list.get(i);
			%>
			<li class="goods_list_style1">
				<div class="item_img_area">
					<a id="aaa"
						href="<%=request.getContextPath()%>/index.jsp?workgroup=product&work=product_action&itemno=<%=dto.getItem_num()%>">

						<img
						src="<%=request.getContextPath()%>/images/goods/<%=dto.getItem_img()%>.png">
					</a>
					<div class="display_zzim">
						<img
							src="<%=request.getContextPath()%>/images/icon/goodsdisplay/preview/thumb_zzim_off.png"
							class="zzimOffImg" alt="찜하기" data-member data-goods="49"
							data-wish onclick="setWish(this)"> <img
							src="<%=request.getContextPath()%>/images/icon/goodsdisplay/preview/thumb_zzim_on.png"
							class="zzimOnImg" alt="찜하기" style="" data-member data-goods="49"
							data-wish onclick="setWish(this)">
					</div>
				</div>
				<ul class="item_info_area">
					<li class="displaY_color_option"><span class="areA border"
						style="background-color: #FFFFFF;"></span> <span class="areA"
						style="background-color: #6b4d32;"></span> <span class="areA"
						style="background-color: #b89f88;"></span> <span class="areA"
						style="background-color: #ebd8c1;"></span></li>
					<li class="goods_name_area"><span class="brand_name"><%=dto.getItem_brand()%>
					</span> <a href="<%=request.getContextPath()%>/index.jsp?workgroup=product&work=product_action&itemno=<%=dto.getItem_num()%>"> <span class="name"><%=dto.getItem_name()%></span>
					</a></li>
					<li class="goods_desc_area"><%=dto.getItem_info()%></li>
					<li class="goods_price_area"><span class="sale_price">
							<b class="num"><%=(int) (dto.getItem_price() - (dto.getItem_price()) * (0.29))%></b>
							원
					</span> <span class="consumer_price"> <span class="num"><%=dto.getItem_price()%></span>
							원
					</span> <span class="discount_rate"> <b class="num"><%=dto.getItem_sale()%></b>
							%
					</span></li>
					<li class="goods_seller_area"><span class="name"><%=dto.getItem_brand()%></span>
						<span class="rank"></span></li>
					<li class="goods_icon_area"><img alt=""
						src="<%=request.getContextPath()%>/images/icon/goods/16.gif">
						<img alt=""
						src="<%=request.getContextPath()%>/images/icon/goods/17.gif">
					</li>
				</ul>
			</li>
			<%} %>
		</ul>
	</div>
</div>
</div>


