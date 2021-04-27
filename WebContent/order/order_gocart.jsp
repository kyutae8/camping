<%@page import="site.semi.dto.ItemDTO"%>
<%@page import="site.semi.dto.SaleCartDTO"%>
<%@page import="site.semi.dao.SaleCartDAO"%>
<%@page import="site.semi.dao.SmemberDAO"%>
<%@page import="site.semi.dao.ItemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_url.jspf" %>
<%
	//변수 전달값 저장
	String color = request.getParameter("color");
	String itemno = request.getParameter("itemno");
	String itemcount = request.getParameter("itemcount");
	//색상변경 해버리기
	int rows = ItemDAO.getDAO().updateItemColor(color,Integer.parseInt(itemno));
	//물건목록 가져오기(단일행으로)
	ItemDTO itemdto = ItemDAO.getDAO().selectItem(Integer.parseInt(itemno));
	//카트db에 물건 담기
	SaleCartDTO saledto = new SaleCartDTO();
	saledto.setItem_buycount(Integer.parseInt(itemcount));
	saledto.setItem_color(color);
	saledto.setItem_price(itemdto.getItem_price());
	saledto.setItem_sale(itemdto.getItem_sale());
	saledto.setLogin_id(loginMember.getId());
	saledto.setItem_num(Integer.parseInt(itemno));
	saledto.setItem_name(itemdto.getItem_name());
	
	int cartrows = SaleCartDAO.getDAO().insertSale(saledto);
	if(rows==0 || cartrows==0){%>
		<script type="text/javascript">
	location.href="<%=request.getContextPath() %>/index.jsp?workgroup=error&work=error400";
</script>
		
<% 	}else{%> 

		<script type="text/javascript">
		var confirm = confirm("장바구니에 등록되었습니다! 확인하시겠습니까?");
		if(confirm){
		 location.href="<%=request.getContextPath() %>/index.jsp?workgroup=cart&work=cart_list";
			
		}else{
			 location.href="<%=request.getContextPath() %>/index.jsp?workgroup=order&work=order_item&itemno=<%=itemno%>";
		}
</script>
		
	<% }
%>
