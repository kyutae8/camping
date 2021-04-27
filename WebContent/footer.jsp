<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="layout_footer" class="layout_footer">
	<div class="footer_a" >
		<div class="resp_wrap">
			<ul class="menu1">
				<li class="foot_menu_d1 cs">
					<h4 class="title"><a href="index.jsp?workgroup=company&work=cs" >CS Center</a></h4>
					<ul class="list v4">
						<li class="compay_phone">
							<a href="tel: 02-6255-8002">02-6255-8002</a>
						</li>
						<li>
							<p><span>MON-FRI : AM 09:00 ~ PM 06:00 </p><p>SAT, SUN, HOLIDAY OFF</span></p>
						</li>
						<li class="Pt2"><p><span>LUNCH : AM 12:00 ~ PM 01:00</span></p></li>
					</ul>
				</li>
				<li class="foot_menu_d2 bank">
					<h4 class="title"><span>Banking Info</span></h4>
					<ul class="list v3 gray_03">
						<li>
							<p>우리은행 1002-748-541279 / <span class="gray_06" >예금주 :</span> 최규태</p>
						</li>
						<li>
							<p>신한은행 110-268-222010 / <span class="gray_06" >예금주 :</span> 최규태</p>
						</li>
					</ul>
				</li>
				<li class="foot_menu_d3">
					<h4 class="title"><span>Community</span></h4>
					<ul class="list v3 gray_03">
						<li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=board&work=board_list&category=1">Notice</a></li>
						<li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=board&work=qa&category=5">Q&amp;A</a></li>
						<li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=board/question&work=question_list&category=3">Inquiry</a></li>
						<li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=board/review&work=review_list&category=2">Review</a></li>
					</ul>
				</li>
				<li class="foot_menu_d4">
					<h4 class="title"><span>Follow Us</span></h4>
					<ul class="list v3 gray_03">
						<li>
							<a href="https://www.instagram.com/omirakitchen/">Instagram</a>
						</li>
						<li>
							<a href="https://open.kakao.com/o/so5sYqXc">Kakao</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	<div class="footer_b">
		<div class="resp_wrap">
			<ul class="menu2">
				<li><a href="index.jsp?workgroup=base&work=print" >HOME</a></li>
				<li><a href="index.jsp?workgroup=company&work=company_hello" >COMPANY</a></li>
				<li><a href="index.jsp?workgroup=company&work=agreement" >AGREEMENT</a></li>
				<li><a href="index.jsp?workgroup=company&work=privacy" >PRIVACY POLICY</a></li>
                <li><a href="index.jsp?workgroup=company&work=guide" >GUIDE</a></li>
                <li><a href="index.jsp?workgroup=company&work=partner" ></a></li>
			</ul>
		</div>
	</div>
	<div class="footer_c">
		<div class="resp_wrap">
			<ul class="menu3">
				<li><span>COMPANY :</span> <span class="pcolor">(주) On The Mountain</span></li>
				<li><span>CEO :</span> <span class="pcolor">박철호 </span></li>
				<li><span>ADDRESS :</span> <span class="pcolor">서울특별시 강남구 테헤란로 124 4층 (역삼동, 삼원타워) </span></li>
				<li><span>TEL :</span> <a href="tel:02-6255-8002" class="pcolor">02-6255-8002</a></li>
				<li><span>FAX :</span> <span class="pcolor">02-569-8069</span></li>
				<li><span>BUSINESS LICENCE :</span> <span class="pcolor">220-86-20171 <a href="javascript:;" onclick="window.open('http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1234567890','communicationViewPopup','width=750,height=700,scrollbars=yes')">[사업자정보확인]</a></span></li>
				<li><span>ONLINE LICENCE :</span> <span class="pcolor">강남 제-3339호</span></li>
				<li><span >PRIVACY OFFICER :</span> <span class="pcolor"> 박소연(<a class="pcolor" href="mailto:pinypine@naver.com">pinypine@naver.com</a>)</span></li>
				<li>HOSTING PROVIDER : <span class="pcolor">(주)유니윌</span></li>
			</ul>
			<p class="copyright">COPYRIGHT (c) <span class="pcolor">(주) 유니윌</span> ALL RIGHTS RESERVED.</p>
			<div class="escrow"><script type="text/javascript">function f_escrowKicc(){window.open("http://www.easypay.co.kr/escrow/escrow_memb_auth.jsp?memb_id=GA123456", "kicc_escrow", "top=0,left=0,width=800,height=450,scrollbars,menubar=no,resizable,status,location=yes,toolbar=yes");}</script><img src="/proto/camping/data/icon/escrow_mark/kicc.png" style="cursor:pointer;" onclick="f_escrowKicc();" /></div>
		</div>
	</div>
</div>

<!-- 하단영역 : 끝 -->
</html>