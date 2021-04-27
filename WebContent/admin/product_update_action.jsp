<%@page import="site.semi.dao.ItemDAO"%>
<%@page import="site.semi.dto.ItemDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		String num = request.getParameter("item_num");
		String name = request.getParameter("item_name");
		String price = request.getParameter("item_price");
		String count = request.getParameter("item_count");
		String brand = request.getParameter("item_brand");
		String info = request.getParameter("item_info");
	
		 ItemDTO dto = ItemDAO.getDAO().selectItem(Integer.parseInt(num));
		dto.setItem_name(name);
		dto.setItem_price(Integer.parseInt(price));
		dto.setItem_count(Integer.parseInt(count));
		dto.setItem_brand(brand);
		dto.setItem_info(info); 
	 int row = ItemDAO.getDAO().updateItem(dto);
		if(row==0){%>
			<Script type="text/javascript">location.href='<%=request.getContextPath()%>/index.jsp?workgroup=error&work=error400'</Script>
		<%}else{%>
			<Script type="text/javascript">location.href='<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=product_manager'</Script>
			
		<%}
	%> 