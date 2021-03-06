<!-- ================= #HTML_HEADER :: START. 파일위치 : _modules/common/html_header.html ================= -->
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
@@ #HTML_HEADER @@
- 파일위치 : [스킨폴더]/_modules/common/html_header.html
++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<%@page import="site.semi.dao.ItemDAO"%>
<%@page import="site.semi.dto.ItemDTO"%> 
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    List<ItemDTO> list = ItemDAO.getDAO().selectAllItem();
   String itemno = request.getParameter("itemno");
    out.println(itemno); 
    %>
<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko"  xmlns:fb="http://ogp.me/ns/fb#"  xmlns:og="http://ogp.me/ns#">

<!-- Mirrored from responsive-sample30.firstmall.kr/goods/view?no=49 by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Feb 2021 16:05:27 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/fb/website#">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta charset="utf-8">

<script nonce="N4PAfPeS5X1KQo6IwLA3BI/AsF6dPNRF7MnYkP54sIM=">window.Firstmall = window.Firstmall || {};
window.Firstmall.Config = {"Environment":{"MobileMode":true,"SetMode":null,"Language":"KR","isAdmin":false,"isSellerAdmin":false,"Currency":{"Basic":{"Id":"KRW","Symbol":"&#x20a9;","Position":"after"},"Skin":{"Id":"KRW","Symbol":"&#x20a9;","Position":"after"}},"serviceLimit":{"H_FR":false,"H_AD":true,"H_NFR":true},"OperationType":"light","Protocol":"http","CacheBreaker":null},"Security":{"PreventDrag":false,"PreventContextMenu":false},"Search":{"AutoComplete":false,"Suggest":false}};
(function(){ var aliases = {"gl_operation_type":window.Firstmall.Config.Environment.OperationType,"gl_mobile_mode":window.Firstmall.Config.Environment.MobileMode,"gl_set_mode":window.Firstmall.Config.Environment.SetMode,"gl_language":window.Firstmall.Config.Environment.Language,"gl_basic_currency":window.Firstmall.Config.Environment.Currency.Basic.Id,"gl_skin_currency":window.Firstmall.Config.Environment.Currency.Skin.Id,"gl_basic_currency_symbol":window.Firstmall.Config.Environment.Currency.Basic.Symbol,"gl_basic_currency_symbol_position":window.Firstmall.Config.Environment.Currency.Basic.Position,"gl_protocol":window.Firstmall.Config.Environment.Protocol+"://"}; for(var attr in aliases) { window[attr] = aliases[attr]; }})();</script>
<!-- <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests" />  -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<title></title>

	<!-- SEO 설정이 있을경우 -->
	<meta name="Robots" content="noindex,nofollow" />
<meta name="title" content="" />
<meta name="author" content="" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<META http-equiv="PICS-label" content='(PICS-1.1 "http://service.kocsc.or.kr/rating.html" l gen false for "edge_sample.firstmall.kr" r (y 1))'>

<meta property="og:url" content="http://edge_sample.firstmall.kr/goods/view?no=49" />
<meta property="og:site_name" content="한국" />
<meta property="og:title" content="세련된 혼합형 배너 제공" />
	<meta property="og:description" content="퍼스트몰 반응형 스킨은 세련된 이미지형, 텍스트형, 슬라이드배너형 팝업을 제공합니다." />

	<meta property="fb:app_id" content="" />
		<meta property="og:type" content="website" />
<meta property="og:image" content="//responsive-sample30.firstmall.kr/data/goods/1/2020/04/49_tmp_55e62897f887773479085ca9d3bc69450954view.png"  />
<link rel="image_src" href="http://responsive-sample30.firstmall.kr/data/goods/1/2020/04/49_tmp_55e62897f887773479085ca9d3bc69450954view.png"/>


<!-- CSS -->
<link rel="stylesheet" type="text/css" href="http://responsive-sample30.firstmall.kr/data/font/font.css" />

<!-- 구글 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700&amp;subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/css/jqueryui/black-tie/jquery-ui-1.8.16.custom.css" />
<link rel="stylesheet" type="text/css" href="http://responsive-sample30.firstmall.kr/app/javascript/plugin/slick/slick.css"><!-- 반응형 슬라이드 -->
<link rel="stylesheet" type="text/css" href="http://responsive-sample30.firstmall.kr/data/design/goods_info_style.css"><!-- 상품디스플레이 CSS -->
<link rel="stylesheet" type="text/css" href="http://responsive-sample30.firstmall.kr/data/design/goods_info_user.css"><!-- ++++++++++++ 상품디스플레이 사용자/제작자 CSS ++++++++++++ -->
<link rel="stylesheet" type="text/css" href="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/css/lib.css" />
<link rel="stylesheet" type="text/css" href="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/css/common.css" />
<link rel="stylesheet" type="text/css" href="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/css/board.css" />
<link rel="stylesheet" type="text/css" href="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/css/buttons.css" />
<link rel="stylesheet" type="text/css" href="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/css/mobile_pagination.css" />
<link rel="stylesheet" type="text/css" href="http://responsive-sample30.firstmall.kr/link/css?k=quickdesign&amp;v=20210216010216" /><!-- Quick Design CSS -->
<link rel="stylesheet" type="text/css" href="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/css/broadcast.css" /> 
<link rel="stylesheet" type="text/css" href="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/css/user.css" /><!-- ++++++++++++ 스킨 사용자/제작자 CSS ++++++++++++ -->
<!-- 파비콘 -->
<link rel="shortcut icon" href="http://responsive-sample30.firstmall.kr//data/icon/favicon/favicon1497244551.ico" />
<link rel="stylesheet" href="http://responsive-sample30.firstmall.kr/app/javascript/plugin/touchSlider/swiper.css" />
<!-- /CSS -->
<link rel="stylesheet" type="text/css" href="http://responsive-sample30.firstmall.kr/app/javascript/plugin/jquery_swipe/jquery_swipe.css" />
<!-- 자바스크립트 -->
<script src="http://responsive-sample30.firstmall.kr/app/javascript/jquery/jquery.min.js"></script>
<script src="http://responsive-sample30.firstmall.kr/app/javascript/jquery/jquery-ui.min.js"></script>
<script src="http://responsive-sample30.firstmall.kr/app/javascript/plugin/jquery.poshytip.min.js"></script>
<script src="http://responsive-sample30.firstmall.kr/app/javascript/plugin/jquery.activity-indicator-1.0.0.min.js"></script>
<script src="http://responsive-sample30.firstmall.kr/app/javascript/plugin/jquery.cookie.js"></script>
<script src="http://responsive-sample30.firstmall.kr/app/javascript/plugin/jquery.slides.min.js"></script>
<script src="http://responsive-sample30.firstmall.kr/app/javascript/plugin/jquery.placeholder.js"></script>
<script src="http://responsive-sample30.firstmall.kr/app/javascript/plugin/validate/jquery.validate.js"></script>
<script src="http://responsive-sample30.firstmall.kr/app/javascript/plugin/ezmark/js/jquery.ezmark.min.js"></script>
<script src="http://responsive-sample30.firstmall.kr/app/javascript/plugin/custom-select-box.js"></script>
<script src="http://responsive-sample30.firstmall.kr/app/javascript/plugin/custom-mobile-pagination.js"></script>
<script src="http://responsive-sample30.firstmall.kr/app/javascript/plugin/slick/slick.min.js"></script>
<script src="http://responsive-sample30.firstmall.kr/app/javascript/plugin/jquery_swipe/jquery.event.swipe.js"></script>
<script src="http://responsive-sample30.firstmall.kr/app/javascript/plugin/touchSlider/swiper.js"></script>


<script>
var REQURL = 'http://responsive-sample30.firstmall.kr/goods/view?no=49';
var WINDOWWIDTH = window.innerWidth;
</script>

<script>
 var is_user = false;
 var plus_app_id = '';
 var fammercemode = '';
 var mbpage = false;

 var orderpage = false;

  window.fbAsyncInit = function() {
    FB.init({
      appId      : '', //App ID
      status     : true, // check login status
      cookie     : true, // enable cookies to allow the server to access the session
      xfbml      : true,  // parse XFBML,
      oauth      : true,
      version    : 'v3.2'
    });


		// like 이벤트가 발생할때 호출된다.
		FB.Event.subscribe('edge.create', function(response) {
			$.ajax({'url' : '../sns_process/facebooklikeck', 'type' : 'post', 'data' : {'mode':'like', 'product_url':response}});
		});

		// unlike 이벤트가 발생할때 호출된다.
		FB.Event.subscribe('edge.remove', function(response) {
			$.ajax({'url' : '../sns_process/facebooklikeck', 'type' : 'post', 'data' : {'mode':'unlike', 'product_url':response}});
		});

	// logout 이벤트가 발생할때 호출된다.
	FB.Event.subscribe('auth.logout', function(response) {

	});
  };
	$(document).ready(function() {
		//기본 login
		$(".fb-login-button").click(function(){
				FB.login(handelStatusChange,{scope:'email,public_profile,'});
		});

		//기업회원 login
		$(".fb-login-button-business").click(function(){
				FB.login(handelStatusChangebiz,{scope:'email,public_profile,'});
		});

		//회원통합 로그인(이메일동일)
		$(".fb-login-button-connect").click(function(){
				FB.login(handelStatusChangeconnect,{scope:'email,public_profile,'});
		});

		//새로가입(이메일동일함)
		$(".fb-login-button-noconnect").click(function(){
				FB.login(handelStatusChangenoconnect,{scope:'email,public_profile,'});
		});

	});
