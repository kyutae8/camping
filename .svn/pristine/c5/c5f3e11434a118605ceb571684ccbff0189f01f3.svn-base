<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="layout_body" class="layout_body">
		<!-- ================= 파트 페이지들 :: START. ================= -->
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
@@ 회원가입 > 회원정보 입력 @@
- 파일위치 : [스킨폴더]/member/register.html
++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<!-- 타이틀 -->
<div class="title_container">
	<h2><span designelement="text" textindex="1" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbWVtYmVyL3JlZ2lzdGVyLmh0bWw=">회원정보 입력</span></h2>
</div>
<div class="mypage_greeting Pb30">
	<span class="pilsu_icon"><img alt="테스트" src="<%=request.getContextPath() %>/images/icon_check1.png"></span> <span designelement="text" textindex="2" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbWVtYmVyL3JlZ2lzdGVyLmh0bWw=">항목은 <span class="pointcolor">필수 입력</span> 항목입니다.</span>
</div>


<div class="resp_member_join_wrap">
	<form name="registFrm" id="registFrm" target="actionFrame" method="post" action="../member_process/register_ok" onsubmit="registAct()" novalidate="">
	<input type="hidden" name="mtype" value="member">
	
	<!-- ------- 회원가입 입력폼. 파일위치 : [스킨폴더]/member/register_form.html ------- -->
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
@@ 회원가입 입력폼 @@
- 파일위치 : [스킨폴더]/member/register_form.html
++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<div id="formMemberArea" class="resp_member_join">

