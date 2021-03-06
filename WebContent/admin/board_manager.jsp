<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="site.semi.dto.SmemberDTO"%>
<%@page import="site.semi.dto.SboardDTO"%>
<%@page import="java.util.List"%>
<%@page import="site.semi.dao.SboardDAO"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %> 
<%
	String category = request.getParameter("category");
	if (category == null) category = "ALL";
	if (category.equals("null")) category = "ALL";
	//System.out.print(category);
	String search=request.getParameter("search");//컬럼명
	if(search==null) search="";
	String keyword=request.getParameter("keyword");//검색어
	if(keyword==null) keyword="";
	
	/* 페이징 처리*/
	int pageNum=1;
	if(request.getParameter("pageNum")!=null) {//전달값이 존재하는 경우
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
	}
	
	int pageSize=5; 
	
	int totalBoard=SboardDAO.getDAO().adminBoardCount(category, search, keyword);
	int totalPage=(int)Math.ceil((double)totalBoard/pageSize);
	
	if(pageNum<=0 || pageNum>totalPage) {//페이지 번호가 비정상적인 경우
		pageNum=1;
	}
	
	int startRow=(pageNum-1)*pageSize+1;
	int endRow=pageNum*pageSize;

	if(endRow>totalBoard) {
		endRow=totalBoard;
	}
	
	List<SboardDTO> boardList=SboardDAO.getDAO().adminBoardList(category, startRow, endRow, search, keyword);
	
	int number=totalBoard-(pageNum-1)*pageSize;
	
	//SmemberDTO loginMember=(SmemberDTO)session.getAttribute("loginMember");
	String currentDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	
%>
<%--공지사항 페이지 --%>

