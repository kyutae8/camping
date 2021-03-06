<%@page import="site.semi.dto.SmemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>


.title_container2 {

margin-bottom: 50px;	

}



#btn_register {

margin-top: 30px;	

}

</style>

<%-- 현재 로그인 사용자의 회원정보를 클라이언트에게 전달하는 JSP 문서 --%>
<%-- => 비로그인 사용자가 요청한 경우 에러페이지 이동 - 비정상적인 요청 --%>
<%-- => [회원정보변경]을 클릭한 경우 회원정보 변경을 위한 비밀번호 입력페이지(password_confirm.jsp) 이동 --%>
<%-- => [회원탈퇴]를 클릭한 경우 회원정보 삭제를 위한 비밀번호 입력페이지(password_confirm.jsp) 이동 --%>

<%@include file="/security/login_url.jspf" %>  


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
	</div>
			<div class="title_container2">
				<h3 class="title_sub6" style="text-align:center"><span style="text-align:center; font-size: 2.0em;  designElement="text" textIndex="8"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvc2VydmljZS9jcy5odG1s" >My Page</span> <span class="top5" designElement="text" textIndex="9"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvc2VydmljZS9jcy5odG1s" ></span></h3>
			</div>
			
	<div class="resp_member_join_wrap">

			<div id="formMemberArea" class="resp_member_join">
				<div class="resp_join_table">
					<ul>
						<li class="th"><p >아이디</p></li>
						<li class="td"><%=loginMember.getId() %></li>
				
						<li class="th"><p >성함</p></li>
						<li class="td"><%=loginMember.getName() %></li>
					</ul>
					<ul>
						<li class="th"><p >생년월일</p></li>
						<li class="td"><%=loginMember.getBirthday() %></li>
				
						<li class="th"><p >이메일</p></li>
						<li class="td"><%=loginMember.getEmail() %></li>
					</ul>

					<ul>
						<li class="th"><p >기본주소</p></li>
						<li class="td"><%=loginMember.getZipcode() %>,<br><%=loginMember.getAddress1() %></li>
				
						<li class="th"><p >상세주소</p></li>
						<li class="td"><%=loginMember.getAddress2() %>,<%=loginMember.getAddress3() %></li>
					</ul>
					<ul>
						<li class="th"><p >회원가입일</p></li>
						<li class="td"><%=loginMember.getJoinDate().substring(0, 19) %></li>
				
						<li class="th"><p >최종로그인</p></li>
						<li class="td"><%=loginMember.getLastLogin().substring(0, 19) %></li>
					</ul>
				</div>
			</div>
		</div>

	<div id="btn_register" class="btn_area_a">
		<a  class="btn_resp size_c color2 " href="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=passwordconfirm&action=modify">회원정보변경</a>
		<a  class="btn_resp size_c color2 " href="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=passwordconfirm&action=remove">회원탈퇴</a>
		
	</div>
</div>	
</div>

</div>
