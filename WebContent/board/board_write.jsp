<%@page import="site.semi.dto.SmemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@include file="/security/login_check.jspf" %> --%>

<%
	SmemberDTO loginMember=(SmemberDTO)session.getAttribute("loginMember");
	String pageNum="1";
	//System.out.println(loginMember.getId());
	if(loginMember==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=member&work=login';");
		out.println("</script>");
		return;
	}
	//관리자만 글작성 가능
	if(loginMember.getStatus()!=9){
		out.println("<script type='text/javascript'>");
		out.println("alert('관리자만 글 작성이 가능합니다')");
		out.println("history.go(-1);");//이전 페이지 이동
		out.println("</script>");
		return;
	}
	
	//
%>

<div id="layout_body" class="layout_body">
	<div id="boardlayout">
		<div class="subpage_wrap">
			<%@include file="/board/board_left.jsp"%>

			<div class="subpage_container">
				<div class="title_container">
					<h2>공지사항 쓰기</h2>
				</div>

				<div id="bbsview">
					<!--
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, board.getCategory()); O
					pstmt.setString(2, board.getId()); O
					pstmt.setString(3, board.getWriter()); O
					pstmt.setInt(4, board.getItemnum()); O
					pstmt.setString(5, board.getGrade()); O
					pstmt.setString(6, board.getTitle());
					pstmt.setString(7, board.getContent());
					pstmt.setString(8, board.getImg()); O
					pstmt.setInt(9, board.getStatus());
					  -->
					<form name="writeform" id="writeform" method="post" action="<%=request.getContextPath()%>/index.jsp?workgroup=board&work=board_write_action">
						<input type="hidden" name="category" value="1">
						<input type="hidden" name="writer" value="<%=loginMember.getName()%>">
						<input type="hidden" name="itemnum" value="0">
						<input type="hidden" name="grade" value="">
						<input type="hidden" name="img" value=""> 
						<input type="hidden" name="pageNum" value="<%=pageNum%>">
						
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
										<!-- <span class=""><input type="checkbox" name="hidden" id="hidden" value="1"><label for="hidden"> <span>비밀글</span></label></span> -->

									</td>
								</tr>
								<tr>
									<th><p>제목</p></th>
									<td>
										<input type="text" name="title" id="subject" value="" class="Wmax" title="제목을 입력해 주세요" placeholder="제목을 입력해 주세요">
									</td>
								</tr>
							</tbody>
						</table>

						<textarea name="content" id="contents" class="size3 Mt10" title="내용을 입력하세요" placeholder="내용을 입력하세요" style="resize: none;"></textarea>

						<div class="bbswrite_division">

							<script type="text/javascript" src="/app/javascript/js/skin-board_mobile_file.js?dummy=201905062"></script>

							<!-- 2018-06-05 byuncs add image 먼저 업로드 후 경로 및 태그 -->
							<input type="hidden" name="realfilename" value="">
							<input type="hidden" name="incimage" value="">
							<input type="hidden" name="insert_image" value="bottom">
							<input type="hidden" name="remove_no" value="">

							
						</div>


						<div class="board_detail_btns2">
							<button type="submit" class="data_save_btn btn_resp size_c color2">
								<span>저장</span>
							</button>
							<button type="button" class="btn_resp size_c" onclick="location.href='<%=request.getContextPath()%>/index.jsp?workgroup=board&work=board_list&category=<%=request.getParameter("category")%>'">
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

</script>