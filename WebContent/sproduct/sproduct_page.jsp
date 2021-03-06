<%@page import="site.semi.dto.SmemberDTO"%>
<%@page import="site.semi.dao.SboardDAO"%>
<%@page import="site.semi.dto.SboardDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="site.semi.dao.SproductDAO"%>
<%@page import="site.semi.dto.SproductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
 	int num=Integer.parseInt(request.getParameter("num"));

 	SproductDTO sproduct=SproductDAO.getDAO().selectNumSproduct(num);
	SmemberDTO loginMember=(SmemberDTO)session.getAttribute("loginMember");
 	List<SboardDTO> boardList=SboardDAO.getDAO().selectQA(num);
 	List<SboardDTO> boardList2=SboardDAO.getDAO().selectRV(num);

	String category=request.getParameter("category");
	if(category==null) category="ALL";	
 	
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
		&nbsp;&nbsp;메인페이지<a class="home" href="<%=request.getContextPath()%>/index.jsp">&nbsp;&nbsp;홈</a>
	</div>


	<!-- 타이틀 -->
	<div class="detail_title_area">
		<h3 class="name"><%=sproduct.getName()%></h3>	
			<div><p class="summary"><%=sproduct.getDetail()%></p></div>
	</div>
<form name="goodsForm" method="post" id="goodsForm">
<input type="hidden" name="num" value="<%=sproduct.getNum() %>">
<input type="hidden" name="name" value="<%=sproduct.getName() %>">
<input type="hidden" name="image" value="<%=sproduct.getImage() %>">
<input type="hidden" name="price2" value="<%=sproduct.getPrice() %>">

	<div id="goods_view">
		<div class="goods_thumbs_spec">
			<div id="goods_thumbs">
						<img src="<%=request.getContextPath() %>/sproduct_image/mheader<%=num%>.png"  title="" />
				<div class="slides_container hide" style="position: relative;">
					<div class="viewImgWrap">
					</div>
				</div>
			</div>

			<!-- ++++++++++++++++++++++++ 상품 스펙 ++++++++++++++++++++++++ -->
			<div id="goods_spec">
					<input type="hidden" name="goodsSeq" value="49" />


					<ul class="goods_spec_sections">

						<!-- ~~~~~ 가격, 할인율, 할인내역 ~~~~~ -->
						
						<li class="goods_spec_sub_info">
							<ul class="detail_spec_table">
								<li class="th"><span designElement="text" textIndex="200"
									textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s">상품이름</span></li>
								<li><span class="gray_06" designElement="text"textIndex="200"extTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s">
									<%=sproduct.getName() %></span></li>
								<li class="btn_area1"></li>
							</ul>
						</li>
						<li class="goods_spec_brand">
							<ul class="detail_spec_table">
								<li class="th"><span designElement="text" textIndex="81"
									textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s">상품정보</span></li>
								<li><span class="gray_06" designElement="text"textIndex="200"extTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s">
									<%=sproduct.getDetail() %></span></li>
								
							</ul>
						</li>
						<li class="goods_spec_brand">
							<ul class="detail_spec_table">
								<li class="th"><span designElement="text" textIndex="81"
									textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s">상품색상</span></li>
								<li>
									<span class="gray_06" >
										<select name="category" id="category">
											<option value="RED" <% if(category.equals("RED")) { %> selected="selected" <% } %>>빨강</option>		
											<option value="GREEN" <% if(category.equals("GREEN")) { %> selected="selected" <% } %>>초록</option>		
											<option value="YELLOW" <% if(category.equals("YELLOW")) { %> selected="selected" <% } %>>노랑</option>		
										</select>
									</span>
								</li>
							<li class="goods_spec_brand">
							<ul class="detail_spec_table">
								<li class="th"><span designElement="text" textIndex="81"
									textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s">상품수량</span></li>
								<li><span class="gray_06" >
										<select id="su" name="su">
											<option value="1" <% if(category.equals("1")) { %> selected="selected" <% } %>>1</option>
											<option value="2" <% if(category.equals("2")) { %> selected="selected" <% } %>>2</option>
											<option value="3" <% if(category.equals("3")) { %> selected="selected" <% } %>>3</option>
											<option value="4" <% if(category.equals("4")) { %> selected="selected" <% } %>>4</option>
											<option value="5" <% if(category.equals("5")) { %> selected="selected" <% } %>>5</option>
										</select></span></li>
								
							</ul>
						</li>		
							</ul>
						</li>
							</ul>
						</li>
						<!-- ~~~~~ //상품정보 ~~~~~ -->
						<!-- ~~~~~ 브랜드 ~~~~~ -->
						<!-- ~~~~~ //브랜드 ~~~~~ -->
					</ul>

					<!-- ~~~~~~~~~~~ 구매하기 열기 섹션( 모바일 전용 ) ~~~~~~~~~~~ -->
					
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
										textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s">개당 상품금액</span>
										<span id="don"><%=sproduct.getPrice() %></span>&nbsp;&#x20a9;</td>
								</tr>
							</table>
								<tr>
									<!-- 단일옵션일 경우 수량 -->
									<td class="total_goods_price"><span
										class="total_goods_tit" designElement="text" textIndex="106"
										textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvZ29vZHMvdmlldy5odG1s">총 상품금액</span>
										<span id="total_goods_price"><span id="sum"></span></span>&nbsp;&#x20a9;</td>
								</tr>
							</table>
						</div>
						<!-- 총 상품 금액 표기 끝-->
						<div class="goods_buttons_area">
							<ul class="goods_buttons_section">
								<li>
									<ul class="basic_btn_area">
										<li><button type="button" id="addcart" onclick="sproduct_cart_action();" >
											<span>장바구니</span></button></li>
										<li><button type="button" id="buy" class="btn_resp size_extra2 color2 NpayNo">
												<span>구매하기</span>
											</button></li>
									</ul>

								</li>
							</ul>
						</div>

					</div>


					<!-- 오프라인 쿠폰 -->
					<!-- //오프라인 쿠폰 -->

			</div>
		</div>
	</form>
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
									<%if(board.getImg()!=null && !board.getImg().equals("null")){ %>
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
									<%if(board.getImg()!=null && !board.getImg().equals("null")){ %>
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
	
</div>
<%--장바구니로 보내기! --%>
<script type="text/javascript">
$("#addcart").click(function() {
	$("#goodsForm").attr("method","post");
	$("#goodsForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=sproduct&work=sproduct_cart_action&num=<%=sproduct.getNum()%>");
	$("#goodsForm").submit(); 	
});

$("#buy").click(function() {
	$("#goodsForm").attr("method","post");
	$("#goodsForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=sproduct&work=order_action&num=<%=sproduct.getNum()%>");
	$("#goodsForm").submit(); 	
	alert("비로그인시 비회원구매페이지 / 로그인시 구매페이지");
});

</script>
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

	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	function calc() {
		var don=$("#don").text();
		var su=$("#su").val();
		$("#sum").text(numberWithCommas(don*su));
	}
	
	calc();
	
	$("#su").change(calc);
	


</script>

