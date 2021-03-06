<%@page import="site.semi.dao.SproductDAO"%>
<%@page import="site.semi.dto.SproductDTO"%>
<%@page import="site.semi.dao.ItemDAO"%>
<%@page import="site.semi.dto.ItemDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="site.semi.dto.SmemberDTO"%>
<%@page import="site.semi.dto.SboardDTO"%>
<%@page import="java.util.List"%>
<%@page import="site.semi.dao.SboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<%
	String category = request.getParameter("category");
	if (category == null) category = "2";
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
	
	int totalBoard=SboardDAO.getDAO().selectBoardCount(category, search, keyword);
	int totalPage=(int)Math.ceil((double)totalBoard/pageSize);
	
	if(pageNum<=0 || pageNum>totalPage) {//페이지 번호가 비정상적인 경우
		pageNum=1;
	}
	
	int startRow=(pageNum-1)*pageSize+1;
	int endRow=pageNum*pageSize;

	if(endRow>totalBoard) {
		endRow=totalBoard;
	}
	
	List<SboardDTO> boardList=SboardDAO.getDAO().selectBoardList(category, startRow, endRow, search, keyword);
	
	int number=totalBoard-(pageNum-1)*pageSize;
	
	SmemberDTO loginMember=(SmemberDTO)session.getAttribute("loginMember");
	String currentDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	
%>
<%--공지사항 페이지 --%>

