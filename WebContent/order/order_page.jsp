<%@page import="site.semi.dao.SaleCartDAO"%>
<%@page import="site.semi.dto.SaleCartDTO"%>
<%@page import="java.util.List"%>
<%@page import="site.semi.dto.SmemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@include file="/security/login_url.jspf" %>
	


<%
	List<SaleCartDTO> list = SaleCartDAO.getDAO().selectAllSale(loginMember.getId());
int originprice = 0;
int countprice = 0;
int saleprice = 0;
int countsaleprice = 0;
int totalprice = 0;
//총괄값들
int buyoriginprice=0;
int buysaleprice =0;
int buytotalprice = 0;
%>
<style type="text/css">

#layout_body body,
#layout_body table,
#layout_body div,
#layout_body input,
#layout_body textarea,
#layout_body select,
#layout_body span
{
}

</style>


<!-- /자바스크립트 -->
<script src="/app/javascript/js/dev-tools.js?v="></script><script src="/app/javascript/js/goods-display_mobile.js?v="></script><script src="/app/javascript/js/design.js?v="></script><script src="/app/javascript/js/common.js?v="></script><script type="text/javascript" src="/data/js/language/L10n_KR.js"></script><script type="text/javascript" src="/app/javascript/js/common-function.js?v=140729"></script><script src="/app/javascript/js/common-mobile.js?v="></script><script src="/app/javascript/js/front-layout.js?v="></script><script src="/app/javascript/js/base64.js?v="></script><script src="/app/javascript/js/skin-responsive.js?v="></script><script src="/data/js/language/L10n_KR.js?v="></script><script src="/data/skin/responsive_camping_healing_gl/common/jquery.event.drag-1.5.min.js?v="></script><script src="/data/skin/responsive_camping_healing_gl/common/jquery.touchSlider.js?v="></script><script src="/data/skin/responsive_camping_healing_gl/common/responsive.js?v="></script><script src="/data/skin/responsive_camping_healing_gl/common/script.js?v="></script><script src="/data/skin/responsive_camping_healing_gl/common/search_ver2.js?v="></script><script src="/data/skin/responsive_camping_healing_gl/common/user.js?v="></script><script src="/app/javascript/js/handlers/order/settle.ready.js?v="></script><script src="/app/javascript/plugin/jquery.bxslider.js?v="></script>
<style type="text/css" data-fbcssmodules="css:fb.css.basecss:fb.css.dialog css:fb.css.iframewidget">.fb_hidden{position:absolute;top:-10000px;z-index:10001}.fb_reposition{overflow:hidden;position:relative}.fb_invisible{display:none}.fb_reset{background:none;border:0;border-spacing:0;color:#000;cursor:auto;direction:ltr;font-family:"lucida grande", tahoma, verdana, arial, sans-serif;font-size:11px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:1;margin:0;overflow:visible;padding:0;text-align:left;text-decoration:none;text-indent:0;text-shadow:none;text-transform:none;visibility:visible;white-space:normal;word-spacing:normal}.fb_reset>div{overflow:hidden}@keyframes fb_transform{from{opacity:0;transform:scale(.95)}to{opacity:1;transform:scale(1)}}.fb_animate{animation:fb_transform .3s forwards}
.fb_dialog{background:rgba(82, 82, 82, .7);position:absolute;top:-10000px;z-index:10001}.fb_dialog_advanced{border-radius:8px;padding:10px}.fb_dialog_content{background:#fff;color:#373737}.fb_dialog_close_icon{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png) no-repeat scroll 0 0 transparent;cursor:pointer;display:block;height:15px;position:absolute;right:18px;top:17px;width:15px}.fb_dialog_mobile .fb_dialog_close_icon{left:5px;right:auto;top:5px}.fb_dialog_padding{background-color:transparent;position:absolute;width:1px;z-index:-1}.fb_dialog_close_icon:hover{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png) no-repeat scroll 0 -15px transparent}.fb_dialog_close_icon:active{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png) no-repeat scroll 0 -30px transparent}.fb_dialog_iframe{line-height:0}.fb_dialog_content .dialog_title{background:#6d84b4;border:1px solid #365899;color:#fff;font-size:14px;font-weight:bold;margin:0}.fb_dialog_content .dialog_title>span{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/yd/r/Cou7n-nqK52.gif) no-repeat 5px 50%;float:left;padding:5px 0 7px 26px}body.fb_hidden{height:100%;left:0;margin:0;overflow:visible;position:absolute;top:-10000px;transform:none;width:100%}.fb_dialog.fb_dialog_mobile.loading{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/ya/r/3rhSv5V8j3o.gif) white no-repeat 50% 50%;min-height:100%;min-width:100%;overflow:hidden;position:absolute;top:0;z-index:10001}.fb_dialog.fb_dialog_mobile.loading.centered{background:none;height:auto;min-height:initial;min-width:initial;width:auto}.fb_dialog.fb_dialog_mobile.loading.centered #fb_dialog_loader_spinner{width:100%}.fb_dialog.fb_dialog_mobile.loading.centered .fb_dialog_content{background:none}.loading.centered #fb_dialog_loader_close{clear:both;color:#fff;display:block;font-size:18px;padding-top:20px}#fb-root #fb_dialog_ipad_overlay{background:rgba(0, 0, 0, .4);bottom:0;left:0;min-height:100%;position:absolute;right:0;top:0;width:100%;z-index:10000}#fb-root #fb_dialog_ipad_overlay.hidden{display:none}.fb_dialog.fb_dialog_mobile.loading iframe{visibility:hidden}.fb_dialog_mobile .fb_dialog_iframe{position:sticky;top:0}.fb_dialog_content .dialog_header{background:linear-gradient(from(#738aba), to(#2c4987));border-bottom:1px solid;border-color:#043b87;box-shadow:white 0 1px 1px -1px inset;color:#fff;font:bold 14px Helvetica, sans-serif;text-overflow:ellipsis;text-shadow:rgba(0, 30, 84, .296875) 0 -1px 0;vertical-align:middle;white-space:nowrap}.fb_dialog_content .dialog_header table{height:43px;width:100%}.fb_dialog_content .dialog_header td.header_left{font-size:12px;padding-left:5px;vertical-align:middle;width:60px}.fb_dialog_content .dialog_header td.header_right{font-size:12px;padding-right:5px;vertical-align:middle;width:60px}.fb_dialog_content .touchable_button{background:linear-gradient(from(#4267B2), to(#2a4887));background-clip:padding-box;border:1px solid #29487d;border-radius:3px;display:inline-block;line-height:18px;margin-top:3px;max-width:85px;padding:4px 12px;position:relative}.fb_dialog_content .dialog_header .touchable_button input{background:none;border:none;color:#fff;font:bold 12px Helvetica, sans-serif;margin:2px -12px;padding:2px 6px 3px 6px;text-shadow:rgba(0, 30, 84, .296875) 0 -1px 0}.fb_dialog_content .dialog_header .header_center{color:#fff;font-size:16px;font-weight:bold;line-height:18px;text-align:center;vertical-align:middle}.fb_dialog_content .dialog_content{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/y9/r/jKEcVPZFk-2.gif) no-repeat 50% 50%;border:1px solid #4a4a4a;border-bottom:0;border-top:0;height:150px}.fb_dialog_content .dialog_footer{background:#f5f6f7;border:1px solid #4a4a4a;border-top-color:#ccc;height:40px}#fb_dialog_loader_close{float:left}.fb_dialog.fb_dialog_mobile .fb_dialog_close_icon{visibility:hidden}#fb_dialog_loader_spinner{animation:rotateSpinner 1.2s linear infinite;background-color:transparent;background-image:url(https://static.xx.fbcdn.net/rsrc.php/v3/yD/r/t-wz8gw1xG1.png);background-position:50% 50%;background-repeat:no-repeat;height:24px;width:24px}@keyframes rotateSpinner{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}
.fb_iframe_widget{display:inline-block;position:relative}.fb_iframe_widget span{display:inline-block;position:relative;text-align:justify}.fb_iframe_widget iframe{position:absolute}.fb_iframe_widget_fluid_desktop,.fb_iframe_widget_fluid_desktop span,.fb_iframe_widget_fluid_desktop iframe{max-width:100%}.fb_iframe_widget_fluid_desktop iframe{min-width:220px;position:relative}.fb_iframe_widget_lift{z-index:1}.fb_iframe_widget_fluid{display:inline}.fb_iframe_widget_fluid span{width:100%}
</style>
</head>

<body style="overflow: auto;">




<div id="layout_body" class="layout_body">
		<!-- ================= 파트 페이지들 :: START. ================= -->
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
@@ 주문/결제 @@
- 파일위치 : [스킨폴더]/order/settle.html
++++++++++++++++++++++++++++++++++++++++++++++++++++ -->



<div class="subpage_wrap">
	<div class="subpage_container v3 Pb10">
		<!-- 타이틀 -->
		<div class="title_container Pb0">
			<h2><span designelement="text" textindex="1" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvb3JkZXIvc2V0dGxlLmh0bWw=">주문/결제</span></h2>
		</div>
	</div>
</div>


<div id="orderPaymentLayout" class="subpage_wrap order_payment" data-ezmark="undo">
	<div class="subpage_container v2 Pt0 order_payment_left">
		<!-- 주문상품 :: START -->
		<h2 class="title_od1 Pt15"><span designelement="text" textindex="2" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvb3JkZXIvc2V0dGxlLmh0bWw=">주문상품 정보</span></h2>
		<div class="cart_contents">
			<div class="cart_list">
				<ul class="shipping_group_list ">
					<li class="goods_delivery_info clearbox" style="display: list-item;">
						<ul class="detail">
							<li class="th">무료배송</li>
							
						
						</ul>
					</li>
	<%for(int i =0;i<list.size();i++){ 
		SaleCartDTO dto = list.get(i);
		originprice = dto.getItem_price();
		countprice = originprice * dto.getItem_buycount();
		saleprice = (int)(originprice*dto.getItem_sale()/100);
		countsaleprice = saleprice*dto.getItem_buycount();
		totalprice =countprice-countsaleprice; 
		buyoriginprice+=countprice;
		buysaleprice+=countsaleprice;
		buytotalprice+=totalprice;
	%>
					<li class="cart_goods">
						<div class="cart_goods_detail">

							<div class="cgd_contents">
								<div class="block block1">
									<ul>
										<li class="img_area">
										<%-- 	<a href="../goods/view?no=23"><img src="/data/goods/1/2019/02/23_tmp_83a1903d385c3e2538e042862f2d8ebd6470thumbCart.jpg" class="goods_thumb" onerror="this.src='/data/skin/responsive_camping_healing_gl/images/common/noimage_list.gif'"></a> --%>
										</li>
										<li class="option_area">


											<div class="goods_name v2">
												<a href="../goods/view?no=23"><%=dto.getItem_name()%></a>
											</div>


											<ul class="cart_option">
												<li><span class="xtle">색상</span><%=dto.getItem_color() %></li>
											</ul>

											<input type="hidden" name="coupon_download[40][41]" value="">
											<input type="hidden" name="shippingcoupon_download[1_1_delivery]" value="">
											<div class="cart_quantity">
												<span class="xtle">수량</span> <%=dto.getItem_buycount()%>개
												<span class="add_txt">(<span class="cart_price_num"><%=totalprice%></span>₩)</span>
											</div>


										</li>
									</ul>
								</div>

								<ul class="block block2 x1" id="mobile_cart_sale_tr_41">
									<li class="price_a">
										<span class="ptitle">상품금액</span><%=totalprice%>₩
									</li>
									
								</ul>
							</div>
						</div>
					</li>
<%} %>

				</ul>
			</div>
		</div>
		<!-- 주문상품 :: END -->



		<div class="order_subsection v2">
			<!-- ++++++++++++++++++++ 주문자 :: START ++++++++++++++++++++ -->

		
			<!-- ++++++++++++++++++++ 주문자 :: END ++++++++++++++++++++ -->


			<!-- ++++++++++++++++++++ 배송지 :: START ++++++++++++++++++++ -->
			<h3 class="title3"><span designelement="text" textindex="4" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvb3JkZXIvc2V0dGxlLmh0bWw=">배송지 입력</span></h3>

			<!-- 회원관련 배송정보 -->
			<div class="recipient delivery_info_member" style="display: none;">
				<!-- 최종 배송지 :: START -->
				<div class="real_delivery hide">
					<div class="real_delivery_area">
					
					</div>
				</div>
				<!-- 최종 배송지 :: END -->

				<!-- 회원 배송지 VIEW :: START -->
			
				<!-- 회원 배송지 VIEW :: END -->
			</div>

			<!-- 받는분 정보 입력 란 -->
			<div class="delivery_selecter delivery_info_input hide" style="display: block;">
				<ul class="settle_tab delivery_choice clearbox">
				
				</ul>
				<div class="settle_tab_contents tab_box1 delivery_often" style="display: none;"><!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
@@ 다른 배송지 목록( 신청/결제 > 배송지 > 다른배송지 선택 > 선택 목록 ) @@
- 파일위치 : [스킨폴더]/order/pop_delivery_address.html
++++++++++++++++++++++++++++++++++++++++++++++++++++ -->



</div>
				<div class="settle_tab_contents tab_box2 delivery_input" style="display: block;">
					<ul class="list_01 v2">
						<!-- 받는분 -->
						<li class="th"><p >성함</p></li>
						<li class="td"><%=loginMember.getName() %></li>
						<li class="th"><p >기본주소</p></li>
						<li class="td"><%=loginMember.getZipcode() %>,<br><%=loginMember.getAddress1() %></li>
				
						<li class="th"><p >상세주소</p></li>
						<li class="td"><%=loginMember.getAddress2() %>,<%=loginMember.getAddress3() %></li>
						<!-- 국내 -->
						<li class="domestic goods_delivery_info " style="display: list-item;">
				<input type="text" id="sample6_postcode" placeholder="우편번호">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="sample6_address" placeholder="주소"><br>
<input type="text" id="sample6_detailAddress" placeholder="상세주소">
<input type="text" id="sample6_extraAddress" placeholder="참고항목">
						
						</li>
						
						
						
					</ul>
				</div>
			</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
			<!-- 배송 메세지 -->
			<div id="shipMessage" class="ship_message">
				<input type="text" class="ship_message_txt" name="memo" id="memo" value="" title="배송 메세지 입력" autocomplete="off" placeholder="배송 메세지 입력">
				<ul class="add_message">
					<li>부재시 경비실에 맡겨 주세요.</li>
					<li>부재시 전화 주시거나 문자 남겨 주세요.</li>
					<li>배송 전에 미리 연락해 주세요.</li>
				</ul>
			</div>
			<!-- ++++++++++++++++++++ 배송지 :: END ++++++++++++++++++++ -->



		
		</div>
	</div>


	<div class="subpage_container v2 Pt0 order_payment_right">
		<div class="order_subsection v2 ">
			<div class="right_flying_wrap1">
				<div class="right_flying_wrap2">
					<div class="right_flying_wrap3">
						<!-- ++++++++++++++++++++ 결제 금액 :: START ++++++++++++++++++++ -->
						<h3 class="title3 Pt15"><span designelement="text" textindex="6" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvb3JkZXIvc2V0dGxlLmh0bWw=">결제 금액</span></h3>
						<div class="order_price_total">
							<ul>
								<li class="th"><span class="gray_01 Fs17" designelement="text" textindex="7" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvb3JkZXIvc2V0dGxlLmh0bWw=">상품금액</span></li>
								<li class="td"><span id="total_goods_price" class="v2 gray_01"><%=buytotalprice %></span>₩</li>
							</ul>
							<ul>
								<li class="th">
									<span designelement="text" textindex="8" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvb3JkZXIvc2V0dGxlLmh0bWw=">배송비</span>&nbsp;
								</li>
								<li class="td">
									() <span class="total_delivery_shipping_price">무료</span>₩
								</li>
							</ul>
							
						</div>

						
						<!-- ++++++++++++++++++++ 결제 금액 :: END ++++++++++++++++++++ -->


						<!-- ++++++++++++++++++++ 결제 수단 :: START ++++++++++++++++++++ -->
						<h3 class="title3"><span designelement="text" textindex="17" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvb3JkZXIvc2V0dGxlLmh0bWw=">결제 수단</span></h3>
						<ul class="payment_method_select clearbox" id="payment_type">

							<li>
								<div class="card">
									<label><input type="radio" name="payment" value="card" checked="checked"></label>
								</div>
								<p designelement="text" textindex="20" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvb3JkZXIvc2V0dGxlLmh0bWw=">신용카드</p>
							</li>
							<li>
								<div class="account">
									<label><input type="radio" name="payment" value="account"></label>
								</div>
								<p designelement="text" textindex="21" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvb3JkZXIvc2V0dGxlLmh0bWw=">실시간<br>계좌이체</p>
							</li>
							
							<li>
								<div class="cellphonepay">
									<label><input type="radio" name="payment" value="cellphone"></label>
								</div>
								<p designelement="text" textindex="25" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvb3JkZXIvc2V0dGxlLmh0bWw=">휴대폰결제</p>
							</li>
							<li>
								<div class="bank2">
									<label><input type="radio" name="payment" value="bank"></label>
								</div>
								<p designelement="text" textindex="26" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvb3JkZXIvc2V0dGxlLmh0bWw=">무통장입금</p>
							</li>
							
							<!-- 참고) npay : class="npay", payco : class="payco" -->
						</ul>

						<ul class="payment_method_select hide" id="payment_type_zero" style="display: none;">
							<li><strong style="color:#4b4b4b;">전액할인</strong></li>
						</ul>

						<!-- 카카오페이 - 상세 -->

						<!-- 신용카드 - 상세 -->
						<div id="typereceiptcardlay" class="hide" style="display: none;">
							카드매출전표(또는 휴대폰결제전표)로 대체합니다.
						</div>

						<!--무통장입금 - 상세 -->
						<ul class="list_01 v2 bank hide" style="display: none;">
							<li>
								<input type="text" name="depositor" value="" title="입금자명" placeholder="입금자명">
							</li>
							<li>
								<select name="bank">
									<option value="">은행 선택</option>
									<option value="국민은행 000000-00-000000 예금주:김대표">국민은행 000000-00-000000 예금주:김대표</option>
									<option value="신한은행 000-000-000000 예금주:김대표">신한은행 000-000-000000 예금주:김대표</option>
								</select>
							</li>
						</ul>
						<ul id="typereceiptlay" class="mt_sp1 hide" style="display: block;">
							<li class="labelgroup_design ">
								<label for="typereceiptuse1"><input type="radio" name="typereceiptuse" id="typereceiptuse1" value="1"> 발급</label>
								<label for="typereceiptuse0" class="on"><input type="radio" name="typereceiptuse" id="typereceiptuse0" value="0" checked="checked"> 발급 안 함</label>					
							</li>
							<li class="hide labelgroup_design" id="typereceiptchoice">
								<label class="cach_voucherchk on"><input type="radio" name="typereceipt" id="typereceipt2" value="2"> 현금영수증 </label>
								<label class="tax_voucherchk"><input type="radio" name="typereceipt" id="typereceipt1" value="1"> 세금계산서 </label>
							</li>
						</ul>
						<div id="typereceipttablelay" class="hide" style="display: block;">

							<!-- ~~~~~~~ 현금영수증 신청 부분 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
							<ul id="cash_container" class="typereceiptlay list_01 v2 Mt5 hide">
								<li class="labelgroup_design">
									<label for="cuse0" class="on"><input type="radio" name="cuse" id="cuse0" value="0" checked="checked"> 개인 소득공제</label>
									<label for="cuse1"><input type="radio" name="cuse" id="cuse1" value="1"> 사업자 지출증빙</label>
								</li>
								<li id="personallay">
								  <input type="tel" name="creceipt_number[0]" class="size_email_full" maxlength="13" title="휴대폰번호( '-' 없이 입력 )" placeholder="휴대폰번호( '-' 없이 입력 )">
								</li>
								<li id="businesslay" class="hide">
								  <input type="tel" name="creceipt_number[1]" class="size_email_full" maxlength="10" title="사업자번호( '-' 없이 입력 )" placeholder="사업자번호( '-' 없이 입력 )">
								</li>
								<li id="personallay">
								  <input type="email" name="sales_email" class="size_email_full" title="이메일주소" placeholder="이메일주소">
								</li>
								<li id="duplicate_message" class="desc">
									※ 결제창에서 다시 현금영수증을 신청하지 마세요. 중복발행 됩니다.
								</li>
							</ul>
							<!-- ~~~~~~~ 세금계산서 신청 부분 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
							<ul id="tax_container" class="typereceiptlay list_01 v2 Mt10 hide">
								<li>
									<input type="text" name="co_name" id="co_name" value="" title="상호명" placeholder="상호명">
								</li>
								<li>
									<input type="tel" name="busi_no" id="busi_no" value="" title="사업자번호" placeholder="사업자번호"> <span class="desc">ex) 123-12-12345</span>
								</li>
								<li>
									<input type="text" name="co_ceo" id="co_ceo" value="" title="대표자명" placeholder="대표자명">
								</li>
								<li>
									<input type="text" name="co_status" id="co_status" value="" title="업태" style="width:130px;" placeholder="업태"> /
									<input type="text" name="co_type" id="co_type" value="" title="업종" style="width:130px;" placeholder="업종">
								</li>
								<li>
									<input type="text" name="co_new_zipcode" class="size_zip_all" value="" title="우편번호" readonly="" placeholder="우편번호">
									<button type="button" class="btn_resp size_b color4" onclick="openDialogZipcode_resp('co_');">검색</button>
									<input type="hidden" name="co_address_type" id="co_address_type" value="" title="주소" placeholder="주소">
									<input type="text" name="co_address" id="co_address" value="" class="size_address Mt5 " title="주소" readonly="" placeholder="주소">
									<input type="text" name="co_address_street" id="co_address_street" value="" class="size_address Mt5 hide" title="주소" readonly="" placeholder="주소">
									<input type="text" name="co_address_detail" id="co_address_detail" value="" class="size_address Mt5" title="상세주소" placeholder="상세주소">
								</li>
								<li>
									<input type="text" name="person" id="person" value="" title="담당자명" placeholder="담당자명">
								</li>
								<li>
									<input type="email" name="email" id="email" value="qkrthdus0711@naver.com" title="이메일주소" class="size_email_full" placeholder="이메일주소">
								</li>
								<li>
									<input type="tel" name="phone" id="phone" value="" title="연락처 " placeholder="연락처 "> <span class="desc">숫자만 입력</span>
								</li>
							</ul>
						</div>
						<!-- ++++++++++++++++++++ 결제 수단 :: END ++++++++++++++++++++ -->

						<!-- ++++++++++++++++++++ 약관 동의( 비회원 ) :: START ++++++++++++++++++++ -->
						<!-- ++++++++++++++++++++ 약관 동의( 비회원 ) :: END ++++++++++++++++++++ -->

						<!-- 결제 버튼 -->
						<div class="pay_layer btn_area_c" id="pay_layer1">
							<input type="button" value="결제하기" name="button_pay" id="pay" class="btn_resp size_extra color2 Wmax"
							onclick="goBuy();">
							<%-- onclick="location.href='<%=request.getContextPath()%>/index.jsp?workgroup=order&work=order_buy'"> --%>
							<span class="hide"><input type="button" value="장바구니로" class="btn_resp size_extra" onclick="document.location.href='cart';"></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>

