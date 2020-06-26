<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
 <!-- BootStrap4 -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <!-- BootStrap4 End-->
        <!-- google font -->
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;900&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
        <!-- google font end-->
        <!-- header,footer용 css  -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/index-css.css">
<!-- header,footer용 css  -->
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="/resources/css/loginview.css">
</head>

<body>
	<!-- ******************* -->
	<!-- header  -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- hedaer  -->
	<!-- ******************* -->
	<div id=container class=login-container>
	<h1 class="login_text">로그인</h1>
		<form action="/" method=post>
			<div  class="login_text">
				<label for="id" class="login_text">아이디</label> <input type="text" class="form-control"
					id="id" name="id">
			</div>
			<div  class="login_text">
				<label for="password" class="login_text">Password</label> <input type="password"
					class="form-control" id="pw" name="pw">
			</div>
			<button type="submit" id="loginBtn" class="btn btn-warning">Submit</button>
		</form>
		<!-- 카카오톡 아이디로 로그인 버튼 노출 영역 -->
		<a
			href="https://kauth.kakao.com/oauth/authorize?client_id=39543f4353dc8ce2c9268fc23c6d67e4&redirect_uri=http://localhost/member/login&response_type=code">
			<img src="/resources/img/kakao_login_medium_narrow.png" id="kakaoLoginBtn">
		</a>
		<!-- 카카오톡 아이디로 로그인 버튼 노출 영역 -->
	</div>
	<!-- ******************* -->
	<!-- footer  -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- footer  -->
	<!-- ******************* -->
</body>
</html>