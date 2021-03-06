<%@page import="site.semi.dto.SboardDTO"%>
<%@page import="java.util.List"%>
<%@page import="site.semi.dao.SboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %> 
<%
List<SboardDTO> boardList=SboardDAO.getDAO().selectAnswerNull();
%>
<div id="layout_body" class="layout_body">
	<div id="boardlayout">
		<div class="subpage_wrap">
			<%-- <%@include file="/board/board_left.jsp"%> --%>
			<div class="subpage_container">
				<div class="title_container">
					<h2>미처리 상태의 문의</h2>
				</div>
				<div id="bbslist">
				
<ul class="bbs_top_wrap">
	
	<li class="right2">
		<span class="searchform">
			
			<button type="button" class="btn_resp size_b" onclick="location.href='<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=board_manager'">게시글 관리 페이지</button>
			
		</span>
	</li>
</ul>		
					<%if(boardList.isEmpty()){ %>
					<div class="no_data_area2">미처리 문의가 없습니다.</div>
					<%}else{ %>
					
				
					<ul class="faq_new">
						<li>
						<% for(SboardDTO board:boardList) {
							String num=Integer.toString(board.getNum());
						%>
						<form method="post" action="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=board_answernull_action&num=<%=num%>">
						
						<input type="hidden" name="category" value="2">
						<%-- <input type="hidden" name="num" value="<%=num%>"> --%>
							<div class="question">
								<p class="subject">
									<span class="cat">[상품번호 : <%=board.getItemnum() %>]</span> 
									<span class="hand highlight-link boad_faqview_btn " viewtype="page" pagetype="" viewlink="/board/view?id=faq&amp;seq=12" fileperm_read="" board_seq="<%=num%>" board_id="faq">
									<a><%=board.getTitle() %></a> &nbsp;&nbsp; 
									</span>
								</p>
								<p class="add_info">
									<span class="hide">번호: 12</span>
								</p>
							</div>
							<div id="faqcontent_<%=num %>" class="answer hide">
								<p>작성자 : <%=board.getWriter() %></p>
								<p>문의 상품번호 : <%=board.getItemnum() %></p>
								<%if(board.getImg()!=null && !board.getImg().equals("null")){ %>
								<br><p>이미지</p>
								<p><img src="<%=request.getContextPath()%>/board/review/image/<%=board.getImg()%>" width="400px"></p><br>
								<%} %>
								<p>문의내용 : <%=board.getContent() %></p>
								
								<br><!-- <p>답변달기</p> -->
								<textarea rows="10" name="answer" id="answer" placeholder="답변을 입력하세요" style="resize: none;"></textarea>
								
								<ul class="bbs_top_wrap">
									<li class="right2">
										<span class="searchform">	
											<button type="submit" class="btn_resp size_b">답변달기</button>			
										</span>
									</li>
								</ul>	
								
							</div>
							
						</form>
						<%} %>
						</li>
						
					</ul>
					<%} %>
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
</div>