<script type="text/javascript">
function goBuy() {
	var address = document.getElementById("sample6_address").value;
	if(address==''){
		alert("배송지를 입력해주세요!");
		return false;
	}else{
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=order&work=order_buy";
	}
}
</script>


<script type="text/javascript">
	// 패치되는 settle 페이지 버전 :: 2017-06-01 스킨패치 시 필수
	skin_order_settle_ver = 1;
	// 배송 변경
	$("button.btn_shipping_modify").bind("click",function() {
		var cart_seq	= $(this).attr('cart_seq');
		var prepay_info = $(this).attr('prepay_info');
		var nation		= $(this).attr('nation');
		var hop_date	= $(this).attr('hop_date');
		var goods_seq	= $(this).attr('goods_seq');
		var cart_table	= parseInt($(this).attr('person_seq')) > 0 ? 'person' : '';

		$.ajax({
			'url'	: '/goods/shipping_detail_info',
			'data'	: {'mode':'cart','cart_seq':cart_seq,'prepay_info':prepay_info,'nation':nation,'hop_date':hop_date,'goods_seq':goods_seq,'cart_table':cart_table},
			'type'	: 'get',
			'dataType': 'text',
			'success': function(html) {
				if(html){
					$("#shipping_detail_lay .layer_pop_contents").html(html);
					showCenterLayer('#shipping_detail_lay');
					//배송방법 안내 및 변경
					//openDialog(getAlert('os170'), "shipping_detail_lay", {"width":500,"height":650});
				}else{
					//오류가 발생했습니다. 새로고침 후 다시시도해주세요.
					alert(getAlert('os171'));
					document.location.reload();
				}
			}
		});
	});
