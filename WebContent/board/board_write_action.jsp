<%@page import="site.semi.util.Utility"%>
<%@page import="site.semi.dao.SboardDAO" %>
<%@page import="site.semi.dto.SboardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>
<!--
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, board.getCategory()); O
					pstmt.setString(2, board.getId()); O
					pstmt.setString(3, board.getWriter()); O
					pstmt.setInt(4, board.getItemnum()); O
					pstmt.setString(5, board.getGrade()); O
					pstmt.setString(6, board.getTitle());
					pstmt.setString(7, board.getContent());
					pstmt.setString(8, board.getImg()); O
					pstmt.setInt(9, board.getStatus());
-->
<%

	String pageNum=request.getParameter("pageNum");
	
	/*String subject=Utility.escapeTag(request.getParameter("subject"));  */
//

	//loginMember=(SmemberDTO)session.getAttribute("loginMember");
	String category=request.getParameter("category");
	String id=request.getParameter("id");
	String writer=request.getParameter("writer");
	int itemnum=Integer.parseInt(request.getParameter("itemnum"));
	String grade=request.getParameter("grade");
	String title=Utility.escapeTag(request.getParameter("title"));
	String content=Utility.escapeTag(request.getParameter("content"));
	String img=request.getParameter("img");
	int status=0;//전달값이 없는 경우(일반글) - 일반글 : 0(초기값) 
	if(request.getParameter("secret")!=null){//전달값이 있는 경우(비밀글)
		status=Integer.parseInt(request.getParameter("secret"));
	}
	//System.out.println(category);
	//System.out.println(title);
	
	SboardDTO board=new SboardDTO();
	board.setCategory(category);
	board.setId(id);
	board.setWriter(writer);
	if(itemnum!=0){
		board.setItemnum(itemnum);
	}
	board.setGrade(grade);
	board.setTitle(title);
	board.setContent(content);
	board.setImg(img);
	board.setStatus(status);
	
	SboardDAO.getDAO().insertBoard(board);
	if(category.equals("1")){
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=board&work=board_list&pageNum="+pageNum+"';");
		out.println("</script>");
	} else if(category.equals("2")){
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=board/review&work=review_list&pageNum="+pageNum+"';");
		out.println("</script>");
	}
	
	
%>