</script>
<script>(function(d, s, id) {
var js, fjs = d.getElementsByTagName(s)[0];
if (d.getElementById(id)) return;
js = d.createElement(s); js.id = id;
js.src = "http://connect.facebook.net/ko_KR/sdk.js";//#xfbml=1&appId=
fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
 <script type="text/javascript">
  var fbId = "";
  var fbAccessToken = "";
  var isLogin = false;
  var isFirst = true;
  var fbUid = "";
  var fbName = "";
	function handelStatusChange(response) {
		if (response && response.status == 'connected') {
		// 로그인
		isLogin = true;
		initializeFbTokenValues();
		initializeFbUserValues();
		fbId = response.authResponse.userID;
		fbAccessToken = response.authResponse.accessToken;
		FB.api('/me', function(response) {
			 fbUid = response.email;
			 fbName = response.name;
			 if (fbName != "") {
				loadingStart("body",{segments: 12, width: 15.5, space: 6, length: 13, color: '#000000', speed: 1.5});
					$.ajax({
					'url' : '../sns_process/facebookloginck',
					'type' : 'post',
					'dataType': 'json',
					'success': function(res) {
						if(res.result == 'emailck'){//이메일이 등록된 경우
							//회원 통합하기  <span class='desc'>로그인해 주세요.</span>
							openDialog(getAlert('mb237'), "member_facebook_connect", {"width":"470","height":"250"});
						}else if(res.result == true){
							loadingStop("body",true);
							openDialogAlert(res.msg,'400','180',function(){
								document.location.reload();
							});
						}else{
							loadingStop("body",true);
							openDialogAlert(res.msg,'400','140',function(){});
						}
					}
					});
			}
		});
	   } else if (response.status == 'not_authorized' || response.status == 'unknown') {
		   //연결을 취소하셨습니다.
			openDialogAlert(getAlert('mb238'),'400','160',function(){});
			// 로그아웃된 경우
			isLogin = false;
			if (fbId != "")  initializeFbTokenValues();
			if (fbUid != "") initializeFbUserValues();
		}
	}

	function handelStatusChangebiz(response) {
		if (response && response.status == 'connected') {
		// 로그인
		isLogin = true;
		initializeFbTokenValues();
		initializeFbUserValues();
		fbId = response.authResponse.userID;
		fbAccessToken = response.authResponse.accessToken;
		FB.api('/me', function(response) {
			 fbUid = response.email;
			 fbName = response.name;
			 if (fbName != "") {
				loadingStart("body",{segments: 12, width: 15.5, space: 6, length: 13, color: '#000000', speed: 1.5});
					$.ajax({
					'url' : '../sns_process/facebookloginck',
					'data' : {'mtype':'biz'},
					'type' : 'post',
					'dataType': 'json',
					'success': function(res) {
						if(res.result == 'emailck'){//이메일이 등된 경우
							//회원 통합하기  <span class='desc'>로그인해 주세요.</span>
							openDialog(getAlert('mb237'), "member_facebook_connect", {"width":"470","height":"250"});
						}else if(res.result == true){
							loadingStop("body",true);
							openDialogAlert(res.msg,'400','180',function(){
								document.location.reload();
							});
						}else{
							loadingStop("body",true);
							openDialogAlert(res.msg,'400','140',function(){});
						}
					}
					});
			}
		});
	   } else if (response.status == 'not_authorized' || response.status == 'unknown') {
		   //연결을 취소하셨습니다.
			openDialogAlert(getAlert('mb238'),'400','160',function(){});
			// 로그아웃된 경우
			isLogin = false;
			if (fbId != "")  initializeFbTokenValues();
			if (fbUid != "") initializeFbUserValues();
		}
	}

	//회원통합을 위한 로그인
	function handelStatusChangeconnect(response) {
		if (response && response.status == 'connected') {
		// 로그인
		isLogin = true;
		initializeFbTokenValues();
		initializeFbUserValues();
		fbId = response.authResponse.userID;
		fbAccessToken = response.authResponse.accessToken;
		FB.api('/me', function(response) {
			 fbUid = response.email;
			 fbName = response.name;
			 if (fbName != "") {
				loadingStart("body",{segments: 12, width: 15.5, space: 6, length: 13, color: '#000000', speed: 1.5});
					var userid = $("#facebook_userid").val();
					var password = $("#facebook_password").val();
					$.ajax({
					'url' : '../sns_process/facebookloginck',
					'data' : {'facebooktype':'mbconnect','userid':userid, 'password':password},
					'type' : 'post',
					'dataType': 'json',
					'success': function(res) {
						if(res.result == true){
							loadingStop("body",true);
							openDialogAlert(res.msg,'400','180',function(){
								document.location.reload();
							});
						}else{
							loadingStop("body",true);
							openDialogAlert(res.msg,'400','140',function(){});
						}
					}
					});
			}
		});
	   } else if (response.status == 'not_authorized' || response.status == 'unknown') {
		   //연결을 취소하셨습니다.
			openDialogAlert(getAlert('mb238'),'400','160',function(){});
			// 로그아웃된 경우
			isLogin = false;
			if (fbId != "")  initializeFbTokenValues();
			if (fbUid != "") initializeFbUserValues();
		}
	}

	//회원통합하지 않고 가입하기
	function handelStatusChangenoconnect(response) {
		if (response && response.status == 'connected') {
		// 로그인
		isLogin = true;
		initializeFbTokenValues();
		initializeFbUserValues();
		fbId = response.authResponse.userID;
		fbAccessToken = response.authResponse.accessToken;
		FB.api('/me', function(response) {
			 fbUid = response.email;
			 fbName = response.name;
			 if (fbName != "") {
				loadingStart("body",{segments: 12, width: 15.5, space: 6, length: 13, color: '#000000', speed: 1.5});
					$.ajax({
					'url' : '../sns_process/facebookloginck',
					'data' : {'facebooktype':'noconnect'},
					'type' : 'post',
					'dataType': 'json',
					'success': function(res) {
						if(res.result == true){
							loadingStop("body",true);
							openDialogAlert(res.msg,'400','180',function(){
								document.location.reload();
							});
						}else{
							loadingStop("body",true);
							openDialogAlert(res.msg,'400','140',function(){});
						}
					}
					});
			}
		});
	   } else if (response.status == 'not_authorized' || response.status == 'unknown') {
		   //연결을 취소하셨습니다.
			openDialogAlert(getAlert('mb238'),'400','160',function(){});
			// 로그아웃된 경우
			isLogin = false;
			if (fbId != "")  initializeFbTokenValues();
			if (fbUid != "") initializeFbUserValues();
		}
	}

	function initializeFbTokenValues() {
		fbId = "";
		fbAccessToken = "";
	}
	function initializeFbUserValues() {
		fbUid = "";
		fbName = "";
	}
	function logout(){
		// 로그아웃된 경우
		FB.logout();
		isLogin = false;
		if (fbId != "")  initializeFbTokenValues();
		if (fbUid != "") initializeFbUserValues();
	}
 </script>

<style type="text/css">

/* 레이아웃설정 폰트 적용 */
#layout_body body,
#layout_body table,
#layout_body div,
#layout_body input,
#layout_body textarea,
#layout_body select,
#layout_body span
{
}

/* 레이아웃설정 스크롤바색상 적용 */
</style>


<!-- /자바스크립트 -->
<script src="http://responsive-sample30.firstmall.kr/app/javascript/js/dev-tools.js?v="></script><script src="http://responsive-sample30.firstmall.kr/app/javascript/js/goods-display_mobile.js?v="></script><script src="http://responsive-sample30.firstmall.kr/app/javascript/js/design.js?v="></script><script src="http://responsive-sample30.firstmall.kr/app/javascript/js/common.js?v="></script><script src="http://responsive-sample30.firstmall.kr/app/javascript/js/common-mobile.js?v="></script><script src="http://responsive-sample30.firstmall.kr/app/javascript/js/front-layout.js?v="></script><script src="http://responsive-sample30.firstmall.kr/app/javascript/js/base64.js?v="></script><script src="http://responsive-sample30.firstmall.kr/app/javascript/js/skin-responsive.js?v="></script><script src="http://responsive-sample30.firstmall.kr/data/js/language/L10n_KR.js?v="></script><script src="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/common/jquery.event.drag-1.5.min.js?v="></script><script src="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/common/jquery.touchSlider.js?v="></script><script src="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/common/responsive.js?v="></script><script src="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/common/script.js?v="></script><script src="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/common/search_ver2.js?v="></script><script src="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/common/user.js?v="></script><script src="http://responsive-sample30.firstmall.kr/app/javascript/plugin/jquery.bxslider.js?v="></script>
</head>

<body>

<!--facebook area-->
<div id="fb-root"></div>
<!--facebook area end-->

<!-- ================= #HTML_HEADER :: END. 파일위치 : _modules/common/html_header.html ================= -->

<!--[ 디자인모드 호출 스크립트]-->

<!--[ 모바일쇼핑몰 디자인모드시 화면 구성 ]-->

<style>
#layout_body {
background-color:#ffffff;}
#layer_pay {position:absolute;top:0px;width:100%;height:100%;background-color:#ffffff;text-align:center;z-index:999999;}
#payprocessing {text-align:center;position:absolute;width:100%;top:150px;z-index:99999999px;}
</style>

<div id="wrap">
	<!-- ================= 어사이드 :: START. 파일위치 : _modules/common/layout_side.html (비동기 로드) ================= -->
	<div id="layout_side" class="layout_side"></div>
	<!-- ================= 어사이드 :: END. 파일위치 : _modules/common/layout_side.html (비동기 로드) ================= -->
	<a href="javascript:;" id="side_close" class="side_close">어사이드 닫기</a>

	<div id="layout_wrap" class="layout_wrap">
		<!-- ================= #LAYOUT_HEADER :: START. 파일위치 : layout_header/standard.html (default) ================= -->
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
@@ #LAYOUT_HEADER @@
- 파일위치 : [스킨폴더]/layout_header/standard.html
++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<link href="https://fonts.googleapis.com/css2?family=Open+Sans&amp;family=Quicksand:wght@300;500;700&amp;display=swap" rel="stylesheet" />

<div id="layout_header" class="layout_header">
	<div class="util_wrap">
		<div class="resp_wrap">
			<!-- language -->
			<div class="language hide">
				<a class="select_list" id="select_main" href="http://edge_sample.firstmall.kr/">
				<span class="language_country_img language_country_img_KR"></span>
				Korea
				<span class="sel_arrow"></span>
				</a>
				<ul class="optionSub" style="position: relative; display: none;">
				</ul>
			</div>

			<!-- bookmark -->
			<ul class="bookmark">
				<li><a href="http://responsive-sample30.firstmall.kr/service/cs" designElement="text" textIndex="1"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2hlYWRlci9zdGFuZGFyZC5odG1s" >CS Center</a></li>
				<li><a href="http://responsive-sample30.firstmall.kr/mypage" designElement="text" textIndex="2"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2hlYWRlci9zdGFuZGFyZC5odG1s" >My page</a></li>
			</ul>

			<ul class="util_wrap_menu2">
				<li class="respCartArea">
					<a href="http://responsive-sample30.firstmall.kr/order/cart"><span designElement="text" textIndex="11"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2hlYWRlci9zdGFuZGFyZC5odG1s" >Cart</span> <span class="cart_cnt1">0</span></a>
				</li>
				<li><a href="http://responsive-sample30.firstmall.kr/mypage/order_catalog" designElement="text" textIndex="12"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2hlYWRlci9zdGFuZGFyZC5odG1s" >Order</a></li>
				<li><a href="http://responsive-sample30.firstmall.kr/member/login" designElement="text" textIndex="13"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2hlYWRlci9zdGFuZGFyZC5odG1s" >Login</a></li>
				<li class="point">
					<a href="http://responsive-sample30.firstmall.kr/member/agreement" designElement="text" textIndex="14"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2hlYWRlci9zdGFuZGFyZC5odG1s" >Join</a>
					<div class="benefit">
						<span class="arrow">▲</span>
						+ 2,000
					</div>
				</li>
			</ul>
		</div>
	</div>

	<div class="logo_wrap">
		<div class="resp_wrap">
			<!-- 햄버거 버튼 -->
			<div class="resp_top_hamburger">
				<a href="#category"><b>aside menu</b></a>
			</div>

			<!-- logo -->
			<h1 class="logo_area">
			<a href="http://responsive-sample30.firstmall.kr/main/index" target="_self"><img src="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/design_resp/logo.png" alt="(주) 귀사의 회사명" /></a>
			</h1>

			<!-- 장바구니( 1023px 이하에서 노출됨 ) -->
			<a href="http://responsive-sample30.firstmall.kr/order/cart" class="resp_top_cart"><span class="cart_cnt2">0</span></a>

			<!-- +++++++++++++++++++++++++ 검색 리뉴얼 +++++++++++++++++++++++++++++ -->
			<div id="searchModule" class="resp_top_search">
				<a href="javascript:void(0)" id="btnSearchV2" class="btn_search_open">검색</a>
				<div id="searchVer2" class="search_ver2">
					<div class="search_new">
						<!-- ------- 검색 입력 ------- -->
						<form name="topSearchForm" id="topSearchForm" action="http://responsive-sample30.firstmall.kr/goods/search">
						<div class="input_area">
							<div class="cont">
								<label class="search_box"><input type="text" name="search_text" id="searchVer2InputBox" class="search_ver2_input_box" placeholder="Search" autocomplete="off" /></label>
								<button type="submit" class="search"></button>
								<button type="button" class="close searchModuleClose"></button>
							</div>
						</div>
						</form>
						<!-- ------- 페이지별 기본 검색 ------- -->
						<!-- ------- //검색 입력 ------- -->
						<div class="contetns_area" style="display: none;">
							<!-- ------- 최근 검색어, 최근본 상품 ------- -->
							<div id="recentArea" class="recent_area">
								<ul class="tab_btns">
									<li class="on"><a href="#recent-searched-list">최근 검색어</a></li>
									<li><a href="#recent-item-list">최근본 상품</a></li>
								</ul>
								<!-- 최근 검색어 -->
								<div id="recent-searched-list" class="tab_contents">
									<ul id="recentSearchedList" class="searching_list">
										<li class="recent_search_item popular_search_item">
											<a class="searched_item" href="javascript:void(0)">영일미가</a>
										</li>
										<li class="recent_search_item popular_search_item">
											<a class="searched_item" href="javascript:void(0)">텐트</a>
										</li>
										<li class="no_data">최근검색어가 없습니다.</li>
									</ul>
									<div id="recentSearchedGuide" class="no_data" style="display: none;">최근 검색어 저장 기능이 꺼져있습니다.</div>
									<ul class="tab_foot_menu">
										<li class="menu_item">
											<a href="javascript:void(0)" data-value="all" onclick="searchRecentRemove(this)">전체삭제</a>
											<a class="btnRecentAuto off" href="javascript:void(0)">자동저장 끄기</a>
											<a class="btnRecentAuto on" href="javascript:void(0)" style="display: none;">자동저장 <span class="importcolor">켜기</span></a>
										</li>
										<li class="search_close searchModuleClose"><a href="javascript:void(0)">닫기</a></li>
									</ul>
								</div>
								<!-- //최근 검색어 -->
								<!-- 최근본 상품 -->
								<div id="recent-item-list" class="tab_contents" style="display: none;">
									<ul class="recent_item_list">
										<li class="recent_item" data-value="48">
											<a class="item_link" href="http://responsive-sample30.firstmall.kr/goods/view?no=48"><img class="item_img" src="http://responsive-sample30.firstmall.kr/data/goods/1/2020/04/48_tmp_28a538612e75d2c98952805cc294ac319152thumbScroll.jpg" alt="썸네일(스크롤)" onerror="this.src='http://responsive-sample30.firstmall.kr/data/icon/goods/error/noimage_list.gif';" /></a>
											<div class="display_zzim">
												<img src="http://responsive-sample30.firstmall.kr/data/icon/goodsdisplay/preview/thumb_zzim_off.png" class="zzimOffImg" alt="찜하기" data-member="" data-goods="48" data-wish="" onclick="setWish(this)" />
												<img src="http://responsive-sample30.firstmall.kr/data/icon/goodsdisplay/preview/thumb_zzim_on.png" class="zzimOnImg" alt="찜하기" style="display: none;" data-member="" data-goods="48" data-wish="" onclick="setWish(this)" />
											</div>
											<a class="item_delete" href="javascript:void(0)" title="삭제" onclick="todayViewRemove(this);">아이템 삭제</a>
										</li>
										<li class="recent_item" data-value="38">
											<a class="item_link" href="http://responsive-sample30.firstmall.kr/goods/view?no=38"><img class="item_img" src="http://responsive-sample30.firstmall.kr/data/goods/1/2020/04/38_tmp_3d6224616adf9334e7a0438b39facc496747thumbScroll.jpg" alt="썸네일(스크롤)" onerror="this.src='http://responsive-sample30.firstmall.kr/data/icon/goods/error/noimage_list.gif';" /></a>
											<div class="display_zzim">
												<img src="http://responsive-sample30.firstmall.kr/data/icon/goodsdisplay/preview/thumb_zzim_off.png" class="zzimOffImg" alt="찜하기" data-member="" data-goods="38" data-wish="" onclick="setWish(this)" />
												<img src="http://responsive-sample30.firstmall.kr/data/icon/goodsdisplay/preview/thumb_zzim_on.png" class="zzimOnImg" alt="찜하기" style="display: none;" data-member="" data-goods="38" data-wish="" onclick="setWish(this)" />
											</div>
											<a class="item_delete" href="javascript:void(0)" title="삭제" onclick="todayViewRemove(this);">아이템 삭제</a>
										</li>
										<li class="recent_item" data-value="23">
											<a class="item_link" href="http://responsive-sample30.firstmall.kr/goods/view?no=23"><img class="item_img" src="http://responsive-sample30.firstmall.kr/data/goods/1/2019/02/23_tmp_83a1903d385c3e2538e042862f2d8ebd6470thumbScroll.jpg" alt="썸네일(스크롤)" onerror="this.src='http://responsive-sample30.firstmall.kr/data/icon/goods/error/noimage_list.gif';" /></a>
											<div class="display_zzim">
												<img src="http://responsive-sample30.firstmall.kr/data/icon/goodsdisplay/preview/thumb_zzim_off.png" class="zzimOffImg" alt="찜하기" data-member="" data-goods="23" data-wish="" onclick="setWish(this)" />
												<img src="http://responsive-sample30.firstmall.kr/data/icon/goodsdisplay/preview/thumb_zzim_on.png" class="zzimOnImg" alt="찜하기" style="display: none;" data-member="" data-goods="23" data-wish="" onclick="setWish(this)" />
											</div>
											<a class="item_delete" href="javascript:void(0)" title="삭제" onclick="todayViewRemove(this);">아이템 삭제</a>
										</li>
										<li class="recent_item" data-value="21">
											<a class="item_link" href="http://responsive-sample30.firstmall.kr/goods/view?no=21"><img class="item_img" src="http://responsive-sample30.firstmall.kr/data/goods/1/2019/02/21_tmp_516fde25e6fc1da11a3a9ee3bec415082475thumbScroll.jpg" alt="썸네일(스크롤)" onerror="this.src='http://responsive-sample30.firstmall.kr/data/icon/goods/error/noimage_list.gif';" /></a>
											<div class="display_zzim">
												<img src="http://responsive-sample30.firstmall.kr/data/icon/goodsdisplay/preview/thumb_zzim_off.png" class="zzimOffImg" alt="찜하기" data-member="" data-goods="21" data-wish="" onclick="setWish(this)" />
												<img src="http://responsive-sample30.firstmall.kr/data/icon/goodsdisplay/preview/thumb_zzim_on.png" class="zzimOnImg" alt="찜하기" style="display: none;" data-member="" data-goods="21" data-wish="" onclick="setWish(this)" />
											</div>
											<a class="item_delete" href="javascript:void(0)" title="삭제" onclick="todayViewRemove(this);">아이템 삭제</a>
										</li>
										<li class="recent_item" data-value="40">
											<a class="item_link" href="http://responsive-sample30.firstmall.kr/goods/view?no=40"><img class="item_img" src="http://responsive-sample30.firstmall.kr/data/goods/1/2020/04/40_tmp_db4fdc5ef6ee28116bf7a927b26f04e65083thumbScroll.jpg" alt="썸네일(스크롤)" onerror="this.src='http://responsive-sample30.firstmall.kr/data/icon/goods/error/noimage_list.gif';" /></a>
											<div class="display_zzim">
												<img src="http://responsive-sample30.firstmall.kr/data/icon/goodsdisplay/preview/thumb_zzim_off.png" class="zzimOffImg" alt="찜하기" data-member="" data-goods="40" data-wish="" onclick="setWish(this)" />
												<img src="http://responsive-sample30.firstmall.kr/data/icon/goodsdisplay/preview/thumb_zzim_on.png" class="zzimOnImg" alt="찜하기" style="display: none;" data-member="" data-goods="40" data-wish="" onclick="setWish(this)" />
											</div>
											<a class="item_delete" href="javascript:void(0)" title="삭제" onclick="todayViewRemove(this);">아이템 삭제</a>
										</li>
										<li class="no_data" style="display: none;">최근본 상품이 없습니다.</li>
									</ul>
									<ul class="tab_foot_menu">
										<li class="swiper_guide">
											<span class="to_left">&lt;</span>
											<span class="to_right">&gt;</span>
										</li>
										<li class="search_close searchModuleClose"><a href="javascript:void(0)">닫기</a></li>
									</ul>
								</div>
								<!-- //최근본 상품 -->
							</div>
							<!-- ------- //최근 검색어, 최근본 상품 ------- -->

							<!-- ------- 검색어 자동완성 ------- -->
							<div id="autoCompleteArea" class="autocomplete_area" style="display: none;">
								<!-- 검색어 자동완성 검색어 -->
								<div class="autocomplete_searching">
									<ul id="autoCompleteList" class="searching_list"></ul>

									<div id="autoCompleteGuide" class="no_data" style="display: none;">자동완성 기능이 꺼져있습니다</div>

									<ul class="tab_foot_menu">
										<li class="menu_item">
											<a class="btnAutoComplete off" href="javascript:void(0)">자동완성 끄기</a>
											<a class="btnAutoComplete on" href="javascript:void(0)" style="display: none;">자동완성 <span class="importcolor">켜기</span></a>
										</li>
										<li class="search_close searchModuleClose"><a href="javascript:void(0)">닫기</a></li>
									</ul>
								</div>
								<!-- //검색어 자동완성 - 검색어 -->

								<!-- 검색어 자동완성 - 배너( 추천상품 ) -->
								<div id="autoCompleteBanner" class="autocomplete_banner">
									<h5 class="title">추천 상품</h5>
									<ul id="autocompleteBannerList" class="banner_list"></ul>
								</div>
								<!-- //검색어 자동완성 - 배너( 추천상품 ) -->
							</div>
							<!-- ------- //검색어 자동완성 ------- -->
						</div>
					</div>
				</div>
			</div>
			<!-- +++++++++++++++++++++++++ //검색 리뉴얼 +++++++++++++++++++++++++++++ -->

			<!-- +++++++++++ 카테고리 메뉴( 카테고리 메뉴를 미노출 하실 분은 style="display:none;" 처리 하세요. ex) id="cateSwiper" class="nav_wrap" style="display:none;" ) +++++++++++ -->
			<div id="cateSwiper" class="nav_wrap">
				<div class="resp_wrap">
					<div class="nav_category_area">
						<div class="designCategoryNavigation">
							<ul class="respCategoryList">
								<li class="custom_nav_link">
									<a class="categoryDepthLink" designElement="text" textIndex="15"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2hlYWRlci9zdGFuZGFyZC5odG1s"  href="http://responsive-sample30.firstmall.kr/service/company"><em>About Us</em></a>
								</li>
								<li class="categoryDepth1 nav_category_all ">
									<!-- 전체 카테고리 버튼 class 네임 : 'categoryAllBtn', 전체 브랜드 : 'brandAllBtn', 전체 지역 : 'locationAllBtn' -->
									<!-- 전체 카테고리 로딩 파일위치 : [스킨폴더]/_modules/category/all_navigation.html -->
									<a class="categoryAllBtn" designElement="text" textIndex="16"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2hlYWRlci9zdGFuZGFyZC5odG1s"  href="#none"><em>Product</em></a>
									<div class="categorySub categoryAllSub">
										<ul>
											<!-- 카테고리 네비게이션. 파일위치 : [스킨폴더]/_modules/category/category_gnb.html -->
											<!-- 참고) 브랜드: showBrandLightNavigation(), 지역: showLocationLightNavigation() -->
											<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
@@ 카테고리 네비게이션 @@
- 파일위치 : [스킨폴더]/_modules/category/category_gnb.html
- 현재 3뎁스까지 노출 가능
++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

	<li class="categoryDepth1">
		<a class="categoryDepthLink" href="http://responsive-sample30.firstmall.kr/goods/catalog?code=0003"><em>텐트/타프</em></a>
	</li>
	<li class="categoryDepth1">
		<a class="categoryDepthLink" href="http://responsive-sample30.firstmall.kr/goods/catalog?code=0004"><em>가방/케이스</em></a>
	</li>
	<li class="categoryDepth1">
		<a class="categoryDepthLink" href="http://responsive-sample30.firstmall.kr/goods/catalog?code=0005"><em>침낭/매트</em></a>
	</li>
	<li class="categoryDepth1">
		<a class="categoryDepthLink" href="http://responsive-sample30.firstmall.kr/goods/catalog?code=0006"><em>화로대/바베큐용품</em></a>
	</li>
	<li class="categoryDepth1">
		<a class="categoryDepthLink" href="http://responsive-sample30.firstmall.kr/goods/catalog?code=0007"><em>랜턴/후레쉬</em></a>
	</li>
	<li class="categoryDepth1">
		<a class="categoryDepthLink" href="http://responsive-sample30.firstmall.kr/goods/catalog?code=0008"><em>의자/테이블</em></a>
	</li>
	<li class="categoryDepth1">
		<a class="categoryDepthLink" href="http://responsive-sample30.firstmall.kr/goods/catalog?code=0009"><em>캠핑소품</em></a>
	</li>

											<!-- //카테고리 네비게이션 -->
										</ul>
									</div>
								</li>
								<li class="custom_nav_link">
									<a class="categoryDepthLink" designElement="text" textIndex="17"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2hlYWRlci9zdGFuZGFyZC5odG1s"  href="http://responsive-sample30.firstmall.kr/goods/best"><em>Best</em></a>
								</li>
								<li class="custom_nav_link">
									<a class="categoryDepthLink" designElement="text" textIndex="18"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2hlYWRlci9zdGFuZGFyZC5odG1s"  href="http://responsive-sample30.firstmall.kr/goods/new_arrivals"><em>New</em></a>
								</li>
								<li class="custom_nav_link">
									<a class="categoryDepthLink" designElement="text" textIndex="19"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2hlYWRlci9zdGFuZGFyZC5odG1s"  href="http://responsive-sample30.firstmall.kr/goods/brand_main"><em>Brands</em></a>
								</li>
								<li class="custom_nav_link">
									<a class="categoryDepthLink" designElement="text" textIndex="20"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2hlYWRlci9zdGFuZGFyZC5odG1s"  href="http://responsive-sample30.firstmall.kr/promotion/event"><em>Event</em></a>
								</li>
								<li class="custom_nav_link">
									<a class="categoryDepthLink" designElement="text" textIndex="21"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2hlYWRlci9zdGFuZGFyZC5odG1s"  href="http://responsive-sample30.firstmall.kr/board/?id=custom_bbs2"><em>Story</em></a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- +++++++++++ //카테고리 메뉴 +++++++++++ -->
		</div>
	</div>
	<!-- //로고 영역 -->

	<!-- 카테고리 전체 네비게이션 팝업 START -->
	<div id="categoryAll_wrap" class="categoryAll_wrap" style="display: none;">
		<div class="categoryAllContainer">
			<!-- 로딩 파일위치 : [스킨폴더]/_modules/category/all_navigation.html -->
		</div>
	</div>

</div>
<!-- 상단영역 : 끝 -->

