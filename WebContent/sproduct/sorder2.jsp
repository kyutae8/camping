<%@page import="site.semi.dto.SmemberDTO"%>
<%@page import="site.semi.dao.SproductDAO"%>
<%@page import="site.semi.dto.SproductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int num=Integer.parseInt(request.getParameter("num"));

	SproductDTO sproduct=SproductDAO.getDAO().selectNumSproduct(num);
	

	SmemberDTO loginMember=(SmemberDTO)session.getAttribute("loginMember");

	if(loginMember==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
	
	String category=request.getParameter("category");
	if(category==null) category="ALL";	
	

	
%>   



<div class="subpage_wrap">
	<div class="subpage_container v3 Pb10">
		<div class="title_container Pb0">
			<h2><span >주문/결제</span></h2>
		</div>
	</div>
</div>

<form name="joinForm" id="join" method="post" action="<%=request.getContextPath() %>/index.jsp?workgroup=sproduct&work=sorder_action2">
<input type="hidden" name="color" value="<%=sproduct.getColor() %>">
<input type="hidden" name="name" value="<%=sproduct.getName() %>">
<input type="hidden" name="price" value="<%=sproduct.getPrice() %>">
<input type="hidden" name="num" value="<%=sproduct.getNum() %>">

<div id="orderPaymentLayout">

	<div>
		<!-- 주문상품 :: START -->
		<h2 class="title_od1 Pt15"><span>주문상품 정보</span></h2>
		<div class="cart_contents">
			<div class="cart_list">
				<ul class="shipping_group_list ">
					<li class="goods_delivery_info clearbox" style="display: list-item;">
						<ul class="detail">
							<li class="th">무료배송</li>
						</ul>
					</li>
					<li class="cart_goods">
						<div class="cart_goods_detail">

							<div class="cgd_contents">
								<div class="block block1">
									<ul>
										<li class="img_area"></li>
										<li class="option_area">


											<div class="goods_name v2">
												<a><%=sproduct.getName() %></a>
											</div>


											<ul class="cart_option">
												<li><span class="xtle">색상</span>
																				<select name="category" id="category">
											<option value="RED" <% if(category.equals("RED")) { %> selected="selected" <% } %>>빨강</option>		
											<option value="GREEN" <% if(category.equals("GREEN")) { %> selected="selected" <% } %>>초록</option>		
											<option value="YELLOW" <% if(category.equals("YELLOW")) { %> selected="selected" <% } %>>노랑</option>		
										</select>		
												</li>
												
											</ul>
 
												<span class="xtle">수량</span>
										<select name="qty" class="input" id="su" >
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select>
											</div>
								</div>

								<ul class="block block2 x1" id="mobile_cart_sale_tr_44">
									<li class="price_a">
										<span class="ptitle">상품금액</span><span id="don"><%=sproduct.getPrice() %></span>
									</li>
									
									<li class="price_c">
									</li>
								</ul>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>



		<div class="order_subsection v2">

			<h3 class="title3"><span>배송지 입력</span></h3>



	<div class="mypage_greeting Pb30">
	</div>


	<div class="resp_member_join_wrap">

			<div id="formMemberArea" class="resp_member_join">
				<div class="resp_join_table">

					<ul class="th ">
						<li class="th " ><p>이름</p></li>
						<li class="td"><input type="text" name="name" id="name" value="<%=loginMember.getName() %>">
							<div id="nameMsg" class="error">이름을 입력해 주세요.</div>
						</li>

						<li class="th "><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일</p></li>
						<li class="td">
							<input type="text" name="email1" id="email1" >
							 @ 
							  <select name="email2" id="email2">
								<option value="" selected>선택</option>
								<option value="naver.com">naver.com</option>
								<option value="nate.com">nate.com</option>
								<option value="dreamwiz.com">dreamwiz.com</option>
								<option value="yahoo.co.kr">yahoo.co.kr</option>
								<option value="empal.com">empal.com</option>
								<option value="unitel.co.kr">unitel.co.kr</option>
								<option value="gmail.com">gmail.com</option>
								<option value="korea.com">korea.com</option>
								<option value="chol.com">chol.com</option>
								<option value="paran.com">paran.com</option>
								<option value="freechal.com">freechal.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="hotmail.com">hotmail.com</option>
							</select>
							<div id="emailMsg" class="error">이메일을 입력해 주세요.</div>
							<div id="emailRegMsg" class="error"></div>
				
						</li>
					</ul>
	
					<ul class="th ">
						<li class="th"><p>휴대폰번호</p></li>
						<li class="td"><select name="mobile1">
											<option value="010" selected>&nbsp;010&nbsp;</option>
											<option value="011">&nbsp;011&nbsp;</option>
											<option value="016">&nbsp;016&nbsp;</option>
											<option value="017">&nbsp;017&nbsp;</option>
											<option value="018">&nbsp;018&nbsp;</option>
											<option value="019">&nbsp;019&nbsp;</option>
										</select>
										- <input type="text" name="mobile2" id="mobile2" size="4" maxlength="4" class="size_phone2">
										- <input type="text" name="mobile3" id="mobile3" size="4" maxlength="4" class="size_phone2">
										<div id="mobileMsg" class="error">전화번호를 입력해 입력해 주세요.</div>
										<div id="mobileRegMsg" class="error">전화번호는 3~4 자리의 숫자로만 입력해 주세요.</div>
						</li>
			
						<li class="th "><p>&nbsp;&nbsp;&nbsp;주소</p></li>
						<li class="td">
							<input type="text" id="zipcode" name="zipcode" placeholder="우편번호" readonly="readonly" value="<%=loginMember.getZipcode() %>">
							<input id="postt" type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" id="address1" name="address1" placeholder="주소" readonly="readonly">
							<input type="text" id="address2" name="address2" placeholder="상세주소">
							<input type="text" id="address3" name="address3" placeholder="참고항목">
							
							<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
								<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
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
						
						</li>
					</ul>

				</div>
			</div>

</div>
</div>

			<!-- 배송 메세지 -->
			<div id="shipMessage" class="ship_message">
				<input type="text" class="ship_message_txt" name="omessage" id="omessage" value="" title="배송 메세지 입력" autocomplete="off" placeholder="배송 메세지 입력">
				<ul class="add_message">
					<li>부재시 경비실에 맡겨 주세요.</li>
					<li>부재시 전화 주시거나 문자 남겨 주세요.</li>
					<li>배송 전에 미리 연락해 주세요.</li>
				</ul>
			</div>
			
			<!-- ++++++++++++++++++++ 배송지 :: END ++++++++++++++++++++ -->



		
		</div>
	</div>


	<div class="subpage_container v2 Pt0 order_payment_right">
		<div class="order_subsection v2 ">
			<div class="right_flying_wrap1">
				<div class="right_flying_wrap2">
					<div class="right_flying_wrap3">
						<!-- ++++++++++++++++++++ 결제 금액 :: START ++++++++++++++++++++ -->
						<h3 class="title3 Pt15"><span >결제 금액</span></h3>
						<div class="order_price_total">
							<ul>
								<li class="th"><span class="gray_01 Fs17" >상품금액</span></li>
								<li class="td"><span id="sum" class="v2 gray_01">	</span>₩</li>
							</ul>
							<ul>
								<li class="th">
									<span>배송비</span>&nbsp;
								</li>
								<li class="td">
									<span class="total_delivery_shipping_price">무료</span>
								</li>
							</ul>
						</div>

						
						<!-- ++++++++++++++++++++ 결제 금액 :: END ++++++++++++++++++++ -->


						<!-- ++++++++++++++++++++ 결제 수단 :: START ++++++++++++++++++++ -->
						<h3 class="title3"><span>결제 수단</span></h3>
						<ul class="payment_method_select clearbox" id="payment_type">
							<li>
								<div class="bank2">
									<label><input type="radio" name="payment" value="bank"></label>
								</div>
								<p>무통장입금</p>
							</li>

							<li>
								<input type="text" name="oname" id="oname" value="" title="입금자명" placeholder="입금자명">
							</li>
							<li>
								<select name="bank">
									<option value="">은행 선택</option>
									<option value="국민은행 000000-00-000000 예금주:김대표">국민은행 000000-00-000000 예금주:김대표</option>
									<option value="신한은행 000-000-000000 예금주:김대표">신한은행 000-000-000000 예금주:김대표</option>
								</select>
							</li>
						</ul>
	
						<!-- 결제 버튼 -->
						<div class="pay_layer btn_area_c" id="pay_layer1">
							<input type="submit" value="결제하기" name="button_pay" id="pay" class="btn_resp size_extra color2 Wmax">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

<script type="text/javascript">
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function calc() {
	var don=$("#don").text();
	var su=$("#su").val();
	$("#sum").text(numberWithCommas(don*su));
}

calc();

$("#su").change(calc);

</script>
