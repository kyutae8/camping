<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
		<!-- ================= 파트 페이지들 :: START. ================= -->
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
@@ 장바구니 @@
- 파일위치 : [스킨폴더]/order/cart.html
++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/font.css" />

<!-- 구글 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700&amp;subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jqueryui/black-tie/jquery-ui-1.8.16.custom.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/slick.css"><!-- 반응형 슬라이드 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/lib.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/board.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/buttons.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/broadcast.css" /> 
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/user.css" /><!-- ++++++++++++ 스킨 사용자/제작자 CSS ++++++++++++ -->

<!-- /CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/javascript/plugin/jquery_swipe/jquery_swipe.css" />
<!-- 자바스크립트 -->
<script src="<%=request.getContextPath() %>/css/javascript/jquery/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/css/javascript/jquery/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath() %>/css/javascript/plugin/jquery.poshytip.min.js"></script>
<script src="<%=request.getContextPath() %>/css/javascript/plugin/jquery.activity-indicator-1.0.0.min.js"></script>
<script src="<%=request.getContextPath() %>/css/javascript/plugin/jquery.cookie.js"></script>
<script src="<%=request.getContextPath() %>/css/javascript/plugin/jquery.slides.min.js"></script>
<script src="<%=request.getContextPath() %>/css/javascript/plugin/jquery.placeholder.js"></script>
<script src="<%=request.getContextPath() %>/css/javascript/plugin/validate/jquery.validate.js"></script>
<script src="<%=request.getContextPath() %>/css/javascript/plugin/ezmark/js/jquery.ezmark.min.js"></script>
<script src="<%=request.getContextPath() %>/css/javascript/plugin/custom-select-box.js"></script>
<script src="<%=request.getContextPath() %>/css/javascript/plugin/custom-mobile-pagination.js"></script>
<script src="<%=request.getContextPath() %>/css/javascript/plugin/slick/slick.min.js"></script>
<script src="<%=request.getContextPath() %>/css/javascript/plugin/jquery_swipe/jquery.event.swipe.js"></script>
<script src="<%=request.getContextPath() %>/css/javascript/plugin/touchSlider/swiper.js"></script>
<script type='text/javascript'>var fbv='3.2';</script><script type='text/javascript' src='/app/javascript/js/facebook.js?v=20150501' charset='utf8'></script>

<div class="title_container">
	<h2><span designElement="text" textIndex="1"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvb3JkZXIvY2FydC5odG1s" >장바구니</span></h2>
</div>

