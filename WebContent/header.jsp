<%@page import="site.semi.dao.SorderDAO"%>
<%@page import="site.semi.dto.SorderDTO"%>
<%@page import="site.semi.dao.ScartDAO"%>
<%@page import="site.semi.dto.ScartDTO"%>
<%@page import="site.semi.dao.SproductDAO"%>
<%@page import="site.semi.dto.SproductDTO"%>
<%@page import="site.semi.dao.SaleCartDAO"%>
<%@page import="site.semi.dto.SaleCartDTO"%>
<%@page import="java.util.List"%>
<%@page import="site.semi.dto.SmemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script nonce="nsqtrbDkqLM9+hVF/hYN9dFOpTAKxWFcuzchmc+uQ6E=">window.Firstmall = window.Firstmall || {};
window.Firstmall.Config = {"Environment":{"MobileMode":true,"SetMode":null,"Language":"KR","isAdmin":false,"isSellerAdmin":false,"Currency":{"Basic":{"Id":"KRW","Symbol":"&#x20a9;","Position":"after"},"Skin":{"Id":"KRW","Symbol":"&#x20a9;","Position":"after"}},"serviceLimit":{"H_FR":false,"H_AD":true,"H_NFR":true},"OperationType":"light","Protocol":"http","CacheBreaker":null},"Security":{"PreventDrag":false,"PreventContextMenu":false},"Search":{"AutoComplete":false,"Suggest":false}};
(function(){ var aliases = {"gl_operation_type":window.Firstmall.Config.Environment.OperationType,"gl_mobile_mode":window.Firstmall.Config.Environment.MobileMode,"gl_set_mode":window.Firstmall.Config.Environment.SetMode,"gl_language":window.Firstmall.Config.Environment.Language,"gl_basic_currency":window.Firstmall.Config.Environment.Currency.Basic.Id,"gl_skin_currency":window.Firstmall.Config.Environment.Currency.Skin.Id,"gl_basic_currency_symbol":window.Firstmall.Config.Environment.Currency.Basic.Symbol,"gl_basic_currency_symbol_position":window.Firstmall.Config.Environment.Currency.Basic.Position,"gl_protocol":window.Firstmall.Config.Environment.Protocol+"://"}; for(var attr in aliases) { window[attr] = aliases[attr]; }})();</script>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<title></title>

<%
	SmemberDTO loginMember=(SmemberDTO)session.getAttribute("loginMember");
	
%>
 

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/font.css" />

<!-- ?????? ????????? -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700&amp;subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jqueryui/black-tie/jquery-ui-1.8.16.custom.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/slick.css"><!-- ????????? ???????????? -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/lib.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/board.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/buttons.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/broadcast.css" /> 
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/user.css" /><!-- ++++++++++++ ?????? ?????????/????????? CSS ++++++++++++ -->

<!-- /CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/javascript/plugin/jquery_swipe/jquery_swipe.css" />
<!-- ?????????????????? -->
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


<script>
var REQURL = 'main.html';
var WINDOWWIDTH = window.innerWidth;
</script>

</head>
<body>

<div id="layout_header" class="layout_header">
	<div class="util_wrap">
		<div class="resp_wrap">
			<!-- bookmark -->
			<ul class="bookmark">
				<li><a href="index.jsp?workgroup=company&work=cs">CS Center</a></li>
				<li><a href="index.jsp?workgroup=member&work=mypage">My page</a></li>
			</ul>
			<ul class="util_wrap_menu2">
				<li class="respCartArea">
					<a href="index.jsp?workgroup=sproduct&work=sproduct_cart"><span>TestCart</span><span  class="cart_cnt1" ></span></a>
				</li>
				<li class="respCartArea">
					<a href="index.jsp?workgroup=sproduct&work=myorder"><span>TestOrder</span><span class="cart_cnt1"></span></a>
				</li>
				<li class="respCartArea">
					<a href="index.jsp?workgroup=cart&work=cart"><span>Cart</span><span class="cart_cnt1"></span></a>
				</li>
				<li><a href="index.jsp?workgroup=order&work=order_list" >Order</a></li>
			<% if(loginMember==null) {//???????????? ????????? %>
				<li><a href="index.jsp?workgroup=member&work=login&state=1" >Login</a></li>
				<li class="point"><a href="index.jsp?workgroup=member&work=agreement" >Join</a></li>
			<% } else {//????????? ????????? %>
				<li class="point"><a href="index.jsp?workgroup=member&work=logout">Logout</a></li>
					<% if(loginMember.getStatus()==9) { //????????? ???????????? ???????????? ?????? %>
						<li><a href="index.jsp?workgroup=admin&work=admin_main">Admin</a></li>
					<% } %>
			<% } %>	 				
			</ul>
		</div>
	</div>


	<div class="logo_wrap">
		<div class="resp_wrap">

			<!-- logo -->
			<h1 class="logo_area">
			<a href="index.jsp?workgroup=base&work=print" target="_self"><img src="<%=request.getContextPath() %>/images/logo.png" alt="(???) ????????? ?????????" /></a>
			</h1>

			<!-- ????????????( 1023px ???????????? ????????? ) -->
			<a href="order/cart.html" class="resp_top_cart"><span class="cart_cnt2">0</span></a>


			<!-- +++++++++++ ???????????? ??????( ???????????? ????????? ????????? ?????? ?????? style="display:none;" ?????? ?????????. ex) id="cateSwiper" class="nav_wrap" style="display:none;" ) +++++++++++ -->
			<div id="cateSwiper" class="nav_wrap">
				<div class="resp_wrap">
					<div class="nav_category_area">
						<div class="designCategoryNavigation">
							<ul class="respCategoryList">
								<li class="custom_nav_link">
									<a class="categoryDepthLink"  href="index.jsp?workgroup=company&work=company_hello"><em>About Us</em></a>
								</li>
								<li class="custom_nav_link">
									<a class="categoryDepthLink" href="index.jsp?workgroup=sproduct&work=sproduct_list"><em>Product</em></a>
								</li>
								<li class="custom_nav_link">
									<a class="categoryDepthLink" href="index.jsp?workgroup=product&work=product_list"><em>Sale</em></a>
								</li>
								<li class="custom_nav_link">
									<a class="categoryDepthLink" href="<%=request.getContextPath()%>/index.jsp?workgroup=board&work=board_list&category=1"><em>Notice</em></a>
								</li>
								<li class="custom_nav_link">
									<a class="categoryDepthLink" href="<%=request.getContextPath()%>/index.jsp?workgroup=board/question&work=question_list&category=3"><em>Inquiry</em></a>
								</li>
								<li class="custom_nav_link">
									<a class="categoryDepthLink" href="index.jsp?workgroup=board&work=qa"><em>Q&amp;A</em></a>
								</li>
								<li class="custom_nav_link">
									<a class="categoryDepthLink" href="index.jsp?workgroup=board&work=board_list"><em>Board</em></a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //?????? ?????? -->
</div>
</body>
</html>