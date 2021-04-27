function joinwindowopen() {
	var w;var h;
	var sns = snstype;
	switch(sns) {
		case 'tw':
			w = 810;h = 550;
			break;
		case 'nv':
			w = 460;h = 517;
			break;
		case 'kk':
			loginWithKakao();
			return false;
		break;
		case 'it':
			w = 460;h = 517;
		break;
		case 'ap':
			loginWithApple();
			return false;
		break;
		default:
			w = 800;h=400;
	}
	
	if( jointype == 'fbmember' ) {
		//기본 가입
		loadingStart("body",{segments: 12, width: 15.5, space: 6, length: 13, color: '#000000', speed: 1.5});
		FB.login(handelStatusChange,{scope:fbuserauth});
	} else if( jointype == 'fbbusiness' ) {
		loadingStart("body",{segments: 12, width: 15.5, space: 6, length: 13, color: '#000000', speed: 1.5});
		FB.login(handelStatusChangebiz,{scope:fbuserauth});
	} else {
		var join_type	= '';
		var join_gubun	= '';
		switch(jointype){
			case "twmember":	join_type = "member";	join_gubun = "twitter"; break;	//일반회원
			case "twbusiness":	join_type = "biz";		join_gubun = "twitter"; break;	//기업회원

			case "nvmember":	join_type = "member";	join_gubun = "naver";	break;	//일반회원
			case "nvbusiness":	join_type = "biz";		join_gubun = "naver";	break;	//기업회원

			case "kkmember":	join_type = "member";	join_gubun = "kakao";	break;	//일반회원
			case "kkbusiness":	join_type = "biz";		join_gubun = "kakao";	break;	//기업회원

			case "itmember":	join_type = "member";	join_gubun = "instagram";	break;	//일반회원
			case "itbusiness":	join_type = "biz";		join_gubun = "instagram";	break;	//기업회원
		}
		joinloginajax(join_type,join_gubun);
	}

}

function joinloginajax(jtype, sns ) {
	loadingStart("body",{segments: 12, width: 15.5, space: 6, length: 13, color: '#000000', speed: 1.5});
	var w;var h;
	switch(sns) {
		case 'twitter':
			w = 810;h = 550;
			break;
		case 'naver':
			w = 460;h = 737;
			break;
		case 'instagram':
			w = 500;h = 530;
			break;
	}
	var width_	= w;
	var height_	= h;
	var left_	= screen.width;
	var top_	= screen.height;

	left_		= left_/2 - (width_/2);
	top_		= top_/2 - (height_/2);

	if(jtype == 'biz')		loginck_data = {'mform':'join','mtype':'biz'};
	else					loginck_data = {'mform':'join'};

	$.ajax({
		'url' : '../sns_process/'+sns+'loginck',
		'data' : loginck_data,
		'type' : 'post',
		'dataType': 'json',
		'success': function(res) {
			if(res.result == true) {
				var newWin = window.open(res.loginurl,"_blank","height="+height_+",width="+width_+",status=yes,scrollbars=no,statusbar=no,resizable=no,left="+left_+",top="+top_+"");
		if (newWin == null || typeof(newWin)=='undefined'){
					//팝업이 차단되었습니다.<br/>차단된 팝업을 허용해 주세요.
					openDialogAlert(getAlert('mb004'),'400','140',function(){});
				}
			}else{
				openDialogAlert(res.msg,'400','140',function(){});
			}
			loadingStop("body",true);
		}
	});
}

function loginwindowopen(sns) {
	var w;var h;
	switch(sns) {
		case 'twitter':
			w = 810;h = 550;
			break;
		case 'naver':
			w = 460;h = 517;
			break;
		case 'kakao':
			loginWithKakao();
			return false;
		break;
		case 'instagram':
			w = 500;h = 530;
			break;
		case 'apple':
			loginWithApple();
			return false;
			break;
		default:
			w = 800;h=400;
	}
	loadingStart("body",{segments: 12, width: 15.5, space: 6, length: 13, color: '#000000', speed: 1.5});

	if(sns == 'facebook' ) {//경고문구창사이즈
		FB.login(handelStatusChangeLogin,{scope:fbuserauth});
	}else{
		snsloginck(sns);
	}
}

