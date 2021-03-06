<%@page import="site.semi.dao.SmemberDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- MEMBER 테이블에 저장된 회원정보를 검색하여 클라이언트에게 회원목록을 전달하는 JSP 문서 --%>
<%-- => 로그인 상태의 관리자만 접근 가능하도록 권한 설정 --%>
<%-- => 회원목록 중 체크박스를 이용하여 회원정보를 선택하고 [선택회원삭제]를 클릭한 경우 
        회원정보 삭제페이지(member_remove_action.jsp)로 이동 - 선택회원의 아이디 전달 --%>
<%-- => [회원상태]를 변경한 경우 회원상태 변경페이지(member_status_action.jsp)로 이동 
        - 아이디와 변경하고자 하는 회원상태 전달 --%>        
<%@include file="/security/admin_check.jspf" %>    
<%
String search=request.getParameter("search");//컬럼명
if(search==null) search="";
String keyword=request.getParameter("keyword");//검색어
if(keyword==null) keyword="";

int pageNum=1;
if(request.getParameter("pageNum")!=null) {//전달값이 존재하는 경우
	pageNum=Integer.parseInt(request.getParameter("pageNum"));
}

int pageSize=10;

int totalMember=SmemberDAO.getDAO().sbc(search, keyword);

//전체 페이지 갯수를 계산하여 저장
//int totalPage=totalBoard/pageSize+(totalBoard%pageSize==0?0:1);
int totalPage=(int)Math.ceil((double)totalMember/pageSize);

//JSP 문서를 요청할 때 전달된 페이지 번호에 대한 검증
if(pageNum<=0 || pageNum>totalPage) {//페이지 번호가 비정상적인 경우
	pageNum=1;
}

//페이지 번호에 대한 게시글 시작 행번호를 계산하여 저장
//ex)1 Page : 1, 2 Page : 11, 3 Page : 21, 4 Page : 31, ...
int startRow=(pageNum-1)*pageSize+1;
	
//페이지 번호에 대한 게시글 종료 행번호를 계산하여 저장
//ex)1 Page : 10, 2 Page : 20, 3 Page : 30, 4 Page : 40, ...
int endRow=pageNum*pageSize;

//마지막 페이지에 대한 게시글 종료 행번호를 전체 게시글의 갯수로 변경
if(endRow>totalMember) {
	endRow=totalMember;
}

//게시글 시작 행번호와 게시글 종료 행번호를 이용하여 BOARD 테이블에 저장된 게시글에서
//시작행부터 종료행 범위에 포함된 게시글을 검색하여 반환하는 DAO 클래스의 메소드 호출
//List<BoardDTO> boardList=BoardDAO.getDAO().selectBoardList(startRow, endRow);
List<SmemberDTO> boardList=SmemberDAO.getDAO().sbl(startRow, endRow, search, keyword);

//페이지의 게시글에 출력될 시작 게시글 번호를 계산하여 저장
int number=totalMember-(pageNum-1)*pageSize;

//세션에 저장된 권한 관련 정보(회원정보)를 반환받아 저장
// => 로그인 사용자에게만 글쓰기 권한 부여
// => 비밀글인 경우 게시글 작성자와 관리자에게만 게시글 상세보기 권한 부여

String category=request.getParameter("category");
if(category==null) category="ID";

//카테고리를 이용하여 PRODUCT 테이블에 저장된 해당 카테고리의 제품정보를 검색하여 반환하는
//DAO 클래스의 메소드 호출
List<SmemberDTO> smemberList=SmemberDAO.getDAO().scL(category);

%>
<style type="text/css">
table {
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	border: 1px solid black;
	padding: 3px;
	text-align: center;
	font-size: 12px;
}

th {
	background: black;
	color: white;
}

.member_check { width: 80px; }
.member_id { width: 80px; }
.member_name { width: 80px; }
.member_email { width: 140px; }
.member_mobile { width: 140px; }
.member_address { width: 300px; }
.member_join { width: 150px; }
.member_login { width: 150px; }
.member_statue { width: 80px; }
</style>

<h2>회원목록 (회원수 : <%=totalMember %>)</h2>
<form name="smemberForm" id="smemberForm"  method="post">
		<select name="category" id="category">
			<option value="ID" <% if(category.equals("ID")) { %> selected="selected" <% } %>>
				아이디
			</option>	
			<option value="NAME" <% if(category.equals("NAME")) { %> selected="selected" <% } %>>
				이름
			</option>		
			<option value="JOIN" <% if(category.equals("JOIN")) { %> selected="selected" <% } %>>
				가입일
			</option>		
			<option value="LOGIN" <% if(category.equals("LOGIN")) { %> selected="selected" <% } %>>
				로그인
			</option>		
		</select>
	</form>
	<form name="memberForm" id="memberForm" >
