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

	//SmemberDTO loginMember=(SmemberDTO)session.getAttribute("loginMember");
	//String pageNum="1";
	//System.out.println(loginMember.getId());
	
	//관리자만 답변가능
	if(loginMember.getStatus()!=9){
			out.println("<script type='text/javascript'>");
			out.println("alert('관리자만 답변이 가능합니다')");
			out.println("history.go(-1);");//이전 페이지 이동
			out.println("</script>");
			return;
	} 
	
	//게시글 번호를 이용하여 BOARD 테이블에 저장된 해당 게시글을 검색하여 반환하는 DAO 클래스의 메소드 호출
	SboardDTO board=SboardDAO.getDAO().selectNumBoard(num);
	
	ItemDTO item=SboardDAO.getDAO().selectItem(board.getItemnum());
	SproductDTO sproduct=SproductDAO.getDAO().selectNumSproduct(board.getItemnum());
	
	//로그인된 사용자ID, 작성자 ID 비교/관리자확인
	if(loginMember.getStatus()!=9) {
		out.println("<script type='text/javascript'>");
		//out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=member&work=login';");
		out.println("alert('작성자만 답변 작성이 가능합니다')");
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
					<h2>답변달기</h2>
				</div>

				<div id="bbsview">
					<form name="writeform" id="writeform" method="post" action="<%=request.getContextPath()%>/index.jsp?workgroup=board/question&work=question_answer_action">
						<input type="hidden" name="category" value="2">
						<input type="hidden" name="num" value="<%=num%>">
						<input type="hidden" name="pageNum" value="<%=pageNum%>">
						<input type="hidden" name="search" value="<%=search%>">
						<input type="hidden" name="keyword" value="<%=keyword%>">
						
						<input type="hidden" name="itemnum" value="<%if(board.getItemnum()!=0){ %><%=board.getItemnum()%>"<%} %>>
						<%-- <input type="hidden" name="grade" id="grade" value="<%=board.getGrade()%>"> --%>
						<%-- <input type="hidden" name="status" id="status" value="<%=board.getStatus()%>"> --%>
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
										<span class="">
										<input type="checkbox" name="secret" value="1" <% if(board.getStatus()==1) { %> checked="checked" <% } %>>
										<label for="hidden">
										<span>비밀글</span>
										</label>
										</span>
									</td>
								</tr>
								<tr>
									<th><p>문의 상품</p></th>
									<td class="Pt0">
										<!-- 상품선택 & 선택된 상품 -->
										<div class="board_goods_select">
											<div class="btn_area">
											<%if(board.getItemnum()==1 || board.getItemnum()==2 || board.getItemnum()==3 || board.getItemnum()==4 || board.getItemnum()==5 || board.getItemnum()==6){ %>
												<input type="text" name="itemname" id="itemname" value="<%=item.getItem_name()%>" readonly="readonly">
											<%}else{ %>
												<input type="text" name="itemname" id="itemname" value="<%=sproduct.getName()%>" readonly="readonly">
											<%} %>
												<!-- <button type="button" id="issueGoodsButton" class="btn_resp size_b color2">
													<span>상품 선택</span>
												</button> -->
											</div>
										</div>
										<!-- 동영상 사용인 경우( 반응형 1차에서 작업 제외 ) -->
									</td>
								</tr>				
								<tr>
									<th><p>제목</p></th>
									<td>
										<input type="text" name="title" id="subject" value="<%=board.getTitle() %>" class="Wmax" title="제목을 입력해 주세요" placeholder="제목을 입력해 주세요" readonly="readonly">
									</td>
								</tr>
							</tbody>
						</table>

						<textarea name="content" id="contents" class="size3 Mt10" title="내용을 입력하세요" placeholder="내용을 입력하세요" readonly="readonly" style="resize: none;"><%=board.getContent() %></textarea>
						<textarea name="answer" id="answer" class="size3 Mt10" title="답변을 입력하세요" placeholder="답변을 입력하세요" style="resize: none;"><%if(board.getAnswer()!=null){%><%=board.getAnswer()%><%} %></textarea>

					<!-- 	<div class="bbswrite_division">
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
						</div> -->


						<div class="board_detail_btns2">
							<button type="button" class="data_save_btn btn_resp size_c color2" id="savebtn">
								<span>저장</span>
							</button>
							<!-- pageNum=4&search=&keyword=&category=1 -->
							<button type="button" class="btn_resp size_c" onclick="location.href='<%=request.getContextPath()%>/index.jsp?workgroup=board/question&work=question_detail&num=<%=board.getNum()%>&pageNum=<%=pageNum %>&search=<%=search %>&keyword=<%=keyword %>&category=<%=board.getCategory()%>'">
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

/* 별점 넘어가는지 테스트 */
document.getElementById("savebtn").onclick = function() {

	document.writeform.submit();
}


$("#issueGoodsButton").click(function() {
	window.open("<%=request.getContextPath()%>/board/review/product_choice.jsp"
			,"issueGoodsButton", "width=700,height=600,left=600,top=250");
});
</script>