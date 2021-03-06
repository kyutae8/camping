<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<div class="title_container" style="display:block;">
	<h2><span designElement="text" textIndex="3"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbWVtYmVyL2xvZ2luLmh0bWw=" >로그인</span></h2>
</div>

<!-- 탭 -->
<div class="resp_login_wrap">
	<div id="loginTab" class="tab_basic fullsize Pt20">
		<ul>
			<li ><a href="index.jsp?workgroup=member&work=login" data-tab="member"><span>회원</span></a></li>
			<li class="on"><a href="" data-tab="nonmember"><span designElement="text" textIndex="5"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbWVtYmVyL2xvZ2luLmh0bWw=" >비회원</span></a></li>
		</ul>
	</div>
</div>

<!-- +++++++++++ 비회원 +++++++++++ -->
<div id="nonmember" class="loginTabContetns resp_login_wrap Mt0" style="display:block;">
	<form name="order_auth_form" target="actionFrame" method="post" action="">
	<input type="hidden" name="return_url" value="/"/>
		<ul class="login_real_area">
			<li class="input_area">
				<input type="text" name="num"  class="box_order" placeholder="주문번호" />
				<input type="text" name="gmail" value="" class="box_order" placeholder="주문자 이메일" />
			</li>
			<li class="desc_area">
				<p designElement="text" textIndex="14"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbWVtYmVyL2xvZ2luLmh0bWw=" >비회원은 주문번호와 이메일로 주문을 조회할 수 있습니다.</p>
			</li>
			<li>
				<button type="button" onclick="submitCheck();" class="btn_resp size_login1"><span designElement="text" textIndex="15"  textTemplatePath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbWVtYmVyL2xvZ2luLmh0bWw=" >주문조회</span></button>
				
			</li>
		</ul>
	</form>
</div>
<!-- +++++++++++ //비회원 +++++++++++ -->

<script type="text/javascript">
function submitCheck() {
	if(order_auth_form.gmail.value=="") {
		document.getElementById("message").innerHTML="이메일을 입력해 주세요.";
		findIdForm.email.focus();
		return;
	}
	
	if(order_auth_form.num.value=="") {
		document.getElementById("message").innerHTML="주문번호를 입력해 주세요.";
		findIdForm.birthday.focus();
		return;
	}
	
	
	order_auth_form.action="<%=request.getContextPath() %>/index.jsp?workgroup=sproduct&work=findguest_action";
	
	order_auth_form.submit();
}
</script>