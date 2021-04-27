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
	/* 
	if(loginMember.getStatus()!=9){
		out.println("<script type='text/javascript'>");
		out.println("alert('관리자만 글 작성이 가능합니다')");
		out.println("history.go(-1);");//이전 페이지 이동
		out.println("</script>");
		return;
	}
	 */
	//
%>

<div id="layout_body" class="layout_body">
	<div id="boardlayout">
		<div class="subpage_wrap">
			<%@include file="/board/board_left.jsp"%>

			<div class="subpage_container">
				<div class="title_container">
					<h2>상품문의 쓰기</h2>
				</div>

				<div id="bbsview">

					<form name="writeform" id="writeform" method="post" action="<%=request.getContextPath()%>/index.jsp?workgroup=board/question&work=question_write_action" enctype="multipart/form-data">
						<input type="hidden" name="category" value="3">
						<input type="hidden" name="writer" value="<%=loginMember.getName()%>">
						<input type="hidden" name="itemnum" value="0">
						<input type="hidden" name="grade" id="grade" value="">
						<!-- <input type="hidden" name="img" value=""> -->
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
										<span class=""><input type="checkbox" name="secret" value="1">
										<label for="hidden"> <span>비밀글</span></label>
										</span>
									</td>
								</tr>

								<tr>
									<th><p>문의상품</p></th>
									<td class="Pt0">
										<!-- 상품선택 & 선택된 상품 -->
										<div class="board_goods_select">
											<div class="btn_area">
											<input type="text" name="itemname" id="itemname1" value="" readonly="readonly">
												<button type="button" id="issueGoodsButton" class="btn_resp size_b color2">
													<span>상품 선택</span>
												</button>
												
											</div>
										</div>
										<!-- 동영상 사용인 경우( 반응형 1차에서 작업 제외 ) -->
									</td>
								</tr>

								
								<tr>
									<th><p>제목</p></th>
									<td>
										<input type="text" name="title" id="title" value="" class="Wmax" title="제목을 입력해 주세요" placeholder="제목을 입력해 주세요">
									</td>
								</tr>
							</tbody>
						</table>

						<textarea name="content" id="board_content" class="size3 Mt10" title="내용을 입력하세요" placeholder="내용을 입력하세요" style="resize: none;"></textarea>

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
							<button type="button" class="btn_resp size_c" onclick="location.href='<%=request.getContextPath()%>/index.jsp?workgroup=board/question&work=question_list&category=<%=request.getParameter("category")%>'">
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
	document.getElementById("savebtn").onclick = function() {
		if($("#itemname1").val()=="") {
			alert("상품을 선택해 주세요")
			return false;
		}
		
		if($("#title").val()=="") {
			//$("#message").text("제목을 입력해 주세요");
			alert("제목을 입력해 주세요")
			$("#title").focus();
			return false;
		}
		
		if($("#board_content").val()=="") {
			alert("내용을 입력해 주세요")
			$("#board_content").focus();
			return false;
		}
		
		
		
		document.writeform.submit();
	}
	
	/* $("#writeform").submit(function() {
		if($("#title").val()=="") {
			//$("#message").text("제목을 입력해 주세요");
			alert("제목을 입력해 주세요")
			$("#title").focus();
			return false;
		}
		
		if($("#content").val()=="") {
			$("#message").text("내용을 입력해 주세요");
			$("#board_content").focus();
			return false;
		}
		
		if($("#itemname").val()=="") {
			$("#message").text("내용을 입력해 주세요");
			$("#board_content").focus();
			return false;
		}
	}); */

	$("#issueGoodsButton").click(function() {
		window.open("<%=request.getContextPath()%>/board/review/product_choice.jsp"
				,"issueGoodsButton", "width=700,height=600,left=600,top=250");
	});
	
</script>