
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<!-- header -->
<div class="container-fluid ">
	<div class="header-wrap  mt-3 mb-2 px-0 mx-0">
		<div class="row">
			<div class="col-sm-1 logo-image ">
				<a href="/"><img src="/resources/img/logo.png"></a>
			</div>
			<div class="col-sm-9 mb-3">
				<ul class="nav">
					<li class="nav-item navi-menu"><a class="nav-link "
						href="/info/toIntroduction">사이트소개</a></li>
					<li class="nav-item navi-menu"><a class="nav-link "
						href="/party/toParty_New" id="toPartyNew">모임모집</a></li>
					<li class="nav-item navi-menu"><a class="nav-link "
						href="/map/toMap" id="toMap">맛집지도</a></li>
					<li class="nav-item navi-menu"><a class="nav-link "
						href="/party/partylist" id="toPartyList">모임검색</a></li>
					<li class="nav-item navi-menu"><a class="nav-link "
						href="/faq/list">FAQ</a></li>
					<li class="nav-item navi-menu"><a class="nav-link "
						href="/notice/list">공지사항</a></li>
					<li class="nav-item navi-menu"><c:choose>
							<c:when test="${loginInfo.id == 'administrator'}">
								<a class="nav-link " href="#"
									onclick="window.open('/admin/toAdmin', 'Admin','width=1300, height=800, location=no'); return false">관리자페이지</a>

							</c:when>
							<c:otherwise>
								<a class="nav-link" href="#" id="goToMyPage">마이페이지</a>
							</c:otherwise>
						</c:choose></li>
				</ul>
			</div>

			<div class="col-sm-1">
				<div class="navi-menu">
					<c:choose>
						<c:when test="${loginInfo.id!=null && newMsg!=0}">
							<button type="button" class="btn btn-primary" id="newMsg">
								New<span class="badge badge-light">${newMsg}</span>
							</button>
						</c:when>
					</c:choose>
				</div>


			</div>
	
				<c:if test="${loginInfo.id == null}">
					<div class="col-sm-1">
						<span class="main-login"> <a href="/member/loginview">
								로그인 </a> / <a href="/member/signup_check">회원가입</a>
						</span>
					</div>
				</c:if>
				<c:if test="${loginInfo.id != null}">
					<c:choose>
						<c:when test="${loginInfo.id == 'administrator'}">
							<div class="col-sm-1">
								<span class="main-login"> 관리자님, 환영합니다. / <a
									href="/member/logoutProc" id="logout">로그아웃</a>
								</span>
							</div>
						</c:when>
						<c:otherwise>
							<div class="col-sm-1">
								<span class="main-login"> ${loginInfo.id}님, 환영합니다. / <a
									href="/member/logoutProc" id="logout">로그아웃</a> <a
									href="/member/logoutProc" id="Report">신고하기</a>
								</span>
							</div>
						</c:otherwise>
					</c:choose>
				</c:if>
			
		</div>


	</div>
</div>

<script>
	$("#logout").on("click", function() {
		alert("로그아웃되었습니다.");
	})
	$("#goToMyPage").on("click", function() {
		if ("${loginInfo.id}" == "") {
			alert("로그인 후 이용해주세요");
			location.replace('/member/loginview');
		} else {
			location.replace('/member/mypage_myinfo');
		}
	})

	
	$("#newMsg").on("click",function(){
		location.href="/msg/msg_list_sender?msgcpage=1";
	})


	$("#newMsg").on("click", function() {
		location.href = "/msg/msg_list_sender";
	})
</script>