<script type="text/javascript" src="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/common/search_ver2_ready.js"></script>
<!-- 반응형 관련 프론트 js : 검색, 자동검색어 최근본상품 -->
<script type="text/javascript">
  var resp_loc_top;
  function flyingTitleBar() {
  	//var resp_loc_top = $("#layout_header .logo_wrap").offset().top;
  	var obj = $("#layout_header .logo_wrap");
  	var obj_H = $("#layout_header .logo_wrap").outerHeight();
  	$(document).scroll(function(){
  		//alert( resp_loc_top );
  		if ( ( $('.designPopupBand').is(':hidden') || $('.designPopupBand').length < 1 )  && window.innerWidth < 480 ) {
  			if ( $("#layout_header .util_wrap").is(':hidden') ) {
  				resp_loc_top = 0;
  			} else {
  				resp_loc_top = $("#layout_header .util_wrap").outerHeight(); // 띠배너 클로즈시 보정
  			}
  		}
  		if(resp_loc_top < $(document).scrollTop() && window.innerWidth < 480 ){
  		} else {
  			obj.removeClass('flying');
  			if ( $('#gonBox').length ) {
  				$('#gonBox').remove();
  			}
  		}
  	});
  }

  $(function(){
    // 텍스트 수정기능을 통해 소스에 박혀있는 카테고리 삭제시 --> 항목 삭제
  	$('#cateSwiper .custom_nav_link').each(function(e) {
      if ( $(this).find('a').text() == '' ) {
        $(this).remove();
  		}
  	});

    /* 카테고리 메뉴 */
    $(".nav_category_all").on("mouseenter", function () {
      $(".categoryAllSub").show();
    });
    $(".nav_category_all").on("mouseleave", function () {
      $(".categoryAllSub").hide();
    });

  	/* 카테고리 활성화 */
  	var url2, cateIndex;
  	$('#layout_header .designCategoryNavigation .respCategoryList>li').each(function() {
  		url2 = $(this).find('a').attr('href');
  		if ( REQURL == url2 ) {
  			cateIndex = $(this).index();
  		} else if ( REQURL != url2 && ( REQURL.substr( 0, REQURL.length-4 ) == url2 || REQURL.substr( 0, REQURL.length-8 ) == url2) ) {
  			// 1depth 카테고리 일치하는 요소가 없는 경우 2뎁스에서 검색
  			cateIndex = $(this).index();
  		}
  	});
  	$('#layout_header .designCategoryNavigation .respCategoryList>li').eq(cateIndex).addClass('on');
  	/* //카테고리 활성화 */

  	/* 카테고리 swiper 동작( 1024 미만인 경우 동작, 1024 이상인 경우 : 마우스 오버시 서브메뉴 노출 ) */
  	var slideshowSwiper = undefined;

  	if ( window.innerWidth < 1280 && $('#cateSwiper .designCategoryNavigation').length > 0 ) {
  		$('#cateSwiper .designCategoryNavigation ul.respCategoryList>li').addClass('swiper-slide');
      $('#layout_header .respCategoryList .categoryDepth1').off('hover');
      slideshowSwiper = new Swiper('#cateSwiper .designCategoryNavigation', {
  			wrapperClass: 'respCategoryList',
  			slidesPerView: 'auto'
  		});
  		slideshowSwiper.slideTo( (cateIndex-1), 800, false );
  	} else {
  		$('#cateSwiper .designCategoryNavigation ul.respCategoryList>li').removeClass('swiper-slide');
  		$('#layout_header .respCategoryList .categoryDepth1').hover(
  			function() { $(this).children('.categorySub').show(); },
  			function() { $(this).children('.categorySub').hide(); }
  		);
  	}
  	$( window ).resize(function() {
  		if ( window.innerWidth != WINDOWWIDTH ) {
  			if ( window.innerWidth < 1280 && $('#cateSwiper .designCategoryNavigation').length > 0 && slideshowSwiper == undefined ) {
  				$('#cateSwiper .designCategoryNavigation ul.respCategoryList>li').addClass('swiper-slide');
  				$('#layout_header .respCategoryList .categoryDepth1').off('hover');
  				slideshowSwiper = new Swiper('#cateSwiper .designCategoryNavigation', {
  					wrapperClass: 'respCategoryList',
  					slidesPerView: 'auto'
  				});
  				slideshowSwiper.slideTo( (cateIndex-1), 800, false );
  			} else if ( window.innerWidth > 1279 && slideshowSwiper != undefined ) {
  				slideshowSwiper.slideTo( 0, 800, false );
  				$('#cateSwiper .designCategoryNavigation ul.respCategoryList>li').removeClass('swiper-slide');
  				slideshowSwiper.destroy();
  				slideshowSwiper = undefined;
  				$('#layout_header .respCategoryList .categoryDepth1').hover(
  					function() { $(this).children('.categorySub').show(); },
  					function() { $(this).children('.categorySub').hide(); }
  				);
  			}
  		}
  	});
  	/* //카테고리 swiper 동작( 1024 미만인 경우 동작, 1024 이상인 경우 : 마우스 오버시 서브메뉴 노출 ) */

    //================= 카테고리 전체 네비게이션 START ====================
    $('.categoryAllBtn').click(function () {
      $('#categoryAll_wrap .categoryAllContainer').load('/common/category_all_navigation', function () {
        $('#categoryAll_wrap').show();
        $('body').css('overflow', 'hidden');
      });
    });
    $('#categoryAll_wrap').on('click', '.categoryAllClose', function () {
      $('#categoryAll_wrap').hide();
      $('body').css('overflow', 'auto');
    });
    //================= 카테고리 전체 네비게이션 END  ====================

  	// GNB 검색 관련
  	$('#respTopSearch .search_open_btn').click(function() {
  		$('#respTopSearch .search_form').addClass('animating');
  		$('#respTopSearch .search_text').focus();
  	});
  	$('#respTopSearch .search_close_btn').click(function() {
  		$('#respTopSearch .search_form').removeClass('animating');
  	});

  	// 타이틀바 띄우기
  	flyingTitleBar();
  	$( window ).on('resize', function() {
  		if ( window.innerWidth != WINDOWWIDTH ) {
  			flyingTitleBar();
  		}
  	});

  	/* 카테고리 네비게이션 서브레이어 포지션 변화 */
  	var category1DepthNum = $('.respCategoryList .categoryDepth1').length;
  	var rightCategoryStandard = Math.floor( category1DepthNum / 2 );
  	$('.respCategoryList .categoryDepth1').each(function(e) {
  		if ( e > rightCategoryStandard ) {
  			//$('.respCategoryList .categoryDepth1').eq(e).addClass('right_area');
  		}
  	});
  	/* 카테고리 네비게이션 서브레이어 포지션 변화 */

  	$('.designPopupBand .designPopupClose').on('click', function() {
  		// 띠배너 닫기 클릭시
  	});
  });
</script>
		<!-- ================= #LAYOUT_HEADER :: END. 파일위치 : layout_header/standard.html (default) ================= -->

		<div id="layout_body" class="layout_body">
		<!-- ================= 파트 페이지들 :: START. ================= -->

<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
@@ 상품 상세 @@
- 파일위치 : [스킨폴더]/goods/view.html
++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<script type='text/javascript'>var fbv='3.2';</script><script type='text/javascript' src='http://responsive-sample30.firstmall.kr/app/javascript/js/facebook.js?v=20150501' charset='utf8'></script>

<script type="text/javascript">
	var gl_goods_price = 0;
	var gl_event_sale_unit = 0;
	var gl_cutting_sale_price = 0;
	var gl_cutting_sale_action = "dscending";
	var gl_multi_discount_use 	= "";
	var gl_multi_discount_unit = "";
	var gl_multi_discount 		= 0;
	var gl_multi_discount_ea 	= 0;
	var gl_option_view_type = "divide";
	var gl_options_count = 4;
	var gl_opttag = '<tr class="quanity_row">';
	var gl_min_purchase_limit = 'unlimit';
	var gl_min_purchase_ea = 0;
	var gl_max_purchase_limit = 'unlimit';
	var gl_max_purchase_ea = 0;
	var gl_member_seq = "";
	var gl_request_uri = "%2Fgoods%2Fview%3Fno%3D49";
	var gl_goods_seq = 0;
	var gl_option_divide_title_count = 1;
	var gl_skin = "responsive_camping_healing_gl";
	var gl_string_price_use = "";
	var gl_string_button_use = "";

	var gl_option_n0 = [{"opt":"\ube0c\ub77c\uc6b4","stock":"0","price":64000,"consumer_price":"90000.00","reservation":0,"infomation":"","color":"#6b4d32","zipcode":null,"address_type":null,"address":null,"addressdetail":null,"address_street":null,"newtype":"color","codedate":null,"sdayinput":null,"fdayinput":null,"dayauto_type":null,"sdayauto":null,"fdayauto":null,"dayauto_day":null,"biztel":null,"coupon_input":"1","package_option_seq1":null,"package_option_seq2":null,"package_option_seq3":null,"package_option_seq4":null,"package_option_seq5":null,"package_option1":null,"package_option2":null,"package_option3":null,"package_option4":null,"package_option5":null,"option_seq":"212","goods_seq":"49","package_error":false,"chk_stock":true,"ori_price":64000,"opspecial_location":{"color":1},"ismobile":true},{"opt":"\ub77c\uc774\ud2b8\ube0c\ub77c\uc6b4","stock":"0","price":64000,"consumer_price":"90000.00","reservation":0,"infomation":"","color":"#b89f88","zipcode":null,"address_type":null,"address":null,"addressdetail":null,"address_street":null,"newtype":"color","codedate":null,"sdayinput":null,"fdayinput":null,"dayauto_type":null,"sdayauto":null,"fdayauto":null,"dayauto_day":null,"biztel":null,"coupon_input":"1","package_option_seq1":null,"package_option_seq2":null,"package_option_seq3":null,"package_option_seq4":null,"package_option_seq5":null,"package_option1":null,"package_option2":null,"package_option3":null,"package_option4":null,"package_option5":null,"option_seq":"213","goods_seq":"49","package_error":false,"chk_stock":true,"ori_price":64000,"opspecial_location":{"color":1},"ismobile":true},{"opt":"\uc0b4\uad6c\uc0c9","stock":"0","price":64000,"consumer_price":"90000.00","reservation":0,"infomation":"","color":"#ebd8c1","zipcode":null,"address_type":null,"address":null,"addressdetail":null,"address_street":null,"newtype":"color","codedate":null,"sdayinput":null,"fdayinput":null,"dayauto_type":null,"sdayauto":null,"fdayauto":null,"dayauto_day":null,"biztel":null,"coupon_input":"1","package_option_seq1":null,"package_option_seq2":null,"package_option_seq3":null,"package_option_seq4":null,"package_option_seq5":null,"package_option1":null,"package_option2":null,"package_option3":null,"package_option4":null,"package_option5":null,"option_seq":"214","goods_seq":"49","package_error":false,"chk_stock":true,"ori_price":64000,"opspecial_location":{"color":1},"ismobile":true},{"opt":"\ud654\uc774\ud2b8","stock":"0","price":64000,"consumer_price":"90000.00","reservation":0,"infomation":"","color":"#fff","zipcode":null,"address_type":null,"address":null,"addressdetail":null,"address_street":null,"newtype":"color","codedate":null,"sdayinput":null,"fdayinput":null,"dayauto_type":null,"sdayauto":null,"fdayauto":null,"dayauto_day":null,"biztel":null,"coupon_input":"1","package_option_seq1":null,"package_option_seq2":null,"package_option_seq3":null,"package_option_seq4":null,"package_option_seq5":null,"package_option1":null,"package_option2":null,"package_option3":null,"package_option4":null,"package_option5":null,"option_seq":"215","goods_seq":"49","package_error":false,"chk_stock":true,"ori_price":64000,"opspecial_location":{"color":1},"ismobile":true}];


	gl_goods_price = 64000;
	gl_cutting_sale_price = 0.001;
	gl_multi_discount 		= 0.00;
	gl_min_purchase_ea = 1;
	gl_goods_seq = 49;


	/*
	var PlusMobileTaps = {};
	PlusMobileTaps.hiddenTab = $('<div>').appendTo(document.body).css({position:'fixed',top:0,left:0,width:'100%',height:0,zIndex:999});

	PlusMobileTaps.tabFlyingmode = function(type) {
		if( type && !$('#goods_contents_quick').hasClass('flyingMode') ){
			$('#goods_contents_quick').css('padding-top',$('#goods_title_bar').height()).addClass('flyingMode');
			$('#goods_tabs').css('top',$('#goods_title_bar').height()).appendTo(PlusMobileTaps.hiddenTab);
		}else if( !type && $('#goods_contents_quick').hasClass('flyingMode') ){
			$('#goods_contents_quick').removeClass('flyingMode').css('padding-top',0);
			$('#goods_contents_quick').prepend( $('#goods_tabs').css('top',$('#goods_title_bar').height()) );
		}
	}

	PlusMobileTaps.scrollTabsFunc = function() {
		var sc = $(window).scrollTop(),
			headerH = $('#goods_title_bar').height(),
			detailtabH = $('#goods_tabs').height(),
			contH = parseInt($('.event_datetime').height()+$('#goods_view_quick').height());
		if(sc == 0 && contH == 0)	$('#goods_tabs').hide();
		else						$('#goods_tabs').show();
		if( sc > headerH ){
			$('#goods_title_bar').addClass('flyingMode');
		}else{
			$('#goods_title_bar').removeClass('flyingMode');
		}

		if( sc < contH ){
			PlusMobileTaps.tabFlyingmode(false);//해더타이틀 숨김
		}else{
			PlusMobileTaps.tabFlyingmode(true);
		}
	}
	*/

	var get_preload_func = function(){
		$.ajax({
			url: "/goods/view_contents?no=49&zoom=1&view_preload=1",
			type: "get",
			success : function(e){
				$('.goods_view_contents').html(e);
			}
		});
	};

	var get_commonpreload_func = function(){
		$.ajax({
			url: "/goods/view_common_contents?no=49&zoom=1&view_preload=1",
			type: "get",
			success : function(e){
				$('.goods_common_contents').html(e);
			}
		});
	};

	$(document).ready(function(){
		/*
		if	(window.location.hash == '#goods_review') {
			$('#goods_review_frame,#goods_qna_frame').load(function(){
				$('.goods_information_tabs li:eq(1)').click();
				$('html,body').animate({scrollTop:$('html,body').height()+500},'fast');
			});
		}
		*/

		setSlideSwipe('.slides_wrap', '.main_tabs_contents', 'resimg_num');


		$("select[name='viewOptions[]']").last().bind("change",function(){
			gl_opttag = '<td class="quantity_cell option_text">';
			var opt = $(this).find('option:selected').attr('opt1');
			if(!opt) return false;
			gl_opttag += '	색상 : '+opt+'<input type="hidden" name="option[0][]" value="'+opt+'" />';
			gl_opttag += '<input type="hidden" name="optionTitle[0][]" value="색상" />';
		});

		// 관련상품 옵션/수량변경 클릭시
		$("button.btn_option_modify").bind("click",function() {
			var id	= $(this).attr("id");
			option_open(id);
		});

		// 관련상품 장바구니 클릭시
		$("button.goodscart").bind("click",function() {
			var id	= $(this).attr("id");
			id = id.replace("goodscart_","");

			if($("div#optional_changes_area_"+id).html() == ""){
				option_open(id);
			}else{
				if(check_option(this)){
					$("#optional_changes_form_"+id).submit();
				}
			}
		});


		// 상품이미지 페이징
		if($("#goods_thumbs_paging").length){
			var thumbs_max_page = parseInt('2');
			$("#goods_thumbs_paging").customMobilePagination({
				'style' : 'paging_style_5',
				'now_page' : 1,
				'max_page' : thumbs_max_page,
				'btn_auto_hide' : false,
				'on_prev' : function(){
					var idx = parseInt($("#goods_thumbs_paging").attr('idx'));
					var newidx = idx==0?thumbs_max_page-1:idx-1;
					resimg_num(newidx);
				},
				'on_next' : function(){
					var idx = parseInt($("#goods_thumbs_paging").attr('idx'));
					var newidx = idx==thumbs_max_page-1?0:idx+1;
					resimg_num(newidx);
				},
			});
		}


		$("img[data-original]").lazyload();

		/* 상품상세 - 상품설명 탭(대쉬보드) */
		/*
		  $(document).on('on',PlusMobileTaps.scrollTabsFunc);
		  $(document).on('scroll',PlusMobileTaps.scrollTabsFunc);
		  $(document).on('touchmove',PlusMobileTaps.scrollTabsFunc);
		*/

			$(".set_preload").one('inview',get_preload_func);

			$(".set_preload").one('inview',get_commonpreload_func);

		/* #20936 2018-09-27 ycg 네이버페이 배송옵션 변경 이벤트 수정 - 시작 */
		/* #20936 2018-09-27 ycg 네이버페이 배송옵션 변경 이벤트 수정 - 종료 */
	});

	// 티켓상품 지도변경 버튼 :: 2014-04-02 lwh
	function setMapajax(){
		var option_seq	= $("#option_location option:selected").val();
		var goods_seq	= $("#option_location option:selected").attr('goods_seq');

		$.ajax({
				type: "post",
				url: "../goods/coupon_location_ajax",
				data: {'option_seq':option_seq, 'goods_seq':goods_seq, 'width':'300'},
				success: function(result){
					$("#NaverMap").html('');
					$("#map_area").html(result);
				}
			});
	}

	function detail_contents_toggle(btn,contents){
		if($("#"+contents).is(":hidden")){
			$("#"+contents).show();
			if($(btn).is('.btn_open_small')) $(btn).addClass('btn_close_small');
		}else{
			$("#"+contents).hide();
			if($(btn).is('.btn_close_small')) $(btn).removeClass('btn_close_small');
		}
	}

	// 배송정보 변경 :: 2016-07-15 lwh
	function view_delivery_cost(){
		// 희망배송일 레이어 닫기 및 초기화
		$(".hopCalendarLayer").hide();
		$("#hop_select_date").val('');

		var set_seq = $("select[name='shipping_method']").val();
		var prepay_info = $("select[name='shipping_method'] option:selected").attr('prepay_info');
		var hop_date = $("select[name='shipping_method'] option:selected").attr('hop_date');

		// 배송비 결제 정보
		if(prepay_info == 'delivery' || prepay_info == 'all'){
			$("#shipping_prepay_info").val('delivery');
		}else{
			$("#shipping_prepay_info").val('postpaid');
		}
		if	(prepay_info)	chg_prepayinfo(prepay_info);			// 선착불 변경
		if	(hop_date)		$("#hop_select_date").val(hop_date);	// 희망배송일 자동지정

		$(".set_lay").hide();
		$(".shipping_set_area").find(".set_"+set_seq).show();

		/* #20936 2018-09-27 ycg 네이버페이 배송옵션 변경 이벤트 수정 - 시작 */
		/* #20936 2018-09-27 ycg 네이버페이 배송옵션 변경 이벤트 수정 - 종료 */
	}

	// 자세히보기 배송비 안내에서 배송정보 변경 :: 2016-08-10 lwh
	function chg_delivery_info(ship_set_seq,store_seq,prepay_info){
		$("select[name='shipping_method']").val(ship_set_seq).trigger('change');
		if (prepay_info){
			$("#shipping_prepay_info").val(prepay_info);
			chg_prepayinfo(prepay_info);
		}
		if(store_seq)		$("#shipping_store_seq").val(store_seq);
		closeDialog('shipping_detail_lay');
	}

	// 선착불 여부 변경
	function chg_prepayinfo(prepay_info){
		// 배송비 결제 정보
		var res_msg	= '';
		var msg		= getAlert('sy004') == undefined ? '선불' : getAlert('sy004');
		var msg2	= getAlert('sy003') == undefined ? '착불' : getAlert('sy003');

		if			(prepay_info == 'all'){
			$("#shipping_prepay_info").val('delivery'); // 선불
			res_msg = msg;
		}else if	(prepay_info == 'delivery'){
			$("#shipping_prepay_info").val('delivery'); // 선불
			res_msg = msg;
		}else if	(prepay_info == 'postpaid'){
			$("#shipping_prepay_info").val('postpaid'); // 착불
			res_msg = msg2;
		}

		var selected_method = $("select[name='shipping_method'] option:selected").attr('prepay_info');
		if(selected_method == 'all'){
			// 선택 배송 결제 방법 색상 처리 :: 2019-01-30 lwh
			var sel_prepay_info = $("#shipping_prepay_info").val();
			$('.prepay_info_area').removeClass('on');
			$('.prepay_info_'+sel_prepay_info).addClass('on');
			$("#shipping_prepay_txt").html('('+res_msg+')');
		}else{
			$("#shipping_prepay_txt").html('');
		}

		var shipping_set_code = $("select[name='shipping_method'] option:selected").attr('shipping_set_code');
		if(shipping_set_code == 'direct_store'){
			$("#shipping_prepay_txt").html('');
		}
	}

	// 컬러 옵션 클릭시 상품상세컷 연결 leewh
	function clickSelectColor(color) {
		$("img[id^=dot_]").each(function(){
			if ($(this).attr('color')==color) {
					$(this).trigger("click");
					return false;
			}
		});
	}

	function resimg_num(i){
		var slide_current = $(".slides_wrap").data('slide_current');
		$('.main_tabs_contents').eq(slide_current).removeClass('active');
		$('.main_tabs_contents').eq(i).addClass('active').show();
		var k=0;
		$('.main_tabs_contents').each(function(){
			if(i == k) $(this).show();
			else $(this).hide();
			k = k + 1;
		});
		$(".slides_wrap").data('slide_current',i);

		$("#goods_thumbs_paging").attr('idx',i);
		$("#goods_thumbs_paging .paging_btn_num_now").html(parseInt(i)+1);
	}

	var old_id = "";
	function option_open(id){
		var url = "recently_option?no="+id;
		var area_obj = $("div#optional_changes_area_"+id);

		// 닫기 옵션
		if(old_id == id){ $(".optional_area").slideUp(500); old_id = ""; $(".optional_area").html(""); return; }
		else			{ $(".optional_area").slideUp(500); $(".optional_area").html(""); }

		$.get(url, function(data) {
			area_obj.html(data);
			area_obj.slideDown(500);
			old_id = id;
		});
	}

	var alert_timer = null;
	function wish_chg(){
		if(!gl_member_seq){
			//회원만 사용가능합니다.\n로그인하시겠습니까?
			if(confirm(getAlert('gv009'))){
				var url = "/member/login?return_url=/goods/view?no=49";
				top.document.location.href = url;
				return;
			}else{
				return;
			}
		}
		$.ajax({
			'url' : $('#wishimg').attr('usewish') == 'n' ? '/mypage/wish_add?seqs[]=49' : '/mypage/wish_del?seqs=49',
			'type' : 'get',
			'success' : function(res){
				if($('#wishimg').attr('usewish') == 'n'){
					//$('#wishimg').attr('src','/data/skin/responsive_camping_healing_gl/images/design/ico_wish_on.png');
					$('#wishimg').css('background-image','url(/data/skin/responsive_camping_healing_gl/images/design/ico_wish_on.png)');
					$('#wishimg').attr('usewish','y');
					$("#wish_alert .wa_on").show();
					$("#wish_alert .wa_off").hide();
					//위시리스트에<br />저장되었습니다.
					$("#wish_alert .wa_msg").html(getAlert('gv056'));

				}else{
					//$('#wishimg').attr('src','/data/skin/responsive_camping_healing_gl/images/design/ico_wish_off.png');
					$('#wishimg').css('background-image','url(/data/skin/responsive_camping_healing_gl/images/design/ico_wish_off.png)');
					$('#wishimg').attr('usewish','n');
					$("#wish_alert .wa_on").hide();
					$("#wish_alert .wa_off").show();
					//위시리스트에서<br />삭제되었습니다.
					$("#wish_alert .wa_msg").html(getAlert('gv057'));
				}
				$("#wish_alert").stop(true,true).show();

				clearInterval(alert_timer);
				alert_timer = setInterval(function(){
					clearInterval(alert_timer);
					$("#wish_alert").stop(true,true).show().fadeOut('slow');
				},1000);
			}
		});
	}