//기본 facebook 로그인 //
function handelStatusChangeLogin(response) {
	var data;
	if (response && response.status == 'connected') {
	// 로그인
	isLogin = true;
	initializeFbTokenValues();
	initializeFbUserValues();
	if(response.authResponse){
		fbId = response.authResponse.userID;
		fbAccessToken = response.authResponse.accessToken;
	}
	if(jointype == 'myinfo') {
		data = {'facebooktype':'mbconnect_direct'};
	}
	FB.api('/me', function(response) {
		 fbUid = response.email;
		 fbName = response.name;
		 if (fbName != "") {
				$.ajax({
				'url' : '../sns_process/facebookloginck',
				'data' : data,
				'type' : 'post',
				'dataType': 'json',
				'success': function(res) {
					if(res.result == true){
						loadingStop("body",true);
		                loginCompleteSendNativeApp(res);	
						joinloginsuccess();
					}else{
						loadingStop("body",true);
						joinloginfail(res);
					}
				}
				});
		}
	});
   } else if (response.status == 'not_authorized' || response.status == 'unknown') {
	   //연결을 취소하셨습니다.
		openDialogAlert(getAlert('mb003'),'400','160',function(){});
		// 로그아웃된 경우
		isLogin = false;
		if(is_user) {
			logoutajax('facebook');
		}
		if (fbId != "")  initializeFbTokenValues();
		if (fbUid != "") initializeFbUserValues();
		loadingStop("body",true);
	}else{
		openDialogAlert(getAlert('mb003'),'400','160',function(){});
		// 로그아웃된 경우
		isLogin = false;
		if(is_user) {
			logoutajax('facebook');
		}
		if (fbId != "")  initializeFbTokenValues();
		if (fbUid != "") initializeFbUserValues();
		loadingStop("body",true);
	}
}

//feed 권한추가 -> 로그인시키지
function handelStatusChangepublish_stream(response) {
	if (response && response.status == 'connected') {
		document.location.href='../mypage/myinfo';
   }else{
		loadingStop("body",true);
		openDialogAlert(getAlert('mb003'),'400','160',function(){});
   }
}


//기본 SNS로그인//
function snsloginck(sns) {
	loadingStop("body",true);
	var w;var h;
	switch(sns) {
		case 'twitter':
			w = 810;h = 550;
			break;
		case 'naver':
			w = 460;h = 517;
			break;
		case 'instagram':
			w = 650;h = 517;
		break;
	}
	var width_	= w;
	var height_ = h;
	var left_	= screen.width;
	var top_	= screen.height;

	left_		= left_/2 - (width_/2);
	top_		= top_/2 - (height_/2);
	var newWin  = window.open("../sns_process/snsredirecturl?snsloginstart=1","_blank","height="+height_+",width="+width_+",status=yes,scrollbars=no,statusbar=no,resizable=no,left="+left_+",top="+top_+"");

	if (newWin == null || typeof(newWin)=='undefined'){
		//팝업이 차단되었습니다.<br/>차단된 팝업을 허용해 주세요.
		openDialogAlert(getAlert('mb004'),'400','140',function(){});
	}
	
	data	= {'mform':'login'};
	if(jointype !== '') {
		data['mform'] = 'join';
		if(jointype == 'myinfo') {
			data['facebooktype']	= 'mbconnect_direct';
			data['m']				= 'myinfo';
		}
	}

	$.ajax({
		'url' : '../sns_process/' + sns + 'loginck',
		'data' : data,
		'type' : 'post',
		'dataType': 'json',
		'success': function(res) {
			if(res.result == true) {
				newWin.location = res.loginurl;
				newWin.focus();
			}else{
				newWin.close();
				openDialogAlert(res.msg,'400','140',function(){});
			}
		}
	});
}

// sns 로그인 이후 성공 페이지 리턴
function joinloginsuccess() {
	// 성인인증 페이지에서는 adult_auth 로 페이지 이동
	if( typeof adult_auth != 'undefined'  && adult_auth == "1") {
		return_url = '/member/adult_auth'
	}
	if(jointype == 'myinfo') {
		return_url = '../mypage/myinfo';
	}
	document.location.href=return_url;
}

