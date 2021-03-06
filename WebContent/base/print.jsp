<%@page import="site.semi.dao.ItemDAO"%>
<%@page import="site.semi.dto.ItemDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% List<ItemDTO> dto = ItemDAO.getDAO().selectAllItem();%>


<!-- 슬라이드 배너 영역  (light_style_2_11) :: START -->
<div class="wide_visual_slider sliderB center">
	<!-- 슬라이드 배너 데이터 영역 :: START -->
	<div class="light_style_2_11 designBanner">
		<div class="sslide">
			<img class="simg"
				src="<%=request.getContextPath()%>/images/images_1.jpg" />
			<div class="slide_contents">
				<div class="wrap1">
					<div class="wrap2">
						<ul class="text_wrap">
							<li class="text1">도심에서 벗어나 자연이 선사하는 고요함<br>지금은 라이프밸런스 할
								시간
							</li>
							<li class="sbtns1"><a></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="sslide">
			<img class="simg"
				src="<%=request.getContextPath()%>/images/images_2.jpg" />
			<div class="slide_contents">
				<div class="wrap1">
					<div class="wrap2">
						<ul class="text_wrap">
							<li class="text1">미니멀리스트들을 위한<br> 맞춤형 초경량 미니멀 그레이텐트
							</li>
							<li class="sbtns1"><a></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="sslide">
			<img class="simg"
				src="<%=request.getContextPath()%>/images/images_3.jpg" />
			<div class="slide_contents">
				<div class="wrap1">
					<div class="wrap2">
						<ul class="text_wrap">
							<li class="text1">바로 이 순간, 또 다른 추억<br> 당신의 여행엔 언제나
								라이프밸런스
							</li>
							<li class="sbtns1"><a></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 슬라이드 배너 데이터 영역 :: END -->
</div>

<div class="resp_wrap">
	<div class="title_group1">
		<h3 class="title1">
			<span designElement="text" textIndex="1"
				textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbWFpbi9pbmRleC5odG1s">D
				I S C O U N T&nbsp;&nbsp;&nbsp;P R O D U C T</span>
		</h3>
	</div>
</div>
<div class="camping_goods_list">
		<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
@@ [반응형] 디스플레이 템플릿 - 격자 반응형 @@
- 파일위치 : [스킨폴더]/_modules/display/goods_display_responsible.html
++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<style type="text/css">
	.designDisplay_603f380f11056 .goods_list li.gl_item{ width:300px; }
</style>

<div id='designDisplay_603f380f11056' class='designDisplay' designElement='display' templatePath='main/index.html' displaySeq='10301' page='' perpage='' category='' displayStyle='responsible'>

	<div class="designDisplay_603f380f11056 display_responsible_class ">
		<!-- ------- 상품정보. 파일위치 : /data/design/ ------- -->
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
@@ goods_info_style_4 @@
- 파일 위치 : /data/design/goods_info_style_4.html
- CSS 경로 : /data/design/goods_info_style.css
- 상품정보 관련 CSS 수정 및 추가는 다음의 CSS파일에서 작업하시기 바랍니다.
/data/design/goods_info_user.css
※ /data 폴더는 /skin 폴더 상위 폴더입니다.
++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

	
	<ul class="goods_list designDisplay_603f380f11056 goods_info_style_4">
	<%for(int i =0; i<dto.size();i++){ 
		ItemDTO list = dto.get(i);
	%>
	<li class="gl_item">
	<div class="gl_inner_item_wrap">

		<!--상품이미지-->
		<div class="gli_image goodsDisplayImageWrap">
			<a href="javascript:void(0);" class="respItemImageArea" onclick="location.href='<%=request.getContextPath()%>/index.jsp?workgroup=product&work=product_action&itemno=<%=list.getItem_num()%>'">
				<img src="<%=request.getContextPath()%>/images/goods/goods<%=list.getItem_num()%>.png" data-src="/data/goods/1/2020/04/40_tmp_db4fdc5ef6ee28116bf7a927b26f04e65083list1.jpg" class="goodsDisplayImage lazyload item1cut" onerror="this.src='/data/skin/responsive_camping_healing_gl/images/common/noimage.gif';" alt="가장 높은 검색우선순위" />
				<img src="<%=request.getContextPath()%>/images/goods/goods<%=list.getItem_num()%>_sub.png" data-src="/data/goods/1/2020/04/40_tmp_9124b3f73c7e22ef17dcda735c9e0fe68974list1.jpg" class="goodsDisplayImage lazyload item2cut" onerror="this.src='/data/skin/responsive_camping_healing_gl/images/common/noimage.gif';" alt="가장 높은 검색우선순위"  />
			</a>
		</div>

	<div class="resp_display_goods_info infO_style_4">
	<!-- +++++++++++++++++++++++++++++++++ NEW 상품 정보 ++++++++++++++++++++++++++++++++ -->
		<!-- 상품명-->
		<div class="goodS_info displaY_goods_name">
			<span class="areA"><a href="<%=request.getContextPath()%>/index.jsp?workgroup=product&work=product_action&itemno=<%=list.getItem_num()%>"><%=list.getItem_name()%></a></span>
		</div>

		<div class="infO_group">
			<!-- (할인혜택)판매가 -->
			<div class="goodS_info displaY_sales_price">
				<span class="areA">					
					<span class="nuM"><%=list.getItem_price()-list.getItem_price()*list.getItem_sale()/100%></span>&#x20a9;
				</span>
			</div>

			<!-- 정가 -->
			<div class="goodS_info displaY_consumer_price">
				<span class="areA">					
					<span class="nuM" style="text-decoration: line-through;"><%=list.getItem_price()%></span>&#x20a9;
				</span>
			</div>
		</div>

		

		<!-- 아이콘 -->
		
	<!-- +++++++++++++++++++++++++++++++++ //NEW 상품 정보 ++++++++++++++++++++++++++++++++ -->
	</div>

	</div>
  </li>
	<%} %>
	</ul>
	

		<!-- ------- //상품정보. ------- -->
	</div>


</div>

	</div>
<script type="text/javascript">
	$(function() {
		$(".light_style_2_11").not(".slick-initialized").slick({
			// $('.light_style_타입num_배너num')에서 '배너num'는 showDesignBanner(배너num)과 반드시 일치해야 합니다
			dots : true, // 도트 페이징 사용( true 혹은 false )
			autoplay : true, // 슬라이드 자동( true 혹은 false )
			speed : 1000, // 슬라이딩 모션 속도 ms( 밀리세컨드, ex. 600 == 0.6초 )
			fade : true, // 슬라이딩 fade 모션 사용( true 혹은 fasle )
			autoplaySpeed : 3000, // autoplay 사용시 슬라이드간 시간 ms( 밀리세컨드, ex. 3000 == 3초 )
		// 이 외 slick 슬라이더의 자세한 옵션사항은 http://kenwheeler.github.io/slick/ 참고
		});
	});
</script>
<!-- 슬라이드 배너 영역 (light_style_2_11) :: END -->
