<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="site.semi.dao.ItemDAO"%>
<%@page import="site.semi.dto.ItemDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	
		int item_num = Integer.parseInt(request.getParameter("item_num"));
		String item_name = request.getParameter("item_name");
		int item_price = Integer.parseInt(request.getParameter("item_price"));
		String item_category = request.getParameter("item_category");
		String item_info = request.getParameter("item_info");
		String item_img = request.getParameter("item_img");
		int item_count = Integer.parseInt(request.getParameter("item_count"));
		int item_sale = Integer.parseInt(request.getParameter("item_sale"));
		String item_brand = request.getParameter("item_brand");
		ItemDTO dto = new ItemDTO();
		dto.setItem_num(item_num);
		dto.setItem_name(item_name);
		dto.setItem_price(item_price);
		dto.setItem_category(item_category);
		dto.setItem_info(item_info);
		dto.setItem_img(item_img);
		dto.setItem_count(item_count);
		dto.setItem_sale(item_sale);
		dto.setItem_brand(item_brand);
		int row = ItemDAO.getDAO().insertItem(dto);
		if(row==0){%>
			<script type="text/javascript">
			alert("이미 있는 상품번호입니다");
			location.href='<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=product_add';
			</script>
		<% }else{%>
			<script type="text/javascript">
			alert("성공");
			location.href='<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=product_manager';
			
			</script>
		<% }
	%>