// sns 로그인 시 실패됐을 때 
function joinloginfail(res) {
	if(res.dormany_auth){
		location.href= res.dormany_auth;
	}else{
		openDialogAlert(res.msg,'400','160',function(){

			var url = res.callback;
			if(url == "" || typeof url === "undefined") url = res.return_url;
			if(url == "" || typeof url === "undefined") url = res.retururl;

			if(url){
				location.href= url;
				return;
			}
		});
	}
}

//naver 쇼핑몰로그인
function naverjoinlogin() {
	var data = '';
	var url = '../sns_process/naverlogin';
	if(jointype) {
		url = '../sns_process/naverjoin';
		if(jointype == 'myinfo') {
			data = {'facebooktype':'mbconnect_direct'};
		}
	}

	$.ajax({
		'url' : url,
		'type' : 'post',
		'dataType': 'json',
		'data' : data,
		'success': function(res) {
			if(res.result == true){
				loginCompleteSendNativeApp(res);	
				joinloginsuccess();
			}else{
				loadingStop("body",true);
				joinloginfail(res);
			}
		}
	});
}

// twitter 쇼핑몰 로그인
function twitterjoinlogin(json_params) {

	var send_params = JSON.stringify(json_params);

	$.ajax({
		'url' : '../sns_process/twitterlogincomplete',
		'type' : 'post',
		'data' : {'send_params':send_params},
		'dataType': 'json',
		'success': function(res) {            
			if(res.result == true){
                loginCompleteSendNativeApp(res);	
				joinloginsuccess();
			}else{
				loadingStop("body",true);
				joinloginfail(res);
			}
		}
	});
}

//kakao login start

function loginWithKakao() {
	
	var IEIndex = navigator.appVersion.indexOf("MSIE");         // MSIE를 찾고 인덱스를 리턴
	var IE8Over = navigator.userAgent.indexOf("Trident");		// MS IE 8이상 버전 체크

	if(jointype) {
		var join_type = "member";
		if(jointype == "kkbusiness" ) join_type = "biz";
	}
	
	if( IEIndex > 0 && IE8Over < 0 )  {
		//카카오 로그인을 지원하지 않는 브라우저 버전입니다.\nInternet Explorer 8 버전 이상 사용해 주세요.
		alert(getAlert('mb005'));
	}else{

		// 로그인 창을 띄웁니다.
		Kakao.Auth.login({
			success: function(authObj) {
				var aaccess_token	= authObj.access_token;

				if(authObj.access_token){
					Kakao.API.request({
						url: '/v2/user/me',
						success: function(userObj) {
							var kakaoObj		= $.extend(authObj,userObj);
							if(jointype) {
								var pram = {'mtype':join_type};
								if(jointype == 'myinfo') {
									pram['facebooktype'] = 'mbconnect_direct';
								}
								kakaoObj = $.extend(authObj,userObj,pram);
							}
							kakaojoinlogin(kakaoObj);
						}

					});
				}else{
					//잘못된 접근입니다.
					alert(getAlert('mb006'));
					return false;
				}
			},fail: function(res){
				alert(getAlert('mb006'));
				//JSON.stringify(res);
			}
		});
	}
};

function kakaoAPI(kakaoKey){ Kakao.init(kakaoKey); }

function kakaojoinlogin(kakaoObj) {
	var url = '../sns_process/kakaologin';
	if(jointype) {
		url = '../sns_process/kakaojoin';
		if(jointype == 'myinfo') {
			kakaoObj['facebooktype'] = 'mbconnect_direct';
		}
	}
	$.ajax({
		'url' : url,
		'type' : 'post',
		'dataType': 'json',
		'data': kakaoObj,
		'success': function(res) {
			if(res.result == true){
				loadingStop("body",true);
				loginCompleteSendNativeApp(res);
				if	(res.msg){
					openDialogAlert(res.msg,'400','180',function(){joinloginsuccess();});
				}else{
					joinloginsuccess();
				}
			}else{
				loadingStop("body",true);
				joinloginfail(res);
			}
		}
	});
}
//kakao login end

//회원정보 초기화 시키기..
function logoutajax(sns){
	$.ajax({
		'url' : '../sns_process/'+sns+'logout',
		'dataType': 'json',
		'success': function(res) {
			if(res.result == true){
				joinloginsuccess()
			}else{
				loadingStop("body",true);
				openDialogAlert(res.msg,'400','140',function(){});
			}
		}
	});
}