</script>

<script type="text/javascript" src="/app/javascript/jquery/jquery.form.js" charset="utf8"></script>
<script type="text/javascript">
	var multiShippingItemNoCnt	= 0;

	var order_version			= $("input[name='order_version']").val();
	var gl_mode					= 'cart';
	var gl_region				= new Array();
	gl_region[0] = new Array();
	gl_region[0][0] = "미국";
	gl_region[1] = new Array();
	gl_region[1][0] = "234";

	var gl_mobile				= '';
	var gl_ssl_action			= "../order/pay?mode=cart";
	var gl_pg_company			= 'kicc';
	var gl_isuser				= false;

gl_isuser					= '1';	gl_iscancellation			= false;
	var gl_cashreceiptuse		= '1';
	var gl_taxuse				= '1';
	var gl_request_uri			= '%2Forder%2Fsettle%3Fmode%3Dcart';
	var gl_goods_seq			= 0;
	var gl_skin					= "responsive_camping_healing_gl";
	var gl_http_host			= 'responsive-sample30.firstmall.kr';
	var gl_sub_domain			= 'edge_sample.firstmall.kr';
	var url						= 'http://responsive-sample30.firstmall.kr'
	var is_file_facebook_tag	= true;	var fblike_ordertype		= "1";
	var fblikesale				= false;
	var fbuser					= false;
	var APP_USE					= "f";
	var APP_DOMAIN				= "edge_sample.firstmall.kr";
	var HTTP_HOST				= "responsive-sample30.firstmall.kr";
	var firstmallcartid			= "c0942268456cafe7832e4fba02477791a5b96120";
	var APP_VER					= '3.2';

	var shipping_policy_count	= "2";

	var shipping_policy_count_detail = false;
	var escrow_view				= false;
	var cart_promotioncode		= "";
	var is_goods				= true;
	var is_direct_store			= false;
	var is_coupon				= false;
	var is_members				= true;
	var is_address				= true;
