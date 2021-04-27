<%@page import="site.semi.dao.SaleCartDAO"%>
<%@page import="site.semi.dto.ItemDTO"%>
<%@page import="site.semi.dto.ItemBuyDTO"%>
<%@page import="site.semi.dao.ItemBuyDAO"%>
<%@page import="site.semi.dao.ItemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="/security/login_url.jspf" %>
<%
	int itemno = Integer.parseInt(request.getParameter("itemno"));
	int itemcount = Integer.parseInt(request.getParameter("itemcount"));
	int boxcount = Integer.parseInt(request.getParameter("itemboxcount"));
	int row = ItemDAO.getDAO().updateBuy(itemno,itemcount);
	ItemDTO itemdto = ItemDAO.getDAO().selectItem(itemno);
	ItemBuyDTO dto = new ItemBuyDTO();
	dto.setItem_buycount(itemcount);
	dto.setItem_color(itemdto.getItem_color());
	dto.setItem_name(itemdto.getItem_name());
	dto.setItem_num(itemno);
	dto.setItem_price(itemdto.getItem_price());
	dto.setLogin_id(loginMember.getId());
	ItemBuyDAO.getDAO().insertBuy(dto);
	if(row==0){%>
		<Script type="text/javascript">
		alert("구매가 안되ㅠ");
		</Script>
	<%return;}else{
	SaleCartDAO.getDAO().deleteSale(boxcount);
	%>
		<script type="text/javascript">
		alert("구매가 완료되었습니다.");
		location.href='<%=request.getContextPath()%>/index.jsp?workgroup=product&work=product_list';
		</script>
	<%}
	
%>