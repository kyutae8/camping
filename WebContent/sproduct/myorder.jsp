<%@page import="java.util.List"%>
<%@page import="site.semi.dto.SorderDTO"%>
<%@page import="site.semi.dao.SorderDAO"%>
<%@page import="site.semi.dto.SmemberDTO"%>
<%@page import="site.semi.dao.GuestDAO"%>
<%@page import="site.semi.dto.GuestDTO"%>
<%@page import="site.semi.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	SmemberDTO loginMember=(SmemberDTO)session.getAttribute("loginMember");

	String oid=loginMember.getId();
	
	List<SorderDTO> sorderList=SorderDAO.getDAO().selectAllSorderList(oid);
	
%>
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
<% if(sorderList.isEmpty()) { %>
		<tr>
			<td colspan="4">등록된 제품이 하나도 없습니다.</td>
		</tr>
		<% } else {%>

<form name="relogina" method="post">
<div id="productList">

<% for(SorderDTO sorder:sorderList) { %>
	<div class="product">
		<div><%=sorder.getStatus() %></div>
		<div>상품이름 = <%=sorder.getName() %></div>
		<div>상품색상 = <%=sorder.getColor() %></div>
		<div>상품수량 = <%=sorder.getQty() %></div>
		<div>상품가격 = <%=sorder.getPrice() %></div>
		<div>
			<a href="<%=request.getContextPath() %>/index.jsp?workgroup=sproduct&work=sorder2&num=<%=sorder.getNum() %>">
				<img src="<%=request.getContextPath() %>/sproduct_image/mheader<%=sorder.getNum() %>.png" width="200">
			</a>
		</div>
	</div>
<% } %>
<% } %>
</div> 
<div style="clear:both;"></div>
		<button type="button" onclick="relogin()" class="btn_resp size_b color2">돌아가기<br><br></button>
		<br>
		
</form>
<script type="text/javascript">
function relogin() {
	relogina.action="<%=request.getContextPath() %>/index.jsp?workgroup=base&work=print";
	relogina.submit();
}
</script>