</script>
<script type="text/javascript" src="/app/javascript/js/order-settle.js?dummy=20210224183304" charset="utf8"></script>
<script type="text/javascript" src="/app/javascript/js/skin-order-settle-resp.js" charset="utf8"></script>

<!-- 해외배송 안내 콘텐츠. 파일위치 : [스킨폴더]/goods/_international_shipping_info.html -->
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
@@ 해외배송 안내 콘텐츠 @@
- 파일위치 : [스킨폴더]/goods/_international_shipping_info.html
- EYE-Design을 켜고 텍스트 수정 기능으로 수정 가능.
++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<div id="international_shipping_info" class="hide pd5">
<p designelement="text" textindex="1" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvX2ludGVybmF0aW9uYWxfc2hpcHBpbmdfaW5mby5odG1s">1. 주문하신 물품의 총 결제금액이 15만원 이상 (환율의 변동에 따라 다를 수 있음) 이면 과부가세가 발생합니다.  관부가세는 고객님께서 부담하시는 금액으로 문자를 통해 입금내역이 발송되며 해당 관세사로 입금하시면 통관처리됩니다.<br><br>2. 해외구매 특성상 주문에서 배송까지는 평균 10~15일이 소요됩니다. 간혹 현지 제품 수급에 따라 부득이하게 시일이 더 소요 될 수 있으니 구매시 좀 더 여유있게 주문하시길 권합니다.<br><br>3. 해외 내수품인 관계로 A/S에 대해서는 별도의 책임을 지지 않습니다.<br><br>4. 해외배송 특성상 주문접수후 배송상태가 배송준비중으로 넘어간 경우 해외에서 국내로의 배송이 이루어지고 있다는 뜻입니다. 따라서 배송준비중으로 배송상태가 넘어간 경우 취소및 반품이 불가하므로 이점 양해 부탁드립니다.<br><br>5. 타 해외구매대행 사이트에서 주문하신 물건과 주문날짜가 겹치지않도록 주의해 주십시오. 통관날짜가 같을 경우 합산관세가 부가되게 됩니다.</p>
</div>
<!-- //해외배송 안내 콘텐츠 -->

	<!-- 좋아요할인 : 삭제하지 말아주세요 -->
	<script language="JavaScript" src="../order/fblike_opengraph?files=settle&amp;mode=cart"></script>
	<!-- 좋아요할인 : 삭제하지 말아주세요 -->

