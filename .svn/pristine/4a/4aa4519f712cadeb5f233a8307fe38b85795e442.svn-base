<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getParameter("state")!=null) {
		if(request.getParameter("state").equals("1")){
		session.removeAttribute("url");
		}
	}

	/* status 받아서 하기 */ 

	String message=(String)session.getAttribute("message");
	if(message==null){
		message="";
	} else {
		session.removeAttribute("message");
	}
	
	String id=(String)session.getAttribute("id");
	if(id==null){
		id="";
	} else {
		session.removeAttribute("id");
	}
%>



<div class="title_container" style="display:block;">
	<h2><span>로그인</span></h2>
</div>

<!-- 탭 -->
<div class="resp_login_wrap">
	<div id="loginTab" class="tab_basic fullsize Pt20">
		<ul>
			<li class="on"><a href="javascript:void(0)" data-tab="member"><span>회원</span></a></li>
			<li ><a href="index.jsp?workgroup=member&work=login2" data-tab="nonmember"><span>비회원</span></a></li>
		</ul>
	</div>
</div>

<!-- +++++++++++ 회원 +++++++++++ -->
<div id="member" class="loginTabContetns resp_login_wrap Mt0">
	<form id="logintt" name="loginForm" method="post" action="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=login_action" >
		<fieldset>
			<ul class="login_real_area">
				<li class="input_area">
					<input type="text" name="id" id="id" class="box_id" value="<%=id%>" placeholder="아이디" required="required" />
					<input type="password" name="passwd" id="passwd" class="box_pw" placeholder="비밀번호" required="required" />
				</li>
				<li>
					<label class="id_save"><input type="checkbox" name="idsave" id="idsave" value="checked"   /> <span>아이디 저장</span></label>
				</li>
				<li>
					<span id="message"><%=message %></span>
				</li>
				<li>
					<button type="submit" class="btn_resp size_login1" id="login_btn"><span>로그인</span></button>
				</li>
				<li class="find_join">
					<a href="index.jsp?workgroup=member&work=findid">아이디 찾기</a> &nbsp;|&nbsp;
					<a href="index.jsp?workgroup=member&work=findpasswd">비밀번호 찾기</a> &nbsp;|&nbsp;
					<a href="index.jsp?workgroup=member&work=agreement" class="Fw500 gray_01">회원가입</a>
				</li>
			</ul>

			<!-- SNS 가입폼 -->

		</fieldset>
	</form>
</div>
<!-- +++++++++++ //회원 +++++++++++ -->
<script type="text/javascript">

$("#id").focus();

$("#login_btn").click(function() {
	if($("#userid").val()=="") {
		$("#message").text("아이디를 입력해 주세요.");
		$("#userid").focus();
		return;
	}
	
	if($("#passwd").val()=="") {
		$("#message").text("비밀번호를 입력해 주세요.");
		$("#passwd").focus();
		return;
	}
	
	$("#logintt").submit();
});

</script>