<div id="layout_body" class="layout_body">

	<div id="boardlayout">
		<div class="subpage_wrap">

			<div class="subpage_container">
				<div class="title_container">
					<h2>게시판 관리</h2>
				</div>
				<div id="bbslist">
					<!-- 검색 -->
					
					
					<%-- <form method="post" name="boardsearch" id="boardsearch">
						<ul class="bbs_top_wrap">
							<li class="left">
								<select name="category" id="category" class="line category">
									<option value="ALL" <% if(category.equals("ALL")) { %> selected="selected" <% } %>>카테고리 전체</option>
									<option value="1" <% if(category.equals("1")) { %> selected="selected" <% } %>>공지사항</option>
									<option value="2" <% if(category.equals("2")) { %> selected="selected" <% } %>>상품후기</option>
									<option value="3" <% if(category.equals("3")) { %> selected="selected" <% } %>>상품문의</option>
									<option value="9" <% if(category.equals("9")) { %> selected="selected" <% } %>>삭제게시글</option>
								</select>
							</li>
						
							<li class="right2">
							<select name="search">
								<option value="title">&nbsp;제목&nbsp;</option>
								<option value="content">&nbsp;내용&nbsp;</option>
								<option value="writer">&nbsp;작성자이름&nbsp;</option>
							</select>
							<span class="searchform"> 
							<input type="text" name="keyword" id="search_text" class="res_bbs_search_input" <%if(keyword!=null){ %>value="<%=keyword %>" <%} %>title="검색내용" placeholder="검색내용">
							<button type="submit" class="btn_resp size_b">검색</button>
							</span>
							</li>
						</ul>
					</form> --%>
					
						<ul class="bbs_top_wrap"> 
							<li class="left">
							<form method="post" name="categoryForm" id="categoryForm" action="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=board_manager">
								<select name="category" id="category" class="line category">
									<option value="ALL" <% if(category.equals("ALL")) { %> selected="selected" <% } %>>카테고리 전체</option>
									<option value="1" <% if(category.equals("1")) { %> selected="selected" <% } %>>공지사항</option>
									<option value="2" <% if(category.equals("2")) { %> selected="selected" <% } %>>상품후기</option>
									<option value="3" <% if(category.equals("3")) { %> selected="selected" <% } %>>상품문의</option>
									<option value="9" <% if(category.equals("9")) { %> selected="selected" <% } %>>삭제게시글</option>
								</select>
							</form>
							</li>
							<li class="right2">
							<form method="post" name="boardsearch" id="boardsearch" action="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=board_manager&category=<%=category%>">
							<select name="search">
								<option value="title" <%if(search.equals("title")){%>selected="selected"<%} %>>&nbsp;제목&nbsp;</option>
								<option value="content" <%if(search.equals("content")){%>selected="selected"<%} %>>&nbsp;내용&nbsp;</option>
								<option value="writer" <%if(search.equals("writer")){%>selected="selected"<%} %>>&nbsp;작성자이름&nbsp;</option>
							</select>
							<span class="searchform"> 
							<input type="text" name="keyword" id="search_text" class="res_bbs_search_input" <%if(keyword!=null){ %>value="<%=keyword %>" <%} %>title="검색내용" placeholder="검색내용">
							<button type="submit" class="btn_resp size_b">검색</button>
							</span>
							</form>
							</li>
						</ul>
					

					<%-- <div class="article_info">게시글 목록(게시글 갯수 : <%=totalBoard %>)</div> --%>

					
					<% if(totalBoard==0) { %>
						<div class="no_data_area2">등록된 게시글이 없습니다.</div>
					<% } else { %>
					<form name="boardForm" id="boardForm">
					<input type="hidden" name="category" value="<%=category%>">
					<div class="res_table">
							<ul class="thead">
								<!-- <li style="width: 45px;"><span designelement="text" textindex="1" >번호</span></li> -->
								<li style="width: 45px;"><!-- <span designelement="text" textindex="1" ></span> -->
									<input type="checkbox" name="allCheck" id="allCheck">
								</li>
								<li style="width: 60px;"><span designelement="text" textindex="1" >NUM</span></li>
								<li style="width: 94px;"><span designelement="text" textindex="4" >카테고리</span></li>
								<li><span designelement="text" textindex="2" >글제목</span></li>
								
								<li style="width: 94px;"><span designelement="text" textindex="4" >작성자</span></li>
								<li style="width: 94px;"><span designelement="text" textindex="4" >아이디</span></li>
								<li style="width: 94px;"><span designelement="text" textindex="4" >선택상품번호</span></li>
								<li style="width: 94px;"><span designelement="text" textindex="4" >별점</span></li>
								<li style="width: 94px;"><span designelement="text" textindex="4" >답변여부</span></li>
								<li style="width: 84px;"><span designelement="text" textindex="6" >등록일</span></li>
								<li style="width: 94px;"><span designelement="text" textindex="4" >게시글상태</span></li>
							</ul>
							
							<!-- 반복문 -->
							<% for(SboardDTO board:boardList) { %>
							<ul class="tbody">
								
								<%-- <li class="mo_hide"><span class="mtitle">번호:</span><%=number %></li> --%>
								<li>
									<input type="checkbox" name="checkId" value="<%=board.getNum()%>" class="check">
								</li>
								<li class="mo_hide"><span class="mtitle">번호:</span><%=board.getNum() %></li>
								<li><%=board.getCategory().replace("1", "공지").replace("3", "문의").replace("2", "후기").replace("9", "삭제글") %></li>
								
								<li class="subject">
									<ul class="board_goods_list">
										<li class="info">
											<div class="title"> 
												<a href="<%if(board.getCategory().equals("1")){ %>
												<%=request.getContextPath()%>/index.jsp?workgroup=board&work=board_detail&num=<%=board.getNum()%>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>&category=<%=category%>
												<%}else if(board.getCategory().equals("2")) {%>
												<%=request.getContextPath()%>/index.jsp?workgroup=board/review&work=review_detail&num=<%=board.getNum()%>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>&category=<%=category%>
												<%}else if(board.getCategory().equals("3")) {%>
												<%=request.getContextPath()%>/index.jsp?workgroup=board/question&work=question_detail&num=<%=board.getNum()%>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>&category=<%=category%>
												<%} %>">
												<span class="boad_view_btn" style="margin-left: 20px;"> 
												<span class="type"></span><%=board.getTitle() %>
												</span>
												</a>
											</div>
										</li>
									</ul>
								</li>  
								<li><%=board.getWriter() %></li>
								<li><%=board.getId() %></li>
								<li><%if(board.getItemnum()==0){ %>없음<%} %><%else{ %><%=board.getItemnum()%><%} %></li>
								<li><%if(board.getGrade()!=null){%><%=board.getGrade() %><%}else {%>X<%} %></li>
								<li><%if(board.getAnswer()!=null && board.getCategory().equals("3")){ %>
									답변완료
									<%}else if(board.getAnswer()==null && board.getCategory().equals("3")){%>
									미답변
									<%}else{ %>
									X
									<%} %>
								</li>
								<li><%=board.getRegdate().substring(0,19)%></li>
								<li><%if(board.getStatus()==1){ %>
										비밀글
									<%}else if(board.getStatus()==0){ %>
										일반글
									<%}else if(board.getStatus()==9){ %>
										삭제글
									<%} %>
									
								</li>
							</ul>
							<% number--; %>
							<%} %>
							
						</div>
						</form>
						<% } %>
						
						<!--  -->
					
					<%-- 페이지 번호 출력(페이징 처리) --%>
					<%
						//페이지 블럭에 출력될 페이지 번호의 갯수 설정
						int blockSize=5;

						int startPage=(pageNum-1)/blockSize*blockSize+1;
						int endPage=startPage+blockSize-1;
						if(endPage>totalPage) {
							endPage=totalPage;
						}
					%>
					<div id="pagingDisplay" class="paging_navigation">
					<p>
					<% if(startPage>blockSize) { %>
						<a class="red" href="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=board_manager&pageNum=1&search=<%=search%>&keyword=<%=keyword%>&category=<%=category%>">&lt;&lt;</a> 
						<a class="red" href="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=board_manager&pageNum=<%=startPage-blockSize%>&search=<%=search%>&keyword=<%=keyword%>&category=<%=category%>">이전</a>
					<% } else { %>
					<a class="red">&lt;&lt;</a>
					<a class="red">이전</a>
					<% } %>
					
					<% for(int i=startPage;i<=endPage;i++) { %>
						<% if(pageNum!=i) { %>
							<a class="red" href="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=board_manager&pageNum=<%=i%>&search=<%=search%>&keyword=<%=keyword%>&category=<%=category%>"><%=i %></a>
						<% } else { %>
							<a class="on red"><%=i %></a>
						<% } %>
					<% } %> 
					
					<% if(endPage!=totalPage) { %>
						<a class="red" href="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=board_manager&pageNum=<%=startPage+blockSize%>&search=<%=search%>&keyword=<%=keyword%>&category=<%=category%>">다음</a>
						<a class="red" href="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=board_manager&pageNum=<%=totalPage%>&search=<%=search%>&keyword=<%=keyword%>&category=<%=category%>">&gt;&gt;</a>
					<% } else { %>
					<a class="red">다음</a>
					<a class="red">&gt;&gt;</a>
					<% } %>
					</p>
					</div>
				
					<!-- 글쓰기 버튼 -->
					
					<ul class="board_detail_btns">
						<li class="right">
							<button type="button" id="answerNull" name="goods_boad_modify_btn" board_seq="4" board_id="goods_qna" class="btn_resp size_b" onclick="location.href='<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=board_answernull'">
								<span>미답변 문의 보기</span>
							</button>
						
							<button type="button" id="removeBtn" name="goods_boad_modify_btn" board_seq="4" board_id="goods_qna" class="btn_resp size_b">
								<span>선택 게시글 삭제</span>
							</button>
							
							<button type="button" id="removedbBtn" board_id="goods_qna" class="btn_resp size_b color2">
								DB에서 <span>삭제</span>
							</button>
						</li>
					</ul>
					
				</div>
			</div>
		</div>


	</div>

</div>
<script type="text/javascript">
$("#allCheck").change(function() {
	if($(this).is(":checked")) {
		$(".check").prop("checked",true);		
	} else {
		$(".check").prop("checked",false);		
	}
});

$("#category").change(function() {
	$("#categoryForm").submit();
});

$("#removeBtn").click(function() {
	if($(".check").filter(":checked").size()==0) {
		alert("선택된 게시글이 없습니다.")
		return;
	}
	if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
		$("#boardForm").attr("method","post");
		$("#boardForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=board_remove_action");
		$("#boardForm").submit();
	}
});

$("#removedbBtn").click(function() {
	if($(".check").filter(":checked").size()==0) {
		alert("선택된 게시글이 없습니다.")
		return;
	}
	if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
		$("#boardForm").attr("method","post");
		$("#boardForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=board_removeDB_action");
		$("#boardForm").submit();
	}
});
</script>