/**
 * Cumtom Select Box Plugin (jQuery 1.6.2, jQuery UI 1.8.16 기반)
 * Author : ocw
 * Date : 2012.01.13
**/
$(function() {
	$.widget( "custom.customSelectBox", {
		// default options
		options: {
			multi			: false,
			selectedIndex	: null,
			rows			: null,
			showEffect		: 'slideDown',
			hideEffect		: 'slideUp',
			effectSpeed		: 'fast',
			width			: null
		},

		// the constructor
		_create: function() {
			var that = this;
			
			this.element
				.hide()
				.disableSelection();

			this.list = new Array();

			for(var i=0;i<this.element.children("option").length;i++){
				var optionItem = this.element.children("option").eq(i);
				this.list.push({
					'value' : optionItem.val(),
					'text'	: optionItem.text(),
					'event' : optionItem.attr('event')?optionItem.attr('event'):null,
					'selected' : optionItem.attr('selected')
				});
			}
			
			if(!this.options.width) this.options.width = $(this.element).attr('width')?$(this.element).attr('width'):'120px'; 

			this.dropSelectLayerObj = $('<ul class="custom-select-box-layer"  style="z-index:1001;" ></ul>');
			this.dropSelectLayerObj.css('min-width',this.options.width);			

			// 확장모드일때
			if(this.options.multi){
				this.dropMultiMainObj = $('<span class="custom-select-box-btn btn drop_multi_main"><a href="#"></a></span>');
				this.dropMultiMainTextObj = this.dropMultiMainObj.children('a');
				this.dropBtnObj = $('<span class="custom-select-box-btn btn drop_multi_sub"><a href="#"></a></span>');
				this.dropBtnTextObj = this.dropBtnObj.children('a');

				// 버튼 뿌리기
				this.element.before(this.dropMultiMainObj);
				this.element.before(this.dropBtnObj);

				this.dropMultiMainTextObj.click(function(e){
					that.element.change();
				});
			}
			else{
				this.dropBtnObj = $('<span class="custom-select-box-btn btn drop"><a href="#"></a></span>');
				this.dropBtnTextObj = this.dropBtnObj.children('a');	
				
				// 버튼 뿌리기
				this.element.before(this.dropBtnObj);
			}

			// 셀렉트 레이어 뿌리기
			this.dropSelectLayerObj.prependTo('body');

			// 옵션목록 뿌리기
			for(var i=0;i<this.list.length;i++){
				this.dropSelectLayerObj.append("<li idx='"+i+"'><span>"+this.list[i].text+"</span></li>");
			}

			// select박스로부터 기본값 넣고 클릭이벤트걸기
			this.dropSelectLayerObj.children("li").each(function(i){
				// select박스에 선택된값 기본값으로 넣기
				if(that.list[i].selected){
					that.selectedIndex	= $(this).attr('idx');
					that._select(true);
				}			

				// 항목 클릭하면 값 바꾸기
				$(this).bind("click",function(){
					that.selectedIndex	= $(this).attr('idx');
					that._select();
				});
			});

			// select박스에 선택된값이 없으면 첫번째값 넣기
			if(this.selectedIndex == null)	{
				this.selectedIndex = 0;
				that._select(true);
			}

			// 선택레이어 스크롤바처리
			if($(this.element).attr('rows')){
				
				this.rows = parseInt($(this.element).attr('rows'));

				if(this.rows < this.list.length){
					var rowHeight = this.dropSelectLayerObj.children('li:eq(0)').height();
					
					this.dropSelectLayerObj.css({
						'overflow-y': 'scroll',
						'height'	: (rowHeight+1) * this.rows + 1
					});
				}
			}

			// 선택레이어 토글
			this.dropBtnObj.bind('click',function(e){
				e.preventDefault();
				e.stopPropagation();
				if(that.dropSelectLayerObj.is(':hidden')){

					// 확장모드일때
					if(that.options.multi){
						// 위치 세팅
						that.dropSelectLayerObj.css({
							top : that.dropMultiMainObj.offset().top + that.dropMultiMainObj.height(),
							left : that.dropMultiMainObj.offset().left
						});
					}
					else
					{
						// 위치 세팅
						that.dropSelectLayerObj.css({
							top : that.dropBtnObj.offset().top + that.dropBtnObj.height(),
							left : that.dropBtnObj.offset().left
						});
					}

					// 선택된 항목 Bold처리
					that.dropSelectLayerObj.children("li").removeClass('selected').eq(that.selectedIndex).addClass('selected');
					

					// 다른 선택레이어 모두 숨기기
					$(".custom-select-box-layer").hide();

					// 보이기
					that.dropSelectLayerObj[that.options.showEffect](that.options.effectSpeed);
					
				}
				else{
					// 숨기기
					that.dropSelectLayerObj[that.options.hideEffect](that.options.effectSpeed);
				}
			});

		},

		// 값 선택시
		_select: function(defaultFlag) { // defaultFlag이 true이면 초기 change()를 실행하지 않는다.
			var selectedValue	= this.list[this.selectedIndex].value;
			var selectedText	= this.list[this.selectedIndex].text;
			var selectedEvent	= this.list[this.selectedIndex].event;

			// 확장모드일때
			if(this.options.multi){
				this.dropMultiMainTextObj.text(selectedText);
			}else{
				this.dropBtnTextObj.text(selectedText);
			}

			this.dropSelectLayerObj[this.options.hideEffect](this.options.effectSpeed);

			if(!defaultFlag) this.element.val(selectedValue).change();
		},
		
		selectIndex: function(selectedIndex){
			this.selectedIndex = selectedIndex;
			this.element.selectedIndex = selectedIndex;
			this._select(true);
		},

		destroy: function() {

			this.element.show();
			this.dropBtnObj.remove();
			this.dropBtnTextObj.remove();
			this.dropSelectLayerObj.remove();

			if(this.options.multi){
				this.dropMultiMainObj.remove();
				this.dropMultiMainTextObj.remove();
			}

			$.Widget.prototype.destroy.apply(this,arguments);
		},

		// _setOptions is called with a hash of all options that are changing
		// always refresh when changing options
		_setOptions: function() {
			// in 1.9 would use _superApply
			$.Widget.prototype._setOptions.apply( this, arguments );
		},

		// _setOption is called for each individual option that is changing
		_setOption: function( key, value ) {
			// in 1.9 would use _super
			$.Widget.prototype._setOption.call( this, key, value );
		}
	});

});