</script>
<script type="text/javascript" src='http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/common/minishop.js'></script>
<script type="text/javascript" src="http://responsive-sample30.firstmall.kr/app/javascript/js/goods-view.js?dummy=20210216010216"></script>
<script type="text/javascript" src="http://responsive-sample30.firstmall.kr/app/javascript/plugin/lazy/jquery.lazyload.min.js"></script>
<script type="text/javascript" src="http://responsive-sample30.firstmall.kr/app/javascript/plugin/jquery.inview.js"></script>

<style type="text/css">
@media only screen and (max-width:767px) {
	/* 플로팅 - BACK/TOP(대쉬보드) */
	#floating_over .ico_floating_back {bottom:73px !important;}
	#floating_over .ico_floating_top {bottom:73px !important;}
	#floating_over .ico_floating_foward {bottom:73px !important;}
	#floating_over .ico_floating_zoom {bottom:115px !important;}
}
</style>


<!-- 현재 상품의 카테고리 라인맵( 스킨단에서 html 수정 불가. CSS로만 수정하세요. ) -->
	<div class="ajaxLineMap search_nav">
		<a class="home" href="http://responsive-sample30.firstmall.kr/main">홈</a>
			</div>
	<script type="text/javascript">
	$(function() {
		$('.ajaxLineMap .navi_linemap2').on('click', function() {
			var catecode = $(this).attr('catecode');
			var that = $(this).find('.navi_linemap_sub');

			if ( $(that).is(':hidden') ) {
				if($(that).html()){
					$('.ajaxLineMap .navi_linemap_sub').hide();
					$(that).show();
				}else{
					$(that).empty();
					// 데이터 동적 호출
					$.getJSON('category_depth?code='+catecode, function(data) {
						$(data).each(function(idx, val){
							if(val.category_code == catecode){
								$(that).append('<li class="on"><a href="/goods/catalog?code=' + val.category_code + '">' + val.title + '</a></li>');
							}else{
								$(that).append('<li><a href="/goods/catalog?code=' + val.category_code + '">' + val.title + '</a></li>');
							}
						});
						$('.ajaxLineMap .navi_linemap_sub').hide();
						$(that).show();
					});
				}
			} else {
				$(that).hide();
			}
		});
	});
	</script>


<!-- 타이틀 -->
<div class="detail_title_area">
	<h3 class="name">세련된 혼합형 배너 제공</h3>
	<p class="summary">
		퍼스트몰 반응형 스킨은 세련된 이미지형, 텍스트형, 슬라이드배너형 팝업을 제공합니다.
		<span class="detail_icons">
			<img src="http://responsive-sample30.firstmall.kr/data/icon/goods/16.gif" alt="">
			<img src="http://responsive-sample30.firstmall.kr/data/icon/goods/17.gif" alt="">
		</span>
	</p>
	<p class="seq_num Hide">상품번호 : 49</p>
</div>

