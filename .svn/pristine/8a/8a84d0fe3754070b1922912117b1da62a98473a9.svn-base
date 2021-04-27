<%@page import="site.semi.dao.ScartDAO"%>
<%@page import="site.semi.dto.ScartDTO"%>
<%@page import="site.semi.dao.SproductDAO"%>
<%@page import="site.semi.dto.SproductDTO"%>
<%@page import="java.util.List"%>
<%@page import="site.semi.dto.SmemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id=request.getParameter("id");
	List<ScartDTO> list=ScartDAO.getDAO().selectAllScart(id);
	
	
%>   

<div id="productList">
<% for(ScartDTO sproduct:list) { %>
	<div class="product">
		<div><%=sproduct.getName() %></div>
		<div>[<%=sproduct.getPrice() %>]</div>
		<div>
			<a href="">
			</a>
		</div>
		<div>
		</div>
	</div>
<% } %>
</div>