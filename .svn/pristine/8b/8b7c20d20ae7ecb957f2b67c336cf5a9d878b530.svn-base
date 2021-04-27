<%@page import="site.semi.dto.SmemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	SmemberDTO loginMember=(SmemberDTO)session.getAttribute("loginMember");
	
	//비로그인 상태의 사용자이거나 관리자가 아닌 경우 - 비정상적인 요청
	if(loginMember==null || loginMember.getStatus()!=9) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
%>    
<style>

.amain {

	align-content: center;
	width: 1300px;
	height: 900px;
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
}


.atext {

	text-align: center;
	size: 60em;
	color: white;
}

</style>
<div id="layout_body" class="layout_body">

<img src="<%=request.getContextPath()%>/images/amain.gif" class="amain">
<p class="atext">즐거운 코딩즐거운 코딩즐거운 코딩즐거운 코딩즐거운 코딩즐거운 코딩즐거운 코딩즐거운 코딩즐거운 코딩즐거운 코딩즐거운 코딩즐거운 코딩</p>

</div>