<div id="goods_view">
	<div class="goods_thumbs_spec">
		<!-- ++++++++++++++++++++++++ 상품 이미지 ++++++++++++++++++++++++ -->
		<style>
			#goods_thumbs { width:600px; }
		</style>
		<div id="goods_thumbs">
			<div class="slides_container hide" style="position:relative;">
					<div class="viewImgWrap">
							<img src="<%=request.getContextPath()%>/images/goods/goods<%=itemno %>.png" onerror="this.src='http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/noimage_wide.gif'" title="" />
					</div>
					<div class="viewImgWrap">
							<img src="http://responsive-sample30.firstmall.kr/data/goods/1/2020/04/49_tmp_5326d70bd1d52cff0984a03a97628e295522view.jpg" onerror="this.src='http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/noimage_wide.gif'" title="" />
					</div>
				<a id="btn_zoom_view" href="javascript:popup('zoom?no=49&popup=1',817, document.body.clientHeight,'yes')">확대 보기</a>
			</div>

			<div class="pagination_wrap">
				<div class="count">
					<a href="javascript:void(0)" class="prev" title="이전"></a>
					<div class="pagination_area">
						<ul class="pagination">
							<li><a href="javascript:void(0)"><img src="http://responsive-sample30.firstmall.kr/data/goods/1/2020/04/49_tmp_55e62897f887773479085ca9d3bc69450954thumbView.png" width="100" onerror="this.src='http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/noimage_list.gif'"  /></a></li>
							<li><a href="javascript:void(0)"><img src="http://responsive-sample30.firstmall.kr/data/goods/1/2020/04/49_tmp_5326d70bd1d52cff0984a03a97628e295522thumbView.jpg" width="100" onerror="this.src='http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/noimage_list.gif'"  /></a></li>
						</ul>
					</div>
					<a href="javascript:void(0)" class="next" title="다음"></a>
				</div>
			</div>
			<script type="text/javascript">
				//$("#goods_thumbs .pagination").hide().width('540').show();
				var setGoodsThumbsPaginationScroll = function(){
					var paginationWidth = $("#goods_thumbs .pagination").width();
					var currentWidth = $("#goods_thumbs .pagination>li.current").outerWidth();
					var currentLeft = $("#goods_thumbs .pagination>li.current").position().left;

					var gap = ($("#goods_thumbs .pagination").scrollLeft()+currentLeft+(currentWidth/2))-(paginationWidth/2);

					$("#goods_thumbs .pagination").stop(true,true).animate({'scrollLeft':gap});
				};
				$("#goods_thumbs .slides_container>.viewImgWrap:gt(0)").hide();
				$("#goods_thumbs .pagination>li:eq(0)").addClass('current');
				$("#goods_thumbs .slides_container").show();
				$("#goods_thumbs .pagination>li").bind('click',function(){
					var i = $("#goods_thumbs .pagination>li").index(this);
					$("#goods_thumbs .slides_container>.viewImgWrap").hide().eq(i).show();
					$("#goods_thumbs .pagination>li").removeClass('current').eq(i).addClass('current');
					setGoodsThumbsPaginationScroll();
					return false;
				});
				$("#goods_thumbs .prev").bind('click',function(){
					var i = $("#goods_thumbs .slides_container>.viewImgWrap").index($("#goods_thumbs .slides_container>.viewImgWrap:visible"));
					if(i<=0) i = $("#goods_thumbs .slides_container>.viewImgWrap").length-1;
					else i--;
					$("#goods_thumbs .slides_container>.viewImgWrap").hide().eq(i).show();
					$("#goods_thumbs .pagination>li").removeClass('current').eq(i).addClass('current');
					setGoodsThumbsPaginationScroll();
					return false;
				});
				$("#goods_thumbs .next").bind('click',function(){
					var i = $("#goods_thumbs .slides_container>.viewImgWrap").index($("#goods_thumbs .slides_container>.viewImgWrap:visible"));
					if(i>=$("#goods_thumbs .slides_container>.viewImgWrap").length-1) i = 0;
					else i++;
					$("#goods_thumbs .slides_container>.viewImgWrap").hide().eq(i).show();
					$("#goods_thumbs .pagination>li").removeClass('current').eq(i).addClass('current');
					setGoodsThumbsPaginationScroll();
					return false;
				});
			</script>
		</div>
		<!-- ++++++++++++++++++++++++ //상품 이미지 ++++++++++++++++++++++++ -->


		<!-- ++++++++++++++++++++++++ 상품 스펙 ++++++++++++++++++++++++ -->
		<div id="goods_spec">
		<form name="goodsForm" method="post" enctype="multipart/form-data" action="http://responsive-sample30.firstmall.kr/order/add" target="actionFrame">
		<input type="hidden" name="goodsSeq" value="49" />

			<div class="sns_wish">
				<!-- SNS 공유 -->
				<a href="javascript:void(0)" id="btnSnsShare" class="btn_sns_share" title="SNS 공유"><span designElement="text" textIndex="1"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >공유</span></a>
				<div id="snsListDetail" class="snsbox_area" style="display:none;">
					<ul class="snsbox clearbox"><li><img src="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/board/icon/sns_f0.gif" alt="페이스북"  title="페이스북"  width="33" height="33"  valign="middle" onclick="snsWin('fa','', '%EC%84%B8%EB%A0%A8%EB%90%9C+%ED%98%BC%ED%95%A9%ED%98%95+%EB%B0%B0%EB%84%88+%EC%A0%9C%EA%B3%B5', '', 'http%3A%2F%2Fedge_sample.firstmall.kr%2Fgoods%2Fview%3F%26no%3D49','','','','');" /><br />페이스북</li><li><img src="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/board/icon/sns_t0.gif" alt="트위터"  title="트위터"  width="33" height="33"  valign="middle" onclick="snsWin('tw','', '%EC%84%B8%EB%A0%A8%EB%90%9C+%ED%98%BC%ED%95%A9%ED%98%95+%EB%B0%B0%EB%84%88+%EC%A0%9C%EA%B3%B5', '', 'http%3A%2F%2Fedge_sample.firstmall.kr%2Fgoods%2Fview%3Fno%3D49','','http://responsive-sample30.firstmall.kr/data/goods/1/2020/04/49_tmp_55e62897f887773479085ca9d3bc69450954list1.png','300','300');" /><br />트위터</li><script type='text/javascript'src='http://responsive-sample30.firstmall.kr/app/javascript/js/kakao.link.js'></script><li class="kakao-link-btn"><img src="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/board/icon/sns_k0.gif" alt="카카오톡"  title="카카오톡"  width="33" height="33"  valign="middle" onclick="kakaotalk_link();" oncli="snsWin('ka','', '세련된 혼합형 배너 제공', '', 'http://edge_sample.firstmall.kr/goods/view?no=49','','http://responsive-sample30.firstmall.kr/data/goods/1/2020/04/49_tmp_55e62897f887773479085ca9d3bc69450954list1.png','300','300');" /><br />카카오톡</li></ul>
				</div>
				<!-- 찜 -->
				<a href="javascript:void(0)" id="wishimg" class="ico_wish" usewish="n" onclick="wish_chg();" title="찜하기(위시리스트에 추가)"><span designElement="text" textIndex="2"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >찜</span></a>
			</div>

			<ul class="goods_spec_sections">
				<!-- ~~~~~ 단독 이벤트 ~~~~~ -->
				<!-- ~~~~~ //단독 이벤트 ~~~~~ -->

				<!-- ~~~~~ 퍼스트몰 라이브 알림 ~~~~~ -->
				<!-- ~~~~~ 퍼스트몰 라이브 알림 ~~~~~ -->

				<!-- ~~~~~ 가격, 할인율, 할인내역 ~~~~~ -->
				<li class="deatil_price_area">
						<div class="deatil_sale_rate">
							<p class="inner">
								<span class="num">29</span>%
							</p>
						</div>
						<p class="org_price">
							<span class="dst_th_size"><s><span class="num">90,000</span></s>&#x20a9;</span>
						</p>
						<p class="sale_price">
								<span class="num">64,000</span><span class='price_won'>&#x20a9;</span>
						</p>

				</li>
				<!-- ~~~~~ //가격, 할인율, 할인내역 ~~~~~ -->

				<!-- ~~~~~ 상품번호 ~~~~~ -->
				<li class="goods_spec_number hide">
					<ul class="detail_spec_table">
						<li class="th"><span designElement="text" textIndex="6"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >상품번호</span></li>
						<li class="td">49</li>
					</ul>
				</li>
				<!-- ~~~~~ //상품번호 ~~~~~ -->

				<!-- ~~~~~ 판매중지 ~~~~~ -->
				<!-- ~~~~~ //판매중지 ~~~~~ -->

				<!-- ~~~~~ 대량구매 ~~~~~ -->
				<!-- ~~~~~ //대량구매 ~~~~~ -->

				<!-- ~~~~~ 회원등급 ~~~~~ -->
				<!-- ~~~~~ //회원등급 ~~~~~ -->

				<!-- ~~~~~ 쿠폰 ~~~~~ -->
				<!-- ~~~~~ //쿠폰 ~~~~~ -->

				<!-- ~~~~~ 할인코드 ~~~~~ -->
				<!-- ~~~~~ //할인코드 ~~~~~ -->

				<!-- ~~~~~ 좋아요 ~~~~~ -->
				<!-- ~~~~~ //좋아요 ~~~~~ -->

				<!-- ~~~~~ 모바일 ~~~~~ -->
				<!-- ~~~~~ //모바일 ~~~~~ -->

				<!-- ~~~~~ 무이자할부( common.css에서 display:none 처리 - 190320 sjg ) ~~~~~ -->
				<li class="goods_spec_halbu">
					<ul class="detail_spec_table">
						<li class="th"><span designElement="text" textIndex="24"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >무이자할부</span></li>
						<li><span class="gray_06" designElement="text" textIndex="25"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >우측 '자세히' 참조</span></li>
						<li class="btn_area1">
							<button type="button" class="btn_resp no_border" onclick="detail_contents_toggle(this,'goodsInterest')"><span designElement="text" textIndex="26"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >자세히</span></button>
						</li>
					</ul>
					<div id="goodsInterest" class="Relative hide">
						<div class="layer_simple_basic px p_right">
							<table class="detail_option_table card" cellpadding="0" cellspacing="0">
								<tbody>
								<tr>
									<th><img src="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/interest/Interest_img_bc.gif"></th>
									<td><span designElement="text" textIndex="27"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >3~12개월</span></td>
									<td><span designElement="text" textIndex="28"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >5만원이상</span></td>
								</tr>
								<tr>
									<th><img src="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/interest/Interest_img_ct.gif"></th>
									<td><span designElement="text" textIndex="29"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >3~12개월</span></td>
									<td><span designElement="text" textIndex="30"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >5만원이상</span></td>
								</tr>
								<tr>
									<th><img src="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/interest/Interest_img_hd.gif"></th>
									<td><span designElement="text" textIndex="31"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >3~12개월</span></td>
									<td><span designElement="text" textIndex="32"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >5만원이상</span></td>
								</tr>
								<tr>
									<th><img src="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/interest/Interest_img_hn.gif"></th>
									<td><span designElement="text" textIndex="33"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >3~12개월</span></td>
									<td><span designElement="text" textIndex="34"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >5만원이상</span></td>
								</tr>
								<tr>
									<th><img src="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/interest/Interest_img_kb.gif"></th>
									<td><span designElement="text" textIndex="35"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >3~12개월</span></td>
									<td><span designElement="text" textIndex="36"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >5만원이상</span></td>
								</tr>
								<tr>
									<th><img src="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/interest/Interest_img_lt.gif"></th>
									<td><span designElement="text" textIndex="37"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >3~12개월</span></td>
									<td><span designElement="text" textIndex="38"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >5만원이상</span></td>
								</tr>
								<tr>
									<th><img src="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/interest/Interest_img_sh.gif"></th>
									<td><span designElement="text" textIndex="39"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >3~12개월</span></td>
									<td><span designElement="text" textIndex="40"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >5만원이상</span></td>
								</tr>
								<tr>
									<th><img src="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/interest/Interest_img_ss.gif"></th>
									<td><span designElement="text" textIndex="41"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >3~12개월</span></td>
									<td><span designElement="text" textIndex="42"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >5만원이상</span></td>
								</tr>
								</tbody>
							</table>
						</div>
					</div>
				</li>
				<!-- ~~~~~ //무이자할부 ~~~~~ -->

				<!-- ~~~~~ 유입경로 ~~~~~ -->
				<!-- ~~~~~ //유입경로 ~~~~~ -->

				<!-- ~~~~~ 적립혜택 ~~~~~ -->
				<li class="goods_spec_saving_benefit">
					<ul class="detail_spec_table">
						<li class="th"><span designElement="text" textIndex="44"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >적립혜택</span></li>
						<li>
							<span designElement="text" textIndex="45"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >구매</span>
							320&#x20a9;

						</li>
					</ul>
					<div id="reviewDetail" class="detail_option_list hide">
						<ul>
						</ul>
					</div>
				</li>
				<!-- ~~~~~ //적립혜택 ~~~~~ -->

				<!-- ~~~~~ 네이버 마일리지 ~~~~~ -->
				<!-- ~~~~~ //네이버 마일리지 ~~~~~ -->

				<!-- ~~~~~ 배송 ~~~~~ -->
				<li class="goods_spec_shipping">
					<ul class="detail_spec_table">
						<li class="th">
							<span designElement="text" textIndex="54"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >배송</span>
						</li>
						<li>

							<ul class="detail_spec_table sub">
								<li>
									<select class="M" name="shipping_method" onchange="view_delivery_cost();" style="display:none">
										<option value='1' selected grp_seq="1" nation="korea" prepay_info="all" shipping_set_code="delivery"  npay="N">택배(<span class="prepay_info_area prepay_info_delivery">주문 시 결제</span>/<span class="prepay_info_area prepay_info_postpaid">착불</span>)</option>
									</select>
									<script>$(function(){view_delivery_cost()});</script>
									<span>택배(<span class="gray_06"><span class="prepay_info_area prepay_info_delivery">주문 시 결제</span>/<span class="prepay_info_area prepay_info_postpaid">착불</span></span>)</span>
									<input type="hidden" name="shipping_prepay_info" id="shipping_prepay_info" value="" alt="선/착불정보" />
									<input type="hidden" name="shipping_store_seq" id="shipping_store_seq" value="" alt="수령매장정보" />
									<!--div id="shipping_detail_lay" class="resp_layer_pop hide"></div-->
									<div id="shipping_detail_lay" class="resp_layer_pop hide">
										<h4 class="title"><span designElement="text" textIndex="57"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >배송비 안내</span></h4>
										<div class="y_scroll_auto2">
											<div class="layer_pop_contents v5"></div>
										</div>
										<a href="javascript:void(0)" class="btn_pop_close" onclick="hideCenterLayer()"></a>
									</div>
								</li>
								<li class="btn_area1">
									<button type="button" class="btn_resp no_border" id="shipping_detail_info_resp"><span designElement="text" textIndex="58"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >자세히</span></button>
								</li>
							</ul>

							<ul class="detail_spec_table sub shipping_set_area">
								<li>
									<div class="set_lay set_1 hide">
										<div class="std">
											무료
										</div>
									</div>
									<input type="hidden" name="hop_select_date" id="hop_select_date" value="" />
									<script>view_delivery_cost();</script>
								</li>
							</ul>

						</li>
					</ul>

					<div id="deliverydateDetail" class="Relative hide">
						<div class="hopCalendarLayer layer_simple_basic"><span designElement="text" textIndex="63"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >달력</span></div>
					</div>

					<div id="customsDetail" class="detail_option_list hide">
						<ul>
							<li>
								<p class="e_title" designElement="text" textIndex="64"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >해외구매대행 상품이란?</p>
								<p class="e_content" designElement="text" textIndex="65"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >
									해외에서 수입하여 판매하는 상품으로 배송, 반품, 교환이 일반상품과 다를 수 있습니다. 또한 관세청 수입통관 신고 시 구매자의 개인통관고유부호가 필요하기 때문에 주문 시 구매자로부터 개인통관고유부호를 수집하게 됩니다.
								</p>
							</li>
							<li>
								<p class="e_title" designElement="text" textIndex="66"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >개인통관고유부호란?</p>
								<p class="e_content" designElement="text" textIndex="67"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >
									관세청에서는 개인정보 유출을 방지하기 위하여 개인물품 수입신고 시 주민등록번호를 대신 활용할 수 있는 개인통관고유부호 제도를 운영합니다. 개인통관고유부호는 <a href="https://p.customs.go.kr/" class="Und" target="_blank" title="새창" designElement="text" textIndex="68"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >관세청 사이트</a>에서 신청 즉시 부여되며, 계속 같은 번호로 사용이 가능합니다. 분실하면 관세청 사이트에서 조회 가능합니다. 부호 체계는 P로 시작하고 13자리입니다.
								</p>
							</li>
						</ul>
					</div>

					<div id="eachDeliveryDetail" class="detail_option_list hide">
						<ul>
							<li>
								<p class="e_title" designElement="text" textIndex="69"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >포장최대단위</p>
								<div class="e_content">
									상품 0개
								</div>
							</li>
							<li>
								<p class="e_title" designElement="text" textIndex="70"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >포장단위별 배송비</p>
								<div class="e_content">
									0&#x20a9;
								</div>
							</li>
							<li>
								<p class="e_title" designElement="text" textIndex="71"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >포장단위별 추가배송비</p>
								<div class="e_content">
									0&#x20a9;
								</div>
							</li>
						</ul>
					</div>
				</li>
				<!-- ~~~~~ //배송 ~~~~~ -->

				<!-- ~~~~~ 해외배송 ~~~~~ -->
				<!-- ~~~~~ //해외배송 ~~~~~ -->

				<!-- ~~~~~ 상품정보 ~~~~~ -->
				<li class="goods_spec_sub_info">
					<ul class="detail_spec_table">
						<li class="th"><span designElement="text" textIndex="75"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >상품정보</span></li>
						<li><span class="gray_06" designElement="text" textIndex="76"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >우측 '자세히' 참조</span></li>
						<li class="btn_area1">
							<button type="button" class="btn_resp no_border" onclick="showCenterLayer('#infoDetail')"><span designElement="text" textIndex="77"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >자세히</span></button>
						</li>
					</ul>
					<div id="infoDetail" class="resp_layer_pop hide">
						<h4 class="title"><span designElement="text" textIndex="78"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >상품 정보 제공 고시</span></h4>
						<div class="y_scroll_auto2">
							<div class="layer_pop_contents v5">
								<div class="resp_1line_table">
									<!--  -->
									<ul>
										<li class="th size1"><p>제품소재</p></li>
										<li class="td">제품소재</li>
									</ul>
									<!--  -->
									<ul>
										<li class="th size1"><p>색상</p></li>
										<li class="td">색상</li>
									</ul>
									<!--  -->
									<ul>
										<li class="th size1"><p>치수</p></li>
										<li class="td">치수</li>
									</ul>
									<!--  -->
									<ul>
										<li class="th size1"><p>제조자,수입품의 경우 수입자를 함께 표기</p></li>
										<li class="td">제조자,수입품의 경우 수입자를 함께 표기</li>
									</ul>
									<!--  -->
									<ul>
										<li class="th size1"><p>제조국</p></li>
										<li class="td">제조국</li>
									</ul>
									<!--  -->
									<ul>
										<li class="th size1"><p>세탁방법 및 취급시 주의사항</p></li>
										<li class="td">세탁방법 및 취급시 주의사항</li>
									</ul>
									<!--  -->
									<ul>
										<li class="th size1"><p>제조년월</p></li>
										<li class="td">제조년월</li>
									</ul>
									<!--  -->
									<ul>
										<li class="th size1"><p>품질보증기준</p></li>
										<li class="td">품질보증기준</li>
									</ul>
									<!--  -->
									<ul>
										<li class="th size1"><p>AS책임자와 전화번호</p></li>
										<li class="td">AS책임자와 전화번호</li>
									</ul>
									<!--  -->
								</div>
							</div>
						</div>
						<div class="layer_bottom_btn_area2">
							<button type="button" class="btn_resp size_c color5 Wmax" onclick="hideCenterLayer()">확인</button>
						</div>
						<a href="javascript:void(0)" class="btn_pop_close" onclick="hideCenterLayer()"></a>
					</div>
				</li>
				<!-- ~~~~~ //상품정보 ~~~~~ -->

				<!-- ~~~~~ 상품후기 ~~~~~ -->
				<!-- ~~~~~ //상품후기 ~~~~~ -->

				<!-- ~~~~~ 브랜드 ~~~~~ -->
				<li class="goods_spec_brand">
					<ul class="detail_spec_table">
						<li class="th"><span designElement="text" textIndex="81"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >브랜드</span></li>
						<li>
							<a href="http://responsive-sample30.firstmall.kr/goods/brand?code=0006">LG</a>
						</li>
					</ul>
				</li>
				<!-- ~~~~~ //브랜드 ~~~~~ -->

				<!-- ~~~~~ 추가정보 ~~~~~ -->
				<!-- ~~~~~ //추가정보 ~~~~~ -->

				<!-- ~~~~~ 청약철회 ~~~~~ -->
				<!-- ~~~~~ //청약철회 ~~~~~ -->

				<!-- ~~~~~ 판매자 ~~~~~ -->
				<li class="goods_spec_provider">
					<ul class="detail_spec_table">
						<li class="th"><span designElement="text" textIndex="84"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >판매자</span></li>
						<li>
							<a href="http://responsive-sample30.firstmall.kr/mshop?m=1" target="_blank" title="새창">본사</a>
							<a href="javascript:void(0)" class="reg_minishop v2 " title="" data-shop='1' onclick="mshopadd(this, '');"></a>
						</li>
						<li class="btn_area1">
							<button type="button" class="btn_resp no_border" onclick="showCenterLayer('#sellerInfo')"><span designElement="text" textIndex="85"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >자세히</span></button>
						</li>
					</ul>
					<div id="sellerInfo" class="resp_layer_pop hide">
						<h4 class="title"><span designElement="text" textIndex="86"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >판매자 정보</span></h4>
						<div class="y_scroll_auto">
							<div class="layer_pop_contents">
								<div class="resp_1line_table">
										<ul>
											<li class="th size2"><p designElement="text" textIndex="87"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >상호명</p></li>
											<li class="td">(주) 귀사의 회사명</li>
										</ul>
										<ul>
											<li class="th size2"><p designElement="text" textIndex="88"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >대표자</p></li>
											<li class="td">김대표</li>
										</ul>
										<ul>
											<li class="th size2"><p designElement="text" textIndex="89"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >사업자등록번호</p></li>
											<li class="td">123-45-67890</li>
										</ul>
										<ul>
											<li class="th size2"><p designElement="text" textIndex="90"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >통신판매신고번호</p></li>
											<li class="td">제1234-서울강남56789호</li>
										</ul>
										<ul>
											<li class="th size2"><p designElement="text" textIndex="91"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >연락처</p></li>
											<li class="td">02-1234-5678</li>
										</ul>
										<ul>
											<li class="th size2"><p designElement="text" textIndex="92"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >사업장 소재지</p></li>
											<li class="td">경기도 성남시 분당구 삼평동 682 유스페이스2 </li>
										</ul>
								</div>
								<div class="layer_bottom_btn_area">
									<button type="button" class="btn_resp size_c color5 Wmax" onclick="hideCenterLayer()">확인</button>
								</div>
							</div>
						</div>
						<a href="javascript:void(0)" class="btn_pop_close" onclick="hideCenterLayer()"></a>
					</div>
				</li>
				<!-- ~~~~~ //판매자 ~~~~~ -->
			</ul>

			<!-- ~~~~~~~~~~~ 구매하기 열기 섹션( 모바일 전용 ) ~~~~~~~~~~~ -->
			<div id="goodsBuyOpenSection" class="goods_buy_open_sections">
				<a href="javascript:void(0);" id="btnSectionOpen" class="btn_section_open off">열기</a>
				<ul class="goods_buttons_section">
					<li>
						<ul class="basic_btn_area">
							<li><button type="button" id="buy_btn" class="btn_resp size_c color2"><span designElement="text" textIndex="99"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >구매하기</span></button></li>
						</ul>
					</li>

				</ul>
			</div>
			<!-- ~~~~~~~~~~~ 구매하기 열기 섹션( 모바일 전용 ) ~~~~~~~~~~~ -->

			<!-- ~~~~~~~~~~~ 구매하기 ~~~~~~~~~~~ -->
			<div id="goodsOptionBuySection" class="goods_buy_sections">
				<a href="javascript:void(0);" id="btnSectionClose" class="btn_section_close">닫기</a>

				<div class="goods_option_select_area">
				<!-- 상품 옵션 인클루드. 파일위치 : [스킨폴더]/goods/_select_options.html -->
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
@@ 상품 옵션 @@
- 파일위치 : [스킨폴더]/goods/_select_options.html
++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<script type="text/javascript" src="http://responsive-sample30.firstmall.kr/app/javascript/plugin/jquery_selectbox/js/jquery.selectbox-0.2.js"></script>
<script type="text/javascript" src="http://responsive-sample30.firstmall.kr/app/javascript/plugin/jquery.fmupload.js"></script>
<link rel="stylesheet" type="text/css" href="http://responsive-sample30.firstmall.kr/app/javascript/plugin/jquery_selectbox/css/jquery.selectbox.mobile.css" />
<link rel="stylesheet" type="text/css" href="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/css/buttons.css" />
<script type="text/javascript" src="http://responsive-sample30.firstmall.kr/app/javascript/js/goods.option.0.2.js"></script>
<script type="text/javascript">
// 기존 option size 저장
var old_height = $('.goods_option_select_area').height();
$(document).ready(function(){
	gl_option_select_ver	= $("input[name='gl_option_select_ver']").val();

	var optObj			= new jscls_option_select();
	optObj.set_init('1',
					'49',
					'64000',
					'',
					'responsive_camping_healing_gl',
					true,
					'1',
					'0',
					'',
					'',
					'divide',
					'',
					'',
					'',
					'',
					'KRW', 
					'&#x20a9;', 
					'after',
					'');



	policyList = new Array();


	optObj.set_cutting_sale_price('0.001', 'dscending');



	// callback 함수 셋팅 :: 2016-02-04 lwh
	optObj.set_selectbox_option('sbHolderOpen', 'sbHolderClose');

	optObj.set_bind_option();
	apply_input_style();
});

// 옵션 선택시 슬라이드 옵션창 재조정 :: 2019-02-07 lwh
function sbHolderOpen(inst){
	if ( window.innerWidth < 768 ) {
		if ( old_height == 0 ) {
			old_height = $('#select_option_lay .goods_option_area').height();
		}
		var opScrollHeight = $('#select_option_lay .goods_option_area').height();
		var selectOptionHeight = $('#select_option_lay').find('.sbOptions:visible').height();
		if ( selectOptionHeight > opScrollHeight - 77 ) {
			$('#select_option_lay .goods_option_area').css( 'min-height', opScrollHeight + selectOptionHeight + 22 + 'px' );
			$('#select_option_lay').find('.sbOptions').css( 'max-height', 'none' );
		}
	}
}
function sbHolderClose(inst){
	// 선택된 옵션이 있는지 체크
	if ( window.innerWidth < 768 ) {
		if($(".goods_quantity_table_container").css('display') != 'block'){
			$('#select_option_lay .goods_option_area').css( 'min-height', '0' );
		}
	}
}
</script>