<!-- 본문내용 시작 -->
<form name="cart_form" id="cart_form" method="post" target="actionFrame" action="order">
<input type="hidden" name="cart_version" value='3' />
<!--  -->
<ul class="resp_cart_wrap">
	<!-- ++++++++++++ cart left area +++++++++++ -->
	<li class="cart_left">
		<div class="cart_contents">

			<!-- 전체 선택 -->
			<ul class="cart_contents_top clearbox">
				<li class="aa">
					<label class="checkbox_allselect"><input type="checkbox" class="btn_select_all" /> <span class="txt">전체선택</span></label>
				</li>
			</ul>

			<div class="cart_list">
			<ul class="shipping_group_list">
				<li class="goods_delivery_info clearbox" id="sippingInfo1">
					<ul class="detail">
						<li class="th">배송 :</li>
						<li class="silmul">
							<span class="gray_01">[본사]</span>
							<span>택배</span>

							<span id="price_">무료</span>
							
							<div class="hope">
							</div>
						</li>
						<li class="btn_area">
							<button type="button" class="btn_resp" onclick="bundle_goods_search('1');" title="새창">다른상품 바로가기</button>
							<input type="button" class="btn_resp btn_shipping_modify" cart_seq="48" prepay_info="delivery" nation="korea" goods_seq="49" hop_date="" reserve_txt="" value="배송 변경" />
						</li>
					</ul>
				</li>
				<li class="cart_goods" id="cart_goods_50">
					<div class="cart_goods_detail">
						<div class="cgd_top">
							<label>
								<input type="hidden" name="ship_possible[50]" value="Y"/>
								<input type="checkbox" name="cart_option_seq[]" value="50" stat="Y" rel="49" />
								<span class="goods_name">세련된 혼합형 배너 제공</span>
							</label>
							<button type="button" class="btn_thisitem_del" value="50" title="상품 삭제">삭제 </button>
						</div>
						
						<div class="cgd_contents">
							<div class="block block1">
								<ul>
									<li class="img_area">
										<%-- <a href="<%=request.getContextPath()%>/index.jsp?workgroup=product&work=product_list"><img src="<%=request.getContextPath() %>/images/goods/goods1.png" class="goods_thumb" onerror="this.src='/data/skin/responsive_camping_healing_gl/images/common/noimage_list.gif'" /></a> --%>
									</li>
									<li class="option_area">

										<ul class="cart_option">
											<li><span class="xtle">색상</span> 살구색</li>
										</ul>

										<div class="cart_quantity"><span class="xtle">수량</span> 1개 <span class="add_txt">(64,000&#x20a9;)</span></div>


									</li>
								</ul>
							</div>

							<ul class="block block2" id="mobile_cart_sale_tr_50">
								<li class="price_a">
									<span class="ptitle">상품금액</span> 64,000&#x20a9;
								</li>
								<li class="price_b">
									<span class="ptitle">
										할인금액 
									</span>
									-&nbsp;

									<div id="cart_sale_detail_50" class="resp_layer_pop hide">
										<h4 class="title">할인 내역</h4>
										<div class="y_scroll_auto2">
											<div class="layer_pop_contents v5">
												<div class="resp_1line_table">
													<ul id="mobile_cart_option_event_saletr_50" class="hide">
														<li class="th size1"><p>이벤트</p></li>
														<li class="td"><span id="mobile_cart_option_event_saleprice_50">0&#x20a9;</span></li>
													</ul>
													<ul id="mobile_cart_option_multi_saletr_50" class="hide">
														<li class="th size1"><p>대량구매</p></li>
														<li class="td"><span id="mobile_cart_option_multi_saleprice_50">0&#x20a9;</span></li>
													</ul>
													<ul id="mobile_cart_option_referer_saletr_50" class="hide">
														<li class="th size1"><p>유입경로</p></li>
														<li class="td"><span id="mobile_cart_option_referer_saleprice_50">0&#x20a9;</span></li>
													</ul>
													<ul id="mobile_cart_option_member_saletr_50" class="hide">
														<li class="th size1"><p>등급할인</p></li>
														<li class="td"><span id="mobile_cart_option_member_saleprice_50">0&#x20a9;</span></li>
													</ul>
													<ul id="mobile_cart_option_like_saletr_50" class="hide">
														<li class="th size1"><p>좋아요</p></li>
														<li class="td"><span id="mobile_cart_option_like_saleprice_50">0&#x20a9;</span></li>
													</ul>
													<ul id="mobile_cart_option_ordersheet_saletr_50" class="hide">
														<li class="th size1"><p>주문서쿠폰</p></li>
														<li class="td"><span id="mobile_cart_option_ordersheet_saleprice_50">0&#x20a9;</span></li>
													</ul>
												</div>
											</div>
										</div>
										<div class="layer_bottom_btn_area2">
											<button type="button" class="btn_resp size_c color5 Wmax" onclick="hideCenterLayer()">확인</button>
										</div>
										<a href="javascript:void(0)" class="btn_pop_close" onclick="hideCenterLayer()"></a>
									</div>

								</li>
								<li class="price_c">
									<span class="ptitle">할인적용금액</span>
									<span class="total_p" id="option_suboption_price_sum_50"><span class="num">64,000</span>&#x20a9;</span>
								</li>
							</ul>

							<ul class="block block3">
								<li><button type="button" class="btn_option_modify btn_resp" id="50">옵션/수량변경</button></li>
								<!--li><button type="button" class="btn_option_modify btn_resp" id="50">옵션/수량변경</button></li-->
								<li><button type="button" class="btn_direct_buy btn_resp color2" value="50">바로구매</button></li>
							</ul>

						</div>

						<!-- 옵션 수량변경 Layer -->
						<div id="optional_changes_area_50" class="resp_layer_pop maxHeight hide">
							<h4 class="title">옵션/수량 변경</h4>
							<div class="y_scroll_auto">
								<div class="layer_pop_contents v2 Pb70">
									<!--h5 class="stitle">세련된 혼합형 배너 제공</h5-->
									<div id="onContent">
										옵션/수량 변경 컨텐츠
									</div>
								</div>
							</div>
							<a href="javascript:void(0)" class="btn_pop_close" onclick="hideCenterLayer()"></a>
						</div>

					</div>
				</li>
			</ul>
			</div>
		</div>

		<!-- 버튼 그룹 -->
		<div class="selected_btn_groups">
			<label class="checkbox_allselect"><input type="checkbox" class="btn_select_all" /> <span class="txt">전체선택</span></label>
			
			<div class="btns">
				<button type="button" class="btn_resp size_b color2 btn_selected_order">선택상품 주문하기</button>
				<button type="button" class="btn_resp size_b gray_05 btn_select_del">선택상품 삭제</button>
			</div>
		</div>
	</li>
	<!-- ++++++++++++ //cart left area +++++++++++ -->

	<!-- ++++++++++++ cart right area +++++++++++ -->
	<li class="cart_right">
		<h3 class="title_x">전체 주문시 금액</h3>

		<!-- 총합계 Start -->
		<div class="total_sum_price">
			<ul class="list list1">
				<li class="th">총 상품금액</li>
				<li class="td"><span class="sum_price" id="totalGoodsPrice"><span class="num">64,000</span>&#x20a9;</span></li>
			</ul>
			<ul class="list list2">
				<li class="th">총 배송비</li>
				<li class="td"><span class="sum_price" id="shippingTotalPrice"><span id="total_shipping_price">0&#x20a9;</span></span></li>
			</ul>
			<ul class="list list3">
				<li class="th">총 할인</li>
				<li class="td"><span class="sum_price" id="saleTotalPrice"><span id="mobile_total_sale">0&#x20a9;</span></span></li>
			</ul>
			<ul class="list list4 total">
				<li class="th">총 결제금액</li>
				<li class="td"><span class="sum_price settle_price" id="totalPrice"><span class="num">64,000</span>&#x20a9;</span></li>
			</ul>
		</div>

		<ul class="cart_order_btn_area">
			<li>
				<button type="button" class="btn_resp size_c btn_select_estimate">전체 견적서</button>
			</li>
			<li>
				<input type="button" class="btn_resp size_c color2 btn_all_order"  value="전체 주문하기" />
			</li>
		</ul>
		<div class="pdb10 center"></div>
	</li>
	<!-- ++++++++++++ //cart right area +++++++++++ -->
</ul>
</head>
<body>


</body>
<%@include file="../footer.jsp"%>
</html>
