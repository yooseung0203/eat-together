
/********************************* 채팅방으로 이동 ************************************/
function toChatroom(num){
	var option = "width = 800, height = 800, top = 100, left = 200, scrollbars=no"
		window.open("/chat/chatroom?roomNum="+num, num, option);
}

/********************************* 채팅방으로 이동 ************************************/

/********************************* 모임 게시글 신고 ************************************/
/*
function partyReport(num){
	$.ajax({
		url:"/party/party_report",
		data : {
			seq : num
		},
		success : function(result) {
			if (result == 1){ 
				alert("신고가 정상적으로 접수되었습니다.");	
			}
		},
		error:function(e){
			console.log("error");
		}
	});	
}
 */
/********************************* 채팅방으로 이동 ************************************/

/*****************************  수지 party content 스크립 ***********************************************/
$(document).ready(function(){

	$("a[data-toggle='sns_share']").click(function(e){
		var option = "width = 500, height = 600, top = 100, left = 200, scrollbars=no";
		e.preventDefault();
		var current_url = document.location.href;
		var _this = $(this);
		var sns_type = _this.attr('data-service');
		var href = current_url;
		var title = _this.attr('data-title');
		var loc = "";
		var img = $("meta[name='og:image']").attr('content');

		if( ! sns_type || !href || !title) return;

		if( sns_type == 'facebook' ) {
			loc = '//www.facebook.com/sharer/sharer.php?u='+href+'&t='+title;
		}
		else if ( sns_type == 'twitter' ) {
			loc = '//twitter.com/home?status='+encodeURIComponent(title)+' '+href;
		}

		else if ( sns_type == 'pinterest' ) {

			loc = '//www.pinterest.com/pin/create/button/?url='+href+'&media='+img+'&description='+encodeURIComponent(title);
		}
		else if ( sns_type == 'kakaostory') {
			loc = 'https://story.kakao.com/share?url='+encodeURIComponent(href);
		}
		else if ( sns_type == 'band' ) {
			loc = 'http://www.band.us/plugin/share?body='+encodeURIComponent(title)+'%0A'+encodeURIComponent(href);
		}
		else if ( sns_type == 'naver' ) {
			loc = "http://share.naver.com/web/shareView.nhn?url="+encodeURIComponent(href)+"&title="+encodeURIComponent(title);
		}
		else {
			return false;
		}

		window.open(loc,"_blank",option);
		return false;
	});


	//var stime = "${con.sTime}";
	var stime = $("#party_time").val();
	var time = stime.substr(0,5);
	console.log(stime);
	$("#time").html(stime);
});


$(function () {
	var party_seq = $("#party_seq").val();
	console.log(party_seq);
	$("#partyModify").on("click", function() {
		//location.href = "/party/partymodify?seq=${con.seq}";
		location.href = "/party/partymodify?seq="+party_seq;
		//partyModify(party_seq);
	});

	$("#partyDelete").on("click", function() {
		var ask = confirm("삭제 후에는 복구할 수 없습니다.\n 정말 삭제하겠습니까?");
		if (ask) {
			////location.href = "/party/partydelete?seq=${con.seq}";
			location.href = "/party/partydelete?seq="+party_seq;
		}
		//partyDelete(party_seq);
	});

	$("#toPartylist").on("click", function() {
		location.href = "/party/toPartylist";
		//toPartylist();
	});

	$("#toPartyJoin").on("click",function(){ //모임가입
		//location.href="/party/partyJoin?seq=${con.seq}";
		location.href="/party/partyJoin?seq="+party_seq;
		//toPartyJoin(party_seq);
	});

	// 태훈 신고
	$("#partyReport").on("click", function() {
		var ask = confirm("무분별한 신고는 신고자 본인에게 불이익이 갈 수 있습니다.\n정말 신고하겠습니까?");
		if (ask) {
			partyReport(party_seq );
		}
	});

	$("#toChatroom").on("click", function() {
		//toChatroom(${con.seq});
		toChatroom(party_seq );
	});

	$("#toExitParty").on("click",function(){
		//toExitParty(${con.seq});
		toExitParty(party_seq );
	});


	$("#toStopRecruit").on("click",function(){
		var ask = confirm("모집종료 후에는 되돌릴 수 없습니다. \n 정말 모집을 종료하시겠습니까?");
		if (ask) {
			////location.href= "/party/stopRecruit?seq=${con.seq}";
			location.href= "/party/stopRecruit?seq="+party_seq;
		}
		//toStopRecruit(party_seq);
	});

});

//페이지 리사이징
$(function() {
	$('.cropping img').each(function(index, item) {
		if ($(this).height() / $(this).width() < 0.567) {
			$(this).addClass('landscape').removeClass('portrait');
		} else {
			$(this).addClass('portrait').removeClass('landscape');
		}
	});
});       

