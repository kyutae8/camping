<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
				<li class="bb hide">
					<input type="button" class="btn_resp size_b btn_shipping_modify" value="배송변경" />
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
							<button type="button" class="btn_resp" onclick="bundle_goods_search('1');" title="새창">묶음배송 상품보기</button>
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
										<a href="<%=request.getContextPath()%>/index.jsp?workgroup=product&work=product_list"><img src="<%=request.getContextPath() %>/images/goods/goods1.png" class="goods_thumb" onerror="this.src='/data/skin/responsive_camping_healing_gl/images/common/noimage_list.gif'" /></a>
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
<!--  -->


	
		


	<div class="total_price_n_btns">
		

		
	</div>


	




</form>


	<div align="center" id="facebook_mgs">장바구니 예시!</div>

	<div id="optional_changes_dialog" style="display:none;"></div>

	<!-- 배송 변경 레이어 -->
	<div id="shipping_detail_lay" class="resp_layer_pop hide">
		<h4 class="title">배송 변경</h4>
		<div class="y_scroll_auto2">
			<div class="layer_pop_contents v5"></div>
		</div>
		<a href="javascript:void(0)" class="btn_pop_close" onclick="hideCenterLayer()"></a>
	</div>

<div id="international_shipping_info" class="hide pd5">
<p designElement="text" textIndex="1"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvX2ludGVybmF0aW9uYWxfc2hpcHBpbmdfaW5mby5odG1s" >1. 주문하신 물품의 총 결제금액이 15만원 이상 (환율의 변동에 따라 다를 수 있음) 이면 과부가세가 발생합니다.  관부가세는 고객님께서 부담하시는 금액으로 문자를 통해 입금내역이 발송되며 해당 관세사로 입금하시면 통관처리됩니다.<br /><br />2. 해외구매 특성상 주문에서 배송까지는 평균 10~15일이 소요됩니다. 간혹 현지 제품 수급에 따라 부득이하게 시일이 더 소요 될 수 있으니 구매시 좀 더 여유있게 주문하시길 권합니다.<br /><br />3. 해외 내수품인 관계로 A/S에 대해서는 별도의 책임을 지지 않습니다.<br /><br />4. 해외배송 특성상 주문접수후 배송상태가 배송준비중으로 넘어간 경우 해외에서 국내로의 배송이 이루어지고 있다는 뜻입니다. 따라서 배송준비중으로 배송상태가 넘어간 경우 취소및 반품이 불가하므로 이점 양해 부탁드립니다.<br /><br />5. 타 해외구매대행 사이트에서 주문하신 물건과 주문날짜가 겹치지않도록 주의해 주십시오. 통관날짜가 같을 경우 합산관세가 부가되게 됩니다.</p>
</div>

		<script language="JavaScript" src="../order/fblike_opengraph"></script>
