<%@page import="site.semi.dao.SboardDAO"%>
<%@page import="site.semi.dto.SboardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
 	for(int i=38;i<=70;i++){ 
		SboardDTO board=new SboardDTO();
		int num=SboardDAO.getDAO().selectNextNum();
		board.setNum(num);
		board.setCategory("2");//공지 : 1/// 상품문의 :3
		board.setId("qwe123");
		board.setWriter("이규성");
		board.setTitle("리뷰테스트-"+i);
		board.setContent("리뷰테스트 -"+i);
		SboardDAO.getDAO().testBoard(board);
	}
%>


<!-- 
				

 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>테스트완료ㅕ</h1>
</body>
</html>