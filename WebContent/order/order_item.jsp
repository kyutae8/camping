<%@page import="site.semi.dao.SboardDAO"%>
<%@page import="site.semi.dto.SboardDTO"%>
<%@page import="site.semi.dto.SmemberDTO"%>
<%@page import="site.semi.dao.ItemDAO"%>
<%@page import="site.semi.dto.ItemDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String itemno = request.getParameter("itemno");
	if (itemno == null) {
%>
<script type="text/javascript">
	location.href="<%=request.getContextPath()%>/error/error400.jsp";
</script>
<%
	}
	ItemDTO dto = ItemDAO.getDAO().selectItem(Integer.parseInt(itemno));
	int originPrice = dto.getItem_price();
	int salePrice = (int) (dto.getItem_price() * dto.getItem_sale() / 100);
	int totalPrice = originPrice - salePrice;
	int itemCount = 1;
	
	SmemberDTO loginMember=(SmemberDTO)session.getAttribute("loginMember");
 	List<SboardDTO> boardList=SboardDAO.getDAO().selectQA(dto.getItem_num());
 	List<SboardDTO> boardList2=SboardDAO.getDAO().selectRV(dto.getItem_num());
%>
<style type="text/css">
.faq_new { font-size:14px; } 
.faq_new>li { margin-top:10px; } 
.faq_new>li:first-child { margin-top:0; } 
.faq_new #question { position:relative; padding:0 0 0 40px; }
.faq_new #question:before { position:absolute; left:0; top:0; display:block; width:40px; box-sizing:border-box; padding-left:8px; content:'R'; font-size:28px; line-height:40px; font-weight:700; color:#333; }
.faq_new #question .subject {min-height:22px;padding:12px 10px 10px 12px;background:#f8f8f8;}
.faq_new #question .subject, .faq_new .question .subject a {color:#333;}
.faq_new .answer { position:relative; margin-top:20px; padding:0 0 20px 52px; line-height:1.6; color:#666; }
.faq_new .answer:before { position:absolute; left:0; top:0; display:block; width:40px; box-sizing:border-box; padding-left:8px; content:''; font-size:28px; line-height:40px; font-weight:700; color:#b1b1b1; }
</style>

<!-- 타이틀 -->
<div id="layout_body" class="layout_body">
	<div class="ajaxLineMap search_nav">
		<a class="home" href="<%=request.getContextPath()%>/index.jsp">홈</a>
	</div>


	<!-- 타이틀 -->
	<div class="detail_title_area">
		<h3 class="name"><%=dto.getItem_name()%></h3>
		<p class="summary">
			<%=dto.getItem_info()%>
			<span class="detail_icons"> <img
				src="http://responsive-sample30.firstmall.kr/data/icon/goods/16.gif"
				alt=""> <img
				src="http://responsive-sample30.firstmall.kr/data/icon/goods/17.gif"
				alt="">
			</span>
		</p>
		
	</div>

	<div id="goods_view">
		<div class="goods_thumbs_spec">

			<div id="goods_thumbs">
				<div class="slides_container hide" style="position: relative;">
					<div class="viewImgWrap">
						<img
							src="<%=request.getContextPath()%>/images/goods/goods<%=itemno%>.png"
							onerror="this.src='http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/noimage_wide.gif'"
							title="" />
					</div>
					<div class="viewImgWrap">
						<img
							src="<%=request.getContextPath()%>/images/goods/goods<%=itemno%>_sub.png"
							onerror="this.src='http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/noimage_wide.gif'"
							title="" />
					</div>
					<a id="btn_zoom_view"
						href="javascript:popup('zoom?no=49&popup=1',817, document.body.clientHeight,'yes')">확대
						보기</a>
				</div>

				<div class="pagination_wrap">
					<div class="count">
						<a href="javascript:void(0)" class="prev" title="이전"></a>
						<div class="pagination_area">
							<ul class="pagination">
								<li><a href="javascript:void(0)"><img
										src="<%=request.getContextPath()%>/images/goods/goods<%=itemno%>.png"
										width="100"
										onerror="this.src='http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/noimage_list.gif'" /></a></li>
								<li><a href="javascript:void(0)"><img
										src="<%=request.getContextPath()%>/images/goods/goods<%=itemno%>_sub.png"
										width="100"
										onerror="this.src='http://responsive-sample30.firstmall.kr/data/skin/responsive_camping_healing_gl/images/common/noimage_list.gif'" /></a></li>
							</ul>
						</div>
						<a href="javascript:void(0)" class="next" title="다음"></a>
					</div>
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

			<!-- ++++++++++++++++++++++++ 상품 스펙 ++++++++++++++++++++++++ -->
			<div id="goods_spec">
				<form name="goodsForm" method="post" enctype="multipart/form-data"
					target="actionFrame">
					<input type="hidden" name="goodsSeq" value="49" />


					<ul class="goods_spec_sections">

						<!-- ~~~~~ 가격, 할인율, 할인내역 ~~~~~ -->
						<li class="deatil_price_area">
							<div class="deatil_sale_rate">
								<p class="inner">
									<span class="num"><%=dto.getItem_sale()%></span>%
								</p>
							</div>
							<p class="org_price">
								<span class="dst_th_size"><span class="num" style="text-decoration: line-through;"><%=originPrice%></span>&#x20a9;</span>
							</p>
							<p class="sale_price">
								<span class="num"><%=totalPrice%></span><span class='price_won'>&#x20a9;</span>
							</p>

						</li>
						<li class="goods_spec_sub_info">
							<ul class="detail_spec_table">
								<li class="th"><span designElement="text" textIndex="75"
									textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s">상품정보</span></li>
								<li><span class="gray_06" designElement="text"
									textIndex="76"
									textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s"><%=dto.getItem_info()%></span></li>
								<li class="btn_area1"></li>
							</ul>
						</li>
						<!-- ~~~~~ //상품정보 ~~~~~ -->
						<!-- ~~~~~ 브랜드 ~~~~~ -->
						<li class="goods_spec_brand">
							<ul class="detail_spec_table">
								<li class="th"><span designElement="text" textIndex="81"
									textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s">브랜드</span></li>
								<li><a
									href="<%=request.getContextPath()%>/index.jsp?workgroup=board&work=board_list"><%=dto.getItem_brand() %></a>
								</li>
							</ul>
						</li>
						<!-- ~~~~~ //브랜드 ~~~~~ -->
					</ul>

					<!-- ~~~~~~~~~~~ 구매하기 열기 섹션( 모바일 전용 ) ~~~~~~~~~~~ -->
					<div id="goodsBuyOpenSection" class="goods_buy_open_sections">
						<a href="javascript:void(0);" id="btnSectionOpen"
							class="btn_section_open off">열기</a>
						<ul class="goods_buttons_section">
							<li>
								<ul class="basic_btn_area">
									
									<li><button type="button" id="buy_btn"
											class="btn_resp size_c color2" onclick="goBuy();">
											<span designElement="text" textIndex="99"
												textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s">구매하기</span>
										</button></li>
								</ul>
							</li>

						</ul>
					</div>
					<!-- ~~~~~~~~~~~ 구매하기 ~~~~~~~~~~~ -->
					<div id="goodsOptionBuySection" class="goods_buy_sections">
						<a href="javascript:void(0);" id="btnSectionClose"
							class="btn_section_close">닫기</a>

						<div class="goods_option_select_area">
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
									<table class="goods_option_table" width="100%" cellpadding="0"
										cellspacing="0" border="0">
										<colgroup>
											<col />
											<col width="15" />
										</colgroup>

										<!-- 필수옵션 시작 -->
										<tr>
											<th colspan="2"><span designElement="text" textIndex="1"
												textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvX3NlbGVjdF9vcHRpb25zLmh0bWw=">상품옵션</span></th>
										</tr>
										<tr class="optionTr">
											<td colspan="2"><span class="optionTitle hide">색상</span>
												<select name="viewOptions[]" id="0" opttype="color">
													<option value="">- 색상 선택 -</option>
													<option value="브라운" price="64000.00"
														consumer_price="90000.00" opt1="브라운" opt2="" opt3=""
														opt4="" opt5="" infomation="" class="" seq="0">브라운</option>
													<option value="라이트브라운" price="64000.00"
														consumer_price="90000.00" opt1="라이트브라운" opt2="" opt3=""
														opt4="" opt5="" infomation="" class="" seq="1">라이트브라운</option>
													<option value="살구색" price="64000.00"
														consumer_price="90000.00" opt1="살구색" opt2="" opt3=""
														opt4="" opt5="" infomation="" class="" seq="2">살구색</option>
													<option value="화이트" price="64000.00"
														consumer_price="90000.00" opt1="화이트" opt2="" opt3=""
														opt4="" opt5="" infomation="" class="" seq="3">화이트</option>
											</select>
												<div class="viewOptionsspecialays color">
													<span class="#6b4d32"><span
														name="viewOptionsspecialbtn"
														class="viewOptionsspecialbtn hand bbs_btn #6b4d32"
														style="color: #6b4d32;" value="브라운" optvalue="브라운"
														price="64000.00" opt1="브라운" opt2="" opt3="" opt4=""
														opt5="" infomation="" eqindex='0'><font
															style="background-color: #6b4d32;">■</font></span></span> <span
														class="#b89f88"><span name="viewOptionsspecialbtn"
														class="viewOptionsspecialbtn hand bbs_btn #b89f88"
														style="color: #b89f88;" value="라이트브라운" optvalue="라이트브라운"
														price="64000.00" opt1="라이트브라운" opt2="" opt3="" opt4=""
														opt5="" infomation="" eqindex='0'><font
															style="background-color: #b89f88;">■</font></span></span> <span
														class="#ebd8c1"><span name="viewOptionsspecialbtn"
														class="viewOptionsspecialbtn hand bbs_btn #ebd8c1"
														style="color: #ebd8c1;" value="살구색" optvalue="살구색"
														price="64000.00" opt1="살구색" opt2="" opt3="" opt4=""
														opt5="" infomation="" eqindex='0'><font
															style="background-color: #ebd8c1;">■</font></span></span> <span
														class="#fff"><span name="viewOptionsspecialbtn"
														class="viewOptionsspecialbtn hand bbs_btn #fff"
														style="color: #fff;" value="화이트" optvalue="화이트"
														price="64000.00" opt1="화이트" opt2="" opt3="" opt4=""
														opt5="" infomation="" eqindex='0'><font
															style="background-color: #fff;">■</font></span></span>
												</div></td>
										</tr>
										<tr id="viewoptionsInfoTr" class="hide">
											<td id="viewOptionsInfo" class="center" colspan="2"></td>
										</tr>
										<!-- 필수옵션 끝 -->


									</table>
									<!-- 옵션 선택 영역 끝 -->
									<div class="goods_quantity_table_container"
										style="display: block">
										<table class="goods_quantity_table" cellpadding="0"
											cellspacing="0">
											<tbody>
												<tr class="quanity_row option_tr" opt_group="2">
													<ul class="num_price">
														<li>
															<button type="button" class="btn_graybox eaMinus"
																onclick="minus();">-</button> <input type="text"
															name="optionEa[0]" value="<%=itemCount%>" id="itemCount">
															<button type="button" class="btn_graybox eaPlus"
																onclick="plus();">+</button>
														</li>
													</ul>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>

							<!-- //상품 옵션 인클루드 -->
						</div>

						<!-- 총 상품 금액 표기 시작-->
						<div class="goods_price_area">
							<table width="100%" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<!-- 단일옵션일 경우 수량 -->
									<td class="total_goods_price"><span
										class="total_goods_tit" designElement="text" textIndex="106"
										textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s">총
											상품금액</span> <span id="total_goods_price"><%=totalPrice%></span>
										&#x20a9;</td>
								</tr>
							</table>
						</div>
						<!-- 총 상품 금액 표기 끝-->
						<div class="goods_buttons_area">
							<ul class="goods_buttons_section">
								<li>

									<ul class="basic_btn_area">
										<li><button type="button" name="addCart" id="addCart"
												onclick="goCart(<%=dto.getItem_num()%>);"
												class="btn_resp size_extra2 NpayNo">
												<span>장바구니</span>
											</button></li>
										<li><button type="button" id="buy" onclick="goBuy();"
												class="btn_resp size_extra2 color2 NpayNo">
												<span>구매하기</span>
											</button></li>
									</ul>

								</li>
							</ul>
						</div>

					</div>


					<!-- 오프라인 쿠폰 -->
					<!-- //오프라인 쿠폰 -->

				</form>
			</div>
			<!-- ++++++++++++++++++++++++ //상품 스펙 ++++++++++++++++++++++++ -->
		</div>
		<!-- 게시판 식별 -->
	<div id="boardlayout">
		<div class="subpage_wrap">
			<div class="subpage_container">
				<div class="title_container">
					<h2>상품 문의</h2>
				</div>
				
				<div id="bbslist">			 
					<%if(boardList.isEmpty()){ %>
					<div class="no_data_area2">등록된 게시글이 없습니다.</div>
					<%}else{ %>
					<ul class="faq_new">
						<li>					
							<%for (SboardDTO board : boardList) {
								String numz = Integer.toString(board.getNum());
							%>
								<div class="question">
									<p class="subject">
										<span class="cat" style="display:inline-block; width:90px;">[<%if(board.getAnswer()==null){%>미처리<%}else{ %>답변완료<%} %>]</span>
										<%if(board.getStatus()==9 && loginMember.getStatus()==9){ %>
										<%}else{ %>
										<%} %>
										
										<% if(board.getStatus()==0) {//일반 게시글인 경우%>
											<span class="hand highlight-link boad_faqview_btn " viewtype="page" pagetype="" viewlink="/board/view?id=faq&amp;seq=12" fileperm_read="" board_seq="<%=numz%>" board_id="faq">
											<a><%=board.getTitle()%></a> &nbsp;&nbsp;
											</span>
										<%}else if(board.getStatus()==1){//비밀 게시글인 경우%>
											<%if(loginMember!=null && (loginMember.getId().equals(board.getId()) || loginMember.getStatus()==9)){//권한이 있는 경우 %>
												<span class="hand highlight-link boad_faqview_btn " viewtype="page" pagetype="" viewlink="/board/view?id=faq&amp;seq=12" fileperm_read="" board_seq="<%=numz%>" board_id="faq">
												<a><%=board.getTitle()%></a> &nbsp;&nbsp;
												</span>
											<%}else{ %>
												<span class="hand highlight-link boad_faqview_btn " viewtype="page" pagetype="" viewlink="/board/view?id=faq&amp;seq=12" fileperm_read="" board_seq="" board_id="faq">
												<a style="color: #5D5D5D">작성자 또는 관리자만 확인 가능합니다</a> &nbsp;&nbsp;
												</span>
											<%} %>
										<%} %>
									</p>
								</div>
								<div id="faqcontent_<%=numz%>" class="answer hide">
									<p>작성자 : <%=board.getWriter()%></p>
									<p>상품번호 : <%=board.getItemnum()%></p>
									<%if(board.getImg()!=null && !board.getImg().equals("null")){ %><br>
									<p>이미지</p>
									<p><img src="<%=request.getContextPath()%>/board/review/image/<%=board.getImg()%>" width="400px"></p><br>
									<%}%>
									<p>문의내용 : <%=board.getContent()%></p><br>
									<%if(board.getAnswer()!=null){ %>
									<p>답변내용 : <%=board.getAnswer() %></p>
									<%} %>
								</div> 
							 <%	}%>			
						</li>
					</ul>
					<%} %>
					<ul class="bbs_top_wrap">
						<li class="right2">
							<span class="searchform">
									<button type="button" class="btn_resp size_b" onclick="location.href='<%=request.getContextPath()%>/index.jsp?workgroup=board/question&work=question_write&category=3'">문의쓰기</button>
							</span>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 게시판 식별 - 문의끝 후기시작 -->
	<div id="boardlayout">
		<div class="subpage_wrap">
			<div class="subpage_container">
				<div class="title_container">
					<h2>상품 후기</h2>
				</div>
				<div id="bbslist">
					
					<%if(boardList2.isEmpty()){ %>
					<div class="no_data_area2">등록된 게시글이 없습니다.</div>
					<%}else{ %>		
					<ul class="faq_new">
						<li>		
							<%
								for (SboardDTO board : boardList2) {
								String numz = Integer.toString(board.getNum());
							%>
								<div class="question" id="question">
									<p class="subject">
										<span class="cat" style="color:#ff6600;display:inline-block; width:90px;"><%=board.getGrade() %></span>
										<span class="hand highlight-link boad_faqview_btn " viewtype="page" pagetype="" viewlink="/board/view?id=faq&amp;seq=12" fileperm_read="" board_seq="<%=numz%>" board_id="faq">
											<a><%=board.getTitle()%></a> &nbsp;&nbsp;
										</span>
									</p>
								</div>
								<div id="faqcontent_<%=numz%>" class="answer hide">
									<p>작성자 : <%=board.getWriter()%></p>
									<%if(board.getImg()!=null && !board.getImg().equals("null")){ %><br>
									<p><img src="<%=request.getContextPath()%>/board/review/image/<%=board.getImg()%>" width="400px"></p><br>
									<%}%>
									<p><%=board.getContent()%></p><br>
								</div>
							 <%	}%>	
						</li>
					</ul>
					<%} %>
					<ul class="bbs_top_wrap">
						<li class="right2"><span class="searchform">
								<button type="button" class="btn_resp size_b" onclick="location.href='<%=request.getContextPath()%>/index.jsp?workgroup=board/review&work=review_write&category=2'">후기 쓰기</button>
						</span></li>
					</ul>

					<script type="text/javascript">
						// FAQ 게시글 보기
						$('.boad_faqview_btn').on('click', function() {
							var board_seq = $(this).attr('board_seq');
							$("#faqcontent_" + board_seq).toggle();
						});
					</script>
				</div>
			</div>
		</div>
	</div>
	<!-- /게시판 식별2 -->
	</div>
	<!-- ================= 파트 페이지들 :: END. ================= -->
</div>

<%--장바구니로 보내기! --%>
<script type="text/javascript">
	function minus() {
		if(document.getElementById('itemCount').value<=1){
			
		document.getElementById('itemCount').value=1;
		}else{
			document.getElementById('itemCount').value--;
		}
		
		
	}
	function plus() {
		document.getElementById('itemCount').value++;
	}
	function goCart(itemno){
		var count = document.getElementById('itemCount').value;
		if($('#0 option:selected').val()==""){
			alert('색상을 선택해주세요');
			return;
		}
		if(itemno==null){
			location.href="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=login";
		}
			
			
		goodsForm.action="<%=request.getContextPath() %>/index.jsp?workgroup=order&work=order_gocart&itemno=<%=itemno%>&color= "+$('#0 option:selected').val()+"&itemcount="+count;
			
		goodsForm.submit();

	} 

	function goBuy() {
		var count = document.getElementById('itemCount').value;
		if($('#0 option:selected').val()==""){
			alert('색상을 선택해주세요');
			return;
		}else{
			
 
		goodsForm.action="<%=request.getContextPath() %>/index.jsp?workgroup=order&work=order_gobuy&itemno=<%=itemno%>&color= "+$('#0 option:selected').val()+"&itemcount="+count;
		
		goodsForm.submit();

		}
	
	}
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


</script>

