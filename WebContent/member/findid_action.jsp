<%@page import="site.semi.dao.SmemberDAO"%>
<%@page import="site.semi.dto.SmemberDTO"%>
<%@page import="site.semi.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	//전달값을 반환받아 저장
	String email=request.getParameter("email");
	String birthday=request.getParameter("birthday");
	
	
	String id=SmemberDAO.getDAO().findIdMember(email, birthday);
	
	
%>
<form name="relogina" method="post">
	<h3 class="title_sub6" style="text-align:center"> 아이디 = <%=id %> </h3>
	<p class="input_area" style="text-align:center">

		<button type="button" onclick="relogin()" class="btn_resp size_b color2">돌아가기<br><br></button>
		<br>
		
	</p>
</form>
<script type="text/javascript">
function relogin() {
	relogina.action="<%=request.getContextPath() %>/index.jsp?workgroup=member&work=login";
	relogina.submit();
}
</script>