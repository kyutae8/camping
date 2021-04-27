<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원정보 변경 또는 탈퇴를 위해 비밀번호를 입력하는 JSP 문서 --%>
<%-- => 비로그인 사용자가 요청한 경우 에러페이지 이동 - 비정상적인 요청 --%>
<%@include file="/security/login_check.jspf" %>
<%
	String action=request.getParameter("action");

	String message=(String)session.getAttribute("message");
	if(message==null) {
		message="";
	} else {
		session.removeAttribute("message");
	}
%>
<style>

.title_sub6 {

	margin-top: 80px;
}

.input_area {
	margin-top: 40px;

}

.kspy {
	margin-top: 20px;

}

</style>

<form name="passwdForm" method="post">
	<%if(action.equals("modify")) { %>
	<h3 class="title_sub6" style="text-align:center">회원정보 변경을 위한 비밀번호를 입력해 주세요. </h3>
	<% } else if (action.equals("remove")) { %>
	<h3 class="title_sub6" style="text-align:center">회원 탈퇴를 위한 비밀번호를 입력해 주세요. </h3>
	<% } %>
	<p class="input_area" style="text-align:center">

		<input type="password" name="passwd" id="passwd" class="box_pw" placeholder="비밀번호" required="required" />
		<button type="button" onclick="submitCheck();" class="btn_resp size_b color2">입력완료<br><br></button>
		<br>
		<a class="kspy" id="message" style="color:red;"><%=message %></a>
		
	</p>
</form>

<script type="text/javascript">
function submitCheck() {
	if(passwdForm.passwd.value=="") {
		document.getElementById("message").innerHTML="비밀번호를 입력해 주세요.";
		passwdForm.passwd.focus();
		return;
	}
	
	<% if(action.equals("modify")) { %>
	passwdForm.action="<%=request.getContextPath() %>/index.jsp?workgroup=member&work=modify";
	<% } else if (action.equals("remove")) { %>
	passwdForm.action="<%=request.getContextPath() %>/index.jsp?workgroup=member&work=remove";
	alert("탈퇴완료, 이용해주셔서 감사합니다.");
	<% } %>
	
	passwdForm.submit();
}
</script>