<table>
	<tr>
		<th><input type="checkbox" id="allCheck"></th>
		<th>아이디</th>
		<th>이름</th>
		<th>이메일</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>가입날짜</th>
		<th>로그인날짜</th>
		<th>상태</th>
	</tr> 
	
	<% for(SmemberDTO smember:boardList) { %>
	<tr>
		<td class="member_check">
			<% if(smember.getStatus()==9) { %>
				관리자
			<% } else { %>
				<input type="checkbox" name="checkId" value="<%=smember.getId()%>" class="check">
			<% } %>
		</td>
		<td class="member_id"><%=smember.getId() %></td>
		<td class="member_name"><%=smember.getName() %></td>
		<td class="member_email"><%=smember.getEmail() %></td>
		<td class="member_mobile"><%=smember.getMobile() %></td>
		<td class="member_address">
			[<%=smember.getZipcode() %>]<%=smember.getAddress1() %> <%=smember.getAddress2() %>
		</td>
		<td class="member_join"><%=smember.getJoinDate().substring(0, 19) %></td>
		<td class="member_login">
			<% if(smember.getLastLogin()!=null) { %>
				<%=smember.getLastLogin().substring(0, 19) %>
			<% } %>
		</td>
		<td class="member_status">
			<select class="status" name="<%=smember.getId()%>">
				<option value="1" <% if(smember.getStatus()==1) { %> selected="selected" <% } %>>
					일반회원
				</option>
				<option value="9" <% if(smember.getStatus()==9) { %> selected="selected" <% } %>>
					관리자
				</option>
			</select>
		</td>
	</tr>
	<% } %>
</table>
	</form>
<button type="button" id="removeBtn">선택회원삭제</button>
<div id="message" style="color: red;"></div>

	<%
		//페이지 블럭에 출력될 페이지 번호의 갯수 설정
		int blockSize=5;
	
		//페이지 블럭에 출력될 시작 페이지 번호를 계산하여 저장
		// => 1 Block : 1, 2 Block : 6, 3 Block : 11, 4 Block : 16, ...
		int startPage=(pageNum-1)/blockSize*blockSize+1;
		                 
		//페이지 블럭에 출력될 종료 페이지 번호를 계산하여 저장
		// => 1 Block : 5, 2 Block : 10, 3 Block : 15, 4 Block : 20, ...
		int endPage=startPage+blockSize-1;
		
		//마지막 페이지 블럭의 종료 페이지 번호 변경
		if(endPage>totalPage) {
			endPage=totalPage;
		}
	%>
	<div>
	<% if(startPage>blockSize) { %>
		<a href="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=member_manager&pageNum=1&search=<%=search%>&keyword=<%=keyword%>">[처음]</a>
		<a href="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=member_manager&pageNum=<%=startPage-blockSize%>&search=<%=search%>&keyword=<%=keyword%>">[이전]</a>
	<% } else { %>
		[처음][이전]	
	<% } %>
	
	<% for(int i=startPage;i<=endPage;i++) { %>
		<% if(pageNum!=i) { %>
			<a href="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=member_manager&pageNum=<%=i%>&search=<%=search%>&keyword=<%=keyword%>">[<%=i %>]</a>
		<% } else { %>
			[<%=i %>]
		<% } %>
	<% } %> 
	
	<% if(endPage!=totalPage) { %>
		<a href="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=member_manager&pageNum=<%=startPage+blockSize%>&search=<%=search%>&keyword=<%=keyword%>">[다음]</a>
		<a href="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=member_manager&pageNum=<%=totalPage%>&search=<%=search%>&keyword=<%=keyword%>">[마지막]</a>
	<% } else { %>
		[다음][마지막]	
	<% } %>
	</div>

<script type="text/javascript">
$("#allCheck").change(function() {
	if($(this).is(":checked")) {
		$(".check").prop("checked",true);		
	} else {
		$(".check").prop("checked",false);		
	}
});

$("#removeBtn").click(function() {
	if($(".check").filter(":checked").size()==0) {
		$("#message").text("선택한 회원이 하나도 없습니다.");
		return;
	}
	
	$("#memberForm").attr("method","post");
	$("#memberForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=member_remove_action");
	$("#memberForm").submit();
});

$(".status").change(function() {
	//이벤트가 발생된 엘리먼트의 속성값을 반환받아 저장
	var id=$(this).attr("name");//고유값
	var status=$(this).val();//변경값
	alert(id+" = "+status);
	location.href="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=member_status_action&id="+id+"&status="+status;
});

$("#category").change(function() {
	$("#smemberForm").submit();
});

</script>











