<%@page import="site.semi.dao.SorderDAO"%>
<%@page import="site.semi.dto.SorderDTO"%>
<%@page import="site.semi.dao.SproductDAO"%>
<%@page import="site.semi.dto.SproductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %>  

<%
	int num=Integer.parseInt(request.getParameter("num"));

	SproductDTO sproduct=SproductDAO.getDAO().selectNumSproduct(num);
	SorderDTO sorder=SorderDAO.getDAO().sns(num);
%>

<style type="text/css">
#product {
	width: 300px;
	margin: 0 auto;
}

table {
	margin: 0 auto;
}

td {
	text-align: left;
} 
</style>

<div id="product">
	<form action="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=sorder_detail_modify_action&num=<%=sorder.getNum() %>"
		method="post" id="productForm">
	<input type="hidden" name="productNum" value="<%=sorder.getNum()%>">
	<h2 >제품변경</h2>
	<table>
		<tr>
			<td>주문자</td>
			<td>
				<input type="text" name="oname" id="oname" value="<%=sorder.getOname()%>">
			</td>
		</tr>
			<td>제품명</td>
			<td>
				<input type="text" name="Name" id="Name" value="<%=sorder.getName()%>">
			</td>
		</tr>
		<tr>
			<td>제품색상</td>
			<td>
				<select name="category2">
					<option value="RED" <% if(sorder.getColor().split("_")[0].equals("TENT")) { %> selected="selected" <% } %>>빨강(RED)</option>
					<option value="GREEN" <% if(sorder.getColor().split("_")[0].equals("BAG")) { %> selected="selected" <% } %>>초록(GREEN)</option>
					<option value="YELLOW" <% if(sorder.getColor().split("_")[0].equals("TOOL")) { %> selected="selected" <% } %>>노랑(YELLOW)</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>배송지</td>
			<td>
				<li><input type="text" id="zipcode" name="zipcode" placeholder="우편번호" readonly="readonly" value="<%=sorder.getZipcode()%>"></li>
				<li><input id="postt" type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br></li>
				<li><input type="text" id="address1" name="address1" placeholder="주소" readonly="readonly"></li>
				<li><input type="text" id="address2" name="address2" placeholder="상세주소"></li>
				<li><input type="text" id="address3" name="address3" placeholder="참고항목"></li>
							
				<li><div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative"></li>
				</div>
							
				<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script>
				   // 우편번호 찾기 찾기 화면을 넣을 element
							    var element_wrap = document.getElementById('wrap');
							
							    function foldDaumPostcode() {
							        // iframe을 넣은 element를 안보이게 한다.
							        element_wrap.style.display = 'none';
							    }
							
							    function sample3_execDaumPostcode() {
							        // 현재 scroll 위치를 저장해놓는다.
							        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
							        new daum.Postcode({
							            oncomplete: function(data) {
							                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							
							                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
							                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							                var addr = ''; // 주소 변수
							                var extraAddr = ''; // 참고항목 변수
							
							                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							                    addr = data.roadAddress;
							                } else { // 사용자가 지번 주소를 선택했을 경우(J)
							                    addr = data.jibunAddress;
							                }
							
							                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							                if(data.userSelectedType === 'R'){
							                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
							                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
							                        extraAddr += data.bname;
							                    }
							                    // 건물명이 있고, 공동주택일 경우 추가한다.
							                    if(data.buildingName !== '' && data.apartment === 'Y'){
							                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							                    }
							                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							                    if(extraAddr !== ''){
							                        extraAddr = ' (' + extraAddr + ')';
							                    }
							                    // 조합된 참고항목을 해당 필드에 넣는다.
							                    document.getElementById("address3").value = extraAddr;
							                
							                } else {
							                    document.getElementById("address3").value = '';
							                }
							
							                // 우편번호와 주소 정보를 해당 필드에 넣는다.
							                document.getElementById('zipcode').value = data.zonecode;
							                document.getElementById("address1").value = addr;
							                // 커서를 상세주소 필드로 이동한다.
							                document.getElementById("address2").focus();
							
							                // iframe을 넣은 element를 안보이게 한다.
							                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
							                element_wrap.style.display = 'none';
							
							                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
							                document.body.scrollTop = currentScroll;
							            },
							            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
							            onresize : function(size) {
							                element_wrap.style.height = size.height+'px';
							            },
							            width : '100%',
							            height : '100%'
							        }).embed(element_wrap);
							
							        // iframe을 넣은 element를 보이게 한다.
						  element_wrap.style.display = 'block';
					 }
			</script>
			</td>
		</tr>
		
		<tr>
			<td>배송 요청 사항</td>
			<td>
				<input type="text" name="productDetail" id="productDetail" value="<%=sorder.getMessage()%>">
			</td>
		</tr>
		<tr>
			<td>제품수량</td>
			<td>
				<input type="text" name="productQty" id="productQty" value="<%=sorder.getQty()%>">
			</td>
		</tr>
		<tr>
			<td>제품가격</td>
			<td>
				<input type="text" name="productPrice" id="productPrice" value="<%=sorder.getPrice()%>">
			</td>
		</tr>
		<tr>
			<td colspan="2"><button type="submit">제품변경</button></td>
		</tr>
	</table>
	</form>
	
	<div id="message" style="color: red;"></div>
</div>

<script type="text/javascript">
$("#productForm").submit(function() {
	if($("#oname").val()=="") {
		$("#message").text("주문자 성함을 입력해 주세요.");
		$("#oname").focus();
		return false;
	}
	if($("#Name").val()=="") {
		$("#message").text("제품명을 입력해 주세요.");
		$("#Name").focus();
		return false;
	}
	if($("zipcode").val()=="") {
		$("#message").text("주소지를 선택해 주세요.");
		$("zipcode").focus();
		return false;
	}
	if($("address2").val()=="") {
		$("#message").text("상세주소를 입력해 주세요.");
		$("address2").focus();
		return false;
	}
	if($("#productDetail").val()=="") {
		$("#message").text("배송요청사항을 입력해 주세요.");
		$("#productDetail").focus();
		return false;
	}
	if($("#productQty").val()=="") {
		$("#message").text("제품수량을 입력해 주세요.");
		$("#productQty").focus();
		return false;
	}
	if($("#productPrice").val()=="") {
		$("#message").text("제품가격을 입력해 주세요.");
		$("#productPrice").focus();
		return false;
	}
});

</script>