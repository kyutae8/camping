try{ 
	if(!eval('facebookjsok')){
		var facebookjsok =true;
		//@2015-04-28
		try{ 
		if(eval("fbv")) 
		{ 
			var fbv = fbv;
		} 
		}catch(e){ 
			var fbv = '2.0';
		}

		try{ 
		if(eval("plus_app_id")) 
		{ 
			var plus_app_id = plus_app_id;
		} 
		}catch(e){ 
			var plus_app_id = '';
		}

		try{ 
		if(eval("orderpage")) 
		{ 
			var orderpage = orderpage;
		} 
		}catch(e){ 
			var orderpage = '';
		}
		
		 
		window.fbAsyncInit = function() {
			FB.init({
			appId      : plus_app_id, //App ID
			status     : true, // check login status
			cookie     : true, // enable cookies to allow the server to access the session
			xfbml      : true,  // parse XFBML,
			oauth      : true,
			version    : 'v'+fbv
			}); 
			
			FB.getLoginStatus(function(response) {
				if (response.status === 'connected') {
					FB.api('/me', function(response) {
						if(response.id)$.cookie('fbuser', response.id);
					});
				}
			});
			
			if( !orderpage ) {//장바구니용따로 제작
				// like 이벤트가 발생할때 호출된다.
				FB.Event.subscribe('edge.create', function(response) {
							var responsear = response.split("&");
							var goodsnoar = responsear[1].split("="); 
							$.ajax({'url' : '../sns_process/facebooklikeck', 'type' : 'post', 'data' : {'mode':'like', 'product_url':response},
							dataType: 'json',
							success: function(result){
								if(result.likecount>= 0){
									//top.statistics_firstmall('like',goodsnoar[1],'','');			사용안함
									$(".fb-og-like-count"+goodsnoar[1]).text(result.likecount);
								}
							}
							});
				});
			
				// unlike 이벤트가 발생할때 호출된다.
				FB.Event.subscribe('edge.remove', function(response) {
							var responsear = response.split("&");
							var goodsnoar = responsear[1].split("=");
							$.ajax({'url' : '../sns_process/facebooklikeck', 'type' : 'post', 'data' : {'mode':'unlike', 'product_url':response},
							dataType: 'json',
							success: function(result){
								if( result.likecount >= 0 ){
									$(".fb-og-like-count"+goodsnoar[1]).text(result.likecount);
								}
							 }
						});
					});
				}
		}; 
		
		
		(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) return;
		js = d.createElement(s); js.id = id;
				js.src = "//connect.facebook.net/" + facebook_language() + "/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		
		
		function initializeFbTokenValues() {
			fbId = "";
			fbAccessToken = "";
		}
		function initializeFbUserValues() {
			fbUid = "";
			fbName = "";
		} 
		function facebook_language(){
			var fbLang	= 'ko_KR';
			if	(gl_language){
				switch	(gl_language){
					case 'CN':	fbLang	= 'zh_CN';	break;
					case 'US':	fbLang	= 'en_US';	break;
					case 'JP':	fbLang	= 'ja_JP';	break;
				}
			}

			return fbLang;
		}
	}
} catch (facebookjsok) {
}
