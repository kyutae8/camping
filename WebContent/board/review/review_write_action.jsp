<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="site.semi.util.Utility"%>
<%@page import="site.semi.dao.SboardDAO"%> 
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

	String saveDirectory=request.getServletContext().getRealPath("/board/review/image"); //테스트용 임시경로
	MultipartRequest mr=new MultipartRequest(request, saveDirectory, 30*1024*1024, "utf-8", new DefaultFileRenamePolicy());

 
 	String pageNum=mr.getParameter("pageNum");

	String category=mr.getParameter("category");
	String id=mr.getParameter("id");
	String writer=mr.getParameter("writer");
	int itemnum=Integer.parseInt(mr.getParameter("itemnum"));
	String grade=mr.getParameter("grade");
	String title=Utility.escapeTag(mr.getParameter("title"));
	String content=Utility.escapeTag(mr.getParameter("content"));
	String img=mr.getFilesystemName("img");
	int status=0;//전달값이 없는 경우(일반글) - 일반글 : 0(초기값) 
	if(request.getParameter("secret")!=null){//전달값이 있는 경우(비밀글)
		status=Integer.parseInt(request.getParameter("secret"));
	}

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

	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=board/review&work=review_list&pageNum="+pageNum+"';");
	out.println("</script>");

	
	
%>
