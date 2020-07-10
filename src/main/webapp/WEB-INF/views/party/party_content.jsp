<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>맛집갔다갈래 - ${con.title} / ${con.writer}</title>
<!-- BootStrap4 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- BootStrap4 End-->

<!-- google font -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet">

<!-- google font end-->

<!-- ******************* -->
<!-- header,footer용 css  -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/index-css.css">
<!-- header,footer용 css  -->
<!-- ******************* -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/party-css.css">
</head>
<script>

function toChatroom(num){
    var option = "width = 800, height = 800, top = 100, left = 200, scrollbars=no"
    window.open("/chat/chatroom?roomNum="+num, num, option);
}


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
	
	
	var stime = "${con.sTime}";
	var time = stime.substr(0,5);
	console.log(time);
	$("#time").html(time);
});

	$(function() {
		$("#partyModify").on("click", function() {
			location.href = "/party/partymodify?seq=${con.seq}";
		});

		$("#partyDelete").on("click", function() {
			var ask = confirm("삭제 후에는 복구할 수 없습니다.\n 정말 삭제하겠습니까?");
			if (ask) {
				location.href = "/party/partydelete?seq=${con.seq}";
			}
		});

		$("#toPartylist").on("click", function() {
			location.href = "/party/toPartylist";
		});
		
		$("#toPartyJoin").on("click",function(){ //모임가입
			location.href="/party/partyJoin?seq=${con.seq}";
			
			
		});
		
		$("#toChatroom").on("click", function() {
			toChatroom(${con.seq});
		});
		
		$("#toExitParty").on("click",function(){
			toExitParty(${con.seq});
		});
        
		
		$("#toStopRecruit").on("click",function(){
			var ask = confirm("모집종료 후에는 되돌릴 수 없습니다. \n 정말 모집을 종료하시겠습니까?");
			if (ask) {
			location.href= "/party/stopRecruit?seq=${con.seq}";
			}
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
</script>
<style>
.featImgWrap {
	height: 250px;
	position: relative;
	padding-top: 56.57%;
	/* 16:9 ratio */
	overflow: hidden;
}

.featImgWrap .cropping {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	-webkit-transform: translate(50%, 50%);
	-ms-transform: translate(50%, 50%);
	transform: translate(50%, 50%);
}

.featImgWrap .cropping img {
	position: absolute;
	top: 0;
	left: 0;
	max-width: 100%;
	height: auto;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}

.featImgWrap .cropping img.landscape {
	max-height: 100%;
	height: 100%;
	max-width: none;
}

.featImgWrap .cropping img.portrait {
	max-width: 100%;
	width: 100%;
	max-height: none;
	border: 1px solid black;
}
</style>
<body>
	<!-- ******************* -->
	<!-- header  -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- hedaer  -->
	<!-- ******************* -->

	<div class="container">
		<div class="row mb-3">
			<div class="col-sm-12 mt-3">
				<h2 class="party_headline">${con.title}</h2>
				<c:choose>
					<c:when test="${con.status  eq '1'}">
						<span class="badge badge-success">멤버 모집중</span>
					</c:when>
					<c:when test="${con.status  eq '0'}">
						<span class="badge badge-secondary">모집마감</span>
					</c:when>
				</c:choose>
			</div>
			<div class="col-sm-12">작성자 : ${con.writer}</div>
		</div>
		<div class="row">
			<div class="col-sm-5">
				<div class="featImgWrap">
					<div class="cropping">
						<img src="${con.imgaddr}" id="img">
					</div>
				</div>
			</div>
		</div>
		<div class="row mb-1">
			<div class="col-sm-2 party-titlelabel">상호명</div>
			<div class="col-sm-3">${con.parent_name}</div>
		</div>
		<div class="row mb-1">
			<div class="col-sm-2 party-titlelabel">위치</div>
			<div class="col-sm-10">${con.parent_address}</div>
		</div>
		<%-- <div class="row mb-1">
				<div class="col-sm-2">제목</div>
				<div class="col-sm-10">
					${con.title}
				</div>
			</div> --%>
		<div class="row mb-1">
			<div class="col-sm-2 party-titlelabel">모임날짜</div>
			<div class="col-sm-2">${con.sDate }</div>
		</div>
		<div class="row mb-1">
			<div class="col-sm-2 party-titlelabel">시간</div>
			<div class="col-sm-2" id="time"></div>
		</div>
		<div class="row mb-1">
			<div class="col-sm-2 party-titlelabel">인원</div>
			<div class="col-sm-2">${con.count }</div>

		</div>
		<div class="row mb-1">
			<div class="col-sm-2 party-titlelabel">멤버구성</div>
			<div class="col-sm-10">
				<c:choose>
					<c:when test="${con.gender  eq 'm'}">남자만</c:when>
					<c:when test="${con.gender  eq 'f'}">여자만</c:when>

					<c:otherwise> 남녀무관 </c:otherwise>
				</c:choose>

			</div>

		</div>


		<div class="row mb-1">
			<div class="col-sm-2 party-titlelabel">연령대</div>
			<div class="col-sm-10">${con.age}</div>
		</div>

		<div class="row mb-1" id="adult_q">
			<div class="col-sm-2 party-titlelabel">음주</div>
			<div class="col-sm-10">
				<c:choose>
					<c:when test="${con.drinking  eq '1'}">음주OK</c:when>
					<c:when test="${con.drinking  eq '0'}">음주NO</c:when>
				</c:choose>

			</div>
		</div>
		<div class="row mb-1">
			<div class="col-2 party-titlelabel">소개</div>
			<div class="col-10">${con.content}</div>
		</div>
		<div class="row mb-1">
			<div class="col-2 party-titlelabel">SNS공유</div>
			<div class="col-10">
				<a href="#" data-toggle="sns_share" data-service="naver"
					data-title="네이버 SNS공유" class="btn btn-default">네이버 SNS 공유하기</a> <a
					href="#" data-toggle="sns_share" data-service="twitter"
					data-title="트위터 SNS공유" class="btn btn-default">트위터 SNS 공유하기</a> <a
					href="#" data-toggle="sns_share" data-service="facebook"
					data-title="페이스북 SNS공유" class="btn btn-default">페이스북 SNS 공유하기</a> <a
					href="#" data-toggle="sns_share" data-service="band"
					data-title="네이버밴드 SNS공유" class="btn btn-default">네이버 밴드 공유하기</a> <a
					href="#" data-toggle="sns_share" data-service="pinterest"
					data-title="핀터레스트 SNS공유" class="btn btn-default">핀터레스트 공유하기</a> <a
					href="#" data-toggle="sns_share" data-service="kakaostory"
					data-title="카카오스토리 SNS공유" class="btn btn-default">카카오스토리 공유하기</a>

			</div>
		</div>
		<div class="row mb-3">
			<div class="col-12 mb-5">
				<c:choose>
					<c:when
						test="${partyFullCheck eq false && partyParticipantCheck eq false}">
						<button type="button" id="toPartyJoin" class="btn btn-success">모임참가하기</button>
					</c:when>
					<c:when test="${partyParticipantCheck  eq true}">
						<button type="button" id="toChatroom" class="btn btn-primary">채팅방으로
							이동</button>
						<button type="button" id="toExitParty" class="btn btn-primary">모임 나가기</button>
					</c:when>
				</c:choose>


				<c:if test="${con.writer eq sessionScope.loginInfo.id }">
					<c:choose>
						<c:when test="${con.status  eq '1'}">
							<button type="button" id="toStopRecruit" class="btn btn-light">모집종료하기</button>
						</c:when>
						<c:when test="${con.status  eq '0'}"></c:when>
					</c:choose>
					<button type="button" id="partyModify" class="btn btn-warning">수정하기</button>
					<button type="button" id="partyDelete" class="btn btn-danger">삭제하기</button>
				</c:if>
				<button type="button" id="toPartylist" class="btn btn-secondary">목록으로</button>

			</div>

		</div>

	</div>



	<!-- ******************* -->
	<!-- footer  -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />

	<!-- footer  -->
	<!-- ******************* -->
</body>
</html>