<script>
// 인풋 박스 필수 체크( 값이 있는 경우 )
function input_pilsu_check() {
	$('input.pilsu').each(function() {
		if ( $(this).val() ) {
			$(this).addClass('complete');
		} else {
			$(this).removeClass('complete');
		}
	});
}

// 오른쪽 영역 스크롤링
function orderPaymentScrolling() {
	var popContentScrollHeight2 = document.body.clientHeight;
	var popContentOuterHeight2 = $('#orderPaymentLayout .order_payment_right .order_subsection').outerHeight();
	var orderPaymentLeft = $('#orderPaymentLayout .order_payment_left').height();
	if ( window.innerWidth > 799 && popContentScrollHeight2 > popContentOuterHeight2 ) {
		$(window).on('scroll', function() {
			var position = $(this).scrollTop();
			var quickTop = $('#orderPaymentLayout .order_payment_right').offset().top;
			popContentOuterHeight2 = $('#orderPaymentLayout .order_payment_right .order_subsection').outerHeight();
			if ( position > quickTop && popContentScrollHeight2 > popContentOuterHeight2 && orderPaymentLeft > popContentOuterHeight2) {
				$('#orderPaymentLayout').addClass('flyingMode');
			} else {
				$('#orderPaymentLayout').removeClass('flyingMode');
			}
		});
	} else {
		$(window).off('scroll');
	}
	$( window ).on('resize', function() {
		if ( window.innerWidth > 799 ) {
			$(window).on('scroll', function() {
				var position = $(this).scrollTop();
				var quickTop = $('#orderPaymentLayout .order_payment_right').offset().top;
				popContentOuterHeight2 = $('#orderPaymentLayout .order_payment_right .order_subsection').outerHeight();
				if ( position > quickTop && popContentScrollHeight2 > popContentOuterHeight2 && orderPaymentLeft > popContentOuterHeight2) {
					$('#orderPaymentLayout').addClass('flyingMode');
				} else {
					$('#orderPaymentLayout').removeClass('flyingMode');
				}
			});
		} else {
			$(window).off('scroll');
			$('#orderPaymentLayout').removeClass('flyingMode');
		}
	});
}

