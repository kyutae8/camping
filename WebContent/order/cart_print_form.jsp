<%@page import="java.util.List"%>
<%@page import="site.semi.dao.SaleCartDAO"%>
<%@page import="site.semi.dto.SaleCartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@include file="/security/login_url.jspf" %>
        <%
		List<SaleCartDTO> list = SaleCartDAO.getDAO().selectAllSale(loginMember.getId());
        int originprice = 0;
        int sale=0;
        int total=0;
        int buycount=0;
        %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
<title>견적서</title>
<style type="text/css" media="all">
body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,textarea,p,blockquote,th,td,input,select,textarea,button{margin:0;padding:0;}
body,th,td,input,select,textarea,button{ font-size:13px; line-height:1.4; font-weight:400; color:#333; font-family:'Malgun Gothic',sans-serif;}
fieldset{border:0 none;vertical-align:top;}
dl,ul,ol,menu,li{list-style:none}
img { max-width:100%; }

table{width:100%; border-collapse:collapse;border-spacing:0; border:1px #bbb solid; }
th { padding:5px; border:1px #bbb solid; text-align:left; background:#eee; font-weight:normal; }
td { padding:5px; border:1px #bbb solid; text-align:left; }

body { overflow:hidden; }

#controll_frame { width:100%; }
#controll_frame td { text-align:center; height:110px; padding:0 5px; border-bottom:1px #333 solid; font-size:15px; }
#controll_frame .desc { padding-top:10px; font-size:13px; line-height:1.4; color:#999; }

#print_frame { position:fixed; left:0; top:112px; right:0; bottom:0; padding:10px; overflow-y:auto; }

h2 { padding:10px 0; text-align:center; font-size:28px; }
h3 { padding:6px 0; font-size:15px; color:#000; }
.estmate_top:after {content:""; display:block; clear:both;}
.estmate_top>li { float:right; width:calc(50% - 5px); }
.estmate_top>li:first-child { float:left; }
.estmate_top .left_area { text-align:center; }
.estmate_top .customer { padding:42px 0 32px; }
.estmate_top #apply_name { display:inline-block; line-height:30px; min-width:140px; border-bottom:1px #333 solid; margin-right:10px; font-size:15px; color:#000; }
.estmate_top .earlow { display:inline-block; line-height:30px; }
.table_1 td { text-align:right; }
.txt1 { padding:10px 0; color:#767676; }

.table_2 { width:100%; table-layout:fixed; }
.table_2 th { text-align:right; }
.table_2 td { text-align:right; }
.table_2 thead th { padding-top:10px; padding-bottom:10px; text-align:center; }
.table_2 tbody tr td:first-child { text-align:left; }
.table_2 .bg2 td { background:#f8f8f8; padding-top:10px; padding-bottom:10px; font-weight:bold; }
.table_2 .bg3 td { background:#e4e4e4; padding-top:10px; padding-bottom:10px; font-weight:bold; }

.tot_cont { margin-top:10px; border:2px #333 solid; padding:15px 0; text-align:center; font-size:17px; font-weight:bold; text-align:right; }
.tot_cont>li { padding:5px 10px; }
.tot_cont .title { font-weight:normal; }
.tot_cont .cont { display:inline-block; min-width:124px; }
.tot_cont .tot_price { font-size:21px; }

@media only screen and (max-width:767px) {
	h3 { padding-top:20px; }
	.estmate_top>li { float:none; width:auto; }
	.estmate_top>li:first-child { float:none; width:auto; }
	.estmate_top .customer { padding:10px 0; }
	.table_2 td { font-size:12px; }
}

@media print {
	* { color:#000 !important; }
	#controll_frame { display:none; }
	#print_frame { top:0; padding:0; }
}
</style>
<script src="/app/javascript/plugin/jquery.bxslider.js?v="></script>
</head>
<body>

	<!-- ++++++++++++++ 상단 ++++++++++++++ -->
	<table id="controll_frame" cellpadding="0" cellspacing="0">
		<tbody>
			<tr>
				<td>
					<span style="color:#555;">받는분</span>&nbsp;
					<input type="text" value="<%=loginMember.getName() %>" class="inp" id="estimate_name" name="estimate_name" style="width:140px; border:none; border-bottom:1px solid #aaa; line-height:30px; font-size:15px; color:#000;">
					<button class="apply-name" type="button" onclick="applyName();" style="border:1px solid #888; background:#fff; padding:0 15px; line-height:30px; font-weight:bold; color:#666; cursor:pointer;">적용</button>
					<button type="button" onclick="estimatePrint();" style="border:1px solid #969696; background:#aaa; padding:0 15px; line-height:30px; color:#fff; cursor:pointer;">인쇄</button>
					<p class="desc">받는분을 입력 후 적용을 클릭하면 아래의 입력란에 적용됩니다.</p>
				</td>
			</tr>
		</tbody>
	</table>
	<!-- ++++++++++++++ //상단 ++++++++++++++ -->

	<!-- ++++++++++++++ 본문 ++++++++++++++ -->
	<div id="print_frame">
		<h2>견 적 서</h2>

		<!-- -->
		<ul class="estmate_top">
			<li class="left_area">
				<div class="area">
					<p class="customer"><span id="apply_name">박소연</span><span class="earlow">귀하</span></p>
					<table class="table_1" cellpadding="0" cellspacing="0">
						<colgroup><col width="80"><col></colgroup>
						<tbody>
							<tr><th>견적번호</th><td>202102241050545163</td></tr>
							<tr><th>견적일자</th><td>2021년 02월 24일</td></tr>
						</tbody>
					</table>
				</div>
			</li>
			<li class="right_area">
				<h3>사업자 정보</h3>
				<div class="area">
					<table class="table_1" cellpadding="0" cellspacing="0">
						<colgroup><col width="90"><col><col width="60"></colgroup>
						<tbody>
							<tr>
								<th>사업자 번호</th>
								<td colspan="2">123-45-67890</td>
							</tr>
							<tr>
								<th>상호</th>
								<td>(주) 귀사의 회사명</td>
								<td rowspan="2" style="text-align:center;"><img src="<%=request.getContextPath()%>/images/mheader.png"></td>
							</tr>
							<tr><th>대표자명</th><td>김대표</td></tr>
							<tr><th>주소</th><td colspan="2">경기도 성남시 분당구 대왕판교로 670 (유스페이스2) </td></tr>
							<tr><th>전화번호</th><td colspan="2">02-1234-5678</td></tr>
							<tr><th>홈페이지주소</th><td colspan="2">edge_sample.firstmall.kr</td></tr>
						</tbody>
					</table>
				</div>
			</li>
		</ul>

		<p class="txt1">아래와 같이 견적합니다.</p>

		<table class="table_2" cellpadding="0" cellspacing="0">
			<colgroup>
				<col><col style="width:8%;"><col style="width:18%;"><col style="width:14%;"><col style="width:15%;">
			</colgroup>
			<thead>
				<tr>
					<th>품명</th>
					<th>수량</th>
					<th>상품금액합계</th>
					<th>배송비</th>
					<th>할인</th>
				</tr>
			</thead>
			<tbody>
			<%for(int i=0;i<list.size();i++){ 
			SaleCartDTO dto = list.get(i);
			originprice+=dto.getItem_price()*dto.getItem_buycount();
			sale+=(dto.getItem_price()*dto.getItem_sale()/100)*dto.getItem_buycount();
			total=originprice-sale;
			buycount +=dto.getItem_buycount();
			%>
				<tr>
					<td>
						<%=dto.getItem_name() %>
						<div class="goods_option">
						<%=dto.getItem_color() %>
						</div>
					</td>
					<td style="text-align:center;">
						<div id="cart_option_ea_41"><%=dto.getItem_buycount() %></div>
					</td>
					<td>
						<span class="cart_option_orgprice_41"><%=dto.getItem_price()*dto.getItem_buycount() %></span>₩
					</td>
					<td class="goods_delivery_info">
								0₩
					</td>
					<td>
						<span class="cart_option_price_41">
						<%=(dto.getItem_price()*dto.getItem_sale()/100)*dto.getItem_buycount()%>₩
						</span>
					</td>
				</tr>
				<%} %>
				<tr class="bg2">
					<td style="text-align:center;">합계</td>
					<td style="text-align:center;"><%=buycount %></td>
					<td><%=originprice%>₩</td>
					<td>0₩</td>
					<td><%=sale%>₩</td>
				</tr>
				<tr class="bg3">
					<td style="text-align:center;">결제금액</td>
					<td colspan="4"><%=total%>₩</td>
				</tr>
			</tbody>
		</table>
		
		<ul class="tot_cont">
			<li><span class="title">공급가액</span> : <span class="cont"><%=total %>₩</span></li>
			<li><span class="title">부가세액</span> : <span class="cont">0₩</span></li>
			<li><span class="tot_price"><span class="title">합계</span> : <span class="cont"><%=total %>₩</span></span></li>
		</ul>
	</div>






<script type="text/javascript">

	function applyName(){
		var apply_name = document.getElementById('estimate_name').value;

		if(apply_name == ''){
			alert("이름을 입력해 주세요.");
			return false;
		}

		document.getElementById('apply_name').innerHTML = apply_name;
	}

	function estimatePrint(){
		//window.onbeforeprint = beforePrint;
		//window.onafterprint = afterPrint;
		window.print();
	}
</script>
</body>
</html>