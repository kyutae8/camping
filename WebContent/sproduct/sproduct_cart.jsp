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
	width: 750px;
	margin: 10px auto;
}	
#btnDiv {
	text-align: right;
	margin-bottom: 5px;
	
}
table {
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
}
#btnDiv {
	text-align: right;
	margin-bottom: 5px;
	
}
th, td {
	border: 1px solid black;
	padding: 3px;
	text-align: center;
	font-size: 12px;
}
.title {
	background: black;
	color: white;
	text-align: center;
	width: 100px;
}

th {
	background: black;
	color: white;
}

.scart_num { width: 100px; }
.scart_name { width: 200px; }
.scart_color { width: 200px; }
.scart_qty { width: 200px; }
.scart_price{ width: 200px; }
.scart_image { width: 300px; }

</style>

<div id="productList">
<form method="post" name="scartForm" id="scartForm" >

<h2>장바구니 목록</h2>
<div id="btnDiv">
<button  type="button" id="removeBtn">선택상품삭제&nbsp;&nbsp;&nbsp;|</button>
<button  type="button" id="goSorder">&nbsp;선택상품주문</button>

</div>
<table>
		<tr>
			<td><input type="checkbox" id="allCheck"></td>
			<td class="title">번호</td>
			<td class="title">상품이름</td>
			<td class="title">상품색상</td>
			<td class="title">상품수량</td>
			<td class="title">상품가격</td> 
			<td class="title">상품이미지</td>
		</tr>
		<% for(ScartDTO scart:list) { %>
		
		<tr>

		<td><input type="checkbox" name="scart_num" class="check" value="<%=scart.getScart_num() %>"></td>
		<td ><%=scart.getScart_num() %></td>
		<td ><%=scart.getName() %><input type="hidden" name="getid" id="getid" value="<%=scart.getId() %>"></td>
		<td ><%=scart.getColor() %></td>
		<td ><%=scart.getQty() %></td>
		<td ><%=scart.getPrice() %></td>
		<td ><img src="<%=request.getContextPath() %>/sproduct_image/mheader<%=scart.getNum() %>.png" width="200"></td>
	</tr>
	<% } %>
</table>
</form>
</div>
<div style="clear:both;"></div>

<script type="text/javascript">
$("#allCheck").change(function() {
	if($(this).is(":checked")) {
		$(".check").prop("checked",true);		
	} else {
		$(".check").prop("checked",false);		
	}
});

$("#removeBtn").click(function() {
	if($(".check").filter(":checked").size()==0) {
		$("#message").text("선택한 재품이 하나도 없습니다.");
		return;
	}
	 
	$("#scartForm").attr("method","post");
	$("#scartForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=sproduct&work=scart_remove_action");
	$("#scartForm").submit();
});
$("#goSorder").click(function() {
	if($(".check").filter(":checked").size()==0) {
		$("#message").text("선택한 재품이 하나도 없습니다.");
		return;
	}
	
	$("#scartForm").attr("method","post");
	$("#scartForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=sproduct&work=sorder");
	$("#scartForm").submit(); 
});
</script>



