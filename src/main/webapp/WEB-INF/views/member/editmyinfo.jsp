<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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
<!-- mypage용 css  -->
<link rel="stylesheet" type="text/css" href="/resources/css/mypage.css">
<!-- ******************* -->
<!-- menubar용 css  -->
<link rel="stylesheet" type="text/css" href="/resources/css/menubar.css">
<!-- ******************* -->
<meta charset="UTF-8">
<title>내 정보 수정</title>
</head>
<body>
	<!-- ******************* -->
	<!-- header  -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- header  -->
	<!-- ******************* -->


	<div id=mypage-container>
		<jsp:include page="/WEB-INF/views/include/menubar.jsp" />
		<div id=contents>
			<form action="/member/editMyInfoProc" method="post">
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col" colspan=12>My Information</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">ID</th>
							<td>${loginInfo.id}</td>
						</tr>
						<tr>
							<th scope="row">PASSWORD</th>
							<td><button type=button class="btn btn-light"
									onclick="window.open('/member/editPw','비밀번호 수정하기','width=430,height=500,location=no,status=no,scrollbars=yes');"
									id="pwEdit">비밀번호 수정하기</button></td>
						</tr>
						<tr>
							<th scope="row">NICKNAME</th>
							<td><input type=text id="nickname" name="nickname"
								value="${loginInfo.nickname}"></td>
						</tr>
						<tr>
							<th scope="row">BIRTH</th>
							<td>${loginInfo.birth}</td>
						</tr>
						<tr>
							<th scope="row">EMAIL</th>
							<td><input type=text id="account_email" name="account_email"
								value="${loginInfo.account_email}"> <input type=button
								id=mail value="인증하기"> <br>
								<div id=mail_div style="display: none;">
									인증번호 : <input type=text id=mail_text>
									<button type=button id=mail_accept>인증</button>
								</div></td>
						</tr>
						<tr>
							<th scope="row"></th>
							<td>
								<button type="submit" class="btn btn-warning" id="editMyInfo">
									수정하기</button>
								<button type=button class="btn btn-light" id="back">되돌아가기</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<script>
		$("#back").on("click", function() {
			location.replace('/member/mypage_myinfo');
		})

		//nickname regex
		$("#nickname").focusout(function() {
			var nickname = $("#nickname").val();
			var nicknameregex = /^[가-힣]{2,6}$/;
			if ($("#nickname").val() != "") {
				if (!nicknameregex.test(nickname)) {
					$("#nickname").val("");
					alert("한글 2~6글자를 입력하세요.");
					$("#nickname").focus();
				}
			}
		})

		//이메일 regex
		$("#account_email")
				.focusout(
						function() {
							if ($("#account_email").val() != "") {
								var account_email = $("#account_email").val();
								var account_emailregex = /[a-zA-Z0-9]*@[a-zA-Z0-9]*[.]{1}[a-zA-Z]{2,3}|([.]{1}[a-zA-Z]{2,3})$/;
								if (!account_emailregex.test(account_email)) {
									$("#account_email").val("");
									alert("유효한 이메일을 입력해주세요.");
									$("#account_email").focus();
								}
							}
						})

		//이메일 중복체크
		$("#mail").on("click", function() {
			if ($("#account_email").val() == "") {
				alert("이메일을 입력해주십시오.");
				$("#account_email").focus();
			} else {
				$.ajax({
					url : "/mail/mailSending",
					type : "post",
					data : {
						account_email : $("#account_email").val()
					}
				}).done(function(resp) {
					if (resp != "") {
						alert("인증메일이 발송되었습니다.");
						$("#mail_div").css("display", "block");
						$("#mail_accept").on("click", function() {
							if ($("#mail_text").val() == resp) {
								$("#mail_text").attr("readonly", true);
								$("#mail_text").css("color", "blue");
								$("#mail_text").val("인증에 성공하였습니다.");
							} else {
								alert("인증문자열을 확인해주세요.");
								$("#mail_text").val("");
								$("#mail_text").focus();
							}
						})
					} else {
						alert("이미 사용중인 이메일입니다.");
						$("#mail_text").val("");
						$("#mail_text").focus();
					}

				})
			}
		})
	</script>

	<!-- ******************* -->
	<!-- footer  -->
	<div id=footer-container>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
	<!-- footer  -->
	<!-- ******************* -->
</body>
</html>