//instagram login
function instagramjoinlogin() {
	var data = '';
	var url = '/sns_process/instagramlogin';
	if(jointype) {
		url = '/sns_process/instagramjoin';
		if(jointype == 'myinfo') {
			data['facebooktype'] = 'mbconnect_direct';
		}
	}
	$.ajax({
		'url' : url,
		'type' : 'post',
		'dataType': 'json',
		'data' : data,
		'success': function(res) {
			if(res.result == true){
				loadingStop("body",true);
				loginCompleteSendNativeApp(res);	
				if	(res.msg){
					openDialogAlert(res.msg,'400','180',function(){
						joinloginsuccess();
					});
				}else{
					joinloginsuccess();
				}
			}else{
				loadingStop("body",true);
				joinloginfail(res);
			}

		}
	});
}
// 18-04-25 사용자앱 byuncs  ###############################################
function loginCompleteSendNativeApp(res){
	if( mobileapp == "Y" ){
			var param = {'member_seq' : res.send_params.member_seq, 'user_id' : res.send_params.userid, 'user_name' : res.send_params.user_name, 'session_id' : res.send_params.session_id, 'channel' : res.send_params.channel, 'reserve' : res.send_params.reserve, 'balance' : res.send_params.balance, 'coupon' : res.send_params.coupon, 'auto_login' : res.send_params.auto_login, 'key' : res.send_params.key };
			var strParam = JSON.stringify(param);
			var dataStr = "MemberInfo" + "?" + strParam;
		if ( m_device =='iphone' ) {
			window.webkit.messageHandlers.CSharp.postMessage(dataStr);
		} else {
			CSharp.postMessage(dataStr);
		}
	}
}

//기본 facebook 로그인
function handelStatusChange(response) {
	if (response && response.status == 'connected') {
		// 로그인
		isLogin = true;
		initializeFbTokenValues();
		initializeFbUserValues();
		if(response.authResponse){
			fbId = response.authResponse.userID;
			fbAccessToken = response.authResponse.accessToken;
		}
		FB.api('/me', function(response) {
			 fbUid = response.email;
			 fbName = response.name;
			 if (fbName != "") {
					loadingStart("body",{segments: 12, width: 15.5, space: 6, length: 13, color: '#000000', speed: 1.5});
					$.ajax({
						'url' : '../sns_process/facebookloginck',
						'type' : 'post',
						'dataType': 'json',
						'success': function(res) {
							if(res.result == true){
								loadingStop("body",true);
								openDialogAlert(res.msg,'400','180',function(){joinloginsuccess();});
							}else{
								loadingStop("body",true);
								openDialogAlert(res.msg,'400','140',function(){});
							}
						}
					});
			}
		});
   } else if (response.status == 'not_authorized' || response.status == 'unknown') {
		// 로그아웃된 경우
		isLogin = false;
		if( is_user == true) {
			loadingStart("body",{segments: 12, width: 15.5, space: 6, length: 13, color: '#000000', speed: 1.5});
			logoutajax('facebook');
		}
		if (fbId != "")  initializeFbTokenValues();
		if (fbUid != "") initializeFbUserValues();
		loadingStop("body",true);
		//'연결을 취소하셨습니다.'
		openDialogAlert(getAlert('mb003'),'400','160',function(){});
	} else{
		loadingStop("body",true);
		//'연결을 취소하셨습니다.'
		openDialogAlert(getAlert('mb003'),'400','160',function(){});
	}
}

