<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="layout_body" class="layout_body">

<div id="boardlayout" >
	<div class="subpage_wrap">

		<div id="subpageLNB" class="subpage_lnb">

<div id="boardLnbCommon">
	<h2 class="title1"><a href="index.jsp?workgroup=company&work=cs" >CS CENTER</a></h2>
	<ul class="lnb_sub">
			<li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=board&work=board_list&category=1">공지사항</a></li>
			<li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=board&work=qa&category=5">자주 묻는 질문</a></li>
			<li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=board/question&work=question_list&category=3">상품문의</a></li>
			<li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=board/review&work=review_list&category=2">상품후기</a></li>
	</ul>
</div>
<script>
$(function() {
	// 고객센터 LNB 텍스트 수정기능으로 삭제시, 클라이언트단에서 삭제 처리
	$('#boardLnbCommon a').each(function(e) {
		if ( $(this).text() == '' ) {
			$(this).parent('li, h2').remove();
		}
	});
});
</script>
			<!-- ------- //고객센터 LNB 인클루드 ------- -->
		</div>

		<!-- +++++ cscenter contents ++++ -->
		<div class="subpage_container">
			<!-- 전체 메뉴 -->
			<a id="subAllButton" class="btn_sub_all" href="javascript:void(0)" designElement="text" textIndex="1"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvc2VydmljZS9jcy5odG1s" >MENU</a>

			<!-- -->
			

			<!-- 타이틀 -->
			<div class="title_container2">
				<h3 class="title_sub6"><span designElement="text" textIndex="8"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvc2VydmljZS9jcy5odG1s" >자주 묻는 질문</span> <span class="top5" designElement="text" textIndex="9"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvc2VydmljZS9jcy5odG1s" >TOP5</span></h3>
			</div>
			
			<ul class="faq_new v2">
				<li>
					<div class="question">
						<p class="subject pointer boad_faqview_btn" board_seq="12"> <span class="cat">[기타]</span> 퍼스트몰 올인원에서는 재고 없이 출고(공급처 배송)할 방법이 없나요?    </p>
						<p class="add_info">
							<span class="hide">번호:  4</span>
						</p>
					</div>
					<div id="faqcontent_12" class="answer hide">								
						<p>퍼스트몰 올인원에서도 '공급처 배송 상품'의 경우, 무재고 출고가 가능합니다.</p><p><br></p><p>1. [판매상품]-[[실물]상품]에서 기존과 동일한 방법으로 상품을 등록합니다.</p><p>&nbsp; &nbsp;다만, '재고 변화에 따른 상품판매 여부'를 '재고와 상관없이 판매'로 변경하여 등록합니다.</p><p>&nbsp; &nbsp;(다른 설정은 상품의 상태를 정상으로 변경할 수 없습니다.)</p><p><br></p><p>2. [재고관리]-[상품관리] 메뉴에서 등록한 상품을 클릭하여, '공급처 배송'에 체크하고, 발주정보를 등록합니다.</p><p>&nbsp; &nbsp;(※ '공급처 배송'의 경우에도 '거래처별 발주정보'는 꼭 입력하여야 합니다.)</p><p><br></p><p>3. 판매 준비가 완료 되었으면, 상품의 상태를 '정상'으로 변경합니다.</p><p><br></p><p>4. '공급처 배송' 상품의 경우에는 재고가 없더라도 출고가 가능합니다.</p><p><br></p><p>5. '공급처 배송' 상품은 출고 시, 출고 수량만큼 자동입고 후 출고 되기 때문에 [발주/입고]-[입고]메뉴에 비정규입고가 쌓이게 됩니다.</p>
					</div>
				</li>
				<li>
					<div class="question">
						<p class="subject pointer boad_faqview_btn" board_seq="11"> <span class="cat">[기타]</span> 이니시스 전자결제 세팅은 어떻게 하나요?    </p>
						<p class="add_info">
							<span class="hide">번호:  3</span>
						</p>
					</div>
					<div id="faqcontent_11" class="answer hide">								
						<p>전자결제 세팅은 [설정]-[전자결제]에서 할 수 있습니다.</p><p><br></p><p>이니시스의 경우 일반 세팅(GBF 코드)과 에스크로 세팅(ESGB 코드) 정보가 따로 있습니다.</p><p>이니시스에서 계약이 완료되면 일반 GBF와 에스크로 ESGB로 시작되는 메일을 보내주며, 각 파일을 다운로드 받아 압축을 해제하면 파일 4개가 있습니다. txt파일 제외 순차적으로 업로드 해주시기 바랍니다.</p><p><br></p><p>※ 아래 1, 2, 3번의 값은 이니시스에서 보내온 메일안에서 확인할 수 있습니다.</p><p>1. 이니시스에서 제공받은 'GBF로 시작하는 아이디'를 입력 합니다.&nbsp;</p><p>2. 키패스워드에는 '1111' 을 입력 합니다.</p><p>3. 메일에서 파일을 다운 받은후 압축을 풀어 파일을 업로드 합니다.&nbsp;</p><p>4. 이니시스 가맹점 관리자에서 사인키를 확인한 후 입력합니다.&nbsp;</p><p>&nbsp; 1) 상점정보를 클릭합니다.</p><p>&nbsp; 2) 부가정보를 클릭합니다.</p><p>&nbsp; 3) 웹결제 signkey생성조회를 클릭합니다.</p><p>&nbsp; 4) 생성/갱신을 클릭하여 사인키를 확인할 수 있습니다.</p><p><br></p><p>&nbsp; ※ 하단 에스크로 세팅은 ESGB코드와 키패스워드 1111를 등록하고, 사인키(signkey)를 위와 같이 이니시스에서 에크스로 ID로 로그인하여 따로 확인하여 입력 후, 파일을 등록하시면 됩니다.</p>
					</div>
				</li>
				<li>
					<div class="question">
						<p class="subject pointer boad_faqview_btn" board_seq="10"> <span class="cat">[기타]</span> 독립몰을 사용 중인데, 프로그램 및 DB 수정을 하려고 합니다. 어떻게 해야 하나요?    </p>
						<p class="add_info">
							<span class="hide">번호:  2</span>
						</p>
					</div>
					<div id="faqcontent_10" class="answer hide">								
						<p>독립형 퍼스트몰에서 프로그램 및 DB에 접근하시려면 FTP권한변경 신청을 하셔야 합니다.</p><p><br></p><p>1. https://www.firstmall.kr MY퍼스트몰에 접속합니다.</p><p>2. FTP권한변경할 도메인을 클릭합니다.</p><p>3. 호스팅정보에서 FTP 권한 변경을 클릭합니다.</p><p>4. FTP권한변경에 대한 절차와 안내에 대해서 동의후 진행하여 주시면 됩니다.</p><p><br></p><p>단, 프로그램 및 DB 접근 이후에는 자동 업그레이드/패치는 지원되지 않으며 수동으로 진행해 주셔야 합니다.</p><p>업그레이드/패치 게시판: https://www.firstmall.kr/customer/patch#page-1</p>
					</div>
				</li>
				<li>
					<div class="question">
						<p class="subject pointer boad_faqview_btn" board_seq="9"> <span class="cat">[기타]</span> 카카오페이 계약 및 설정은 어디서 하나요?    </p>
						<p class="add_info">
							<span class="hide">번호:  1</span>
						</p>
					</div>
					<div id="faqcontent_9" class="answer hide">								
						<p>카카오페이 설정 및 계약은 관리자페이지 內 '설정 - 전자결제' 메뉴에서 할 수 있습니다.</p><p><br></p><p>&lt;카카오페이 신청&gt;</p><p>1. 하단에서&nbsp; 카카오페이의 '온라인 신청하기'를 클릭하여 신청합니다.</p><p>2. '계약서류 다운로드'를 클릭하여 계약서를 작성하고 첨부서류를 준비하여 LG CNS로 우편발송합니다.</p><p>&nbsp; &nbsp; (주소는 계약서류에서 확인할 수 있습니다.)</p><p><br></p><p>&lt;카카오페이 설정&gt;</p><p>1. 카카에페이 사용여부를 선택합니다.</p><p>1. 카카오페이에서 '세팅정보'를 받아서 입력합니다.</p><p>2. 결제방법을 설정후 저정합니다.</p>
					</div>
				</li>
				<li>
					<div class="question">
						<p class="subject pointer boad_faqview_btn" board_seq="8"> <span class="cat">[기타]</span> FTP이용하지않고 이미지를 올리수 있나요?    </p>
						<p class="add_info">
							<span class="hide">번호:  0</span>
						</p>
					</div>
					<div id="faqcontent_8" class="answer hide">								
						<p style="text-align: left;">퍼스트몰의 EYE Editor를 통하여 이미지 등록을 하실 수 있습니다.</p><p style="text-align: left;"><br></p><p style="text-align: left;"><img src="../../interface.firstmall.kr/firstmall_plus/sample_img/responsive_ver1_default_gl/board/faq/813df9c250157769472e78c9b0243b5b1018531.jpg" class="txc-image" style="clear:none;float:none;" /></p><p style="text-align: left;"><br></p><p style="text-align: left;">① 이미지를 업로드할 폴더를 선택 합니다.</p><p style="text-align: left;">② 이미지 업로드 버튼을 클릭합니다.</p><p style="text-align: left;">③ 업로드 할 이미지파일을 선택합니다.</p><p style="text-align: left;">④ 업로드 버튼을 클릭합니다.</p><p style="text-align: left;"><br></p><p style="text-align: left;"><img src="../../interface.firstmall.kr/firstmall_plus/sample_img/responsive_ver1_default_gl/board/faq/94a4318dbaea288106b13460b111d2e01019121.jpg" class="txc-image" style="clear:none;float:none;" /></p><p style="text-align: left;"><br></p><p style="text-align: left;"><br></p><p style="text-align: left;">이미지가 업로드된것을 확인하실수 있으며, 해당 파일명에서 마우스 우클릭 - [주소복사]를 클릭하셔서 원하시는 위치에 붙여넣기하여 이용하실 수 있습니다.</p>
					</div>
				</li>
			</ul>
			<script type="text/javascript">
			// FAQ 게시글 보기
			$('.boad_faqview_btn').on('click', function() { 
				var board_seq = $(this).attr('board_seq');
				$("#faqcontent_"+board_seq).toggle();
			}); 
			</script>


		</div>
		<!-- +++++ //cscenter contents ++++ -->
	</div>
	</div>
	</div>