<div id="select_option_lay">
	<input type="hidden" name="option_select_goods_seq" value="49" />
	<input type="hidden" name="option_select_provider_seq" value="1" />
	<input type="hidden" name="gl_option_select_ver" value="0.1" />
	<input type="hidden" name="use_add_action_button" value="n" />

	<div class="goods_option_area">
		<table class="goods_option_table" width="100%" cellpadding="0" cellspacing="0" border="0">
		<colgroup>
			<col />
			<col width="15" />
		</colgroup>

			<!-- 필수옵션 시작 -->
		<tr>
			<th colspan="2"><span designElement="text" textIndex="1"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvX3NlbGVjdF9vcHRpb25zLmh0bWw=" >상품옵션</span></th>
		</tr>
		<tr class="optionTr">
			<td colspan="2">
				<span class="optionTitle hide">색상</span>
				<select name="viewOptions[]" id="0" opttype="color">
					<option value="">- 색상 선택 -</option>
					<option value="브라운" price="64000.00" consumer_price="90000.00" opt1="브라운" opt2="" opt3="" opt4="" opt5="" infomation="" class="" seq="0">브라운</option>
					<option value="라이트브라운" price="64000.00" consumer_price="90000.00" opt1="라이트브라운" opt2="" opt3="" opt4="" opt5="" infomation="" class="" seq="1">라이트브라운</option>
					<option value="살구색" price="64000.00" consumer_price="90000.00" opt1="살구색" opt2="" opt3="" opt4="" opt5="" infomation="" class="" seq="2">살구색</option>
					<option value="화이트" price="64000.00" consumer_price="90000.00" opt1="화이트" opt2="" opt3="" opt4="" opt5="" infomation="" class="" seq="3">화이트</option>
				</select>
				<div class="viewOptionsspecialays color">
					<span class="#6b4d32"><span name="viewOptionsspecialbtn" class="viewOptionsspecialbtn hand bbs_btn #6b4d32"  style="color:#6b4d32;"  value="브라운"  optvalue="브라운" price="64000.00" opt1="브라운" opt2="" opt3="" opt4="" opt5="" infomation=""  eqindex='0'><font style="background-color:#6b4d32;">■</font></span></span>
					<span class="#b89f88"><span name="viewOptionsspecialbtn" class="viewOptionsspecialbtn hand bbs_btn #b89f88"  style="color:#b89f88;"  value="라이트브라운"  optvalue="라이트브라운" price="64000.00" opt1="라이트브라운" opt2="" opt3="" opt4="" opt5="" infomation=""  eqindex='0'><font style="background-color:#b89f88;">■</font></span></span>
					<span class="#ebd8c1"><span name="viewOptionsspecialbtn" class="viewOptionsspecialbtn hand bbs_btn #ebd8c1"  style="color:#ebd8c1;"  value="살구색"  optvalue="살구색" price="64000.00" opt1="살구색" opt2="" opt3="" opt4="" opt5="" infomation=""  eqindex='0'><font style="background-color:#ebd8c1;">■</font></span></span>
					<span class="#fff"><span name="viewOptionsspecialbtn" class="viewOptionsspecialbtn hand bbs_btn #fff"  style="color:#fff;"  value="화이트"  optvalue="화이트" price="64000.00" opt1="화이트" opt2="" opt3="" opt4="" opt5="" infomation=""  eqindex='0'><font style="background-color:#fff;">■</font></span></span>
				</div>
			</td>
		</tr>
		<tr id="viewoptionsInfoTr" class="hide">
			<td id="viewOptionsInfo" class="center" colspan="2"></td>
		</tr>
			<!-- 필수옵션 끝 -->

			<!-- 입력옵션 시작 -->
			<!-- 입력옵션 끝 -->


			<!-- 추가옵션 시작 -->
			<!-- 추가옵션 끝 -->


		</table>
		<!-- 옵션 선택 영역 끝 -->

		<!-- 추가옵션 시작 -->
		<!-- 추가옵션 끝 -->




		<!-- 선택된 옵션 노출 영역 시작( 장바구니에 해당 ) -->
		<div class="goods_quantity_table_container"  style="display:none">
			<table class="goods_quantity_table" cellpadding="0" cellspacing="0">
			</table>
		</div>
		<!-- 선택된 옵션 노출 영역 끝 -->
	</div>
</div>
				<!-- //상품 옵션 인클루드 -->
				</div>

				<!-- 총 상품 금액 표기 시작-->
				<div class="goods_price_area">
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<!-- 단일옵션일 경우 수량 -->
						<td class="total_goods_price">
							<span class="total_goods_tit" designElement="text" textIndex="106"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >총 상품금액</span>
							<span id="total_goods_price">64,000</span> &#x20a9;
						</td>
					</tr>
					</table>
				</div>
				<!-- 총 상품 금액 표기 끝-->

				<div class="goods_buttons_area">
					<ul class="goods_buttons_section">
						<li>
							<ul class="basic_btn_area">
								<li><button type="button" name="addCart" id="addCart" class="btn_resp size_extra2 NpayNo"><span designElement="text" textIndex="107"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >장바구니</span></button></li>
								<li><button type="button" id="buy" class="btn_resp size_extra2 color2 NpayNo"><span designElement="text" textIndex="109"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >구매하기</span></button></li>
							</ul>
						</li>
					</ul>


				</div>
			</div>
			<div class="goods_bg"></div>
			<!-- ~~~~~~~~~~~ //구매하기 ~~~~~~~~~~~ -->

			<ul class="goods_event_gift_area">
				<!-- ~~~~~ 이벤트 ~~~~~ -->
				<!-- ~~~~~ //이벤트 ~~~~~ -->

				<!-- ~~~~~ 사은품 ~~~~~ -->
				<!-- ~~~~~ //사은품 ~~~~~ -->
			</ul>

			<!-- 오프라인 쿠폰 -->
			<div class="coupon_area">
				<!-- 쿠폰 템플릿. 파일위치 : _modules/display/coupon_display_detail_light.html -->
				<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
@@ [반응형] 쿠폰 템플릿 @@
- 파일위치 : [스킨폴더]/_modules/display/coupon_display_detail_light.html
++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<div id="couponDownloadDialog" style="display:none"></div>

<script type="text/javascript">
$(document).ready(function(){
	
});
function getCouponDownlayerclose(){
	$('#couponDownloadDialog').dialog('close');
}
</script>
				<!-- //쿠폰 템플릿 -->
			</div>
			<!-- //오프라인 쿠폰 -->

		</form>
		</div>
		<!-- ++++++++++++++++++++++++ //상품 스펙 ++++++++++++++++++++++++ -->
	</div>

	<div id="goods_contents_quick" class="set_preload">

		<div id="goods_tabs" class="goods_tabs">
			<div class="resp_area">
				<div class="goods_information_tabs">
					<a href="#goods_contents_quick" class="current" onclick="open_information_tab(this,'goods_description');"><span designElement="text" textIndex="118"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >상세설명</span></a>
					<a href="#goods_contents_quick" id="goodsReviewLoad" onclick="open_information_tab(this,'goods_review');"><span><span designElement="text" textIndex="119"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >상품후기</span> </span></a>
					<a href="#goods_contents_quick" id="goodsQnaLoad" onclick="open_information_tab(this,'goods_qna');"><span><span designElement="text" textIndex="120"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >상품문의</span> </span></a>
					<a href="#goods_contents_quick" onclick="open_information_tab(this,'exchange_guide');"><span designElement="text" textIndex="121"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >교환/반품/<span class="Dib">배송</span></span></a>
				</div>
			</div>
		</div>
		<script>
		var goodsTabsTop = $('#goods_tabs').offset().top;
		//var goodsTabsMargin = 180;
		function open_information_tab(thisTab,type){
			$(".goods_information_tabs>a.current").removeClass('current');
			$(thisTab).addClass('current');

			$(".goods_information_contents").hide();
			$('.info_goods_add').hide();
			$('.info_goods_add_map').hide();
			$('.info_goods_add_bigdata').hide();
			$('.info_goods_add_relation').hide();
			$('.'+type).show();
			if( type == 'goods_description' || type == 'exchange_guide' ) {
				$('.info_goods_add').show();
				if( type == 'goods_description' ) {
					$('.info_goods_add_map').show();
					$('.info_goods_add_bigdata').show();
					$('.info_goods_add_relation').show();
				}
			}
			/*
			if ( $('#goods_tabs').hasClass('flyingMode') ) {
				if ( window.innerWidth > 1024 ) { // PC인 경우 모션 실행
					$('html, body').animate({ scrollTop : (goodsTabsTop - goodsTabsMargin) }, 300);
					return false;
				}
			}
			*/
		}
		$(function() {
			var scrollPosition, tabHeight, goodsTabsTop2;
			tabHeight = $('#goods_tabs').outerHeight();
			goodsTabsTop2 = $('#goods_tabs').offset().top;
			$(window).scroll(function() {
				scrollPosition = $(window).scrollTop();
				if ( scrollPosition > goodsTabsTop2 ) {
					$('#goods_tabs').addClass('flyingMode');
					if ( $('#gon').length < 1 ) {
						$('#goods_tabs').after('<div id="gon" style="height:' + tabHeight + 'px"></div>');
					}
				} else {
					if ( $('#goods_tabs').hasClass('flyingMode') ) {
						$('#goods_tabs').removeClass('flyingMode');
					}
					$('#gon').remove();
				}
			});
			$( window ).resize(function() {
				if ( window.innerWidth != WINDOWWIDTH ) {
					tabHeight = $('#goods_tabs').outerHeight();
					goodsTabsTop2 = $('#goods_tabs').offset().top;
				}
			});
		});
		</script>

		<!-- 상품상세설명 -->
		<div class="goods_information_contents goods_description">
			<ul class="guide_origin_image">
				<li><p designElement="text" textIndex="122"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >상세설명 이미지를 자유롭게 확대/축소하시려면 <a href="http://responsive-sample30.firstmall.kr/goods/view_contents?no=49&amp;zoom=1">원본 보기</a>에서 가능합니다.</p></li>
				<li class="btn_area">
					<button type="button" class="btn_resp size_b" onclick="document.location.href='http://responsive-sample30.firstmall.kr/goods/view_contents?no=49&amp;zoom=1';"><span designElement="text" textIndex="123"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >원본 보기</span></button>
				</li>
			</ul>

			<div class="goods_description_images goods_view_contents">
			</div>
		</div>

		<!-- 상품후기 -->
		<div class="goods_information_contents goods_review hide" id="goods_review_frame_div"><!-- 상품후기 게시판 가져옴 --></div>

		<!-- 상품문의 -->
		<div class="goods_information_contents goods_qna hide" id="goods_qna_frame_div"><!-- 상품문의 게시판 가져옴 --></div>

		<!-- 교환/반품/배송 -->
		<div class="goods_information_contents exchange_guide hide">


			<div class="goods_description_images goods_common_contents">
			</div>

		</div>





		<h3 class="title_sub1"><span designElement="text" textIndex="127"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >관련상품</span></h3>
		<!-- EYE-Design 켜고 클릭해서 관련상품 디스플레이 수정 가능. ( 노출할 상품 설정은, 관리자 > 판매상품 > 상품상세 > 관련상품 ) -->
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
@@ [반응형] 디스플레이 템플릿 - 스와이프형 @@
- 파일위치 : [스킨폴더]/_modules/display/goods_display_sizeswipe.html
++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<style>
	.designDisplay_602a9b0838118 .goods_list ol.gli_contents { text-align:center;}
	.designDisplay_602a9b0838118 .swiper-slide>li.gl_item { width:300px;  }
</style>

<div id='designDisplay_602a9b0838118' class='designGoodsRelationDisplay display_relation' designElement='goodsRelationDisplay' templatePath='goods/view.html' displaySeq='3000' perpage='' category='' displayStyle='sizeswipe'>
          <div class="designDisplay_602a9b0838118 display_slide_class displaySwipeTabContentsContainer" tabIdx="0">
			  <div class="goods_display_slide_wrap">
				  <div class="swiper-wrapper">
					<!-- ------- 상품정보. 파일위치 : /data/design/ ------- -->
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
@@ goods_info_style_1 @@
- 파일 위치 : /data/design/goods_info_style_1.html
- CSS 경로 : /data/design/goods_info_style.css
- 상품정보 관련 CSS 수정 및 추가는 다음의 CSS파일에서 작업하시기 바랍니다.
/data/design/goods_info_user.css
※ /data 폴더는 /skin 폴더 상위 폴더입니다.
++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<ul class="goods_list swiper-slide">	<li class="gl_item">
	<div class="gl_inner_item_wrap">

		<!--상품이미지-->
		<div class="gli_image goodsDisplayImageWrap">
			<a href="javascript:void(0);" class="respItemImageArea" onclick="display_goods_view('49','',this,'goods_view')">
				<img src="http://responsive-sample30.firstmall.kr/data/goods/1/2020/04/49_tmp_55e62897f887773479085ca9d3bc69450954list1.png" data-src="/data/goods/1/2020/04/49_tmp_55e62897f887773479085ca9d3bc69450954list1.png" class="goodsDisplayImage lazyload" onerror="this.src='http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/noimage.gif'" alt="세련된 혼합형 배너 제공"/>
			</a>

			<!-- 반응형 icon new -->

			<!-- 반응형 zzim -->

			<!-- 미리보기/옵션보기/SNS보내기 -->

			<!-- 상품 상태 표시 -->
		</div>

		<div class="resp_display_goods_info infO_style_1">

			<!-- 상품명-->
			<div class="goodS_info displaY_goods_name">
				<span class="areA"><a href="http://responsive-sample30.firstmall.kr/goods/view?no=49">세련된 혼합형 배너 제공</a></span>
			</div>

			<div class="infO_group">
				<!-- 비회원 대체문구 -->
				<!-- (할인혜택)판매가 -->
				<div class="goodS_info displaY_sales_price">
					<span class="areA">
						<span class="nuM">64,000</span>&#x20a9;
					</span>
				</div>

				<!-- 정가 -->
				<div class="goodS_info displaY_consumer_price">
					<span class="areA">
						<span class="nuM">90,000</span>&#x20a9;
					</span>
				</div>

				<!-- 할인율 -->
				<div class="goodS_info displaY_sales_percent">
					<span class="areA"><span class="nuM">29</span>%</span>
				</div>
			</div>

			<div class="infO_group">
				<!-- 무료배송 -->
				<div class="goodS_info displaY_besong typE_a">
					<span class="areA">무료배송</span>
				</div>

				<!-- 해외배송 -->
			</div>

			
		</div>

	</div>
  </li>
</ul><ul class="goods_list swiper-slide">	<li class="gl_item">
	<div class="gl_inner_item_wrap">

		<!--상품이미지-->
		<div class="gli_image goodsDisplayImageWrap">
			<a href="javascript:void(0);" class="respItemImageArea" onclick="display_goods_view('48','',this,'goods_view')">
				<img src="http://responsive-sample30.firstmall.kr/data/goods/1/2020/04/48_tmp_28a538612e75d2c98952805cc294ac319152list1.jpg" data-src="/data/goods/1/2020/04/48_tmp_28a538612e75d2c98952805cc294ac319152list1.jpg" class="goodsDisplayImage lazyload" onerror="this.src='http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/noimage.gif'" alt="편리한 검색 모듈 제공"/>
			</a>

			<!-- 반응형 icon new -->

			<!-- 반응형 zzim -->

			<!-- 미리보기/옵션보기/SNS보내기 -->

			<!-- 상품 상태 표시 -->
		</div>

		<div class="resp_display_goods_info infO_style_1">

			<!-- 상품명-->
			<div class="goodS_info displaY_goods_name">
				<span class="areA"><a href="http://responsive-sample30.firstmall.kr/goods/view?no=48">편리한 검색 모듈 제공</a></span>
			</div>

			<div class="infO_group">
				<!-- 비회원 대체문구 -->
				<!-- (할인혜택)판매가 -->
				<div class="goodS_info displaY_sales_price">
					<span class="areA">
						<span class="nuM">28,000</span>&#x20a9;
					</span>
				</div>

				<!-- 정가 -->
				<div class="goodS_info displaY_consumer_price">
					<span class="areA">
						<span class="nuM">30,000</span>&#x20a9;
					</span>
				</div>

				<!-- 할인율 -->
				<div class="goodS_info displaY_sales_percent">
					<span class="areA"><span class="nuM">7</span>%</span>
				</div>
			</div>

			<div class="infO_group">
				<!-- 무료배송 -->
				<div class="goodS_info displaY_besong typE_a">
					<span class="areA">무료배송</span>
				</div>

				<!-- 해외배송 -->
			</div>

			
		</div>

	</div>
  </li>
</ul><ul class="goods_list swiper-slide">	<li class="gl_item">
	<div class="gl_inner_item_wrap">

		<!--상품이미지-->
		<div class="gli_image goodsDisplayImageWrap">
			<a href="javascript:void(0);" class="respItemImageArea" onclick="display_goods_view('47','',this,'goods_view')">
				<img src="http://responsive-sample30.firstmall.kr/data/goods/1/2020/04/47_tmp_620b794faf8fd67c972da7af119eb9a18886list1.png" data-src="/data/goods/1/2020/04/47_tmp_620b794faf8fd67c972da7af119eb9a18886list1.png" class="goodsDisplayImage lazyload" onerror="this.src='http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/noimage.gif'" alt="편리한 검색 모듈 제공"/>
			</a>

			<!-- 반응형 icon new -->

			<!-- 반응형 zzim -->

			<!-- 미리보기/옵션보기/SNS보내기 -->

			<!-- 상품 상태 표시 -->
		</div>

		<div class="resp_display_goods_info infO_style_1">

			<!-- 상품명-->
			<div class="goodS_info displaY_goods_name">
				<span class="areA"><a href="http://responsive-sample30.firstmall.kr/goods/view?no=47">편리한 검색 모듈 제공</a></span>
			</div>

			<div class="infO_group">
				<!-- 비회원 대체문구 -->
				<!-- (할인혜택)판매가 -->
				<div class="goodS_info displaY_sales_price">
					<span class="areA">
						<span class="nuM">28,000</span>&#x20a9;
					</span>
				</div>

				<!-- 정가 -->
				<div class="goodS_info displaY_consumer_price">
					<span class="areA">
						<span class="nuM">30,000</span>&#x20a9;
					</span>
				</div>

				<!-- 할인율 -->
				<div class="goodS_info displaY_sales_percent">
					<span class="areA"><span class="nuM">7</span>%</span>
				</div>
			</div>

			<div class="infO_group">
				<!-- 무료배송 -->
				<div class="goodS_info displaY_besong typE_a">
					<span class="areA">무료배송</span>
				</div>

				<!-- 해외배송 -->
			</div>

			
		</div>

	</div>
  </li>
</ul><ul class="goods_list swiper-slide">	<li class="gl_item">
	<div class="gl_inner_item_wrap">

		<!--상품이미지-->
		<div class="gli_image goodsDisplayImageWrap">
			<a href="javascript:void(0);" class="respItemImageArea" onclick="display_goods_view('46','',this,'goods_view')">
				<img src="http://responsive-sample30.firstmall.kr/data/goods/1/2020/04/46_tmp_157442a50ca69a70e47c77b6f988be6c8361list1.jpg" data-src="/data/goods/1/2020/04/46_tmp_157442a50ca69a70e47c77b6f988be6c8361list1.jpg" class="goodsDisplayImage lazyload" onerror="this.src='http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/noimage.gif'" alt="세련된 갤러리 게시판 제공"/>
			</a>

			<!-- 반응형 icon new -->

			<!-- 반응형 zzim -->

			<!-- 미리보기/옵션보기/SNS보내기 -->

			<!-- 상품 상태 표시 -->
		</div>

		<div class="resp_display_goods_info infO_style_1">

			<!-- 상품명-->
			<div class="goodS_info displaY_goods_name">
				<span class="areA"><a href="http://responsive-sample30.firstmall.kr/goods/view?no=46">세련된 갤러리 게시판 제공</a></span>
			</div>

			<div class="infO_group">
				<!-- 비회원 대체문구 -->
				<!-- (할인혜택)판매가 -->
				<div class="goodS_info displaY_sales_price">
					<span class="areA">
						<span class="nuM">19,000</span>&#x20a9;
					</span>
				</div>

				<!-- 정가 -->
				<div class="goodS_info displaY_consumer_price">
					<span class="areA">
						<span class="nuM">26,000</span>&#x20a9;
					</span>
				</div>

				<!-- 할인율 -->
				<div class="goodS_info displaY_sales_percent">
					<span class="areA"><span class="nuM">27</span>%</span>
				</div>
			</div>

			<div class="infO_group">
				<!-- 무료배송 -->
				<div class="goodS_info displaY_besong typE_a">
					<span class="areA">무료배송</span>
				</div>

				<!-- 해외배송 -->
			</div>

			
		</div>

	</div>
  </li>
