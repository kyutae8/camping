<%@page import="site.semi.dao.SmemberDAO"%>
<%@page import="site.semi.dao.ScartDAO"%>
<%@page import="java.nio.channels.ScatteringByteChannel"%>
<%@page import="site.semi.dto.ScartDTO"%>
<%@page import="site.semi.dao.SproductDAO"%>
<%@page import="site.semi.dto.SproductDTO"%>
<%@page import="java.util.List"%>
<%@page import="site.semi.dto.SmemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션에 저장된 권한 관련정보를 반환받아 저장 - 로그인 사용자와 비로그인 사용자 구분
	SmemberDTO loginMember=(SmemberDTO)session.getAttribute("loginMember");

	if(loginMember==null) {//비로그인 사용자인 경우
		//request.getRequestURI() : 현재 요청페이지의 URI 주소를 반환하는 메소드
		// URI : 인터넷상의 자원 표현 / URL : JQuery까지 표현
		String requestURI=request.getRequestURI();
		
		//request.getQueryString() : 현재 요청페이지의 QueryString을 반환하는 메소드
		String queryString=request.getQueryString();
		
		if(queryString==null || queryString.equals("")) {
			queryString="";
		} else {
			queryString="?"+queryString;
		}
		
		//세션에 현재 요청페이지의 URL 주소를 속성값으로 저장
		session.setAttribute("url", requestURI+queryString);
	
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=member&work=login';");
		out.println("</script>");
		return;
	}

   //String id = request.getParameter("id");
   List<ScartDTO> list = ScartDAO.getDAO().selectAllScart(loginMember.getId());
   
   
   
   for(int i=0; i<list.size(); i++){

      ScartDTO scartDTO = list.get(i);
   %>
      
 <%  } %> 

<style type="text/css">
#productList {
	width: 1000px;
	margin: 0 auto;
}

.product {
	padding: 10px 5px;
	border: 1px solid black;
	width: 300px;
	margin: 10px;
	text-align: center;
	float: left;
}

</style>
<div id="productList">

<% for(ScartDTO scart:list) { %>
	<div class="product">
		<div><%=scart.getNum() %></div>
		<div>상품이름 = <%=scart.getName() %></div>
		<div>상품색상 = <%=scart.getColor() %></div>
		<div>상품수량 = <%=scart.getQty() %></div>
		<div>상품가격 = <%=scart.getPrice() %></div>
		<div>
			<a href="<%=request.getContextPath() %>/index.jsp?workgroup=sproduct&work=sorder&num=<%=scart.getNum() %>">
				<img src="<%=request.getContextPath() %>/sproduct_image/mheader<%=scart.getNum() %>.png" width="200">
			</a>
		</div>
	</div>
<% } %>
</div>
<div style="clear:both;"></div>

