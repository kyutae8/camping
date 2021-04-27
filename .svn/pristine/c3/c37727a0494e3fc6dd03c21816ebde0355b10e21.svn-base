<%@page import="site.semi.dto.SaleCartDTO"%>
<%@page import="site.semi.dto.CartDTO"%>
<%@page import="site.semi.dao.SaleCartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String item_boxcount = request.getParameter("item_boxcount");
	int row= SaleCartDAO.getDAO().deleteSale(Integer.parseInt(item_boxcount));
	if(row==0){%>
		<Script type="text/javascript">
		alert("삭제할 애가 없다");
		</Script>	
	<%return;}else{%>
		<Script type="text/javascript">
		location.href='<%=request.getContextPath()%>/index.jsp?workgroup=cart&work=cart_list';
		</Script>
<%	}
%>