</ul><ul class="goods_list swiper-slide">	<li class="gl_item">
	<div class="gl_inner_item_wrap">

		<!--상품이미지-->
		<div class="gli_image goodsDisplayImageWrap">
			<a href="javascript:void(0);" class="respItemImageArea" onclick="display_goods_view('45','',this,'goods_view')">
				<img src="http://responsive-sample30.firstmall.kr/data/goods/1/2020/04/45_tmp_968871bf62f92d23920852ce8973bad78503list1.jpg" data-src="/data/goods/1/2020/04/45_tmp_968871bf62f92d23920852ce8973bad78503list1.jpg" class="goodsDisplayImage lazyload" onerror="this.src='http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/noimage.gif'" alt="세련된 팝업 3종 제공"/>
			</a>

			<!-- 반응형 icon new -->

			<!-- 반응형 zzim -->

			<!-- 미리보기/옵션보기/SNS보내기 -->

			<!-- 상품 상태 표시 -->
		</div>

		<div class="resp_display_goods_info infO_style_1">

			<!-- 상품명-->
			<div class="goodS_info displaY_goods_name">
				<span class="areA"><a href="http://responsive-sample30.firstmall.kr/goods/view?no=45">세련된 팝업 3종 제공</a></span>
			</div>

			<div class="infO_group">
				<!-- 비회원 대체문구 -->
				<!-- (할인혜택)판매가 -->
				<div class="goodS_info displaY_sales_price">
					<span class="areA">
						<span class="nuM">64,000</span>&#x20a9;
					</span>
				</div>

				<!-- 정가 -->
				<div class="goodS_info displaY_consumer_price">
					<span class="areA">
						<span class="nuM">90,000</span>&#x20a9;
					</span>
				</div>

				<!-- 할인율 -->
				<div class="goodS_info displaY_sales_percent">
					<span class="areA"><span class="nuM">29</span>%</span>
				</div>
			</div>

			<div class="infO_group">
				<!-- 무료배송 -->
				<div class="goodS_info displaY_besong typE_a">
					<span class="areA">무료배송</span>
				</div>

				<!-- 해외배송 -->
			</div>

			
		</div>

	</div>
  </li>
</ul><ul class="goods_list swiper-slide">	<li class="gl_item">
	<div class="gl_inner_item_wrap">

		<!--상품이미지-->
		<div class="gli_image goodsDisplayImageWrap">
			<a href="javascript:void(0);" class="respItemImageArea" onclick="display_goods_view('43','',this,'goods_view')">
				<img src="http://responsive-sample30.firstmall.kr/data/goods/1/2020/04/43_tmp_c00e8537ae0896d52a40b238030018d96590list1.jpg" data-src="/data/goods/1/2020/04/43_tmp_c00e8537ae0896d52a40b238030018d96590list1.jpg" class="goodsDisplayImage lazyload" onerror="this.src='http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/noimage.gif'" alt="주요 페이지들 통합 관리"/>
			</a>

			<!-- 반응형 icon new -->

			<!-- 반응형 zzim -->

			<!-- 미리보기/옵션보기/SNS보내기 -->

			<!-- 상품 상태 표시 -->
		</div>

		<div class="resp_display_goods_info infO_style_1">

			<!-- 상품명-->
			<div class="goodS_info displaY_goods_name">
				<span class="areA"><a href="http://responsive-sample30.firstmall.kr/goods/view?no=43">주요 페이지들 통합 관리</a></span>
			</div>

			<div class="infO_group">
				<!-- 비회원 대체문구 -->
				<!-- (할인혜택)판매가 -->
				<div class="goodS_info displaY_sales_price">
					<span class="areA">
						<span class="nuM">19,000</span>&#x20a9;
					</span>
				</div>

				<!-- 정가 -->
				<div class="goodS_info displaY_consumer_price">
					<span class="areA">
						<span class="nuM">26,000</span>&#x20a9;
					</span>
				</div>

				<!-- 할인율 -->
				<div class="goodS_info displaY_sales_percent">
					<span class="areA"><span class="nuM">27</span>%</span>
				</div>
			</div>

			<div class="infO_group">
				<!-- 무료배송 -->
				<div class="goodS_info displaY_besong typE_a">
					<span class="areA">무료배송</span>
				</div>

				<!-- 해외배송 -->
			</div>

			
		</div>

	</div>
  </li>
</ul><ul class="goods_list swiper-slide">	<li class="gl_item">
	<div class="gl_inner_item_wrap">

		<!--상품이미지-->
		<div class="gli_image goodsDisplayImageWrap">
			<a href="javascript:void(0);" class="respItemImageArea" onclick="display_goods_view('40','',this,'goods_view')">
				<img src="http://responsive-sample30.firstmall.kr/data/goods/1/2020/04/40_tmp_db4fdc5ef6ee28116bf7a927b26f04e65083list1.jpg" data-src="/data/goods/1/2020/04/40_tmp_db4fdc5ef6ee28116bf7a927b26f04e65083list1.jpg" class="goodsDisplayImage lazyload" onerror="this.src='http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/noimage.gif'" alt="가장 높은 검색우선순위"/>
			</a>

			<!-- 반응형 icon new -->

			<!-- 반응형 zzim -->

			<!-- 미리보기/옵션보기/SNS보내기 -->

			<!-- 상품 상태 표시 -->
		</div>

		<div class="resp_display_goods_info infO_style_1">

			<!-- 상품명-->
			<div class="goodS_info displaY_goods_name">
				<span class="areA"><a href="http://responsive-sample30.firstmall.kr/goods/view?no=40">가장 높은 검색우선순위</a></span>
			</div>

			<div class="infO_group">
				<!-- 비회원 대체문구 -->
				<!-- (할인혜택)판매가 -->
				<div class="goodS_info displaY_sales_price">
					<span class="areA">
						<span class="nuM">39,800</span>&#x20a9;
					</span>
				</div>

				<!-- 정가 -->
				<div class="goodS_info displaY_consumer_price">
					<span class="areA">
						<span class="nuM">50,000</span>&#x20a9;
					</span>
				</div>

				<!-- 할인율 -->
				<div class="goodS_info displaY_sales_percent">
					<span class="areA"><span class="nuM">21</span>%</span>
				</div>
			</div>

			<div class="infO_group">
				<!-- 무료배송 -->
				<div class="goodS_info displaY_besong typE_a">
					<span class="areA">무료배송</span>
				</div>

				<!-- 해외배송 -->
			</div>

			
		</div>

	</div>
  </li>
</ul><ul class="goods_list swiper-slide">	<li class="gl_item">
	<div class="gl_inner_item_wrap">

		<!--상품이미지-->
		<div class="gli_image goodsDisplayImageWrap">
			<a href="javascript:void(0);" class="respItemImageArea" onclick="display_goods_view('39','',this,'goods_view')">
				<img src="http://responsive-sample30.firstmall.kr/data/goods/1/2020/04/39_tmp_ce6512073d5deca10fd77b4a5d8ec3e38324list1.png" data-src="/data/goods/1/2020/04/39_tmp_ce6512073d5deca10fd77b4a5d8ec3e38324list1.png" class="goodsDisplayImage lazyload" onerror="this.src='http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/noimage.gif'" alt="모든 기기에서 최적화된 UI"/>
			</a>

			<!-- 반응형 icon new -->

			<!-- 반응형 zzim -->

			<!-- 미리보기/옵션보기/SNS보내기 -->

			<!-- 상품 상태 표시 -->
		</div>

		<div class="resp_display_goods_info infO_style_1">

			<!-- 상품명-->
			<div class="goodS_info displaY_goods_name">
				<span class="areA"><a href="http://responsive-sample30.firstmall.kr/goods/view?no=39">모든 기기에서 최적화된 UI</a></span>
			</div>

			<div class="infO_group">
				<!-- 비회원 대체문구 -->
				<!-- (할인혜택)판매가 -->
				<div class="goodS_info displaY_sales_price">
					<span class="areA">
						<span class="nuM">19,000</span>&#x20a9;
					</span>
				</div>

				<!-- 정가 -->
				<div class="goodS_info displaY_consumer_price">
					<span class="areA">
						<span class="nuM">26,000</span>&#x20a9;
					</span>
				</div>

				<!-- 할인율 -->
				<div class="goodS_info displaY_sales_percent">
					<span class="areA"><span class="nuM">27</span>%</span>
				</div>
			</div>

			<div class="infO_group">
				<!-- 무료배송 -->
				<div class="goodS_info displaY_besong typE_a">
					<span class="areA">무료배송</span>
				</div>

				<!-- 해외배송 -->
			</div>

			
		</div>

	</div>
  </li>
</ul>
					<!-- ------- //상품정보. ------- -->
				  </div>
				  <!-- scrollbar -->
				  <div class="display-scrollbar swiper-scrollbardesignDisplay_602a9b0838118"></div>
			  </div>
			   <!-- left, right button -->
			  <div class="swiper-button-next"></div>
			  <div class="swiper-button-prev"></div>
          </div>

<script>
	var t = new Date();
	var uniquekey_dsp = 'designDisplay_602a9b0838118'+t.getTime();
	var display_swiper = [];

	$(function(){
		/* 상품디스플레이 스와이프형 탭 스크립트 */
		$("#designDisplay_602a9b0838118 .displaySwipeTabContainer").each(function(){
			var tabContainerObj = $(this);
			tabContainerObj.children('li').css('width',(100/tabContainerObj.children('li').length)+'%');
			tabContainerObj.children('li').bind('mouseover click',function(){
				tabContainerObj.children('li.current').removeClass('current');
				$(this).addClass('current');
				var tabIdx = tabContainerObj.children('li').index(this);
				tabContainerObj.closest('.designDisplay, .designCategoryRecommendDisplay').find('.displayTabContentsContainer').hide().eq(tabIdx).show();
			}).eq(0).trigger('mouseover');
		});


		$('.display_slide_class').each(function(){
			if(!$(this).hasClass('set_slide_clear')){
				display_swiper[uniquekey_dsp] = new Swiper($(this).find('.goods_display_slide_wrap'), {
					//scrollbar: $(this).find('.display-scrollbar'),
					slidesPerView: 'auto',
					grabCursor: true,
					nextButton: $(this).find('.swiper-button-next'),
					prevButton: $(this).find('.swiper-button-prev')
				});
				$(this).addClass('set_slide_clear').bind('mousedown touchstart touchmove',function(){
					$('.active_swipe_slide').removeClass('active_swipe_slide');
					$(this).addClass('active_swipe_slide');
				});
			}
		});
		/*
		 $(window).resize(function(){
			setTimeout(function(){
				if($('.swiper-scrollbar-drag').width() == 0) display_swiper[uniquekey_dsp].update(true);
			},1000);
		 });
		 set_goods_display_decoration(".goodsDisplayImageWrap");
		*/
	});
</script>
</div>

		<h3 class="title_sub1"><span designElement="text" textIndex="128"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >판매자 인기상품</span></h3>
		<!-- EYE-Design 켜고 클릭해서 판매자 인기상품 디스플레이 수정 가능. ( 노출할 상품 설정은, 관리자 > 판매상품 > 상품상세 > 판매자 인기상품 ) -->
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
@@ [반응형] 디스플레이 템플릿 - 스와이프형 @@
- 파일위치 : [스킨폴더]/_modules/display/goods_display_sizeswipe.html
++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<style>
	.designDisplay_602a9b083d517 .goods_list ol.gli_contents { text-align:center;}
	.designDisplay_602a9b083d517 .swiper-slide>li.gl_item { width:300px;  }
</style>

<div id='designDisplay_602a9b083d517' class='designGoodsRelationDisplay display_relation_seller' designElement='goodsSellerRelationDisplay' templatePath='goods/view.html' displaySeq='3001' perpage='' category='' displayStyle='sizeswipe'>
          <div class="designDisplay_602a9b083d517 display_slide_class displaySwipeTabContentsContainer" tabIdx="0">
			  <div class="goods_display_slide_wrap">
				  <div class="swiper-wrapper">
					<!-- ------- 상품정보. 파일위치 : /data/design/ ------- -->
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
@@ goods_info_style_1 @@
- 파일 위치 : /data/design/goods_info_style_1.html
- CSS 경로 : /data/design/goods_info_style.css
- 상품정보 관련 CSS 수정 및 추가는 다음의 CSS파일에서 작업하시기 바랍니다.
/data/design/goods_info_user.css
※ /data 폴더는 /skin 폴더 상위 폴더입니다.
++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<ul class="goods_list swiper-slide">	<li class="gl_item">
	<div class="gl_inner_item_wrap">

		<!--상품이미지-->
		<div class="gli_image goodsDisplayImageWrap">
			<a href="javascript:void(0);" class="respItemImageArea" onclick="display_goods_view('48','',this,'goods_view')">
				<img src="http://responsive-sample30.firstmall.kr/data/goods/1/2020/04/48_tmp_28a538612e75d2c98952805cc294ac319152list1.jpg" data-src="/data/goods/1/2020/04/48_tmp_28a538612e75d2c98952805cc294ac319152list1.jpg" class="goodsDisplayImage lazyload" onerror="this.src='http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/noimage.gif'" alt="편리한 검색 모듈 제공"/>
			</a>

			<!-- 반응형 icon new -->

			<!-- 반응형 zzim -->

			<!-- 미리보기/옵션보기/SNS보내기 -->

			<!-- 상품 상태 표시 -->
		</div>

		<div class="resp_display_goods_info infO_style_1">

			<!-- 상품명-->
			<div class="goodS_info displaY_goods_name">
				<span class="areA"><a href="http://responsive-sample30.firstmall.kr/goods/view?no=48">편리한 검색 모듈 제공</a></span>
			</div>

			<div class="infO_group">
				<!-- 비회원 대체문구 -->
				<!-- (할인혜택)판매가 -->
				<div class="goodS_info displaY_sales_price">
					<span class="areA">
						<span class="nuM">28,000</span>&#x20a9;
					</span>
				</div>

				<!-- 정가 -->
				<div class="goodS_info displaY_consumer_price">
					<span class="areA">
						<span class="nuM">30,000</span>&#x20a9;
					</span>
				</div>

				<!-- 할인율 -->
				<div class="goodS_info displaY_sales_percent">
					<span class="areA"><span class="nuM">7</span>%</span>
				</div>
			</div>

			<div class="infO_group">
				<!-- 무료배송 -->
				<div class="goodS_info displaY_besong typE_a">
					<span class="areA">무료배송</span>
				</div>

				<!-- 해외배송 -->
			</div>

			
		</div>

	</div>
  </li>
</ul><ul class="goods_list swiper-slide">	<li class="gl_item">
	<div class="gl_inner_item_wrap">

		<!--상품이미지-->
		<div class="gli_image goodsDisplayImageWrap">
			<a href="javascript:void(0);" class="respItemImageArea" onclick="display_goods_view('47','',this,'goods_view')">
				<img src="http://responsive-sample30.firstmall.kr/data/goods/1/2020/04/47_tmp_620b794faf8fd67c972da7af119eb9a18886list1.png" data-src="/data/goods/1/2020/04/47_tmp_620b794faf8fd67c972da7af119eb9a18886list1.png" class="goodsDisplayImage lazyload" onerror="this.src='http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/noimage.gif'" alt="편리한 검색 모듈 제공"/>
			</a>

			<!-- 반응형 icon new -->

			<!-- 반응형 zzim -->

			<!-- 미리보기/옵션보기/SNS보내기 -->

			<!-- 상품 상태 표시 -->
		</div>

		<div class="resp_display_goods_info infO_style_1">

			<!-- 상품명-->
			<div class="goodS_info displaY_goods_name">
				<span class="areA"><a href="http://responsive-sample30.firstmall.kr/goods/view?no=47">편리한 검색 모듈 제공</a></span>
			</div>

			<div class="infO_group">
				<!-- 비회원 대체문구 -->
				<!-- (할인혜택)판매가 -->
				<div class="goodS_info displaY_sales_price">
					<span class="areA">
						<span class="nuM">28,000</span>&#x20a9;
					</span>
				</div>

				<!-- 정가 -->
				<div class="goodS_info displaY_consumer_price">
					<span class="areA">
						<span class="nuM">30,000</span>&#x20a9;
					</span>
				</div>

				<!-- 할인율 -->
				<div class="goodS_info displaY_sales_percent">
					<span class="areA"><span class="nuM">7</span>%</span>
				</div>
			</div>

			<div class="infO_group">
				<!-- 무료배송 -->
				<div class="goodS_info displaY_besong typE_a">
					<span class="areA">무료배송</span>
				</div>

				<!-- 해외배송 -->
			</div>

			
		</div>

	</div>
  </li>
</ul><ul class="goods_list swiper-slide">	<li class="gl_item">
	<div class="gl_inner_item_wrap">

		<!--상품이미지-->
		<div class="gli_image goodsDisplayImageWrap">
			<a href="javascript:void(0);" class="respItemImageArea" onclick="display_goods_view('46','',this,'goods_view')">
				<img src="http://responsive-sample30.firstmall.kr/data/goods/1/2020/04/46_tmp_157442a50ca69a70e47c77b6f988be6c8361list1.jpg" data-src="/data/goods/1/2020/04/46_tmp_157442a50ca69a70e47c77b6f988be6c8361list1.jpg" class="goodsDisplayImage lazyload" onerror="this.src='http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/noimage.gif'" alt="세련된 갤러리 게시판 제공"/>
			</a>

			<!-- 반응형 icon new -->

			<!-- 반응형 zzim -->

			<!-- 미리보기/옵션보기/SNS보내기 -->

			<!-- 상품 상태 표시 -->
		</div>

		<div class="resp_display_goods_info infO_style_1">

			<!-- 상품명-->
			<div class="goodS_info displaY_goods_name">
				<span class="areA"><a href="http://responsive-sample30.firstmall.kr/goods/view?no=46">세련된 갤러리 게시판 제공</a></span>
			</div>

			<div class="infO_group">
				<!-- 비회원 대체문구 -->
				<!-- (할인혜택)판매가 -->
				<div class="goodS_info displaY_sales_price">
					<span class="areA">
						<span class="nuM">19,000</span>&#x20a9;
					</span>
				</div>

				<!-- 정가 -->
				<div class="goodS_info displaY_consumer_price">
					<span class="areA">
						<span class="nuM">26,000</span>&#x20a9;
					</span>
				</div>

				<!-- 할인율 -->
				<div class="goodS_info displaY_sales_percent">
					<span class="areA"><span class="nuM">27</span>%</span>
				</div>
			</div>

			<div class="infO_group">
				<!-- 무료배송 -->
				<div class="goodS_info displaY_besong typE_a">
					<span class="areA">무료배송</span>
				</div>

				<!-- 해외배송 -->
			</div>

			
		</div>

	</div>
  </li>
