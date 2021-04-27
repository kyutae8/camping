<%@page import="site.semi.dao.SmemberDAO"%>
<%@page import="site.semi.dto.SmemberDTO"%>
<%@page import="site.semi.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<form name="findPasswdForm" method="post">

	<h3 class="title_sub6" style="text-align:center">비밀번호 찾기를 위해 아이디와 이메일을 입력해 주세요. </h3>
	<p class="input_area" style="text-align:center">

		<input type="text" name="id" id="id" class="id" placeholder="아이디" required="required" />
		<input type="text" name="email" id="email" class="email" placeholder="이메일" required="required" />
		<button type="button" onclick="submitCheck();" class="btn_resp size_b color2">입력완료<br><br></button>
		<br>
		<a class="kspy" id="message" style="color:red;"><%=message %></a>
		
	</p>
</form>

<script type="text/javascript">
function submitCheck() {
	if(findPasswdForm.email.value=="") {
		document.getElementById("message").innerHTML="이메일을 입력해 주세요.";
		findIdForm.email.focus();
		return;
	}
	
	if(findPasswdForm.id.value=="") {
		document.getElementById("message").innerHTML="생년월일을 입력해 주세요.";
		findIdForm.id.focus();
		return;
	}
	
	
	findPasswdForm.action="<%=request.getContextPath() %>/index.jsp?workgroup=member&work=findpasswd_action";
	
	findPasswdForm.submit();
}
</script>