<!-- O2O 통합 가입 안내 -->

	<div class="resp_join_table">
			<ul class="required">
				<li class="th "><p designelement="text" textindex="8" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbWVtYmVyL3JlZ2lzdGVyX2Zvcm0uaHRtbA=="><span class="pilsu_icon"><img alt="테스트" src="<%=request.getContextPath() %>/images/icon_check1.png"></span>아이디</p></li>
				<li class="td">
						<input type="text" name="userid" id="userid" autocapitalize="off" value="" onkeypress="filterKey();" onpaste="javascript:return false;" class="eng_only" placeholder="공백 없는 영문/숫자 포함 6~20자"><img alt="테스트" src="<%=request.getContextPath() %>/images/icon_check1.png">
						<p id="id_info" class="guide_text"></p>
				</li>
			</ul>
				<ul class="required">
					<li class="th "><p designelement="text" textindex="11" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbWVtYmVyL3JlZ2lzdGVyX2Zvcm0uaHRtbA==">비밀번호</p></li>
					<li class="td">
						<input type="password" name="password" value="" class="eng_only" placeholder="공백 없는 영문/숫자 포함 6~20자"><img alt="테스트" src="<%=request.getContextPath() %>/images/icon_check1.png">
					</li>
				</ul>
				<ul class="required">
					<li class="th "><p designelement="text" textindex="12" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbWVtYmVyL3JlZ2lzdGVyX2Zvcm0uaHRtbA==">비밀번호 확인</p></li>
					<li class="td">
						<input type="password" name="re_password" value="" class="eng_only">
					</li>
				</ul>
				<ul class="required">
					<li class="th "><p designelement="text" textindex="13" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbWVtYmVyL3JlZ2lzdGVyX2Zvcm0uaHRtbA==">이름</p></li>
					<li class="td">
						<input type="text" name="user_name" value="">
					</li>
				</ul>
			<ul class="required">
				<li class="th "><p designelement="text" textindex="14" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbWVtYmVyL3JlZ2lzdGVyX2Zvcm0uaHRtbA==">이메일</p></li>
				<li class="td">
					<input type="email" name="email[0]" value="" class="size_mail1"> @
					<input type="email" name="email[1]" value="" class="size_mail2">
					<select name="find_email" id="find_email">
						<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="dreamwiz.com">dreamwiz.com</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
							<option value="empal.com">empal.com</option>
							<option value="unitel.co.kr">unitel.co.kr</option>
							<option value="gmail.com">gmail.com</option>
							<option value="korea.com">korea.com</option>
							<option value="chol.com">chol.com</option>
							<option value="paran.com">paran.com</option>
							<option value="freechal.com">freechal.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="hotmail.com">hotmail.com</option>
					</select>
					<div class="Pt10">
						<label><input type="checkbox" name="mailing" value="Y"> <span designelement="text" textindex="15" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbWVtYmVyL3JlZ2lzdGVyX2Zvcm0uaHRtbA==">정보메일을 수신하겠습니다.</span></label>
					</div>
					<p class="Pt10 desc" designelement="text" textindex="16" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbWVtYmVyL3JlZ2lzdGVyX2Zvcm0uaHRtbA==">이메일 수신에 동의하시면 여러가지 할인혜택과 각종 이벤트 정보를 받아보실 수 있습니다.<br>회원가입관련, 주문배송관련 등의 메일은 수신동의와 상관없이 모든 회원에게 발송됩니다.<br></p>
				</li>
			</ul>
			<ul class="required">
				<li class="th "><p designelement="text" textindex="17" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbWVtYmVyL3JlZ2lzdGVyX2Zvcm0uaHRtbA==">전화번호</p></li>
				<li class="td">
					<input type="tel" name="phone[]" value="" class="size_phone" maxlength="4"> -
					<input type="tel" name="phone[]" value="" class="size_phone" maxlength="4"> -
					<input type="tel" name="phone[]" value="" class="size_phone" maxlength="4">
				</li>
			</ul>
			<ul class="required">
				<li class="th "><p designelement="text" textindex="18" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbWVtYmVyL3JlZ2lzdGVyX2Zvcm0uaHRtbA==">휴대폰번호</p></li>
				<li class="td">
					<input type="tel" name="cellphone[]" value="" class="size_phone" maxlength="4"> -
					<input type="tel" name="cellphone[]" value="" class="size_phone" maxlength="4"> -
					<input type="tel" name="cellphone[]" value="" class="size_phone" maxlength="4">
					<div class="Pt10">
						<label><input type="checkbox" name="sms" value="Y"> <span designelement="text" textindex="20" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbWVtYmVyL3JlZ2lzdGVyX2Zvcm0uaHRtbA==">SMS를 수신하겠습니다.</span></label>
					</div>
					<p class="Pt10 desc" designelement="text" textindex="21" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbWVtYmVyL3JlZ2lzdGVyX2Zvcm0uaHRtbA==">SMS 수신에 동의하시면 여러가지 할인혜택과 각종 이벤트 정보를 받아보실 수 있습니다.<br>회원가입관련, 주문배송관련 등의 SMS는 수신동의와 상관없이 구매 회원에게 발송됩니다.<br></p>
				</li>
			</ul>
			<ul class="required">
				<li class="th "><p designelement="text" textindex="24" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbWVtYmVyL3JlZ2lzdGVyX2Zvcm0uaHRtbA==">닉네임</p></li>
				<li class="td">
					<input type="text" name="nickname" value="" maxlength="10">
				</li>
			</ul>

	</div>





</div>







