/**
 * Cumtom Mobile Pagination Plugin (jQuery 1.6.2, jQuery UI 1.8.16 기반)
 * Author : ocw
 * Date : 2014.09.26
**/
if(typeof customMobilePaginationLoaded == 'undefined'){
	var customMobilePaginationLoaded = true;
	$.widget( "custom.customMobilePagination", {
		// default options
		options: {
			style		: 'paging_style_4',
			max_page	: 1,
			now_page	: 1,
			btn_auto_hide : false,
			on_prev		: function(){},
			on_next		: function(){},
			on_page		: function(){},
		},

		// the constructor
		_create: function() {
			var that = this;

			this.set_page(this.options);
		},

		set_page: function(set_options){
			var that = this;

			if(typeof set_options != 'undefined'){
				for(k in set_options){
					this.options[k] = set_options[k];
				}
			}

			switch(this.options['style']){
				case "paging_style_1":
				case "paging_style_2":
				case "paging_style_3":
					var html = '<ul class="mobile_pagination_'+this.options['style']+'">';
					for(var i=1;i<=this.options['max_page'];i++){
						if(this.options['now_page']==i){
							html += '<li class="current">'+i+'</li>';
						}else{
							html += '<li>'+i+'</li>';
						}
					}
					html += '</ul>';
					$(this.element).empty().html(html);
					$(this.element).find(".mobile_pagination_"+this.options['style']+" li").each(function(i){
						$(this).bind('click',function(){
							that.set_page({'now_page':i+1});
							that.options['on_page'](i+1);
						});
					});
				break;
				case "paging_style_4":
				case "paging_style_5":
					var html = '<ul class="mobile_pagination_'+this.options['style']+'">';
					html += '<li class="paging_btn_prev"></li>';
					html += '<li class="paging_btn_body"><span class="paging_btn_num_now">'+this.options['now_page']+'</span>/<span class="paging_btn_num_max">'+this.options['max_page']+'</span></li>';
					html += '<li class="paging_btn_next"></li>';
					html += '</ul>';
					$(this.element).empty().html(html);
					
					if(this.options['btn_auto_hide']){
						if(this.options['now_page']==1) $(this.element).find(".paging_btn_prev").hide();
						else $(this.element).find(".paging_btn_prev").show();
						if(this.options['now_page']==this.options['max_page']) $(this.element).find(".paging_btn_next").hide();
						else $(this.element).find(".paging_btn_next").show();
					}

					$(this.element).find(".paging_btn_prev").bind('click',function(){
						that.on_prev();
					});

					$(this.element).find(".paging_btn_next").bind('click',function(){
						that.on_next();
					});
				break;
			}

			if(this.options['max_page']>1) $(this.element).show();
			else $(this.element).hide();

		},

		on_prev: function(option) {
			if(typeof option == 'function'){
				this.options['on_prev'] = option;
			}else{
				this.options['on_prev']();
			}
		},

		on_next: function(option) {
			if(typeof option == 'function'){
				this.options['on_next'] = option;
			}else{
				this.options['on_next']();
			}
		},

		destroy: function() {
			$(this.element).empty();
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
}