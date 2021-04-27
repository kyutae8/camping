
<%@page import="site.semi.dao.SmemberDAO"%>
<%@page import="site.semi.dto.SmemberDTO"%>
<%@page import="site.semi.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원정보를 전달받아 MEMBER 테이블에 저장하고 로그인 입력페이지(member_login.jsp)로 이동하는 JSP 무성 --%>
<%

	//비정상적인 요청에 대한 응답 - 에러페이지 이동
	if(request.getMethod().equals("GET")){
		//Content 영역에 포함되는 JSP 문서이므로 리다이렉트 이동 불가
		// => 자바스크립트를 이용하여 페이지 이동
		//response.sendRedirect(request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400");
		//return;
		
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	//POST 방식으로 요청하여 전달된 값에 대한 캐릭터셋 변경
	//Content 영역에 포함되는 JSP 문서이므로 전달값에 대한 캐릭터셋 변경 불가
	// => 템플릿 페이지(index.jsp)에서 전달값에 대한 캐릭터셋 변경
	//request.setCharacterEncoding("UTF-8");
	
	//전달값을 반환받아 저장
	String id=request.getParameter("id");
	String passwd=Utility.encrypt(request.getParameter("passwd"));
	String name=request.getParameter("name").trim();
	String birthday=request.getParameter("birth");
	String email=request.getParameter("email1")+"@"+request.getParameter("email2");
	String mobile=request.getParameter("mobile1")+"-"+request.getParameter("mobile2")+"-"+request.getParameter("mobile3");
	String zipcode=request.getParameter("zipcode");
	String address1=request.getParameter("address1");
	String address2=Utility.stripTag(request.getParameter("address2"));
	String address3=Utility.stripTag(request.getParameter("address3")); 
	
	SmemberDTO smember=new SmemberDTO();
	smember.setId(id); 
	smember.setPasswd(passwd);
	smember.setName(name);
	smember.setBirthday(birthday);
	smember.setEmail(email);
	smember.setMobile(mobile);
	smember.setZipcode(zipcode);
	smember.setAddress1(address1);
	smember.setAddress2(address2);
	smember.setAddress3(address3);
	
	
	
	//DTO 인스턴스를 전달하여 MEMBER 테이블에 삽입하는 DAO 클래스의 메소드 호출
	SmemberDAO.getDAO().insertMember(smember);
	
	//로그인 입력페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=member&work=login';");
	out.println("</script>");
%>