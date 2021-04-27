<%@page import="site.semi.dao.ItemBuyDAO"%>
<%@page import="site.semi.dto.ItemBuyDTO"%>
<%@page import="site.semi.dao.ItemDAO"%>
<%@page import="site.semi.dao.SaleCartDAO"%>
<%@page import="java.util.List"%>
<%@page import="site.semi.dto.SaleCartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/security/login_url.jspf" %>
<%int row = 0;
	List<SaleCartDTO> list = SaleCartDAO.getDAO().selectAllSale(loginMember.getId());
	for(int i=0;i<list.size();i++){
		SaleCartDTO dto = list.get(i);
		SaleCartDAO.getDAO().deleteSale(dto.getItem_boxcount());
		ItemDAO.getDAO().updateBuy(dto.getItem_num(),dto.getItem_buycount());
		
		ItemBuyDTO buydto = new ItemBuyDTO();
		buydto.setItem_name(dto.getItem_name());
		buydto.setItem_num(dto.getItem_num());
		buydto.setItem_color(dto.getItem_color());
		buydto.setItem_price(dto.getItem_price());
		buydto.setLogin_id(dto.getLogin_id());
		buydto.setItem_buycount(dto.getItem_buycount());
		 row = ItemBuyDAO.getDAO().insertBuy(buydto);
	}
	
%>
<script type="text/javascript">
alert("구매가 완료되었습니다."+<%=row%>);
location.href='<%=request.getContextPath()%>/index.jsp?workgroup=product&work=product_list';
</script>