</ul><ul class="goods_list swiper-slide">	<li class="gl_item">
	<div class="gl_inner_item_wrap">

		<!--상품이미지-->
		<div class="gli_image goodsDisplayImageWrap">
			<a href="javascript:void(0);" class="respItemImageArea" onclick="display_goods_view('45','',this,'goods_view')">
				<img src="http://responsive-sample30.firstmall.kr/data/goods/1/2020/04/45_tmp_968871bf62f92d23920852ce8973bad78503list1.jpg" data-src="/data/goods/1/2020/04/45_tmp_968871bf62f92d23920852ce8973bad78503list1.jpg" class="goodsDisplayImage lazyload" onerror="this.src='http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/noimage.gif'" alt="세련된 팝업 3종 제공"/>
			</a>

			<!-- 반응형 icon new -->

			<!-- 반응형 zzim -->

			<!-- 미리보기/옵션보기/SNS보내기 -->

			<!-- 상품 상태 표시 -->
		</div>

		<div class="resp_display_goods_info infO_style_1">

			<!-- 상품명-->
			<div class="goodS_info displaY_goods_name">
				<span class="areA"><a href="http://responsive-sample30.firstmall.kr/goods/view?no=45">세련된 팝업 3종 제공</a></span>
			</div>

			<div class="infO_group">
				<!-- 비회원 대체문구 -->
				<!-- (할인혜택)판매가 -->
				<div class="goodS_info displaY_sales_price">
					<span class="areA">
						<span class="nuM">64,000</span>&#x20a9;
					</span>
				</div>

				<!-- 정가 -->
				<div class="goodS_info displaY_consumer_price">
					<span class="areA">
						<span class="nuM">90,000</span>&#x20a9;
					</span>
				</div>

				<!-- 할인율 -->
				<div class="goodS_info displaY_sales_percent">
					<span class="areA"><span class="nuM">29</span>%</span>
				</div>
			</div>

			<div class="infO_group">
				<!-- 무료배송 -->
				<div class="goodS_info displaY_besong typE_a">
					<span class="areA">무료배송</span>
				</div>

				<!-- 해외배송 -->
			</div>

			
		</div>

	</div>
  </li>
</ul>
					<!-- ------- //상품정보. ------- -->
				  </div>
				  <!-- scrollbar -->
				  <div class="display-scrollbar swiper-scrollbardesignDisplay_602a9b083d517"></div>
			  </div>
			   <!-- left, right button -->
			  <div class="swiper-button-next"></div>
			  <div class="swiper-button-prev"></div>
          </div>

<script>
	var t = new Date();
	var uniquekey_dsp = 'designDisplay_602a9b083d517'+t.getTime();
	var display_swiper = [];

	$(function(){
		/* 상품디스플레이 스와이프형 탭 스크립트 */
		$("#designDisplay_602a9b083d517 .displaySwipeTabContainer").each(function(){
			var tabContainerObj = $(this);
			tabContainerObj.children('li').css('width',(100/tabContainerObj.children('li').length)+'%');
			tabContainerObj.children('li').bind('mouseover click',function(){
				tabContainerObj.children('li.current').removeClass('current');
				$(this).addClass('current');
				var tabIdx = tabContainerObj.children('li').index(this);
				tabContainerObj.closest('.designDisplay, .designCategoryRecommendDisplay').find('.displayTabContentsContainer').hide().eq(tabIdx).show();
			}).eq(0).trigger('mouseover');
		});


		$('.display_slide_class').each(function(){
			if(!$(this).hasClass('set_slide_clear')){
				display_swiper[uniquekey_dsp] = new Swiper($(this).find('.goods_display_slide_wrap'), {
					//scrollbar: $(this).find('.display-scrollbar'),
					slidesPerView: 'auto',
					grabCursor: true,
					nextButton: $(this).find('.swiper-button-next'),
					prevButton: $(this).find('.swiper-button-prev')
				});
				$(this).addClass('set_slide_clear').bind('mousedown touchstart touchmove',function(){
					$('.active_swipe_slide').removeClass('active_swipe_slide');
					$(this).addClass('active_swipe_slide');
				});
			}
		});
		/*
		 $(window).resize(function(){
			setTimeout(function(){
				if($('.swiper-scrollbar-drag').width() == 0) display_swiper[uniquekey_dsp].update(true);
			},1000);
		 });
		 set_goods_display_decoration(".goodsDisplayImageWrap");
		*/
	});
</script>
</div>

	</div>
</div>

<div id="couponDownloadDialog" class="hide"></div>

<!-- 재입고 알림 레이어 -->
<div id="restockNotifyApply" class="resp_layer_pop hide">
	<h4 class="title"><span designElement="text" textIndex="129"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s" >재입고 알림</span></h4>
	<div class="y_scroll_auto">
		<div class="layer_pop_contents v3">
		</div>
	</div>
	<a href="javascript:void(0)" class="btn_pop_close" onclick="hideCenterLayer()"></a>
</div>
<!--<div id="restock_notify_apply" class="hide"></div>-->

<!-- 회원등급별 혜택 안내 -->
<div id="memberBenefitDetailDialog" class="hide">
	<table class="ddlTable" width="100%">
	<col width="100" />
	</table>
</div>

<!-- 위시 클릭시 레이어창 -->
<div id="wish_alert">
	<div class="wa_on"></div>
	<div class="wa_off"></div>
	<div class="wa_msg"></div>
</div>

<!-- 즐겨찾기 레이어 -->
<div id="myshop_favorite_alert" class="myshop_favorite_alert">
	<div class="cfa_on"></div>
	<div class="cfa_off"></div>
	<div class="cfa_msg"></div>
</div>

<!-- 해외배송 안내 콘텐츠. 파일위치 : [스킨폴더]/goods/_international_shipping_info.html -->
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
@@ 해외배송 안내 콘텐츠 @@
- 파일위치 : [스킨폴더]/goods/_international_shipping_info.html
- EYE-Design을 켜고 텍스트 수정 기능으로 수정 가능.
++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<div id="international_shipping_info" class="hide pd5">
<p designElement="text" textIndex="1"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvX2ludGVybmF0aW9uYWxfc2hpcHBpbmdfaW5mby5odG1s" >1. 주문하신 물품의 총 결제금액이 15만원 이상 (환율의 변동에 따라 다를 수 있음) 이면 과부가세가 발생합니다.  관부가세는 고객님께서 부담하시는 금액으로 문자를 통해 입금내역이 발송되며 해당 관세사로 입금하시면 통관처리됩니다.<br /><br />2. 해외구매 특성상 주문에서 배송까지는 평균 10~15일이 소요됩니다. 간혹 현지 제품 수급에 따라 부득이하게 시일이 더 소요 될 수 있으니 구매시 좀 더 여유있게 주문하시길 권합니다.<br /><br />3. 해외 내수품인 관계로 A/S에 대해서는 별도의 책임을 지지 않습니다.<br /><br />4. 해외배송 특성상 주문접수후 배송상태가 배송준비중으로 넘어간 경우 해외에서 국내로의 배송이 이루어지고 있다는 뜻입니다. 따라서 배송준비중으로 배송상태가 넘어간 경우 취소및 반품이 불가하므로 이점 양해 부탁드립니다.<br /><br />5. 타 해외구매대행 사이트에서 주문하신 물건과 주문날짜가 겹치지않도록 주의해 주십시오. 통관날짜가 같을 경우 합산관세가 부가되게 됩니다.</p>
</div>
<!-- //해외배송 안내 콘텐츠 -->

<script type="text/javascript">
$(function() {

	// 재입고 알림
	$('.restockOpenBtn').on('click', function() {
		$.get('restock_notify_apply?goods_seq=49', function(data) {
			$('#restockNotifyApply .layer_pop_contents').html(data);
			showCenterLayer('#restockNotifyApply');
		});
	});

	$('#btnSnsShare').click(function() {
		if ( $('#snsListDetail').is(':hidden') ) {
			$('#snsListDetail').show();
		} else {
			$('#snsListDetail').hide();
		}
	});

	$('#goodsReviewLoad').one('click', function() {
		$("div#goods_review_frame_div").html('<iframe name="goods_review_frame" id="goods_review_frame" src="/board/?id=goods_review&goods_seq=49&iframe=1&gdviewer=1" width="100%" height="500" frameborder="0" scrolling="no" allowTransparency="true"></iframe>');
	});
	$('#goodsQnaLoad').one('click', function() {
		$("div#goods_qna_frame_div").html('<iframe name="goods_qna_frame" id="goods_qna_frame" src="/board/?id=goods_qna&goods_seq=49&iframe=1&gdviewer=1" width="100%" height="500" frameborder="0" scrolling="no" allowTransparency="true"></iframe>');
	});
});
</script>
		<!-- ================= 파트 페이지들 :: END. ================= -->
		</div>

		<!-- ================= #LAYOUT_FOOTER :: START. 파일위치 : layout_footer/standard.html (default) ================= -->
<div id="layout_footer" class="layout_footer">
	<div class="footer_a" style="display:none;">
		<div class="resp_wrap">
			<ul class="menu1">
				<li class="foot_menu_d1 cs">
					<h4 class="title"><a href="http://responsive-sample30.firstmall.kr/service/cs" designElement="text" textIndex="1"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >CS Center</a></h4>
					<ul class="list v4">
						<li class="compay_phone">
							<a href="tel:02-1234-5678">02-1234-5678</a>
						</li>
						<li>
							<p><span designElement="text" textIndex="2"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >MON-FRI : AM 09:00 ~ PM 06:00 / SAT, SUN, HOLIDAY OFF</span></p>
						</li>
						<li class="Pt2"><p><span designElement="text" textIndex="3"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >LUNCH : AM 12:00 ~ PM 01:00</span></p></li>
					</ul>
				</li>
				<li class="foot_menu_d2 bank">
					<h4 class="title"><span designElement="text" textIndex="4"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >Banking Info</span></h4>
					<ul class="list v3 gray_03">
						<li>
							<p>국민은행 000000-00-000000 / <span class="gray_06" designElement="text" textIndex="5"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >예금주 :</span> 김대표</p>
						</li>
						<li>
							<p>신한은행 000-000-000000 / <span class="gray_06" designElement="text" textIndex="5"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >예금주 :</span> 김대표</p>
						</li>
					</ul>
				</li>
				<li class="foot_menu_d3">
					<h4 class="title"><span designElement="text" textIndex="6"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >Community</span></h4>
					<ul class="list v3 gray_03">
						<li>
							<a href="http://responsive-sample30.firstmall.kr/board/?id=notice" designElement="text" textIndex="7"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >Notice</a>
						</li>
						<li>
							<a href="http://responsive-sample30.firstmall.kr/board/?id=faq" designElement="text" textIndex="8"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >Q&A</a>
						</li>
						<li>
							<a href="http://responsive-sample30.firstmall.kr/board/?id=goods_review" designElement="text" textIndex="9"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >Review</a>
						</li>
					</ul>
				</li>
				<li class="foot_menu_d4">
					<h4 class="title"><span designElement="text" textIndex="10"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >Follow Us</span></h4>
					<ul class="list v3 gray_03">
						<li>
							<a href="#none">Instagram</a>
						</li>
						<li>
							<a href="#none">Kakao</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	<div class="footer_b">
		<div class="resp_wrap">
			<ul class="menu2">
				<li><a href="http://responsive-sample30.firstmall.kr/" designElement="text" textIndex="11"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >HOME</a></li>
				<li><a href="http://responsive-sample30.firstmall.kr/service/company" designElement="text" textIndex="12"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >COMPANY</a></li>
				<li><a href="http://responsive-sample30.firstmall.kr/service/agreement" designElement="text" textIndex="13"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >AGREEMENT</a></li>
				<li><a href="http://responsive-sample30.firstmall.kr/service/privacy" designElement="text" textIndex="14"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s"  class="bold">PRIVACY POLICY</a></li>
                <li><a href="http://responsive-sample30.firstmall.kr/service/guide" designElement="text" textIndex="15"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >GUIDE</a></li>
                <li><a href="http://responsive-sample30.firstmall.kr/service/partnership" designElement="text" textIndex="16"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >PARTNER</a></li>
			</ul>
		</div>
	</div>
	<div class="footer_c">
		<div class="resp_wrap">
			<ul class="menu3">
				<li><span designElement="text" textIndex="17"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >COMPANY :</span> <span class="pcolor">(주) 귀사의 회사명</span></li>
				<li><span designElement="text" textIndex="18"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >CEO :</span> <span class="pcolor">김대표 </span></li>
				<li><span designElement="text" textIndex="19"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >ADDRESS :</span> <span class="pcolor">경기도 성남시 분당구 대왕판교로 670 (유스페이스2) </span></li>
				<li><span designElement="text" textIndex="20"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >TEL :</span> <a href="tel:02-1234-5678" class="pcolor">02-1234-5678</a></li>
				<li><span designElement="text" textIndex="21"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >FAX :</span> <span class="pcolor">031-1234-5678</span></li>
				<li><span designElement="text" textIndex="22"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >BUSINESS LICENCE :</span> <span class="pcolor">123-45-67890 <a href="javascript:;" onclick="window.open('http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1234567890','communicationViewPopup','width=750,height=700,scrollbars=yes')">[사업자정보확인]</a></span></li>
				<li><span designElement="text" textIndex="23"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >ONLINE LICENCE :</span> <span class="pcolor">제1234-서울강남56789호</span></li>
				<li><span designElement="text" textIndex="24"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >PRIVACY OFFICER :</span> <span class="pcolor">최정보 (<a class="pcolor" href="mailto:yourmail@yourdomain.com">yourmail@yourdomain.com</a>)</span></li>
				<li>HOSTING PROVIDER : <span class="pcolor">(주)가비아씨엔에스</span></li>
			</ul>
			<p class="copyright" designElement="text" textIndex="25"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbGF5b3V0X2Zvb3Rlci9zdGFuZGFyZC5odG1s" >COPYRIGHT (c) <span class="pcolor">(주) 귀사의 회사명</span> ALL RIGHTS RESERVED.</p>
			<div class="escrow"><script type="text/javascript">function f_escrowKicc(){window.open("http://www.easypay.co.kr/escrow/escrow_memb_auth.jsp?memb_id=GA123456", "kicc_escrow", "top=0,left=0,width=800,height=450,scrollbars,menubar=no,resizable,status,location=yes,toolbar=yes");}</script><img src="http://responsive-sample30.firstmall.kr/data/icon/escrow_mark/kicc.png" style="cursor:pointer;" onclick="f_escrowKicc();" /></div>
		</div>
	</div>
</div>

<div class="pcHideMoShow" style="height:80px;">&nbsp;</div>
<!-- 하단영역 : 끝 -->

<!-- 플로팅 - BACK/TOP(대쉬보드) -->
<div id="floating_over">
	<a href="javascript:history.back();" class="ico_floating_back" title="뒤로 가기"></a>
	<a href="javascript:history.forward();" class="ico_floating_foward" title="앞으로 가기"></a>
	<a href="#layout_header" class="ico_floating_top" title="위로 가기"></a>

	<!-- 최근 본 상품(LAYER) -->
</div>
<!-- //플로팅 - BACK/TOP(대쉬보드) -->

<script type="text/javascript">
	$(function() {
		/* 반응형 슬라이드 배너 관련( 절대 삭제 금지 ) */
			$('.slider_before_loading').removeClass('slider_before_loading');

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
	function logoutfb(){
		FB.getLoginStatus(logoutfb_process);
	}
	function logoutfb_process(){
		FB.api('/me', function(response) {

			FB.logout(function(response) {

			});

			isLogin = false;
			if (fbId != "")  initializeFbTokenValues();
			if (fbUid != "") initializeFbUserValues();

			return false;
		});
	}
	/*######################## 17.12.19 gcs yjy : 앱 처리(fb 로그아웃) e */
</script>
		<!-- ================= #LAYOUT_FOOTER :: END. 파일위치 : layout_footer/standard.html (default) ================= -->

		<iframe name="actionFrame" id="actionFrame" src="http://responsive-sample30.firstmall.kr/main/blank" frameborder="0" width="100%" height="0"></iframe>
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
	<div style="margin:auto;"><img src="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/design/img_paying.gif" /></div>
	<div style="margin:auto;padding-top:20px;"><img src="http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/design/progress_bar.gif" /></div>
</div>
<div id="layout_side_background" class="layout_side_background"></div>

<!-- ================= #HTML_FOOTER :: START. 파일위치 : _modules/common/html_footer.html ================= -->
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
@@ #HTML_FOOTER @@
- 파일위치 : [스킨폴더]/_modules/common/html_footer.html
++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<div id="popupChangePassword" class="resp_layer_pop hide">
	<h4 class="title">비밀번호 변경</h4>
	<form id='passUpdateForm' method='post' action='http://responsive-sample30.firstmall.kr/login_process/popup_change_pass' target='actionFrame'>
	<input type='hidden' name='password_mode' value='update'>
		<div class="y_scroll_auto2">
			<div class="layer_pop_contents v5">
				<h5 class="stitle">회원님의 소중한 개인정보 보호를 위해 비밀번호를 주기적으로 변경하시는 것이 좋습니다.</h5>
				<p class="desc Pb8">※ 비밀번호는 6~20자, 영문 대소문자 또는 숫자 특수문자 중 2가지 이상 조합.</p>
				<div class="resp_table_row input_form th_size3">
					<ul class="tr">
						<li class="th Pl5 Pr5">현재 비밀번호</li>
						<li class="td">
							<input type='password' name='old_password' value='' class='passwordField eng_only Wmax' />
						</li>
					</ul>
					<ul class="tr">
						<li class="th Pl5 Pr5">신규 비밀번호</li>
						<li class="td">
							<input type='password' name='new_password' value='' class='passwordField eng_only Wmax' />
						</li>
					</ul>
					<ul class="tr">
						<li class="th Pl5 Pr5">신규 비밀번호 <span class="Dib">확인</span></li>
						<li class="td">
							<input type='password' name='re_new_password' value='' class='passwordField eng_only Wmax' />
						</li>
					</ul>
				</div>
				<div class="C Pt20 Fs15">
					<label><input type='checkbox' name='update_rate' value='Y' onclick='update_rate_checked();'> 개월 이후에 비밀번호를 변경하겠습니다.</label>
				</div>
			</div>
		</div>
		<div class="layer_bottom_btn_area2 v2">
			<ul class="basic_btn_area2">
				<li><button type="submit" class="btn_resp size_c color2">변경 완료</button></li>
				<li><button type="button" class="btn_resp size_c color5" onclick="hideCenterLayer()">취소</button></li>
			</ul>
		</div>
		<a href="javascript:void(0)" class="btn_pop_close" onclick="hideCenterLayer()"></a>
	</form>
</div>
</body>

<!-- Mirrored from responsive-sample30.firstmall.kr/goods/view?no=49 by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Feb 2021 16:05:27 GMT -->
</html>
<!-- ================= #HTML_FOOTER :: END. 파일위치 : _modules/common/html_footer.html ================= -->