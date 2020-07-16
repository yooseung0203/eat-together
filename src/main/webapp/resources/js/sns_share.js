/**
 * SNS share js
 */

/*네이버*/
 function share_naver() {
	 var sh_title = $("#sns_share_title").val(); 
	 var sh_desc = "혼자서는 망설여지는 맛집이 있다면?\n 맛집동행찾기서비스 /'맛집갔다갈래/' 를　 이용해보세요!"; 
      var url = encodeURIComponent(encodeURIComponent(window.location.href));
      var title = encodeURIComponent(sh_title);
      var shareURL = "https://share.naver.com/web/shareView.nhn?url=" + url + "&title=" + title;
     
  	window.open(shareURL, "_blank"
			, 'width=600,height=400,resizable=yes,scrollbars=yes'
	);
    }

/*트위터*/
function share_twitter(){
	window.open("https://twitter.com/intent/tweet"
			+"?via=eat-together.net"
			+"&text="+encodeURIComponent( $("#sns_share_title").val() ) // Title in this html document
			+"&url="+encodeURIComponent(window.location.href)
			, "_blank"
			, 'width=600,height=400,resizable=yes,scrollbars=yes'
	);
};

/*페이스북*/
function share_facebook(){

	window.open("http://www.facebook.com/sharer/sharer.php?u="
			+encodeURIComponent(window.location.href)
			, "_blank"
			, 'width=600,height=400,resizable=yes,scrollbars=yes'
	);
};

/*카카오톡 */

Kakao.init('7737878fbec4e4034e25f045926f4cab'); 
function share_kakao() {
	var sh_title = $("#sns_share_title").val(); 
	var sh_desc = "혼자서는 망설여지는 맛집이 있다면?\n 맛집동행찾기서비스 /'맛집갔다갈래/' 를　 이용해보세요!"; 
	Kakao.Link.sendDefault({ 
		objectType: 'feed', 
		content: { title: sh_title, description: sh_desc, imageUrl: "https://eat-together.s3.ap-northeast-2.amazonaws.com/logo/eattogether-logo-rectangle.png", 
			link: { mobileWebUrl: window.location.href, webUrl: window.location.href} 
		}, 
	}); 
}


$("a[data-toggle='sns_share']").click(function(e){
	var option = "width = 500, height = 600, top = 100, left = 200, scrollbars=no";
	e.preventDefault();
	var current_url = document.location.href;
	var _this = $(this);
	var sns_type = _this.attr('data-service');
	var href = current_url;
	var loc = "";
	var img = $("meta[name='og:image']").attr('content');
	var sh_title = $("#sns_share_title").val(); 
	var sh_desc = "혼자서는 망설여지는 맛집이 있다면?\n 맛집동행찾기서비스 /'맛집갔다갈래/' 를　 이용해보세요!"; 

	if( ! sns_type || !href || !title) return;

	else if ( sns_type == 'kakaostory') {
		loc = 'https://story.kakao.com/share?url='+encodeURIComponent(href);
	}
	else if ( sns_type == 'band' ) {
		loc = 'http://www.band.us/plugin/share?body='+encodeURIComponent(sh_title)+'%0A'+encodeURIComponent(href);
	}

	else {
		return false;
	}

	window.open(loc,"_blank",option);
	return false;
});


