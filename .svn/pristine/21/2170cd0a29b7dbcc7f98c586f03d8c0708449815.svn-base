<%@page import="site.semi.dto.SmemberDTO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="site.semi.dto.ScartDTO"%>
<%@page import="java.util.Scanner"%>
<%@page import="site.semi.dao.ScartDAO"%>
<%@page import="site.semi.dao.ScartDAO"%>
<%@page import="site.semi.dto.ScartDTO"%>
<%@page import="site.semi.dao.SproductDAO"%>
<%@page import="site.semi.dto.SproductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% 
	SmemberDTO loginMember=(SmemberDTO)session.getAttribute("loginMember");


 	int num=Integer.parseInt(request.getParameter("num"));
 	SproductDTO sproduct=SproductDAO.getDAO().selectNumSproduct(num);
 	
 	

 	String color = request.getParameter("category");
 	int price = sproduct.getPrice();
 	String name=sproduct.getName();
 	int qty=Integer.parseInt(request.getParameter("su"));
 	
 	
 	System.out.println("qty : "+qty);
 	
 	String getId = "";
 	
 	if(loginMember != null){
 		getId = loginMember.getId();
 	 	System.out.println("getId : "+getId);
 	}
 	else{
%>

<%
 	}
 	
	System.out.println("qty : "+qty);
 	ScartDTO scart = new ScartDTO(); 
 	scart.setNum(num);
 	scart.setQty(qty);
 	scart.setPrice(price);
 	scart.setName(name);
 	scart.setId(getId);
 	scart.setColor(color);
 	
 	ScartDAO.getDAO().insertScart(scart);
 
 	
 	
 %>   
	

		<script type="text/javascript">
		if(confirm("장바구니에 등록되었습니다! 확인하시겠습니까?")){
		 location.href="<%=request.getContextPath() %>/index.jsp?workgroup=sproduct&work=sproduct_cart";
		}else{
			 location.href="<%=request.getContextPath() %>/index.jsp?workgroup=sproduct&work=sproduct_page&num=<%=sproduct.getNum()%>";
		}
		</script>
	