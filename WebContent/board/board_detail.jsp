<%@page import="site.semi.dao.SboardDAO"%>
<%@page import="site.semi.dto.SboardDTO"%>
<%@page import="site.semi.dao.CommentDAO"%>
<%@page import="site.semi.dto.CommentDTO"%>
<%@page import="java.util.List"%>
<%@page import="site.semi.dto.SmemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%	
	//비정상인 요청에 대한 응답 
	if(request.getParameter("num")==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
	//String category=request.getParameter("category");
	//전달값을 반환받아 저장
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	
	SboardDTO board=SboardDAO.getDAO().selectNumBoard(num);
	
	//검색된 게시글이 없거나 삭제된 게시글인 경우 - 비정상적인 요청 
	if(board==null || board.getStatus()==9) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
	
	//세션에 저장된 권한 관련 정보(회원정보)를 반환받아 저장
	SmemberDTO loginMember=(SmemberDTO)session.getAttribute("loginMember");
	
	List<CommentDTO> commentList=CommentDAO.getDAO().selectCommentList(num);
	int count=CommentDAO.getDAO().selectCommentCount(num);
	
	//System.out.print(board.getCategory());
	//System.out.print(board.getAnswer()); 
%>


<div id="layout_body" class="layout_body">
	<div id="boardlayout">
		<div class="subpage_wrap">
			<%@include file="/board/board_left.jsp"%>

			<div class="subpage_container">
				<div class="title_container">
					<h2>공지사항</h2>
				</div>

				<div id="bbsview">

					<form name="form1" id="form1" method="post" action="../board_process" target="actionFrame">
						<input type="hidden" name="mode" id="mode" value="">
						<input type="hidden" name="board_id" id="board_id" value="goods_qna">
						<input type="hidden" name="reply" id="reply" value="">
						<input type="hidden" name="seq" id="board_seq" value="4">
						<input type="hidden" name="popup" value="">
						<input type="hidden" name="iframe" value="">
						<input type="hidden" name="goods_seq" value="">

						<div class="board_detail_title">
							<%=board.getTitle() %>
						</div>
						<table class="table_row_a Thc">
							<colgroup>
								<col class="size_b">
								<col>
								<col class="size_b">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th><p>분류</p></th>
									<td>공지사항</td>
									<th><p>작성자</p></th>
									<td><%=board.getWriter() %></td>
								</tr>
								<tr>
									<th><p>등록일</p></th>
									<td><%=board.getRegdate() %></td>
									<th><p>조회수</p></th>
									<td></td>
								</tr>
							</tbody>
						</table>

						<div class="board_detail_contents">
							<br><%=board.getContent().replace("\n", "<br>")%><br><br>
						</div>


						<%-- <%if(){//상품정보가 있을 경우 %>
						<%} %> --%>
					<%-- 	<div class="goods_origin_info">
							<h4 class="title">
								<span>상품 정보,<%=board.getItemnum() %></span>
							</h4>
							<!-- 상품 정보 노출( 스킨단에서 html 수정 불가. CSS로만 수정하세요. ) -->
							상품정보가 없습니다
						</div>

						
						<!-- 관리자 답변 -->
						<div class="board_detail_contents">
						<p>----------------------------------------------------</p>
							관리자의 답변영역
						<p>----------------------------------------------------</p>
						</div> --%>
					</form>



					<div class="board_comment_area" id="comment_container">

						<div class="cmt_division v2">
							<div class="content title_area">
								<span class="title">댓글</span> <strong class="num pointcolor"><%=count %></strong> &nbsp;
								<!-- 댓글 등록 버튼 -->
								 <!-- <input type="button" name="board_comment_btn" id="board_comment_btn_4" seq="4" value="▲" class="board_comment_btn btn_resp size_b isopen"> -->
							</div>
						</div>

						<div class="cmt_division v3">
							<table class="cmt_tbl" cellpadding="0" cellspacing="0" border="0" width="100%">
							<% for(CommentDTO comment:commentList) { %>
								<tbody>
									<tr>
										<td class="cmt_area cmt_cont_head">
											<span class="iconhidden"></span> <strong><%=comment.getCwriter() %></strong> <span class="desc">&nbsp;<%=comment.getCdate() %></span>
										</td>
									</tr>
									<tr>
										<td class="cmt_area cmt_contents" style="font-weight: normal;">
											<div style="left: 0; word-wrap: break-word; word-break: break-all;">
												<span><%=comment.getCcontent() %></span>
											</div>
										

											<div class="pdt10">
											<%-- <form id="CommentForm" method="post">
											<input type="hidden" name="num" value="<%=comment.getCnum()%>">
											<input type="hidden" name="pageNum" value="<%=pageNum%>">
											<input type="hidden" name="search" value="<%=search%>">
											<input type="hidden" name="keyword" value="<%=keyword%>">
											<input type="hidden" name="category" value="<%=board.getCategory()%>">
											</form> --%>
												<!-- <span class="btn_resp size_a " name="boad_cmt_reply_btn" board_cmt_seq="1" board_cmt_idx="1" alt="답글쓰기" title="답글쓰기" designelement="text" textindex="2" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvYm9hcmQvX2NvbW1lbnQuaHRtbA==">답글</span> <span class="btn_resp size_a " name="boad_cmt_modify_btn" board_cmt_seq="1" alt="답글수정" title="답글수정" designelement="text" textindex="3" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvYm9hcmQvX2NvbW1lbnQuaHRtbA==">수정</span> <span class="btn_resp size_a " name="boad_cmt_delete_btn" board_cmt_seq="1" alt="답글삭제" title="답글삭제" designelement="text" textindex="4" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvYm9hcmQvX2NvbW1lbnQuaHRtbA==">삭제</span> -->
												<%if(loginMember!=null){ %>
												<%--원본 <span class="btn_resp size_a" id="deleteComment" onclick="location.href='<%=request.getContextPath() %>/index.jsp?workgroup=board/comment&work=comment_delete_action&num=<%=num%>&cnum=<%=comment.getCnum()%>&pageNum=<%=pageNum%>&search=<%=search %>&keyword=<%=keyword %>&category=<%=board.getCategory() %>';">삭제</span> --%>
												<span class="btn_resp size_a" id="deleteComment" onclick="if(confirm('정말로 댓글을 삭제 하시겠습니까?')) {location.href='<%=request.getContextPath() %>/index.jsp?workgroup=board/comment&work=comment_delete_action&num=<%=num%>&cnum=<%=comment.getCnum()%>&pageNum=<%=pageNum%>&search=<%=search %>&keyword=<%=keyword %>&category=<%=board.getCategory() %>';}">
												삭제
												</span>
												<%} %>  
												<!-- 댓글평가 -->

											</div>

										</td>
									</tr>
								</tbody>
								<%} %>
							</table>
						</div>
						<div id="cwrite" class="">
							<div id="cmt_insert_4" class="cmt_contents cmt_insert hide" style="display: block;">
<!-- 								<form name="cmtform_4" id="cmtform_4" method="post" action="../board_comment_process" target="commentactionFrame"> -->
								<form name="cmtform_4" id="cmtform_4" method="post" action="<%=request.getContextPath()%>/index.jsp?workgroup=board/comment&work=comment_write_action" >
									
									<input type="hidden" name="bnum" value="<%=board.getNum()%>">
									<%if(loginMember!=null){ %>
									<input type="hidden" name="cid" value="<%=loginMember.getId()%>">
									<input type="hidden" name="cwriter" value="<%=loginMember.getName()%>">
									<%} %>
									<%-- 게시글 변경 입력페이지와 삭제 처리 페이지를 요청할 때 전달하기 위한 값 --%>
									<input type="hidden" name="num" value="<%=board.getNum()%>">
								
									<%-- 게시글 목록 출력페이지를 요청할 때 전달하기 위한 값 --%>
									<input type="hidden" name="pageNum" value="<%=pageNum%>">
									<input type="hidden" name="search" value="<%=search%>">
									<input type="hidden" name="keyword" value="<%=keyword%>">
									
									<input type="hidden" name="category" value="<%=board.getCategory()%>">
									<!-- <input type="hidden" name="ccontent" value="4"> -->
									
									<table class="cmt_box" cellpadding="0" cellspacing="0">
										<tbody>
											<tr>
												<td class="its-td">
													<textarea name="ccontent" id="cmtcontent" class="size1 required line" 
													<%if(loginMember==null){ %>
													title="댓글을 입력해 주세요." placeholder="로그인 사용자만 댓글 작성이 가능합니다." readonly="readonly"
													<%}else{%>
													title="댓글을 입력해 주세요." placeholder="댓글을 입력해 주세요."
													<%} %> style="resize: none;"></textarea>
												</td> 
											</tr>
											<tr>
												<td class="its-td">
													<%if(loginMember!=null){ %>
													<button type="button" class="btn_resp size_b" name="board_commentsend" id="board_commentsend" seq="4">댓글등록</button>
													<%} %>
												</td>
											</tr>
										</tbody>
									</table>
								</form>
								<script type="text/javascript">
									$("#board_commentsend").click(function() {
										<%-- $("#cmtform_4").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=board&work=board_list"); --%>
										$("#cmtform_4").submit();
									});
								</script>
							</div>
						</div>
						<!-- 페이징 -->
						<div id="cmtpager" align="center" class="paging_navigation" style="display: none;">
							<p>
								<a class="on" style="color: #ff9102">1</a>
							</p>
							<p></p>
						</div>
						<!-- 페이징 -->
						<!-- <iframe name="commentactionFrame" src="" frameborder="0" width="0" height="0" class="hide"></iframe> -->


						<script type="text/javascript">
							$(document).ready(function() {
								// 페이징 개수가 1개일때 노출 X
								var pagingTotalNum = $('#cmtpager a').length;
								if (pagingTotalNum < 2) {
									$('#cmtpager').hide();
								}
							});
						</script>
						<!-- //게시글 댓글/덧글 인클루드 -->
					</div>



					<!-- 하단 각종 버튼 -->
					<ul class="board_detail_btns">
						<li class="left"><button type="button" id="listBtn" name="boardviewclose" class="btn_resp size_b color5">
								<span>목록</span>
							</button></li>
						<li class="right">
						<%if(loginMember!=null){ %>
							<%if(loginMember.getStatus()==9){ %>
							<button type="button" id="modifyBtn" name="goods_boad_modify_btn" board_seq="4" board_id="goods_qna" class="btn_resp size_b">
								<span>수정</span>
							</button>

							<button type="button" id="removeBtn" name="goods_boad_delete_btn" board_seq="4" board_id="goods_qna" class="btn_resp size_b">
								<span>삭제</span>
							</button>

							<!-- <button type="button" id="goods_boad_reply_btn" board_seq="4" board_id="goods_qna" class="btn_resp size_b">
								<span>답변</span>
							</button> -->
							<button type="button" id="goods_boad_write_btn" board_id="goods_qna" class="btn_resp size_b color2" onclick="location.href='<%=request.getContextPath()%>/index.jsp?workgroup=board&work=board_write&category=<%=board.getCategory()%>'">
								공지사항 <span>쓰기</span>
							</button>
							<%} %>
						<%} %>
						</li>
					</ul>
					<!-- //버튼 -->				
					<!-- //댓글 비회원 비밀번호 확인 -->		
					<!-- //게시글 비회원 비밀번호 확인 -->

					<div id="openDialogLayer" style="display: none">
						<div align="center" id="openDialogLayerMsg"></div>
					</div>
					<script type="text/javascript">
						function getboardLogin() {
							//해당 서비스를 이용하시려면 관리자에게 문의하여 주시길 바랍니다.
							openDialogAlert(getAlert('et132'), '450', '140');
						}

						function getcmtMbLogin() {
							//글작성자만 이용가능합니다.
							openDialogAlert(getAlert('et131'), '400', '140');
						}
					</script>
					<!-- ------- //각각의 게시판 view.html( 게시물 상세 ) 로드 ------- -->
					<form id="boardForm" method="post">
					<%-- 게시글 변경 입력페이지와 삭제 처리 페이지를 요청할 때 전달하기 위한 값 --%>
					<input type="hidden" name="num" value="<%=board.getNum()%>">
				
					<%-- 게시글 목록 출력페이지를 요청할 때 전달하기 위한 값 --%>
					<input type="hidden" name="pageNum" value="<%=pageNum%>">
					<input type="hidden" name="search" value="<%=search%>">
					<input type="hidden" name="keyword" value="<%=keyword%>">
					
					<input type="hidden" name="category" value="<%=board.getCategory()%>">
					</form>
					<script type="text/javascript">
					$("#removeBtn").click(function() {
						if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
							$("#boardForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=board&work=board_remove_action");
							$("#boardForm").submit();		
						}
					});
					
					$("#modifyBtn").click(function() {
						$("#boardForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=board&work=board_modify");
						$("#boardForm").submit();	
					});
					
					$("#listBtn").click(function() {
						$("#boardForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=board&work=board_list");
						$("#boardForm").submit();
					});
					</script>
				</div>

				<!--  -->
			</div>

		</div>
	</div>
</div>