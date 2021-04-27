//ie8이하 start
if(!Array.indexOf){
	Array.prototype.indexOf = function(obj){
	 for(var i=0; i<this.length; i++){
	  if(this[i]==obj){
	   return i;
	  }
	 }
	 return -1;
	}
   }
   
   if (!Object.keys) Object.keys = function(o) {
	if (o !== Object(o))
	 throw new TypeError('Object.keys called on a non-object');
	var k=[],p;
	for (p in o) if (Object.prototype.hasOwnProperty.call(o,p)) k.push(p);
	return k;
   }
   
   if(typeof String.prototype.trim !== 'function') {
	 String.prototype.trim = function() {
	   return this.replace(/^\s+|\s+$/g, ''); 
	 }
   }
   //ie8이하 end
   
   if	(typeof L10n != 'object')
	   document.write('<script type="text/javascript" src="/data/js/language/L10n_KR.js"></script>');
   
   // 함수부만 따로 호출
   document.write('<script type="text/javascript" src="/app/javascript/js/common-function.js?v=140729"></script>');
   
   window.Firstmall = window.Firstmall || {};
   
   $(function(){
	   try {
		   var target = $(window);
		   var target_events = [];
		   var callback = function(e) {
			   if(['input', 'textarea', 'select'].indexOf(e.target.tagName.toLowerCase()) === -1 && !e.target.isContentEditable) e.preventDefault();
			   else e.stopPropagation();
		   };
   
		   if(Firstmall.Config.Security.PreventDrag) target_events.push('selectstart');
		   if(Firstmall.Config.Security.PreventContextMenu) target_events.push('contextmenu');
		   target.on(target_events.join(' '), callback);
	   } catch(ex) {
		   if(ex instanceof TypeError) 1;/* jQuery 1 related exception($(window).on is not exists) */
		   else console.log('An exception occured while set contextmenu prevent event: ', ex);
	   }
   });
   
   $(function(){
	   var cartVersion = $('input[name=cart_version]').val(); //18-05-03 카트 스킨 버전 gcns jhs add
	   /* 스타일적용 */
	   apply_input_style();
	   
	   // jstree 객체를 사용하는 페이지에서는 jQuery 구버전을 사용하므로 on 함수가 없어 예외 처리
	   if(typeof $.jstree !== "object") {
		 //상품디스플레이의 동영상클릭시 -> 동영상자동실행설정되어있어야함
		 $(document).on('click', ".goodsDisplayVideoWrap", function() {
			 $(this).find("img").addClass("hide");
			 $(this).find(".thumbnailvideo").hide();
			 $(this).find(".mobilethumbnailvideo").hide();
			 $(this).find("iframe").removeClass("hide");
			 $(this).find("embed").removeClass("hide");
		 });
	   
		 //동영상넣기의 동영상클릭시-> 동영상자동실행설정되어있어야함
		 $(document).on('click', ".DisplayVideoWrap", function() {
			 $(this).find("img").addClass("hide");
			 $(this).find(".thumbnailvideo").hide();
			 $(this).find(".mobilethumbnailvideo").hide();
			 $(this).find("iframe").removeClass("hide");
			 $(this).find("embed").removeClass("hide");
		 });
	   }
   
	   //18-05-03 gcns jhs add 장바구니 개선
	   if(cartVersion >= 3){
		   if (typeof gl_operation_type != 'undefined' && gl_operation_type == 'light') { // 반응형스킨
			   // 전체 선택
			   $('.btn_select_all').attr('checked',true);			
			   $("form#cart_form .btn_select_all").change(function() {
				   if($(this).is(":checked")){
					   $("form#cart_form input[name='cart_option_seq[]']").each(function(){
						   $(this).attr("checked",true);
					   });
					   cnt = $("form#cart_form input[name='cart_option_seq[]']").length;
				   }else{
					   $("form#cart_form input[name='cart_option_seq[]']").each(function(){
						   $(this).removeAttr("checked");
					   });
				   }
			   });	
			   $("form#cart_form .btn_select_all").change();
			   
			   $('input[name*="cart_option_seq[]"]').live('click',function(){
				   checkBoxCheck();
				   setPriceInfoCheck();
			   });	
		   } else if(gl_set_mode == 'mobile'){ // 전용스킨-모바일
			   // 전체 선택
			   $('.btn_select_all').attr('checked',true);			
			   $("form#cart_form .btn_select_all").change(function() {
				   if($(this).is(":checked")){
					   $("form#cart_form input[name='cart_option_seq[]']").each(function(){
						   $(this).attr("checked",true);
						   $(this).closest("div").addClass("ez-checkbox-on");
					   });
					   $(".cart_goods").css('outline','2px solid #769dff');
					   cnt = $("form#cart_form input[name='cart_option_seq[]']").length;
				   }else{
					   $("form#cart_form input[name='cart_option_seq[]']").each(function(){
						   $(this).removeAttr("checked");
						   $(this).closest("div").removeClass("ez-checkbox-on");
					   });
   
					   $(".cart_goods").css('outline','');
				   }
			   });	
			   $("form#cart_form .btn_select_all").change();
			   
			   $('input[name*="cart_option_seq[]"]').live('click',function(){
				   checkBoxCheck();
				   setPriceInfoCheck();
			   });			
		   } else{ // 전용스킨-pc
			   $('.chk_select_all').attr('checked',true);
			   var chkSt = $('.chk_select_all').is(":checked");
			   checked_all_order(chkSt);
			   //setPriceInfo();
			   
			   $('input[name*="cart_option_seq[]"]').live('click',function(){
				   checkBoxCheck();
				   setPriceInfoCheck();
			   });
		   }
	   }
	   //18-05-03 gcns jhs add 장바구니 개선	
   
   });
   
   $(window).load(function() {
	   /* 스타일적용 */
	   chk_small_goods_image();
   });
   
   String.prototype.replaceAll = function (str1,str2){
	   var str	= this;	 
	   var result   = str.replace(eval("/"+str1+"/gi"),str2);
	   return result;
   }
   
   //통계서버로 통계데이터 전달 사용안함
   function statistics_firstmall(act,goods_seq,order_seq,review_point)
   {
	   return;
	   /*
	   var url = '/_firstmallplus/statistics';
	   var allFormValues = "act="+act+"&goods_seq="+goods_seq;
	   if( order_seq ) allFormValues += "&order_seq="+order_seq;
	   if( review_point ) allFormValues += "&review_point="+review_point;
	   
	   if(act == 'order' && !order_seq) return false;
	   if(act == 'review' && !review_point) return false;
	   if(!goods_seq) return false;
	   $.ajax({
		   cache:false,
		   timeout:1000,  
		   type:"POST",
		   url:url,
		   data:allFormValues,
		   error:function(){},
		   success:function(response){}
	   });
	   return true;
	   */
   }
   
   // 사은품 지급 조건 상세 2015-05-14 pjm
   $(".gift_log").bind('click', function(){
	   $.ajax({
		   type: "post",
		   url: "./gift_use_log",
		   data: "order_seq="+$(this).attr('order_seq')+"&item_seq="+$(this).attr('item_seq'),
		   success: function(result){
			   if	(result){
				   $("#gift_use_lay").html(result);
				   //사은품 이벤트 정보
				   openDialog(getAlert('mo023'), "gift_use_lay", {"width":"450","height":"250"});
			   }
		   }
	   });
   });
   
   
   //문자열 바이트 체크(utf-8도 가능)
   String.prototype.byteLength = function(mode){
	   mode	= (!mode) ? 'euc-kr' : mode;
	   text	= this;
	   byte	= 0;
	   switch(mode){
		   case	'utf-8' :
			   for(byte=i=0;char=text.charCodeAt(i++);byte+=char>>11?3:char>>7?2:1);
			   break;
		   
		   default :
			   for(byte=i=0;char=text.charCodeAt(i++);byte+=char>>7?2:1);
		   
	   }
	   return byte
   };
   
   
   /*
	* form RSA 암호화 프로세스
	*  - form 내에 file이 있을 경우 기존 프로세스에서도 file 데이터 전송은 동작하지 않았음.
	* 확인된 submit 예외 사항
	* - front script 레벨에서 form을 생성한 후 body에 추가하지 않고 submit
	*  -> 이 경우는 https://www.w3.org/TR/html5/forms.html#constraints 4.10.22.3 를 위반하여 일부 브라우저에서 submit이 발생하지 않음.
	* - ajax나 iframe을 통해 새로운 페이지를 생성한 후 document.sslForm.submit() 를 통해 submit
	*  -> DOM 객체로 submit 호출과 동일
	* - 스크립트 호출과 바인딩이 이루어지기 전 $(document).ready() 와 동시에 submit
	*/ 
   // RSA 전역 변수 선언
   var getPublicKeyUrl = ["/ssl/getRSAPublicKey","/RSA/ssl/getRSAPublicKey"];
   var handshakeUrl = ["/ssl/getRSAHandShake","/RSA/ssl/getRSAHandShake"];
   var arrCheckActions = ["/ssl/relayRsa?action=", "/RSA/ssl/setRSAReturnPost/"];
   var jcryptionReloadDelayTime = 500;	// 0.5 초 후 다시 리로드, 지연 발생 시 1초씩 증가
   var sGlSessionKey	= '';
   var sGlAction		= '';
   
   // 동적 스크립트 호출
   $.loadScript = function (url, callback) {$.ajax({url: url,dataType: 'script',success: callback,async: true});}
   $(window).load(function(){
	   // order_price_calculate 주문서 계산 함수에서 ssl 통신을 이용하고 있지 않고 현재 페이지가 주문서 작성 페이지라면 ssl_url로 치환
	   if( window.location.pathname.indexOf('/order/settle') > -1
			   && order_price_calculate.toString().indexOf("/common/ssl_action")==-1){
		   order_price_calculate = function () {
			   var f = $("form#orderFrm");
			   action = "/order/calculate?mode="+gl_mode;
			   // ssl 적용
			   $.ajax({
				   async: false,
				   'url'		: '/common/ssl_action',
				   'data'		: {'action':action},
				   'type'		: 'get',
				   'dataType'	: 'html',
				   'success'	: function(res) {
					   action = res;
				   }
			   });
			   f.attr("action",action);
			   f.attr("target","actionFrame");
			   // jCryption 재적용 스킨의 orderFrm 에 ssl 링크가 없기에 js 영역에서 재선언
			   moduleJcryption.resetJcryptionSubmit(f[0]);
			   f.submit();
		   };
	   }
	   
	   // jquery 버전이 1.7 이하 일경우 관리자에서 사용중이므로 https 강화를 제외한다.
	   if($().jquery >= "1.7"){
		   $.loadScript("/app/javascript/plugin/jcryption/jquery.jcryption.3.1.0_custom.js", function(){
			   initJcryption();
		   });
	   }
	   // ajax 호출 후 새로 생성된 form에도 적용
	   $(document).ajaxComplete(function() {
		   // 모든 폼 엘리먼트에 이벤트를 바인딩 한다
		   $("body form").each(function (){
			   var domEl = this;
			   moduleJcryption.convertJcryptionSubmit(domEl);
		   });
	   });
   });
   // 암호화 적용 기능 모듈화
   var moduleJcryption = {
	   // 폼에서 프로토콜을 포함한 host name을 얻는다.
	   getHostNameFromForm : function (formObj) {
		   var formActionUrl = formObj.attr("action");
		   return moduleJcryption.getHostNameFromUrl(formActionUrl);
	   }
	   , getHostNameFromUrl : function (url){
		   var arr = url.split("/");
		   var result = arr[0]+"//"+arr[2];
		   return result;
	   }
	   // SSL 적용 폼인지 여부 확인
	   , checkSSLForm : function (formObj){
		   var formActionUrl = formObj.attr("action");
		   if(formActionUrl){
			   for(var i in arrCheckActions){
				   if(formActionUrl.indexOf(arrCheckActions[i])>-1){
					   return i;
				   }
			   }
		   }
		   return -1;
	   }
	   // 이벤트가 바인드 된 폼인지 확인
	   , checkBindEventForm : function (formObj){
		   var data = (formObj.data("jCryptionInit") === true);
		   if(data){
			   return true;
		   }
		   return false;
	   }
	   // 이벤트가 치환된 된 폼인지 확인
	   , checkBindEventJcryptionForm : function (formObj){
		   var data = (formObj.data("jCryptionAlready") === true);
		   if(data){
			   return true;
		   }
		   return false;
	   }
	   // 속성을 확인한다
	   , getAttributes : function ( $node ) {
		   var attrs = {};
		   $.each( $node[0].attributes, function ( index, attribute ) {
			   attrs[attribute.name] = attribute.value;
		   } );
   
		   return attrs;
	   }
	   , destroyJcryptionSubmit : function(domEl){
		   $(domEl).data("jCryptionInit",false);
		   $(domEl).data("jCryptionAlready",false);
		   $(domEl).off("submit");
	   }
	   , resetJcryptionSubmit : function(domEl){
		   moduleJcryption.destroyJcryptionSubmit(domEl);
		   moduleJcryption.convertJcryptionSubmit(domEl);
	   }
	   , convertJcryptionSubmit : function(domEl){
		   // 이미 치환된 폼은 중복 치환하지 않음.
		   if(moduleJcryption.checkBindEventJcryptionForm($(domEl))){
			   // console.log("already submit convert ", $(domEl));
		   }else{
			   // console.log("submit convert event binding!", $(domEl));
			   $(domEl).data("jCryptionAlready",true);
			   // URL 이 SSL 적용 폼인지 확인
			   // console.log($(domEl),$(domEl).attr("action"),moduleJcryption.checkSSLForm($(domEl)));
			   if(moduleJcryption.checkSSLForm($(domEl))>-1){
				   // 기본 dom 객체를 우선 치환한 후 jquery 객체 submit 이벤트 바인딩.
				   // jquery객체 서브밋이 발생한다면 preventDefault 로 인해 dom객체의 서브밋은 발생하지 않음.
				   domEl.submit = function (event){
					   // console.log("DOM el submit");
					   moduleJcryption.convertSubmit(domEl);
				   };
				   // validate 플러그인이 적용되어 있을 시 별도의 submithandle를 이용하므로 jquery 객체 바인딩 제외
				   if(typeof $(domEl).data("validator") !== "undefined"){
				   }else{
					   $(domEl).on("submit", function(event){
						   // console.log("jquery el submit");
						   event.preventDefault();
						   moduleJcryption.convertSubmit(domEl);
					   });
				   }
			   }
		   }
	   }
	   // 세션키 유지를 위한 action url 추가
	   , convertActionUrl : function ($formEl){
		   // console.log("convertActionUrl!", $formEl);
		   var action			= $formEl.attr("action");
		   var sessionKey		= $.jCryption.getAESSessionKey($formEl);
		   var actionDomain	= moduleJcryption.getHostNameFromForm($formEl);
		   var domain			= window.location.hostname;
		   if( domain.indexOf("m.") == 0 ){
			   domain			= domain.replace("m.","");
		   }
		   if( actionDomain.indexOf(domain) == -1 && moduleJcryption.checkSSLForm($formEl) > -1 && action.indexOf(sessionKey) == -1 ){
			   action			= action + "/" + sessionKey;
		   }
		   
		   // firstmall ssl 사용시
		   var thisRegex = new RegExp('gabiafreemall');
		   if(	thisRegex.test(action) ){
			   var aPath		= action.split("/");
			   sGlAction		= aPath[6].replace("-", "+");
			   sGlAction		= sGlAction.replace("_", "/");
			   sGlAction		= window.atob(sGlAction);
			   action			= sGlAction;
		   }else{
			   sGlAction		= '';
		   }
		   $formEl.attr("action", action);
	   }
	   // 암호화 서브밋 처리
	   , convertSubmit : function(thisDom){
		   var $formEl = $(thisDom);
		   // submit 전용 폼인지 체크
		   if(moduleJcryption.checkBindEventForm($formEl)){
			   // console.log("already!", $formEl);
			   moduleJcryption.convertActionUrl($formEl);
			   return true;
		   }else{
			   // SSL 적용폼인지 체크
			   if(moduleJcryption.checkSSLForm($formEl)>-1){
				   // 스크립트가 로드되었는지 체크
				   if(typeof $.jCryption === "function"){
					   // rsa 폼 삭제
					   $(".rsaForm").remove();
   
					   // 암호화 적용
					   var AESEncryptionKey = $.jCryption.getAESEncryptionKey($formEl);
					   // console.log(AESEncryptionKey);
					   var hostName = moduleJcryption.getHostNameFromForm($formEl);
   
					   var $submitElement = $formEl.find(":input:submit");
					   var $encryptedElement = $("<input />",{
						 type:'hidden',
						 name:'jCryption'
					   });
   
					   // 암호화 submit 전용 form 
					   var $submitRSAForm = $("<form class='rsaForm'/>");
					   var formAttrs = moduleJcryption.getAttributes($formEl);
					   for (var i in formAttrs){
						   if(i!="id" && i!="name"){
							   $submitRSAForm.attr(i,formAttrs[i]);
						   }
					   }
					   var remakeHandshakeUrl = handshakeUrl[moduleJcryption.checkSSLForm($formEl)];
					   if(moduleJcryption.checkSSLForm($formEl)!=0){
						   remakeHandshakeUrl = remakeHandshakeUrl+"/"+$.jCryption.getAESSessionKey($submitRSAForm);
					   }
   
					   $.jCryption.authenticate(
						   AESEncryptionKey, 
						   hostName+getPublicKeyUrl[moduleJcryption.checkSSLForm($formEl)],
						   hostName+remakeHandshakeUrl, 
						   function(AESEncryptionKey) {
							   var toEncrypt = $formEl.serialize();
							   // console.log(toEncrypt);
							   // console.log($formEl);
							   if ($submitElement.is(":submit")) {
								   toEncrypt = toEncrypt + "&" + $submitElement.attr("name") + "=" + $submitElement.val();
							   }
							   $encryptedElement.val($.jCryption.encrypt(toEncrypt, AESEncryptionKey));
							   // console.log($submitRSAForm.html());
							   $submitRSAForm.append($encryptedElement);
							   $("body").append($submitRSAForm);
							   $submitRSAForm.data("jCryptionInit",true);
							   moduleJcryption.convertActionUrl($submitRSAForm);
							   if(sGlAction){
								   var $encryptionKeyElement = $("<input />",{
									   type:'hidden',
									   name:'encryptionKey',
									   value:AESEncryptionKey
								   });
								   $submitRSAForm.append($encryptionKeyElement);
							   }
							   $submitRSAForm.submit();
						   },
						   function() {
							   // Authentication with AES Failed ... sending form without protection
							   confirm("Authentication with Server failed, are you sure you want to submit this form unencrypted?", function() {
								   $formEl.submit();
							   });
						   }
					   );
				   }else{
					   var delayTime = jcryptionReloadDelayTime;
					   console.log("필수 스크립트가 로드되지 않았습니다. "+(delayTime/1000)+"초 후 다시 시도합니다.");
					   setTimeout(function(){
						   console.log($formEl,"리로드"+delayTime);
						   moduleJcryption.resetJcryptionSubmit(thisDom);
						   $formEl.submit();
					   }, delayTime);
					   jcryptionReloadDelayTime += 1000;	// 1초씩 증가
					   // $formEl.submit();
				   }
				   return false;
			   }else{
				   return true;
			   }
		   }
	   }
   };
   
   // 암호화 적용
   var initJcryption = function(){
	   // 모든 폼 엘리먼트에 이벤트를 바인딩 한다
	   $("body form").each(function (){
		   var domEl = this;
		   moduleJcryption.convertJcryptionSubmit(domEl);
	   });
	   
	   // 아이디 체크의 경우 SSL 통신이 없었으므로 강제로 적용
	   function setupJoinMemberPageCheckId(){
		   var url = location.href;
		   var tmp_url = url.split("?");
		   var domain = moduleJcryption.getHostNameFromUrl(tmp_url[0]);
		   var sub_url = tmp_url[0].replace(domain,"");
		   
		   // 회원가입페이지 일 경우
		   if(sub_url=="/member/register"){
			   
			   // 현재 회원가입 폼의 action 을 통해 유료/무료 SSL을 확인한다.
			   var registFrmAction = $("#registFrm").attr("action");
			   var registFrmHost = moduleJcryption.getHostNameFromUrl(registFrmAction);
			   if(registFrmHost.indexOf("http")>-1){
				   var sslSubUrlIndex = 0;
				   if(registFrmHost == "https://ssl.gabiafreemall.com"){
					   sslSubUrlIndex = 1;
				   }
				   var idCheckFormUrl = registFrmHost+arrCheckActions[sslSubUrlIndex];
   
				   var idCheckCallbackUrl = domain+"/member/"+"../member_process/id_chk";
				   var encodeIdCheckCallbackUrl = Base64.encode(idCheckCallbackUrl);
				   encodeIdCheckCallbackUrl = encodeIdCheckCallbackUrl.replace(/[\+]/g,"-");
				   encodeIdCheckCallbackUrl = encodeIdCheckCallbackUrl.replace(/[\/]/g,"_");
				   var idCheckFormAction = idCheckFormUrl+encodeIdCheckCallbackUrl;
   
				   $("input[name='userid']").unbind("blur");
				   $("input[name='userid']").blur(function() {
   
					   if($(this).val()){
						   // rsa 폼 삭제
						   $("#idchkform").remove();
						   $(".rsaForm").remove();
						   $formEl = $("<form id='idchkform' method='post' target='actionFrame' action='"+idCheckFormAction+"'/>");
						   var idval = $("<input type='hidden' name='userid' value='"+$(this).val()+"'>");
						   $formEl.append(idval);
						   $("body").append($formEl);
   
						   // 암호화 적용
						   var AESEncryptionKey = $.jCryption.getAESEncryptionKey($formEl);
						   // console.log(AESEncryptionKey);
						   var hostName = moduleJcryption.getHostNameFromForm($formEl);
   
						   var $submitElement = $formEl.find(":input:submit");
						   var $encryptedElement = $("<input />",{
							 type:'hidden',
							 name:'jCryption'
						   });
   
						   // 암호화 submit 전용 form 
						   var $submitRSAForm = $("<form class='rsaForm'/>");
						   var formAttrs = moduleJcryption.getAttributes($formEl);
						   for (var i in formAttrs){
							   if(i!="id" && i!="name"){
								   $submitRSAForm.attr(i,formAttrs[i]);
							   }
						   }
						   var remakeHandshakeUrl = handshakeUrl[moduleJcryption.checkSSLForm($formEl)];
						   if(moduleJcryption.checkSSLForm($formEl)!=0){
							   remakeHandshakeUrl = remakeHandshakeUrl+"/"+$.jCryption.getAESSessionKey($submitRSAForm);
						   }
   
						   $.jCryption.authenticate(
							   AESEncryptionKey, 
							   hostName+getPublicKeyUrl[moduleJcryption.checkSSLForm($formEl)],
							   hostName+remakeHandshakeUrl, 
							   function(AESEncryptionKey) {
								   var toEncrypt = $formEl.serialize();
								   // console.log(toEncrypt);
								   // console.log($formEl);
								   if ($submitElement.is(":submit")) {
									   toEncrypt = toEncrypt + "&" + $submitElement.attr("name") + "=" + $submitElement.val();
								   }
								   $encryptedElement.val($.jCryption.encrypt(toEncrypt, AESEncryptionKey));
								   // console.log($submitRSAForm);
								   $submitRSAForm.append($encryptedElement);
								   $("body").append($submitRSAForm);
								   $submitRSAForm.data("jCryptionInit",true);
								   moduleJcryption.convertActionUrl($submitRSAForm);
								   $submitRSAForm.submit();
							   },
							   function() {
								   // Authentication with AES Failed ... sending form without protection
								   confirm("Authentication with Server failed, are you sure you want to submit this form unencrypted?", function() {
									   $formEl.submit();
								   });
							   }
						   );
   
					   }
				   });
			   }
		   }
	   }
	   setupJoinMemberPageCheckId();
   }
   function callbackIdChk(json){
	   var response = $.parseJSON(json);
	   var text = response.return_result;
	   var userid = response.userid;
	   $("#id_info").html(text);
	   $("input[name='userid']").val(userid);
   }
   
   // 크로스도메인 용 iframe 리사이징
   $(document).ready(function(){
	   // console.log($("iframe").height());
	   var message_frame_resize = function (event) {
		   if (event.origin !== "https://"+window.location.hostname) {
			   return;
		   }
		   var iframe = document.getElementById(event.data.id);
		   if (iframe) {
			   iframe.style.height = event.data.height + "px";
		   }
	   };
	   if (window.addEventListener) {
		   window.addEventListener("message", message_frame_resize, false);
	   } else if (window.attachEvent) {
		   window.attachEvent("onmessage", message_frame_resize);
	   }
   });
   