
<%@page import="site.semi.dao.SmemberDAO"%>
<%@page import="site.semi.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원정보를 전달받아 MEMBER 테이블에 저장된 회원정보를 변경하고 회원정보 상세 츨력페이지
(member_detail.jsp)로 이동하는 JSP 문서 --%>
<%-- => 비로그인 사용자가 요청한 경우 에러페이지 이동 - 비정상적인 요청 --%>
<%@include file="/security/login_check.jspf" %>
<%
	//비정상적인 요청에 대한 응답 - 에러페이지 이동 
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
	
	//전달값을 반환받아 저장
	String id=request.getParameter("id");
	String passwd=request.getParameter("passwd");
	if(passwd!=null && !passwd.equals("")) {//비밀번호가 입력되어 전달된 경우 - 새로운 비밀번호 사용
		passwd=Utility.encrypt(passwd);
	} else {//비밀번호를 입력하지 않아 전달되지 않은 경우 - 기존 비밀번호 사용
		passwd=loginMember.getPasswd();
	}
	String name=request.getParameter("name").trim();
	String email=request.getParameter("email");
	String mobile=request.getParameter("mobile1")+"-"+request.getParameter("mobile2")
		+"-"+request.getParameter("mobile3");
	String zipcode=request.getParameter("zipcode");
	String address1=request.getParameter("address1");
	String address2=Utility.stripTag(request.getParameter("address2"));
	String address3=Utility.stripTag(request.getParameter("address3"));
	
	//DTO 클래스로 인스턴스를 생성하여 전달값으로 필드값 변경
	SmemberDTO smember=new SmemberDTO();
	smember.setId(id);
	smember.setPasswd(passwd);
	smember.setName(name);
	smember.setEmail(email);
	smember.setMobile(mobile);
	smember.setZipcode(zipcode);
	smember.setAddress1(address1);
	smember.setAddress2(address2);
	smember.setAddress3(address3);
	
	//회원정보(DTO 인스턴스)를 전달하여 MEMBER 테이블에 저장된 기존 회원정보를 변경하는
	//DAO 클래스의 메소드 호출
	SmemberDAO.getDAO().updateMember(smember);
	
	//세션에 저장된 권한 관련 정보(회원정보)를 변경
	session.setAttribute("loginMember", SmemberDAO.getDAO().selectIdMember(id));
	
	//회원정보 상세 출력페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=member&work=mypage';");
	out.println("</script>");
%>