<script type="text/javascript">
	$(function(){
		$(".selectLabelSet").each(function(){
			var selectLabelSetObj = $(this);
			$("select.selectLabelDepth1",selectLabelSetObj).bind('change',function(){
				var childs = $("option:selected",this).attr('childs').split(';');
				var joinform_seq = $(this).attr('joinform_seq');
				var select2 = $("input.hiddenLabelDepth[type='hidden'][joinform_seq='"+joinform_seq+"']").val();
				if(childs[0]){
					$(".selectsubDepth",selectLabelSetObj).show();
					$("select.selectLabelDepth2[joinform_seq='"+joinform_seq+"']").empty();
					for(var i=0; i< childs.length ; i++){
						$("select.selectLabelDepth2[joinform_seq='"+joinform_seq+"']")
						.append("<option value='"+childs[i]+"'>"+childs[i]+"</option>");
					}
				}else{
					$(".selectsubDepth",selectLabelSetObj).hide();
				}
				$("select.selectLabelDepth2 option[value='"+select2+"']").attr('selected',true);
			}).trigger('change');
		});


		/* ========== 반응형 프론트엔드 추가 ========= */
		// designed radio UI
		$('.designed_radio_checkbox input[type=radio]').closest('.designed_radio_checkbox').addClass('type_radio');
		$('.designed_radio_checkbox input[checked]').parent('label').addClass('on');

		$('.designed_radio_checkbox input[type=radio]').on('change', function() {
			$(this).parent().parent().find('label').removeClass('on');
			$(this).parent('label').addClass('on');
		});
		// designed checkbox UI
		$('.designed_radio_checkbox input[type=checkbox]').on('change', function() {
			if ( $(this).prop('checked') ) {
				$(this).parent('label').addClass('on');
			} else {
				$(this).parent('label').removeClass('on');
			}
		});
		/* ========== //반응형 프론트엔드 추가 ========= */
	});

	// 추천인 확인
	function chkRecommend(type){
		var recommend	= $("#recommend").val();
		if(type=="b")	recommend = $("#brecommend").val();
		if	(!recommend){
			//추천인명을 입력하세요
			openDialogAlert(getAlert('mb009'), 400, 150);
			return;
		}
		actionFrame.location.href	= '/member/recommend_confirm?recomid='+recommend+'&type='+type;
	}
</script>
	<!-- ------- //회원가입 입력폼 ------- -->

	<div id="btn_register" class="btn_area_c">
		<button type="submit" class="btn_resp size_c color2 Wmax"><span designelement="text" textindex="3" texttemplatepath="cmVzcG9uc2l2ZV9jYW1waW5nX2hlYWxpbmdfZ2wvbWVtYmVyL3JlZ2lzdGVyLmh0bWw=">입력 완료</span></button>
	</div>
	</form>
</div>




<script type="text/javascript">
$(document).ready(function() {
	$("input[name='userid']").blur(function() {
		if($(this).val()){
			$.post("../member_process/id_chk", { userid : $(this).val() }, function(response){
				//debug(response);
				var text = response.return_result;
				var userid = response.userid;
				$("#id_info").html(text);
				$("input[name='userid']").val(userid);
			},'json');
		}
    });


	$('#find_email').change(function() {
		if($(this).val() == "select"){
			$("input[name='email[1]']").val("");
			$("input[name='email[1]']").hide();
			return;
		}
		$("input[name='email[1]']").val($(this).val());
		if(!$(this).val()){
			$("input[name='email[1]']").show();
			$("input[name='email[1]']").attr("readonly",false);
		}else{
			$("input[name='email[1]']").hide();
			$("input[name='email[1]']").attr("readonly",true);
		}
	});

});

function filterKey(e) { 
	var keycode;
	var prevent = null; 
	var filter = "[0-9a-z]";
	if(filter){
		// for something else IE
		if (e != null) {
			keycode = e.which;
			prevent = function() {
				e.which = 0;
				e.preventDefault();
			};
		}
		// for IE
		else {
			keycode = window.event.keyCode;
			prevent = function() {
				window.event.keyCode = 0;
				window.event.returnValue = false;
			};
		}

		// fromCharCode : 매개 변수에서 ASCII 값이 나타내는 문자들로 구성된 문자열을 반환합니다
		var sKey = String.fromCharCode(keycode);
		// RegExp
		// 정규표현을 취급하는 객체로 new를 사용하지 않고 정규표현 문자열을 변수에 대입하는 것으로도 동일한 결과
		var re = new RegExp(filter);
		// test() : 일치하는 문자열이 있는 경우 true, 없으면 false
		if(!re.test(sKey)) { 
			prevent();
		}
	}
}
//회원가입버튼 클릭시 버튼 숨기기
function registAct(){
	$('#btn_register').hide();
}
</script>




		<!-- ================= 파트 페이지들 :: END. ================= -->
		</div>