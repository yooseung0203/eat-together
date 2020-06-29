
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- header -->
<div class="container-fluid ">
	<div class="header-wrap  mt-3 px-0 mx-0">
		<div class="row">
			<div class="col-sm-1 logo-image ">
				<a href="/"><img src="/resources/img/dummylogo.png"></a>
			</div>
			<div class="col-sm-10 mb-3">
				<div class="row navibar h5 text-center">
					<div class="col-sm-1">
						<div class="navi-menu">사이트소개</div>
					</div>
					<div class="col-sm-1">
						<div class="navi-menu">
						<a href="/party/toParty_New" id="toPartyNew">모임모집</a>
						</div>
					</div>
					<div class="col-sm-1">
						<div class="navi-menu">
							<a href="/map/toMap" id="toMap">맛집검색</a>
						</div>
					</div>
					<div class="col-sm-1">
						<div class="navi-menu">내주변모임</div>
					</div>
					<div class="col-sm-1">
						<div class="navi-menu">FAQ</div>
					</div>
					<div class="col-sm-1">
						<div class="navi-menu">공지사항</div>
					</div>
					<div class="col-sm-1">
						<div class="navi-menu">마이페이지</div>
					</div>
				</div>
			</div>
			<c:if test="${sessionScope.id == null}">
				<div class="col-sm-1">
					<span class="main-login"> <a href="/member/loginview">로그인 </a> / 
						<a href="/member/signup_check">회원가입</a></span>
				</div>
			</c:if>
			<c:if test="${sessionScope.id != null}">
				<div class="col-sm-1">
					<span class="main-login"> ${sessionScope.id}님, 환영합니다. </a> /
						<a href="/member/mypage">마이페이지</a></span>
				</div>
			</c:if>
		</div>
	</div>
</div>