$(function() {
	// 인풋박스 필수 체크
	input_pilsu_check();
	$('input.pilsu').on('blur', function() {
		if ( $(this).val() ) {
			$(this).addClass('complete');
		} else {
			$(this).removeClass('complete');
		}
	});
	
	// 오른쪽 영역 스크롤링
	orderPaymentScrolling();
	/*
	$( window ).on('resize', function() {
		if ( window.innerWidth > 799 ) {
			$('#orderPaymentLayout').removeClass('flyingMode');
		}
	});
	*/
});
</script>
		<!-- ================= 파트 페이지들 :: END. ================= -->
		</div>

		<!-- ================= #LAYOUT_FOOTER :: START. 파일위치 : layout_footer/standard.html (default) ================= -->


<!-- 하단영역 : 끝 -->

<!-- 플로팅 - BACK/TOP(대쉬보드) -->
<div id="floating_over" style="display: none;">
	<a href="javascript:history.back();" class="ico_floating_back" title="뒤로 가기"></a>
	<a href="javascript:history.forward();" class="ico_floating_foward" title="앞으로 가기"></a>
	<a href="#layout_header" class="ico_floating_top" title="위로 가기"></a>

	<!-- 최근 본 상품(LAYER) -->
</div>
<!-- //플로팅 - BACK/TOP(대쉬보드) -->

