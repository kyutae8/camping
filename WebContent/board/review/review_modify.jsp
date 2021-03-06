<%@page import="site.semi.dao.SproductDAO"%>
<%@page import="site.semi.dto.SproductDTO"%>
<%@page import="site.semi.dto.ItemDTO"%>
<%@page import="site.semi.dao.SboardDAO"%>
<%@page import="site.semi.dto.SboardDTO"%>
<%@page import="site.semi.dto.SmemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@include file="/security/login_check.jspf" %>
<%   
	//비정상인 요청에 대한 응답
	if(request.getParameter("num")==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
	//전달값을 반환받아 저장
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");


	
	//게시글 번호를 이용하여 BOARD 테이블에 저장된 해당 게시글을 검색하여 반환하는 DAO 클래스의 메소드 호출
	SboardDTO board=SboardDAO.getDAO().selectNumBoard(num);
	
	ItemDTO item=SboardDAO.getDAO().selectItem(board.getItemnum());
	SproductDTO sproduct=SproductDAO.getDAO().selectNumSproduct(board.getItemnum());
	
	//로그인된 사용자ID, 작성자 ID 비교
	if(!loginMember.getId().equals(board.getId()) && loginMember.getStatus()!=9) {
		out.println("<script type='text/javascript'>");
		//out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=member&work=login';");
		out.println("alert('작성자만 글 수정이 가능합니다')");
		out.println("history.go(-1);");//이전 페이지 이동
		out.println("</script>");
		return;
	}
	
%>

<div id="layout_body" class="layout_body">
	<div id="boardlayout">
		<div class="subpage_wrap">
			<%@include file="/board/board_left.jsp"%>

			<div class="subpage_container">
				<div class="title_container">
					<h2>공지사항 수정</h2>
				</div>

				<div id="bbsview">
					<form name="writeform" id="writeform" method="post" action="<%=request.getContextPath()%>/index.jsp?workgroup=board/review&work=review_modify_action" enctype="multipart/form-data">
						<input type="hidden" name="category" value="2">
						<input type="hidden" name="num" value="<%=num%>">
						<input type="hidden" name="pageNum" value="<%=pageNum%>">
						<input type="hidden" name="search" value="<%=search%>">
						<input type="hidden" name="keyword" value="<%=keyword%>">
						<input type="hidden" name="itemnum" value="<%=board.getItemnum()%>">
						<input type="hidden" name="grade" id="grade" value="<%=board.getGrade()%>">
						<input type="hidden" name="status" id="status" value="0">
						<input type="hidden" name="currentImg" value="<%=board.getImg()%>">
						<!-- 
						sboard set itemnum=?, grdae=?, title=?, content=?, img=?, status=? where num=?";
						 -->
						<div class="table_top_line1"></div>
						<table id="boardDetailTable" class="table_row_a v2 Thc" width="100%" cellpadding="0" cellspacing="0">
							<colgroup>
								<col class="size_b">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th><p>작성자</p></th>
									<td>
										<input type="text" name="id" value="<%=loginMember.getId() %>" readonly="readonly">
										<!-- <span class=""><input type="checkbox" name="hidden" id="hidden" value="1">
										<label for="hidden">
										<span>비밀글</span>
										</label>
										</span> -->
									</td>
								</tr>
								<tr>
									<th><p>문의 상품</p></th>
									<td class="Pt0">
										<!-- 상품선택 & 선택된 상품 -->
										<div class="board_goods_select">
											<div class="btn_area">
											<%if(board.getItemnum()<=50){ %>
												<input type="text" name="itemname" id="itemname" value="<%=item.getItem_name()%>" readonly="readonly">
											<%}else{ %>
												<input type="text" name="itemname" id="itemname" value="<%=sproduct.getName()%>" readonly="readonly">
											<%} %>
												<button type="button" id="issueGoodsButton" class="btn_resp size_b color2">
													<span>상품 선택</span>
												</button>
											</div>
										</div>
										<!-- 동영상 사용인 경우( 반응형 1차에서 작업 제외 ) -->
									</td>
								</tr>
								
								<!-- 평점 -->
								<tr>
									<th><p>평점</p></th>
									<td>
										<div>
											<table class="scoreboxlay" border="0" cellspacing="0" width="100%">
												<tbody>
													<tr>
														<!-- <div class="review_showScore">★★★★★</div> -->
														<td width="30" class="minus_area"><button type="button" class="btn_graybox eaMinus review_scoreM" id="minus">-</button></td>
														<td width="30%" class="score_area">
															<!-- <input type="hidden" id="starid" name="starname" value=""> -->
															<div class="review_showScore" id="starp"></div>
															
														</td>
														<td width="30" class="plus_area"><button type="button" class="btn_graybox eaPlus review_scoreP" id="plus">+</button></td>
														<td>
															<div class="review_nowScore">
																	<input type="text" class="onlynumber score_avg review_score review_score_number" name="reviewcategory[0][]" size="3" maxlength="2" value="" style="border: none; background: none; text-align: right; width: 10px;">점
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</td>
								</tr>
								<!-- 평점 -->
								
								<tr>
									<th><p>제목</p></th>
									<td>
										<input type="text" name="title" id="subject" value="<%=board.getTitle() %>" class="Wmax" title="제목을 입력해 주세요" placeholder="제목을 입력해 주세요">
									</td>
								</tr>
							</tbody>
						</table>

						<textarea name="content" id="contents" class="size3 Mt10" title="내용을 입력하세요" placeholder="내용을 입력하세요" style="resize: none;"><%=board.getContent() %></textarea>

						<div class="bbswrite_division">
							<table cellpadding="0" cellspacing="0" border="0" class="file_add_table">
								<tbody>
									<tr>
										<th class="width_a"><span designelement="text" textindex="1">첨부파일</span></th>
										<td>
											<input type="file" name="img" id="img">
										</td>
									</tr>

								</tbody>
							</table>
						</div>


						<div class="board_detail_btns2">
							<button type="button" class="data_save_btn btn_resp size_c color2" id="savebtn">
								<span>저장</span>
							</button>
							<!-- pageNum=4&search=&keyword=&category=1 -->
							<button type="button" class="btn_resp size_c" onclick="location.href='<%=request.getContextPath()%>/index.jsp?workgroup=board/review&work=review_detail&num=<%=board.getNum()%>&pageNum=<%=pageNum %>&search=<%=search %>&keyword=<%=keyword %>&category=<%=board.getCategory()%>'">
								<span>취소</span>
							</button>
						</div>

					</form>

				
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
var totalScore = <%=board.getGrade().length()%>; //현재 점수
var MaxScore = 5; //최대 점수
var MinScore = 1; //최저점수 ps.최저 점수가 음수일 경우 에러 발생.
var fullStar; //별로 보여질때 가득찬 별

$(document).ready(function() {
	/* 별점 관련 */
	showStar('0', totalScore);

	$(".review_scoreM").live("click", function() { //마이너스 버튼 클릭시 이벤트
		var idx = $(".review_scoreM").index(this);
		totalScore = $('.review_score').eq(idx).val();
		totalScore--;
		showStar(idx, totalScore);
	});

	$(".review_scoreP").live("click", function() { //플러스 버튼 클릭시 이벤트
		var idx = $(".review_scoreP").index(this);
		totalScore = $('.review_score').eq(idx).val();
		totalScore++;
		showStar(idx, totalScore);
	});

	$('.review_score').bind("change keyup", function() {
		//최대점수는 "+MaxScore+" 입니다.
		if ($(this).val() > MaxScore) {
			alert(getAlert('et074', MaxScore));
			totalScore = MaxScore;
			$(this).val(MaxScore);
		}
		//최저점수는 "+MinScore+"점 입니다.
		else if ($(this).val() < 1) {
			alert(getAlert('et075', MinScore));
			totalScore = MinScore;
			$(this).val(MinScore);
		} else {
			totalScore = $(this).val();
		}
		var idx = $(".review_score").index(this);
		showStar(idx, totalScore);
	});

});

function showStar(idx, totalScore) { //별모양 점수를 보여주기 위한 함수
	$(".review_showScore").eq(idx).text(function() {
		var printStar = ""; //출력할 별 문자형 초기화
		fullStar = totalScore; //가득찬 별의 갯수를 구함

		if (totalScore >= MinScore && totalScore <= MaxScore) { //점수가 최저와 최대 점수 사이일때
			if (totalScore == MinScore) {
				showScore(idx);
				return "★"
			} //점수가 최저일때 "-"문자 출력
			else { //점수가 0이 아닐때 별을 출력
				for (i = 1; i <= fullStar; i++) {
					printStar += "★";
				}
				showScore(idx); //텍스트로 점수 출력
				return printStar;
			}
		} else { //점수가 0과 10사이가 아닐때
			if (totalScore == MaxScore + 1) {
				alert(getAlert('et074', MaxScore));
				totalScore = MaxScore;
				$('.review_score').eq(idx).val(MaxScore);
			} else if (totalScore == (MinScore - 1)) {
				alert(getAlert('et075', MinScore));
				totalScore = MinScore;
				$('.review_score').eq(idx).val(MinScore);
			}
			//showStar(idx);
		}
	});
	$('.review_score').eq(idx).val(totalScore);
}

function showScore(idx) { //텍스트로 점수 출력을 위한 함수
	$(".review_score_number").eq(idx).val(totalScore);
}


/* 별점 넘어가는지 테스트 */
var starpo = document.getElementById('starp').innerHTML;
document.getElementById("savebtn").onclick = function() {
	var starpo = document.getElementById('starp').innerHTML;
	document.getElementById("grade").value = starpo;
	/* alert(document.getElementById("grade").value); */
	document.writeform.submit();
}


$("#issueGoodsButton").click(function() {
	window.open("<%=request.getContextPath()%>/board/review/product_choice.jsp"
			,"issueGoodsButton", "width=700,height=600,left=600,top=250");
});
</script>