<script type="text/javascript">

	$(document).ready(function() {
		
		var cartVersion = $('input[name=cart_version]').val(); //18-05-03 카트 스킨 버전 gcns jhs add


		// 전체 선택
		$("form#cart_form .btn_select_all").change(function() {
			if($(this).is(":checked")){
				$("form#cart_form .btn_select_all").attr("checked",true);
				//$("form#cart_form .btn_select_all").closest("div").addClass("ez-checkbox-on");
				$("form#cart_form input[name='cart_option_seq[]']").each(function(){
					$(this).attr("checked",true);
					//$(this).closest("div").addClass("ez-checkbox-on");
				});
				$(".cart_goods").addClass('selected');
				cnt = $("form#cart_form input[name='cart_option_seq[]']").length;
				
				//18-05-03 gcns jhs add 장바구니 개선
				if(cartVersion >= 3){
					setPriceInfoCheck();	//전체 주문선택 금액 계산 추가 gcns jhs add
				}
			}else{
				$("form#cart_form .btn_select_all").removeAttr("checked");
				//$("form#cart_form .btn_select_all").closest("div").removeClass("ez-checkbox-on");
				$("form#cart_form input[name='cart_option_seq[]']").each(function(){
					$(this).removeAttr("checked");
					//$(this).closest("div").removeClass("ez-checkbox-on");
				});
				$(".cart_goods").removeClass('selected');
				//18-05-03 gcns jhs add 장바구니 개선
				if(cartVersion >= 3){				
					setPriceInfoCheck();	//전체 주문선택 금액 계산 추가 gcns jhs add	
				}
			}
		});
		/*
		$("form#cart_form .btn_select_all").change(function() {
			if($(this).is(":checked")){
				$("form#cart_form input[name='cart_option_seq[]']").each(function(){
					$(this).attr("checked",true);
					$(this).closest("div").addClass("ez-checkbox-on");
				});
				$(".cart_goods").css('outline','2px solid #769dff');
				cnt = $("form#cart_form input[name='cart_option_seq[]']").length;
			}else{
				$("form#cart_form input[name='cart_option_seq[]']").each(function(){
					$(this).removeAttr("checked");
					$(this).closest("div").removeClass("ez-checkbox-on");
				});
				$(".cart_goods").css('outline','');
			}
		});
		*/

		// 해당 상품삭제
		$(".btn_thisitem_del").click(function() {
			var selected_order = $(this).val();
			$("input[name='cart_option_seq[]']").removeAttr("checked");
			$("input[name='cart_option_seq[]'][value='"+selected_order+"']").attr("checked", true);

			$("form#cart_form").attr("action","del");
			$("form#cart_form").attr("target","actionFrame");
			$("form#cart_form")[0].submit();
		});

		// 선택 상품 삭제
		$(".btn_select_del").click(function() {
			var selected_order = '';
			$("input[name='cart_option_seq[]']").each(function(e, el) {
				if( $(el).attr('checked') == 'checked' ){
					selected_order += $(el).val() + ",";
				}
			});
			if(!selected_order){
				//삭제할 상품을 선택해 주세요.
				openDialogAlert(getAlert('oc003'),'400','140');
				return false;
			}
			$("form#cart_form").attr("action","del");
			$("form#cart_form").attr("target","actionFrame");
			$("form#cart_form")[0].submit();
		});


		// 옵션/수량변경 클릭시
		$("button.btn_option_modify").bind("click",function() {
			var id = $(this).attr("id");
			var url = "optional_changes?no="+id+"&t="+new Date().getTime();
			var area_obj = $("#optional_changes_area_"+id);
			$.get(url, function(data) {
				area_obj.find('#onContent').empty().html(data);
				showCenterLayer(area_obj);
			});
		});

		// 바로구매
		$(".btn_direct_buy").bind("click",function() {
			var selected_order = $(this).val();
			$("input[name='cart_option_seq[]']").removeAttr("checked");
			$("input[name='cart_option_seq[]'][value='"+selected_order+"']").attr("checked", true);

			//$("form#cart_form").attr("action","settle?mode=choice");
			$("form#cart_form").attr("action","addsettle?mode=choice");
			$("form#cart_form").attr("target","");
			$("form#cart_form")[0].submit();
			$("form#cart_form").attr("target","actionFrame");
		});

		// 선택 주문
		$(".btn_selected_order").bind("click",function() {
			var selected_order = '';
			var ship_possible = true;
			$("input[name='cart_option_seq[]']").each(function(e, el) {
				if( $(el).attr('checked') == 'checked' ){
					if( $(el).attr('stat') != 'Y' ){
						ship_possible = false;
						return false;
					}
					selected_order += $(el).val() + ",";
				}
			});

			if(!ship_possible){
				// 주문이 불가능한 상품이 있습니다.
				openDialogAlert(getAlert('os142'),'400','140');
				return false;
			}

			if(!selected_order){
				//주문할 상품을 선택해 주세요.
				openDialogAlert(getAlert('oc042'),'400','140');
				return false;
			}

			//$("form#cart_form").attr("action","settle?mode=choice");
			$("form#cart_form").attr("action","addsettle?mode=choice");
			$("form#cart_form").attr("target","");
			$("form#cart_form")[0].submit();
			$("form#cart_form").attr("target","actionFrame");
		});

		// 전체 주문
		$(".btn_all_order").bind("click",function() {
			$("form#cart_form").attr("action","addsettle");
			$("form#cart_form").attr("target","actionFrame");
			$("form#cart_form")[0].submit();
		});

		// 선택 위시리스트 저장
		$(".btn_select_wishlist").bind("click",function(){
			$("form#cart_form").attr("action","../mypage/wish_add?mode=cart");
			$("form#cart_form").attr("target","actionFrame");
			$("form#cart_form")[0].submit();
		});

		// 비우기
		$(".btn_select_all_del").bind("click",function(){
			$("input[name='cart_option_seq[]']").attr("checked",true);

			$("form#cart_form").attr("action","del");
			$("form#cart_form").attr("target","actionFrame");
			$("form#cart_form")[0].submit();
		});

		// 상품 선택시
		$("input[name='cart_option_seq[]']").bind("click",function(){
			var obj = eval("cart_goods_" + $(this).val());
			if($(this).is(":checked")){
				$(obj).addClass('selected');
				cnt = $("input[name='cart_option_seq[]']:checked").length;
			}else{
				$(obj).removeClass('selected');
				cnt = $("input[name='cart_option_seq[]']:checked").length;
			}
		});


		// 배송 방법 변경 :: 2016-08-11 lwh
		$("input.btn_shipping_modify").bind("click",function() {
			var cart_seq	= $(this).attr('cart_seq');
			var prepay_info = $(this).attr('prepay_info');
			var nation		= $(this).attr('nation');
			var hop_date	= $(this).attr('hop_date');
			var goods_seq	= $(this).attr('goods_seq');
			var reserve_txt	= $(this).attr('reserve_txt');

			$.ajax({
				'url'	: '/goods/shipping_detail_info',
				'data'	: {'mode':'cart','cart_seq':cart_seq,'prepay_info':prepay_info,'nation':nation,'hop_date':hop_date,'goods_seq':goods_seq,'reserve_txt':reserve_txt},
				'type'	: 'get',
				'dataType': 'text',
				'success': function(html) {
					if(html){
						$("#shipping_detail_lay .layer_pop_contents").html(html);
						showCenterLayer('#shipping_detail_lay');
						//$("div#shipping_detail_lay").html(html);
						//openDialog(getAlert('oc043'), "shipping_detail_lay", {"width":500,"height":650});
					}else{
						//오류가 발생했습니다. 새로고침 후 다시시도해주세요.
						alert(getAlert('oc044'));
						document.location.reload();
					}
				}
			});
		});

		//  견적서 출력
		$(".btn_select_estimate").bind("click",function(){
			var win = window.open('/prints/form_print_estimate?code=cart', '_estimate', 'width=960,height=760, scrollbars=yes');
			win.focus();
		});
	//	order_price_calculate();
	});

	function getPromotionckloding() {
		var cartpromotioncode = '';
		if( cartpromotioncode  ) {
			$.ajax({
				'url' : '../promotion/getPromotionJson?mode=cart',
				'data' : {'cartpromotioncode':cartpromotioncode},
				'type' : 'post',
				'dataType': 'json',
				'success': function(data) {
					order_price_calculate();
				}
			});
		}
	}

	// facebook 라이크 할인 적용 및 오픈그라피
	function getfblikeopengraph(){
		$.get('../order/fblike_opengraph', function(data) {
			$("#facebook_mgs").html("");
		});
	}

	function order_price_calculate()
	{
		var f = $("form#orderFrm");

		f.attr("action","calculate?mode=cart");
		f.attr("target","actionFrame");
		f[0].submit();
	}
	
	// 묶음배송상품보기
	function bundle_goods_search(grp_seq){
		window.open('/goods/search?ship_grp_seq='+grp_seq);
	}
</script>

<form name="orderFrm" id="orderFrm" method="post" action="cacluate" target="actionFrame"></form>
		</div>