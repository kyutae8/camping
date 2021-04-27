function displaySearchFilter(){
	displaySearchSellerFilter();
	displaySearchDetailFilter();
}
/* +++++++++++++++++++++++ 검색 입력창 ++++++++++++++++++++++++ */
//컬러 필터 - 255, 255, 255 --> border
function filterSort(sVal, ulClassName)
{
	var ulObj	= $('.' + ulClassName);
	var items	= ulObj.find('li').get();
	items.sort(function(a,b){
		if( sVal == 'cntindex' ){
			var keyA = parseInt($(a).find("label").attr('data-cntindex'));
			var keyB = parseInt($(b).find("label").attr('data-cntindex'));
		}else{
			var keyA = $(a).find("label").text();
			var keyB = $(b).find("label").text();
		}
		if (keyB > keyA) return -1;
		if (keyA > keyB) return 1;
		return 0;
	});
	$.each(items, function(i, li){
		ulObj.append(li);
	});
}
function searchObject()
{
	var uObj	= {};
	var iColor		= 0;
	var iDelivery	= 0;
	var iBrand		= 0;
	$("form#goodsSearchForm input[type='hidden']").each(function(){
		var uObjName	= '';
		var regex = /color/gi;
		var bColor = regex.exec($(this).attr('name'));
		regex = /brand/gi;
		var bBrand = regex.exec($(this).attr('name'));
		regex = /delivery/gi;
		var bDelivery	= regex.exec($(this).attr('name'));
		var sVal		= $(this).val();
		if( sVal && sVal != 'undefined' ){
			if(bColor){
				uObjName = $(this).attr('name').replace('\[\]','\['+ iColor +'\]');
				iColor++;
			}else if(bDelivery){
				uObjName = $(this).attr('name').replace('\[\]','\['+ iDelivery +'\]');
				iDelivery++;
			}else if(bBrand){
				uObjName = $(this).attr('name').replace('\[\]','\['+ iBrand +'\]');
				iBrand++;
			}else{
				uObjName = $(this).attr('name');
			}
			uObj[uObjName] = $(this).val();
		}
	});
	$("form#goodsSearchForm select[name='per'] option").each(function(){
		if( $(this).prop("selected") ) uObj['per'] = $(this).val();
	});
	sVal	= $("form#goodsSearchForm input[name='sorting']:checked").val();
	if( sVal && sVal != 'undefined' ){
		uObj['sorting'] = sVal;
	}
	sVal	= $("form#goodsSearchForm input[name='filter_display']:checked").val();
	if( sVal && sVal != 'undefined' ){
		uObj['filter_display'] = sVal;
	}
	return uObj;
}
/* +++++++++++++++++++++++ 검색 입력창 ++++++++++++++++++++++++ */

/* +++++++++++++++++++++++ 최근 본 상품 ++++++++++++++++++++++++ */
function todayViewRemove(bObj){
	var obj = $(bObj);
	var uObj = {'goods_seq' : obj.parent().data('value')};
	var postParams = jQuery.param(uObj);
	$.ajax({
		'type'		: "post",
		'url'		: '/common/mybag_goods_today_del',
		'data'		: postParams,
		'async'		: false,
		'dataType'	: 'json',
		'success'	: function(result){
			obj.parent().remove();
			todayViewList();
		}
	});
}

