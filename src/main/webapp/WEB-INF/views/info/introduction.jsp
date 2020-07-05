<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집갔다갈래 - 사이트소개</title>
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
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">

<!-- google font end-->



<!-- ******************* -->
<!-- header,footer용 css  -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/index-css.css">
<!-- header,footer용 css  -->
<!-- ******************* -->
<link rel="stylesheet" type="text/css" href="/resources/css/info.css">
<style>
body {
	overflow-x: hidden;
}
</style>
</head>
<body>
	<!-- ******************* -->
	<!-- header  -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- hedaer  -->
	<!-- ******************* -->

	<div class="container-fluid big-title mt-5 pt-3 mb-5 pb-3">
		<div class="row">
			<div class="col-12 col-sm-12 text-center">
				<h4 class="info-s-title">맛집 동행 찾기 서비스</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-sm-12 text-center">
				<h1 class="info-title text-center">맛집 갔다 갈래</h1>
			</div>
		</div>

	</div>
	<div class="container">
		<div class="row">
			<div class="col-12 my-3"></div>
		</div>
		<div class="row">
			<div class="col-12 col-sm-5">
				<img src="/resources/img/logo/eattogether-logo-rectangle.png"
					class="info-logo">
			</div>
			<div class="col-12 col-sm-7 ">
				<h3 class="info-copyright mt-5 pt-5 text-center">
					"우리는 사람과 식탁을 연결하고,<br>더 즐거운 삶의 방식을 만듭니다."
				</h3>
			</div>
		</div>
	</div>

	<div class="container-fluid info-movie mx-0 px-0 mt-5">
		<div class="row">
			<div class="col-12 col-sm-12 mx-0 px-0">
				<div class="jb-box">
					<video muted autoplay loop>
						<source src="https://eat-together.s3.ap-northeast-2.amazonaws.com/movie/Lunch-2339.mp4" type="video/mp4">
						<strong>Your browser does not support the video tag.</strong>
					</video>
					<div class="jb-text">
						<p>함께해서 더 맛있는 식사</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid card-bg py-3">
		<div class="container">
			<div class="row">
				<div class="col-12 my-5"></div>
			</div>
			<div class="row">
				<div class="col-12 col-sm-12 text-center">
					<h4 class="info-small-title">주요 서비스</h4>
				</div>
				<div class="row">
					<div class="col-12 col-sm-12 py-5">
						<div class="card-deck">
							<div class="card">
								<img src="/resources/img/info/service01.png"
									class="card-img-top" alt="social dining group service">
								<div class="card-body">
									<h5 class="card-title">맛집 동행 모임 서비스</h5>
									<p class="card-text">위치정보를 활용하여 원하는 맛집 동행 모임을 직접 모집하거나
										검색기능을 통해서 원하는 모임에 참여할 수 있습니다.</p>
									<!-- <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
								</div>
							</div>
							<div class="card">
								<img src="/resources/img/info/service02.png"
									class="card-img-top" alt="chatting service">
								<div class="card-body">
									<h5 class="card-title">커뮤니케이션 서비스</h5>
									<p class="card-text">모임 참여자들의 원활한 커뮤니케이션을 위한 실시간 채팅 서비스와 쪽지
										서비스를 제공합니다.</p>

								</div>
							</div>
							<div class="card">
								<img src="/resources/img/info/service03.png"
									class="card-img-top" alt="location based service">
								<div class="card-body">
									<h5 class="card-title">맛집정보 제공 및 리뷰 서비스</h5>
									<p class="card-text">위치정보를 활용해 제공되는 맛집 정보와 모집중인 모임 리스트가
										실시간으로 제공되고, 이용자들의 솔직한 후기와 평점을 확인할 수 있습니다.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
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