<div id="layout_body" class="layout_body">

	<div id="boardlayout">
		<div class="subpage_wrap">
			<!-- +++++ cscenter LNB ++++ -->
			
			
				<%@include file="/board/board_left.jsp" %> 		

			<!-- +++++ cscenter contents ++++ -->
			<div class="subpage_container">
				<div class="title_container">
					<h2>상품후기</h2>
				</div>

				<div id="bbslist">
					<!-- 
					<select name="search">
						<option value="writer" selected="selected">&nbsp;작성자&nbsp;</option>
						<option value="subject">&nbsp;제목&nbsp;</option>
						<option value="content">&nbsp;내용&nbsp;</option>
					</select>
					 -->
					<!-- 검색 -->
					<form  action="<%=request.getContextPath()%>/index.jsp?workgroup=board/review&work=review_list" method="post" name="boardsearch" id="boardsearch">
						<ul class="bbs_top_wrap">
							<li class="right2">
							<select name="search">
								<option value="title">&nbsp;제목&nbsp;</option>
								<option value="content">&nbsp;내용&nbsp;</option>
								<option value="writer">&nbsp;작성자&nbsp;</option>
							</select>
							<span class="searchform"> 
							<input type="text" name="keyword" id="search_text" class="res_bbs_search_input" <%if(keyword!=null){ %>value="<%=keyword %>" <%} %>title="검색내용" placeholder="검색내용">
							<button type="submit" class="btn_resp size_b">검색</button>
							<!-- <button type="button" class="btn_resp size_b hide" onclick="document.location.href='../board/?id=notice'">초기화</button> -->
							</span>
							</li>
						</ul>
					</form>

					<div class="article_info hide">게시글 목록(게시글 갯수 : <%=totalBoard %>)</div>

					
					<% if(totalBoard==0) { %>
						<div class="no_data_area2">등록된 게시글이 없습니다.</div>
					<% } else { %>
					<div class="res_table">
							<ul class="thead">
								<li style="width: 45px;"><span designelement="text" textindex="1" >번호</span></li>
								<li><span designelement="text" textindex="2" >글제목</span></li>
								<li style="width: 94px;"><span designelement="text" textindex="4" >별점</span></li>
								<li style="width: 94px;"><span designelement="text" textindex="4" >작성자</span></li>
								<li style="width: 84px;"><span designelement="text" textindex="6" >등록일</span></li>
							</ul>
							
							<!-- 반복문 -->
							<% for(SboardDTO board:boardList) { %>
							<%
							ItemDTO item=SboardDAO.getDAO().selectItem(board.getItemnum());
							SproductDTO sproduct=SproductDAO.getDAO().selectNumSproduct(board.getItemnum());
							%>
							<ul class="tbody">
								<li class="mo_hide">
								<span class="mtitle">번호:</span><%=number %></li>
								<li class="subject">
									<ul class="board_goods_list">
										<li class="pic">
											<span class="boad_view_btn " viewtype="page" pagetype="" board_seq="2" board_id="goods_review">
												<%if(board.getItemnum()<=50){ %>
													<%if(item==null){%>
													<a href="" target="_blank"><img src="board/review/test.png"></a>
													<%} else{%>
													<a href="<%=request.getContextPath()%>/index.jsp?workgroup=order&work=order_item&itemno=<%=item.getItem_num()%>" target="_blank">
													<img src="<%=request.getContextPath()%>/images/goods/<%=item.getItem_img()%>.png" width="100px">
													</a>
													<%} %>
												<%}else{ %>
													<%if(sproduct==null){%>
													<a href="" target="_blank"><img src="board/review/test.png"></a>
													<%} else{%>
													<a href="<%=request.getContextPath()%>/index.jsp?workgroup=sproduct&work=sproduct_page&num=<%=sproduct.getNum()%>" target="_blank">
													<%-- <img src="<%=request.getContextPath()%>/sproduct_image/<%=sproduct.getImage()%>" width="100px"> --%>
													<img src="<%=request.getContextPath() %>/sproduct_image/mheader<%=sproduct.getNum() %>.png" width="200">
													</a>
													<%} %>
												<%} %>
											</span>
										</li>
										<li class="info">
											<div class="name" style="margin-left: 20px;">
											
											<%if(board.getItemnum()<=50){ %>
												<%if(item==null){%>
												<a href="" target="_blank">세련된 혼합형 배너 제공</a>
												<%} else{%>
												<a href="<%=request.getContextPath()%>/index.jsp?workgroup=order&work=order_item&itemno=<%=item.getItem_num()%>" target="_blank"><%=item.getItem_name() %></a>
												<%} %>
											<%}else{ %>
												<%if(sproduct==null){%>
												<a href="" target="_blank">세련된 혼합형 배너 제공</a>
												<%} else{%>
												<a href="<%=request.getContextPath()%>/index.jsp?workgroup=sproduct&work=sproduct_page&num=<%=sproduct.getNum()%>" target="_blank"><%=sproduct.getName() %></a>
												<%} %>
											<%} %>
											
											</div>
											<div class="title">  
												<a href="<%=request.getContextPath()%>/index.jsp?workgroup=board/review&work=review_detail&num=<%=board.getNum()%>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>&category=<%=category%>"><!-- 여기에 url 입력 -->
												<span class="boad_view_btn" style="margin-left: 20px;"> 
												<span class="type"></span><%=board.getTitle() %>
												</span>
												</a>
											</div>
										</li>
									</ul>
								</li>  
								<li><span style="color: #ff6600"><%=board.getGrade() %></span></li>
								<%-- <li><span><%=board.getGrade()%></span></li> --%>
								<li>
								<%if(loginMember!=null){ %>
									<%if(loginMember.getId().equals(board.getId()) || loginMember.getStatus()==9){ %>
									<%=board.getWriter() %>
									<%}else{ %>
									<%=board.getWriter().replace(board.getWriter().substring(1,3), "**") %>
									<%} %>
								<%}else{ %>
								<%=board.getWriter().replace(board.getWriter().substring(1,3), "**") %>
								<%} %>
								
								</li>
								<li><%=board.getRegdate().substring(0,19)%></li>
							</ul>
							<% number--; %>
							<%} %>
							
						</div>
						<% } %>
						<!--  -->
					
					<%-- 페이지 번호 출력(페이징 처리) --%>
					<%
						//페이지 블럭에 출력될 페이지 번호의 갯수 설정
						int blockSize=5;
					
						//페이지 블럭에 출력될 시작 페이지 번호를 계산하여 저장
						// => 1 Block : 1, 2 Block : 6, 3 Block : 11, 4 Block : 16, ...
						int startPage=(pageNum-1)/blockSize*blockSize+1;
						                 
						//페이지 블럭에 출력될 종료 페이지 번호를 계산하여 저장
						// => 1 Block : 5, 2 Block : 10, 3 Block : 15, 4 Block : 20, ...
						int endPage=startPage+blockSize-1;
						
						//마지막 페이지 블럭의 종료 페이지 번호 변경
						if(endPage>totalPage) {
							endPage=totalPage;
						}
					%>
					<div id="pagingDisplay" class="paging_navigation"">
					<p>
					<% if(startPage>blockSize) { %>
						<a class="red" href="<%=request.getContextPath()%>/index.jsp?workgroup=board/review&work=review_list&pageNum=1&search=<%=search%>&keyword=<%=keyword%>">&lt;&lt;</a> 
						<a class="red" href="<%=request.getContextPath()%>/index.jsp?workgroup=board/review&work=review_list&pageNum=<%=startPage-blockSize%>&search=<%=search%>&keyword=<%=keyword%>">이전</a>
					<% } else { %>
					<a class="red">&lt;&lt;</a>
					<a class="red">이전</a>
					<% } %>
					
					<% for(int i=startPage;i<=endPage;i++) { %>
						<% if(pageNum!=i) { %>
							<a class="red" href="<%=request.getContextPath()%>/index.jsp?workgroup=board/review&work=review_list&pageNum=<%=i%>&search=<%=search%>&keyword=<%=keyword%>"><%=i %></a>
						<% } else { %>
							<a class="on red"><%=i %></a>
						<% } %>
					<% } %> 
					
					<% if(endPage!=totalPage) { %>
						<a class="red" href="<%=request.getContextPath()%>/index.jsp?workgroup=board/review&work=review_list&pageNum=<%=startPage+blockSize%>&search=<%=search%>&keyword=<%=keyword%>">다음</a>
						<a class="red" href="<%=request.getContextPath()%>/index.jsp?workgroup=board/review&work=review_list&pageNum=<%=totalPage%>&search=<%=search%>&keyword=<%=keyword%>">&gt;&gt;</a>
					<% } else { %>
					<a class="red">다음</a>
					<a class="red">&gt;&gt;</a>
					<% } %>
					</p>
					</div>
					 
					<!-- 글쓰기 버튼 -->
					<%if(loginMember!=null){ %>
					<ul class="bbs_bottom_wrap">
							<li class="right">
								<button type="button" name="boad_write_btn" id="boad_write_btn" class="btn_resp size_b color2" onclick="location.href='<%=request.getContextPath()%>/index.jsp?workgroup=board/review&work=review_write&category=2'">
									상품후기  쓰기
								</button>
							</li>
					<%} %>
					</ul>
					
				</div>

			</div>
		</div>


	</div>

</div>