/* +++++++++++++++++++++++ 최근 본 상품 ++++++++++++++++++++++++ */
/* +++++++++++++++++++++++ 최근 검색어 ++++++++++++++++++++++++ */
function searchRecentRemove(bObj){
	var obj = $(bObj);
	var oData = obj.data('value');
	var uObj = {'recent_seq' : oData};
	var postParams = jQuery.param(uObj);
	$.ajax({
		'type'		: "post",
		'url'		: '/stats_process/search_recent_del',
		'data'		: postParams,
		'async'		: false,
		'dataType'	: 'json',
		'success'	: function(result){
			displaySearchRecentRemove(obj, oData);
			searchRecentList();
		}
	});
}
function setRecentAuto(sMode){
	var sAuto	= 'on';
	var sToggle	= 'off';
	$.ajax({
		'type'		: "get",
		'url'		: '/stats/search_recent_auto',
		'dataType'	: 'json',
	})
	.always(function(result) {
		if(result.auto == 'off') sAuto = 'off';
		if(sAuto == 'off')		sToggle	= 'on';
		if(sMode == 'toggle'){
			var uObj = {'auto' : sAuto};
			var postParams = jQuery.param(uObj);
			$.ajax({
				'type'		: "post",
				'url'		: '/stats_process/set_search_recent_auto',
				'async'		: false,
				'data'		: postParams,
				'dataType'	: 'json',
				'success'	: function(result){
					sAuto	= sToggle;
					displaySetRecentAuto(sAuto);
				}
			});
		}
	});
}
function showAutoComplete(sKeyword){
	var uObj = {'keyword' : sKeyword};
	var postParams = jQuery.param(uObj);
	$.ajax({
		'type'		: "get",
		'url'		: '/stats/search_auto_complete',
		'async'		: true,
		'data'		: postParams,
		'dataType'	: 'json',
		'success'	: function(result){
			displayShowAutoComplete(result);
		}
	});
}
//자동 검색 단어 선택
function setAutoComplete(sKeyword){
	$('#searchVer2InputBox').val(sKeyword);
	$("form#topSearchForm").submit();
}
function setUseAuto(sMode){
	var sAuto	= 'on';
	var sToggle	= 'off';
	$.ajax({
		'type'		: "get",
		'url'		: '/stats/use_auto_complete',
		'dataType'	: 'json',
	})
	.always(function(result) {
		if(result.auto == 'off') sAuto = 'off';
		if(sAuto == 'off')		sToggle	= 'on';
		if(sMode == 'toggle'){
			var uObj = {'auto' : sAuto};
			var postParams = jQuery.param(uObj);
			$.ajax({
				'type'		: "post",
				'url'		: '/stats_process/set_use_auto_complete',
				'async'		: false,
				'data'		: postParams,
				'dataType'	: 'json',
				'success'	: function(result){
					sAuto	= sToggle;
				}
			});
		}
		$('#autoCompleteArea .btnAutoComplete').hide();
		if ( sAuto == 'off' ) {
			$('#autoCompleteArea .btnAutoComplete.on').show();
			$('#autoCompleteList').hide();
			$('#autoCompleteGuide').show();
		} else {
			$('#autoCompleteArea .btnAutoComplete.off').show();
			$('#autoCompleteList').show();
			$('#autoCompleteGuide').hide();
		}
	});
}
/* +++++++++++++++++++++++ 최근 검색어 ++++++++++++++++++++++++ */
/* +++++++++++++++++++++++ 찜 ++++++++++++++++++++++++ */
function setWish(bobj){
	var obj = $(bobj);
	var sMember = obj.data('member');
	var sGoods = obj.data('goods');
	var sWish = obj.data('wish');
	if(! sMember ){
		//회원만 사용가능합니다.\n로그인하시겠습니까?
		if(confirm(getAlert('gv009'))){
			top.document.location.href = "/member/login?return_url=" + document.location.href;
			return;
		}else{
			return;
		}
	}

	var url = '/mypage/wish_add?seqs[]='+ sGoods;
	if( sWish == '1' ){
		url = '/mypage/wish_del?seqs='+ sGoods;
	}

	$.ajax({
		'url' : url,
		'type' : 'get',
		'success' : function(res){
			if(  sWish == '1' ){
				obj.closest("div").find("img").hide();
				obj.closest("div").find("img.zzimOffImg").show();
				obj.closest("div").find("img").each(function(){
					$(this).data('wish', '0');
				});
				$("#wish_alert .wa_msg").html(getAlert('gv057'));
			}else{
				obj.closest("div").find("img").hide();
				obj.closest("div").find("img.zzimOnImg").show();
				obj.closest("div").find("img").each(function(){
					$(this).data('wish', '1');
				});
				$("#wish_alert .wa_msg").html(getAlert('gv056'));
			}
			$("#wish_alert").stop(true,true).show();
			clearInterval(alert_timer);
			alert_timer = setInterval(function(){
				clearInterval(alert_timer);
				$("#wish_alert").stop(true,true).show().fadeOut('slow');
			},1000);
		}
	});
}
/* +++++++++++++++++++++++ 찜 ++++++++++++++++++++++++ */
function searchParams()
{
	var uObj	= searchObject();
	return jQuery.param(uObj);
}
function resetParams()
{
	var uObj	= searchObject();
	var sUrl	= '';
	if(uObj.searchMode == 'catalog'){
		sUrl	= '../goods/catalog?category='+uObj.category;
	}
	if(uObj.searchMode == 'brand'){
		sUrl	= '../goods/brand?brand[0]='+uObj.brand[0];
	}
	if(uObj.searchMode == 'location'){
		sUrl	= '../goods/location?location='+uObj.location;
	}
	if(uObj.searchMode == 'search'){
		sUrl	= '../goods/search?osearchtext='+uObj.osearchtext;
	}
	if(uObj.searchMode == 'best'){
		sUrl	= '../goods/best';
	}
	if(uObj.searchMode == 'new_arrivals'){
		sUrl	= '../goods/new_arrivals';
	}
	if(uObj.searchMode == 'event_view'){
		sUrl	= '../promotion/event_view?event='+uObj.event;
	}
	if(uObj.searchMode == 'gift_view'){
		sUrl	= '../promotion/gift_view?gfit='+uObj.gfit;
	}
	if(uObj.searchMode == 'mshop'){
		sUrl	= '../mshop?provider='+uObj.provider;
	}
	location.href = sUrl;
}
function link_navi(obj, sUrl){
	var sCode	= '';
	var naviObj	= $(obj);
	if( naviObj.find("option:selected").val() ){
		sCode = naviObj.find("option:selected").val();
	}
	if( sCode ){
		sUrl = sUrl+'?code='+sCode;
	}else{
		sUrl = '/';
	}

	location.href = sUrl;
}
function set_classification(category_code, location_code){
	var getParams	= searchParams();
	var sSearchMode	= $("input[name='searchMode']").val();
	$.ajax({
		'type'		: "get",
		'url'		: '/goods/search_classification',
		'data'		: getParams+'&classification=1&category_code='+category_code+'&location_code='+location_code,
		'dataType'	: 'json',
		'success'	: function(result){
			if(result.navigation.navi){
				var oNavi = result.navigation.navi;
				var sNaviLink = result.navigation.link;
				if(typeof(oNavi.__proto__) !== "undefined"){
					oNavi.__proto__ = null;
				}
				display_navi(oNavi, sNaviLink);
			}
			displaySetFilterCategoryPath(sSearchMode, result.category);
			displaySetFilterCategoryChild(result.category_child);
			displaySetFilterLocationPath(sSearchMode, result.location);
			displaySetFilterLocationChild(result.location_child);
		}
	});	
}
function goodsSearch(mode)
{
	// 필터 선택 시 필터 선택된 영역 노출
	if ( typeof gl_searchFilterUse != 'undefined' ) {
		if( gl_searchFilterUse == '0' ){
			$("#searchFilterSelected").hide();
		}else if( gl_searchFilterUse == '1' ){
			$("#searchFilterSelected").show();
		}
	}

	// 첫번째 페이지로 초기화
	if(mode != 'auto') {
		$('form#goodsSearchForm input[name="page"]').val('1');
	}

	// 상품 리스팅 영역 노출
	var getParams	= searchParams();	
	var trident = navigator.userAgent.match(/Trident\/(\d.\d)/i);
	if( trident && trident[1] == "7.0"){ // ie 9
		window.location.pathname + '?' + getParams;
	} else {		
		history.replaceState(null, null, '?' + getParams);
	}

	var uObj	= searchObject();

	if(mode == 'auto'){
		getParams += "&auto=1";
	}

	$.ajax({
		'type'		: "get",
		'url'		: '/goods/search_list',
		'data'		: getParams,
		'async'		: false,
		'dataType'	: 'html',
		'success'	: function(result){
			$("#searchedItemDisplay").html(result);
		},
		'complete' : function() {
			// 상품 색상 코드값 디자인( new 상품정보 )
			if ( $('.displaY_color_option').length > 0 ) {
				$('.displaY_color_option .areA').filter(function() {
					return ( $(this).css('background-color') == 'rgb(255, 255, 255)' );
				}).addClass('border');
			}
			// BEST 페이지 순위 아이콘 넣기
			if ( $('#searchedItemDisplay.best_page_ranking').length > 0 ) {
				$('#searchedItemDisplay.best_page_ranking .item_img_area').each(function( e ) {
					var num = (uObj.per) * (uObj.page-1) + e + 1;
					var rank_icon = '<div class="item_rank"><span class="num">' + num + '</span>위</div>';
					$(this).append( rank_icon );
				});
			}
		}
	});
}

function setFilterCategoryPath(filterName){
	var getParams	= searchParams();
	var sSearchMode	= $("input[name='searchMode']").val();	
	set_classification(filterName, '');
}

function setFilterLocationPath(filterName){
	var getParams	= searchParams();
	var sSearchMode	= $("input[name='searchMode']").val();	
	set_classification('', filterName);
}

function setFilterBrandPath(){
	var getParams	= searchParams();
	var sSearchMode	= $("input[name='searchMode']").val();
	if( sSearchMode == 'brand'){
		$.ajax({
			'type'		: "get",
			'url'		: '/goods/navi',
			'data'		: getParams,
			'dataType'	: 'html',
			'success'	: function(tag){
				$(".search_nav").html(tag);
				displaySearchBrandFilter();
			}
		});
	}
}