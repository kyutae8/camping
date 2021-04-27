<%@page import="site.semi.dao.SmemberDAO"%>
<%@page import="site.semi.dto.SmemberDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 아이디를 전달받아 MEMBER 테이블에 저장된 기존 회원정보의 아이디와 비교하여 사용 가능 여부를 
	클라이언트에게 전달하는 JSP 문서 --%>
<%-- => 아이디 사용가능(미중복) : 사용 가능 메세지 전달 - 부모창의 아이디 입력태그의 입력값 변경 --%>
<%-- => 아이디 사용불가능(중복) : 사용 불가능 메세지 전달 - 아이디 입력 후 현재 페이지 요청 --%>
<%
	//비정상적인 요청에 대한 응답
	if(request.getParameter("id")==null) {//전달값(아이디)이 없는경우
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}

	//전달값을 반환받아 저장
	String id=request.getParameter("id");
	
	//아이디를 이용하여 회원정보를 검색하는 DAO 클래스의 메소드 호출
	// => null 반환 : 회원정보 미검색 - 아이디 사용 가능
	// => 회원정보 반환 : 회원정보 검색 - 아이디 사용 불가능 
	SmemberDTO smember=SmemberDAO.getDAO().selectIdMember(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
<style>
div {
	text-align:center;
	margin: 10px;
}

.id {color: red;}
</style>
</head>
<body>
	<% if(smember==null) {//아이디가 사용 가능한 경우 %>
	<div>입력한 <span class="id">[<%=id %>]</span>는 사용 가능한 아이디 입니다.</div>
	<div><button type="button" onclick="windowClose();">아이디 사용</button></div>
	
	<script type="text/javascript">
	function windowClose() {
		//opener 객체 : 부모창을 표현하는 자바스크립트 객체
		opener.joinForm.id.value="<%=id%>";
		opener.joinForm.idCheckResult.value="1";
		window.close();
	}
	</script>
	<% } else {//아이디가 사용 불가능한 경우 %>
	<div id="message">입력한 <span class="id">[<%=id %>]</span>는 이미 사용중인 아이디 입니다.<br>
	다른 아이디를 입력하고 [확인]을 눌러주세요.</div>
	<div>
	<%-- form 태그의 action 속성이 생략된 경우 현재 브라우저의 URL 주소로 요청 --%>
	<%-- form 태그의 method 속성이 생략된 경우 GET 방식으로 요청 --%>
	<form name="checkForm">
		<input type="text" name="id">
		<button type="button" id="submitBtn">확인</button>
	</form>
	</div>
	
	<script type="text/javascript">
	document.getElementById("submitBtn").onclick=function() {
		var id=checkForm.id.value;
		if(id=="") {
			document.getElementById("message").innerHTML="아이디를 입력해 주세요";
			document.getElementById("message").style="color: red;"
			return;
		}
		
		var idReg=/^[a-zA-Z]\w{5,19}$/g;
		if(!idReg.test(id)) {
			document.getElementById("message").innerHTML="아이디는 영문자로 시작되는 영문자,숫자,_의 6~20범위의 문자로만 작성 가능합니다.";
			document.getElementById("message").style="color: red;"
			return;
		}
		
		checkForm.submit();
	}
	</script>
	<% } %>
</body>
</html>

