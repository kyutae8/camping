<%@page import="site.semi.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 비밀번호를 전달받아 로그인 사용자의 비밀번호와 비교하여 같은 경우 클라이언트에게 회원정보를
입력태그의 초기값으로 전달하고 변경값을 입력받기 위한 JSP 문서 --%>   
<%-- => 비로그인 사용자가 요청한 경우 에러페이지 이동 - 비정상적인 요청 --%>
<%-- => 전달받은 비밀번호가 로그인 사용자의 비밀번호와 같지 않은 경우 비밀번호 입력페이지(password_confirm.jsp)로 이동 --%>
<%-- => [우편번호 검색]를 클릭한 경우 새창에 우편번호 검색페이지(post_search.jsp) 요청 --%>
<%-- => [회원정보변경]를 클릭한 경우 회원정보 변경 처리페이지(member_modify_action.jsp)로 이동 - 입력값 전달 --%>
<%@include file="/security/login_check.jspf" %>
<%
	//비정상적인 요청에 대한 응답 - 에러페이지 이동
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	//전달값을 반환받아 저장
	String passwd=Utility.encrypt(request.getParameter("passwd"));
	
	//전달받은 비밀번호와 로그인 사용자의 비밀번호가 같지 않은 경우
	if(!loginMember.getPasswd().equals(passwd)) {
		session.setAttribute("message", "비밀번호가 맞지 않습니다.");
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=member&work=passwordconfirm&action=modify';");
		//out.println("history.go(-1);");//이전 페이지 이동
		out.println("</script>");
		return;
	}
%>
<style type="text/css">




#fs {
	text-align: center;
}

.error {
	color: red;
	position: relative;
	left: 160px;
	display: none;
}

#idCheck, #postSearch {
	font-size: 12px;
	font-weight: bold;
	cursor: pointer;
	margin-left: 10px;
	padding: 2px 10px;
	border: 1px solid black;
}

#idCheck:hover, #postSearch:hover {
	background: aqua;
}

.title_sub6 {
	margin-top: 50px;
}

.td {

	border-collapse: separate;
}

#td {

	border-collapse: separate;
}

.input.size_phone { width:46px; }

.resp_member_join input[type].size_phone { width:46px; }

</style>
<form name="join" id="join" method="post" action="<%=request.getContextPath() %>/index.jsp?workgroup=member&work=modify_action">
	<h3 class="title_sub6" style="text-align:center">회원정보변경</h3>