//기업회원으로 통합하기
function handelStatusChangebiz(response) {
	if (response && response.status == 'connected') {
		// 로그인
		isLogin = true;
		initializeFbTokenValues();
		initializeFbUserValues();
		if(response.authResponse){
			fbId = response.authResponse.userID;
			fbAccessToken = response.authResponse.accessToken;
		}
		FB.api('/me', function(response) {
			 fbUid = response.email;
			 fbName = response.name;
			 if (fbName != "") {
					$.ajax({
						'url' : '../sns_process/facebookloginck',
						'data' : {'mtype':'biz'},
						'type' : 'post',
						'dataType': 'json',
						'success': function(res) {
							if(res.result == true) {
								loadingStop("body",true);
								openDialogAlert(res.msg,'400','180',function(){joinloginsuccess();});
							}else{
								loadingStop("body",true);
								openDialogAlert(res.msg,'400','140',function(){});
							}
						}
					});
			}
		});
   } else if (response.status == 'not_authorized' || response.status == 'unknown') {
		// 로그아웃된 경우
		isLogin = false;
		if( is_user == true) {
			loadingStart("body",{segments: 12, width: 15.5, space: 6, length: 13, color: '#000000', speed: 1.5});
			logoutajax('facebook');
		}
		if (fbId != "")  initializeFbTokenValues();
		if (fbUid != "") initializeFbUserValues();
		loadingStop("body",true);
		//연결을 취소하셨습니다.
		openDialogAlert(getAlert('mb003'),'400','160',function(){});
	}else{
		loadingStop("body",true);
		//연결을 취소하셨습니다.
		openDialogAlert(getAlert('mb003'),'400','160',function(){});
	}
}


//SNS 해지하기
function snsdisconnect(snstype,snsrute){
	if( is_user == true) {
		$.ajax({
		'url' : '../sns_process/snsdisconnect',
		'data' : {'snstype':snstype,'snsrute':snsrute},
		'type' : 'post',
		'dataType': 'json',
		'success': function(res) {
			if(res.result == true){
				openDialogAlert(res.msg,'400','140',function(){document.location.reload();});
			}else{
				document.location.reload();
			}
		}
		});
	}
}

// apple 연동 추가
function loginWithApple(){
	// 애플은 자동로그인을 처리할 방법이 지원하지않아 매번 로그인을 직접해야함
	// 애플기기에서 로그인시 touchid, faceid는 네이티브에서만 지원하여 id,pw 방식으로만 사용하게 변경 :: 2020-05-26 pjw
	var appleSignPopup;
	var userAgent = navigator.userAgent.toLowerCase();
	if ((userAgent.search('iphone') > -1) || (userAgent.search('ipod') > -1)|| (userAgent.search('ipad') > -1)){
		//IOS
		appleSignPopup = window.open();
	}else{
		appleSignPopup = window.open('', 'appleSignGate', 'width=640,height=663');
	}
	appleSignPopup.document.location.href = apple_authurl;
}

// 로그인 처리
function loginAppleCallback(){
	var process_url = jointype != '' ? 'applejoin' : 'applelogin';

	$.ajax({
	'url' : '../sns_process/' + process_url,
	'type' : 'post',
	'dataType': 'json',
	'data': 'join_type='+jointype,
	'success': function(res) {
		if(res.result == true){
			loadingStop("body",true);
			if	(res.msg)
				openDialogAlert(res.msg,'400','180',function(){document.location.href=res.retururl});
			else
				document.location.href='../main/index';
		}else{
			loadingStop("body",true);
			openDialogAlert(res.msg,'400','140',function(){if(res.retururl){document.location.href=res.retururl}});
		}
		
	}
	});
}


$(document).ready(function() {

	// sns login 창 호출
	// sns-login-button						: 인트로/회원전용, 인트로/성인전용, 회원가입, 로그인
	// sns-login-button-mbconnect-direct	: 마이페이지/회원정보수정 (sns 통합)
	// fb-login-button-mbconnect-direct		: 마이페이지/회원정보수정 (페이스북 신규 통합)
	$(".sns-login-button, .sns-login-button-mbconnect-direct, .fb-login-button-mbconnect-direct").click(function(){
		var snstype = $(this).attr('snstype');
		loginwindowopen(snstype);
	});

	$(".snsbuttondisconnectlay").click(function(){
		//SNS계정 연결해제
		showCenterLayer('#snsdisconnectlay');
	});

	//기존회원 sns 계정통합 해제하기 (마이페이지 전용)
	$(".sns-login-button-disconnect").click(function(){
		var snstype = $(this).attr('snstype');
		var snsrute = $(this).attr('snsrute');
		var title	= $(this).attr('alt');

		//정말로 "+ title + "의 연결을 해제하시겠습니까?
		if(confirm(getAlert('mb139',title))){
			snsdisconnect(snstype, snsrute);
		}
	});

	$.ajax({
		'url' : '../sns_process/kakaokeys',
		'dataType': 'json',
		'success': function(res) {
			if(res.result == true){
				kakaoAPI(res.keys);
			}
		}
	});
});