<%@page import="java.util.List"%>
<%@page import="site.semi.dao.ItemBuyDAO"%>
<%@page import="site.semi.dto.ItemBuyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/security/login_url.jspf"%>

<%List<ItemBuyDTO> list =  ItemBuyDAO.getDAO().selectId(loginMember.getId()); %>

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

<script type="text/javascript"
	src="../data/skin/responsive_camping_healing_gl/common/search_ver2_ready.js"></script>
	<style type="text/css">
	th{background-color: black;color: white;}
	td{border: 1px solid black; text-align: center;height: 60px;}
	</style>
<div class="subpage_wrap">

	<!-- +++++ mypage LNB ++++ -->
	<div id="subpageLNB" class="subpage_lnb">
		<div id="mypageLnbBasic">
			<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
		@@ 마이페이지 LNB 공통 @@%>
		- 파일위치 : [스킨폴더]/mypage/mypage_lnb.html
		++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
			<h2 class="title1">
				<a href="/mypage" designelement="text" textindex="1"
					texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbXlwYWdlL215cGFnZV9sbmIuaHRtbA==">MY
					SHOPPING</a>
			</h2>
		
			
			<h3 class="title2">
				<a href="/mypage/myqna_catalog" designelement="text" textindex="18"
					texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbXlwYWdlL215cGFnZV9sbmIuaHRtbA==">나의
					활동</a>
			</h3>
			<ul class="lnb_sub">
				<li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=board/question&work=question_list&category=3" designelement="text"
					textindex="20"
					texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbXlwYWdlL215cGFnZV9sbmIuaHRtbA==">
						상품문의</a></li>
				<li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=board/question&work=question_list&category=2" designelement="text"
					textindex="21"
					texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbXlwYWdlL215cGFnZV9sbmIuaHRtbA==">
						상품후기</a></li>
				
			</ul>
			<h3 class="title2">
				<a href="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=mypage" designelement="text" textindex="23"
					texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbXlwYWdlL215cGFnZV9sbmIuaHRtbA==">나의
					정보</a>
			</h3>
			<ul class="lnb_sub">
				<li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=passwordconfirm&action=modify" designelement="text"
					textindex="24"
					texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbXlwYWdlL215cGFnZV9sbmIuaHRtbA==">회원정보
						수정</a></li>
				<li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=passwordconfirm&action=remove" designelement="text"
					textindex="25"
					texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbXlwYWdlL215cGFnZV9sbmIuaHRtbA==">회원
						탈퇴</a></li>
			</ul>
		</div>
	</div>
	<!-- +++++ //mypage LNB ++++ -->

	<!-- +++++ mypage contents ++++ -->
	<div class="subpage_container">
		<!-- 전체 메뉴 -->
		<a id="subAllButton" class="btn_sub_all" href="javascript:void(0)">MENU</a>

		<!-- 타이틀 -->
		<div class="title_container">
			<h2>
				<span designelement="text" textindex="1"
					texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbXlwYWdlL29yZGVyX2NhdGFsb2cuaHRtbA==">주문/배송
					내역</span>
			</h2>
		</div>
		<div class="mypage_greeting">
			전체 <span class="pointnum"><%=list.size()%></span>건
		</div>

		<form name="orderSearchForm" id="orderSearchForm" method="get"
			action="order_catalog">
			<input type="hidden" name="step_type" value="">
			<ul class="myorder_sort">
				<li class="list3"><span class="td"> 
				</span> <span id="directArea" class="direct_area Hide"> <input
						type="text" name="sc_sdate" size="10" value="2021-02-03"
						class="sc-datepicker hasDatepicker" readonly=""
						id="dp1614043487417"> - <input type="text" name="sc_edate"
						size="10" value="2021-02-23" class="sc-datepicker hasDatepicker"
						readonly="" id="dp1614043487418">
						<button type="submit" class="btn_resp size_b">검색</button>
				</span></li>
			</ul>
		</form>
		<table style="border: 1px solid black; margin: 0 auto; width: 600px;">
		<tr>
		<th>상품명</th>
		<th>색상</th>
		<th>가격</th>
		<th>구매수</th>
		<th>총 가격</th>
		<th>구매날짜</th>
		</tr>		
		<%if(list.size()==0){ %>
		<tr>
		<td colspan="6">구매 내역이 없습니다!</td>
		</tr>		
		<%}else{for(int i=0;i<list.size();i++){ 
		ItemBuyDTO dto = list.get(i);
		%>
		<tr>
		<Td><%=dto.getItem_name()%></Td>
		<Td><%=dto.getItem_color()%></Td>
		<Td><%=dto.getItem_price()%>원</Td>
		<Td><%=dto.getItem_buycount()%></Td>
		<Td><%=dto.getItem_price()*dto.getItem_buycount()%>원</Td>
		<Td><%=dto.getItem_buyreg()%></Td>
		</tr>	
		<%} }%>
		</table>	

	</div>
	<!-- +++++ //mypage contents ++++ -->
</div>
</head>

<%@include file="../footer.jsp"%>
</html>