<div id="layout_body" class="layout_body">
	<div class="resp_member_join_wrap">
		<div id="formMemberArea" class="resp_member_join">
			<div class="resp_join_table"> 
					<ul class="required">
						<li class="th"><p>아이디</p></li>
						<li class="td"><input type="text" name="id" id="id" value="<%=loginMember.getId()%>" readonly="readonly">
						</li>
						<li class="th"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이름</p></li>
						<li class="td"><input type="text" name="name" id="name" value="<%=loginMember.getName()%>">
							<div id="nameMsg" class="error">이름을 입력해 주세요.</div>
						</li>
					</ul>			
					<ul class="required">
						<li class="th"><p>비밀번호</p></li>
						<li class="td"><input type="password" name="passwd" id="passwd" placeholder="비밀번호 미변경 시 공란">
							<div id="passwdRegMsg" class="error">비밀번호는 영문자,숫자,특수문자가 반드시 하나이상 포함된 6~20 범위의 문자로만 작성 가능합니다.</div>
						</li>
						<li class="th"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 확인</p></li>
						<li class="td"><input type="password" name="repasswd" id="repasswd" placeholder="비밀번호 미변경 시 공란">
							<div id="repasswdMatchMsg" class="error">비밀번호와 비밀번호 확인이 서로 맞지 않습니다.</div>
						</li>
					</ul>
					<ul class="required">
						<li class="th"><p>이메일</p></li>
						<li class="td"><input type="text" name="email" id="email" value="<%=loginMember.getEmail()%>">
							<div id="emailMsg" class="error">이메일을 입력해 주세요.</div>
							<div id="emailRegMsg" class="error">입력한 이메일이 형식에 맞지 않습니다.</div>
						</li>
						<li class="th"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화번호</p></li>
						<li class="td">
						<% String[] mobile=loginMember.getMobile().split("-"); %>
						<select name="mobile1" class="size_phone">
								<option value="010" <% if(mobile[0].equals("010")) { %> selected <% } %>>&nbsp;010&nbsp;</option>
								<option value="011" <% if(mobile[0].equals("011")) { %> selected <% } %>>&nbsp;011&nbsp;</option>
								<option value="016" <% if(mobile[0].equals("016")) { %> selected <% } %>>&nbsp;016&nbsp;</option>
								<option value="017" <% if(mobile[0].equals("017")) { %> selected <% } %>>&nbsp;017&nbsp;</option>
								<option value="018" <% if(mobile[0].equals("018")) { %> selected <% } %>>&nbsp;018&nbsp;</option>
								<option value="019" <% if(mobile[0].equals("019")) { %> selected <% } %>>&nbsp;019&nbsp;</option>
							</select>
							 <input class="size_phone" type="text" name="mobile2" id="mobile2" size="4" maxlength="4" value="<%=mobile[1]%>">
							 <input class="size_phone" type="text" name="mobile3" id="mobile3" size="4" maxlength="4" value="<%=mobile[2]%>">
							<div id="mobileMsg" class="error">전화번호를 입력해 입력해 주세요.</div>
							<div id="mobileRegMsg" class="error">전화번호는 3~4 자리의 숫자로만 입력해 주세요.</div>
					</ul>
					<ul class="required">
						<li class="th" ><p>우편번호</p></li>
						<li class="td"><input type="text" name="zipcode" id="zipcode" size="7" readonly="readonly" value="<%=loginMember.getZipcode()%>">
							<input id="postt" type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기">
							<div id="zipcodeMsg" class="error">우편번호를 입력해 주세요.</div>
						</li>
						<li class="th"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기본주소</p></li>
						<li class="td"><input type="text" name="address1" id="address1" size="50" readonly="readonly" value="<%=loginMember.getAddress1()%>">
							<div id="address1Msg" class="error">기본주소를 입력해 주세요.</div>
						</li>
					</ul>		
					<ul class="required">
						<li class="th"><p>상세주소</p></li>
						<li class="td"><input type="text" name="address2" id="address2" size="50" value="<%=loginMember.getAddress2()%>">
							<div id="address2Msg" class="error">상세주소를 입력해 주세요.</div>
						</li>
						<li class="th"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;참고항목</p></li>
						<li class="td"><input type="text" name="address3" id="address3" size="50" value="<%=loginMember.getAddress3()%>">
						</li>
					</ul>		
					
								
					<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
							</div>
							
							<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
							<script>
							    // 우편번호 찾기 찾기 화면을 넣을 element
							    var element_wrap = document.getElementById('wrap');
							
							    function foldDaumPostcode() {
							        // iframe을 넣은 element를 안보이게 한다.
							        element_wrap.style.display = 'none';
							    }
							
							    function sample3_execDaumPostcode() {
							        // 현재 scroll 위치를 저장해놓는다.
							        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
							        new daum.Postcode({
							            oncomplete: function(data) {
							                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							
							                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
							                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							                var addr = ''; // 주소 변수
							                var extraAddr = ''; // 참고항목 변수
							
							                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							                    addr = data.roadAddress;
							                } else { // 사용자가 지번 주소를 선택했을 경우(J)
							                    addr = data.jibunAddress;
							                }
							
							                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							                if(data.userSelectedType === 'R'){
							                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
							                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
							                        extraAddr += data.bname;
							                    }
							                    // 건물명이 있고, 공동주택일 경우 추가한다.
							                    if(data.buildingName !== '' && data.apartment === 'Y'){
							                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							                    }
							                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							                    if(extraAddr !== ''){
							                        extraAddr = ' (' + extraAddr + ')';
							                    }
							                    // 조합된 참고항목을 해당 필드에 넣는다.
							                    document.getElementById("address3").value = extraAddr;
							                
							                } else {
							                    document.getElementById("address3").value = '';
							                }
							
							                // 우편번호와 주소 정보를 해당 필드에 넣는다.
							                document.getElementById('zipcode').value = data.zonecode;
							                document.getElementById("address1").value = addr;
							                // 커서를 상세주소 필드로 이동한다.
							                document.getElementById("address2").focus();
							
							                // iframe을 넣은 element를 안보이게 한다.
							                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
							                element_wrap.style.display = 'none';
							
							                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
							                document.body.scrollTop = currentScroll;
							            },
							            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
							            onresize : function(size) {
							                element_wrap.style.height = size.height+'px';
							            },
							            width : '100%',
							            height : '100%'
							        }).embed(element_wrap);
							
							        // iframe을 넣은 element를 보이게 한다.
							        element_wrap.style.display = 'block';
							    }
							</script>
						</div>
				</div>
		</div>
</div>
<div id="btn_register" class="btn_area_c">
	<button type="submit" class="btn_resp size_c color2 ">입력 완료</button>
	<button type="reset" class="btn_resp size_c color2">다시 입력</button>
</div>
</form>

<script type="text/javascript">
$("#join").submit(function() {
	var submitResult=true;
	$(".error").css("display","none");
	
	var passwdReg=/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*_-]).{6,20}$/g;
	if($("#passwd").val()!="" && !passwdReg.test($("#passwd").val())) {
		$("#passwdRegMsg").css("display","block");
		submitResult=false;
	} 
	
	if($("#passwd").val()!=$("#repasswd").val()) {
		$("#repasswdMatchMsg").css("display","block");
		submitResult=false;
	}
	
	if($("#name").val()=="") {
		$("#nameMsg").css("display","block");
		submitResult=false;
	}
	
	var emailReg=/^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+(\.[-a-zA-Z0-9]+)+)*$/g;
	if($("#email").val()=="") {
		$("#emailMsg").css("display","block");
		submitResult=false;
	} else if(!emailReg.test($("#email").val())) {
		$("#emailRegMsg").css("display","block");
		submitResult=false;
	}
	
	var mobile2Reg=/\d{3,4}/;
	var mobile3Reg=/\d{4}/;
	if($("#mobile2").val()=="" || $("#mobile3").val()=="") {
		$("#mobileMsg").css("display","block");
		submitResult=false;
	} else if(!mobile2Reg.test($("#mobile2").val()) || !mobile3Reg.test($("#mobile3").val())) {
		$("#mobileRegMsg").css("display","block");
		submitResult=false;
	}
	

	
	if($("#address2").val()=="") {
		$("#address2Msg").css("display","block");
		submitResult=false;
	}
	
	alert("정보수정 완료");
	return submitResult;
});


</script>

















