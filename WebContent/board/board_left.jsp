<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%
	String category = request.getParameter("category");
	if (category == null) category = "1";
%> --%>
<div id="subpageLNB" class="subpage_lnb">
	<div id="boardLnbCommon">
		<h2 class="title1">
			<a href="index.jsp?workgroup=company&work=cs">CS CENTER</a>
		</h2>
		<ul class="lnb_sub">
			<li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=board&work=board_list&category=1">공지사항</a></li>
			<li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=board&work=qa&category=5">자주 묻는 질문</a></li>
			<li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=board/question&work=question_list&category=3">상품문의</a></li>
			<li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=board/review&work=review_list&category=2">상품후기</a></li>
			<%-- <li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=board&work=board_list&category=4">대량구매</a></li> --%>
		</ul>
	</div>
</div>
<!-- ------- //고객센터 LNB 인클루드 ------- -->















<!-- <div id="subpageLNB" class="subpage_lnb">
<div id="boardLnbCommon">
	<h2 class="title1">
		<a href="/service/cs" designelement="text" textindex="1" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvX21vZHVsZXMvY29tbW9uL2JvYXJkX2xuYi5odG1s">CS CENTER</a>
	</h2>
	<ul class="lnb_sub">
		<li><a href="/board/?id=notice" designelement="text" textindex="2" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvX21vZHVsZXMvY29tbW9uL2JvYXJkX2xuYi5odG1s">공지사항</a></li>
		<li><a href="/board/?id=faq" designelement="text" textindex="3" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvX21vZHVsZXMvY29tbW9uL2JvYXJkX2xuYi5odG1s">자주 묻는 질문</a></li>
		<li><a href="/board/?id=goods_qna" designelement="text" textindex="4" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvX21vZHVsZXMvY29tbW9uL2JvYXJkX2xuYi5odG1s">상품문의</a></li>
		<li><a href="/board/?id=goods_review" designelement="text" textindex="5" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvX21vZHVsZXMvY29tbW9uL2JvYXJkX2xuYi5odG1s">상품후기</a></li>
		<li><a href="/board/?id=bulkorder" designelement="text" textindex="6" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvX21vZHVsZXMvY29tbW9uL2JvYXJkX2xuYi5odG1s">대량구매</a></li>
	</ul>
</div>



<script>
	$(function() {
		// 고객센터 LNB 텍스트 수정기능으로 삭제시, 클라이언트단에서 삭제 처리
		$('#boardLnbCommon a').each(function(e) {
			if ($(this).text() == '') {
				$(this).parent('li, h2').remove();
			}
		});
	});
</script>
</div> -->