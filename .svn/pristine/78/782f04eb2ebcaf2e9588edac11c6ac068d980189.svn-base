<%@page import="java.util.UUID"%>
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

	String id=request.getParameter("id");
	String email=request.getParameter("email");
	
	String passwd=Utility.tempPasswd();
	
	
	SmemberDTO smember=new SmemberDTO();
	smember.setId(id);
	smember.setEmail(email);
	smember.setPasswd(Utility.encrypt(passwd));
	
	SmemberDAO.getDAO().tempPasswd(smember);
%>

<form name="relogina" method="post">
	<h3 class="title_sub6" style="text-align:center"> 임시비밀번호 = <%=passwd %> </h3>
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