<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="site.semi.dao.SboardDAO"%>
<%@page import="site.semi.dto.SboardDTO"%>
<%@page import="site.semi.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>
<% 
	//비정상적인 요청에 대한 응답
	if(request.getMethod().equals("GET")) {		
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	

	//전달값을 반환받아 저장
	String saveDirectory=request.getServletContext().getRealPath("/board/review/image"); //테스트용 임시경로
	MultipartRequest mr=new MultipartRequest(request, saveDirectory, 30*1024*1024, "utf-8", new DefaultFileRenamePolicy());
	
	int num=Integer.parseInt(mr.getParameter("num"));
	String pageNum=mr.getParameter("pageNum");
	String search=mr.getParameter("search");
	String keyword=mr.getParameter("keyword");
	
	int itemnum=Integer.parseInt(mr.getParameter("itemnum"));
	String grade=mr.getParameter("grade");
	String title=Utility.escapeTag(mr.getParameter("title"));
	String content=Utility.escapeTag(mr.getParameter("content"));
	String img=mr.getFilesystemName("img");
	String currentImg=mr.getParameter("currentImg");
	int status=0;//전달값이 없는 경우 : 일반글 -  0(초기값)   
	if(mr.getParameter("secret")!=null) {//전달값이 있는 경우 : 비밀글 - 1
		status=Integer.parseInt(mr.getParameter("secret"));
	} 
	
	/* 
	pstmt=con.prepareStatement(sql);
	pstmt.setInt(1, board.getItemnum());			
	pstmt.setString(2, board.getGrade());
	pstmt.setString(3, board.getTitle());
	pstmt.setString(4, board.getContent());
	pstmt.setString(5, board.getImg());
	pstmt.setInt(6, board.getStatus());
	pstmt.setInt(7, board.getNum());
	*/
	
	SboardDTO board=new SboardDTO();
	board.setNum(num);
	board.setItemnum(itemnum);
	board.setGrade(grade);
	board.setTitle(title);
	board.setContent(content);
	if(img!=null){
		board.setImg(img);
		new File(saveDirectory, currentImg).delete();
	}else{
		board.setImg(currentImg);
	}
	board.setStatus(status);
	
	//게시글을 이용하여 BOARD 테이블에 저장된 해당 게시글을 변경하는 DAO 클래스의 메소드 호출
	SboardDAO.getDAO().updateReview(board);
	
	//게시글 상세 출력페이지 이동 - 페이지 관련 값 전달
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()
		+"/index.jsp?workgroup=board/question&work=question_detail&num="+num+"&pageNum="
		+pageNum+"&search="+search+"&keyword="+keyword+"';");
	out.println("</script>");
	
%>