<script type="text/javascript">
	$(function() {
		/* 반응형 슬라이드 배너 관련( 절대 삭제 금지 ) */
			$('.slider_before_loading').remove();

		// 상품 색상 코드값 디자인( new 상품정보 )
		if ( $('.displaY_color_option').length > 0 ) {
			$('.displaY_color_option .areA').filter(function() {
				return ( $(this).css('background-color') == 'rgb(255, 255, 255)' );
			}).addClass('border');
		}

		$( window ).on('resize', function() {
			if ( window.innerWidth != WINDOWWIDTH ) {
				setTimeout(function(){ WINDOWWIDTH = window.innerWidth; }, 10);
			}
		});
	});

	/*######################## 17.12.19 gcs yjy : 앱 처리(fb 로그아웃) s */
	
	/*######################## 17.12.19 gcs yjy : 앱 처리(fb 로그아웃) e */
</script>
		<!-- ================= #LAYOUT_FOOTER :: END. 파일위치 : layout_footer/standard.html (default) ================= -->

		<iframe name="actionFrame" id="actionFrame" src="/main/blank" frameborder="0" width="100%" height="0"></iframe>
		<div id="openDialogLayer" style="display: none">
			<div align="center" id="openDialogLayerMsg"></div>
		</div>
		<div id="ajaxLoadingLayer" style="display: none"></div>
	</div>	
</div>
<div id="mobileZipcodeLayer" style="display: none"></div>
<!-- 결제창을 레이어 형태로 구현-->
<div id="layer_pay" class="hide"></div>
<div id="payprocessing" class="pay_layer hide">
	<div style="margin:auto;"><img src="/data/skin/responsive_camping_healing_gl/images/design/img_paying.gif"></div>
	<div style="margin:auto;padding-top:20px;"><img src="/data/skin/responsive_camping_healing_gl/images/design/progress_bar.gif"></div>
</div>
<div id="layout_side_background" class="layout_side_background"></div>

</body>