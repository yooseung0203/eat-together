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
<!-- header,footer용 css  -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/index-css.css">
<!-- header,footer용 css  -->
<!-- ******************* -->
<!-- withdraw용 css -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/withdraw.css">
<!-- ************* -->
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
	<!-- ******************* -->
	<!-- header  -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- header  -->
	<!-- ******************* -->


	<div class="jumbotron jumbotron-fluid">
		<div class="container withdraw_text">
			<h1 class="display-4" class="withdraw_text">${loginInfo.id}
				님이 참여한 모임으로<br>수많은 새로운 맛집 친구를 만났습니다.
			</h1>
			<br>
			<p class="lead withdraw_text">
				앞으로 더 많은 맛집 친구들이 기다리고 있습니다.<br>정말로 탈퇴하시겠습니까?
			</p>
		</div>
	</div>
	<br>
	<div class="contents_container withdraw_text">
		<form action="/member/withdrawProc" id=withdrawProc method="post">
			<fieldset class="withdraw_text">
				<legend>회원탈퇴</legend>
				<div class="withdraw_text">
					<label for="account_email" class="withdraw_text">이메일</label> <input
						type="text" class="form-control" id="account_email"
						name="account_email" placeholder="ex)eat-together@naver.com">
					<input type=button id=mail value="인증하기" class="btn btn-warning"><br>
					<div id=mail_div style="display: none;">
						인증번호 : <input type=text id=mail_text>
						<button type=button id=mail_accept class="btn btn-light">인증</button>
					</div>
					<div id=withdraw_result style="display: none;">
						<button type=button class="btn btn-light withdraw_text"
							id="withdrawBtn">탈퇴하기</button>
					</div>
				</div>
			</fieldset>
			<button type="button" class="btn btn-dark withdraw_text" id="back">되돌아가기</button>
		</form>

		<script>
		//메일 인증_resp값이 text이므로 dataType을 text로 수정해야 제대로 작동함_20200709
		$("#mail").on("click", function() {
			if ($("#account_email").val() == "") {
				alert("이메일을 모두 입력해주십시오.");
				$("#account_email").focus();
			} else if($("#account_email").val()=="need@eat-together.com"){
				alert("이메일 인증을 하지 않은 회원입니다.\n내정보 수정 - 이메일 인증을 진행해주세요.");
			}else {
				$.ajax({
					url : "/mail/mailSendingForOut",
					type : "post",
					dataType : "text",
					data : {
						account_email : $("#account_email").val()
					}
				}).done(function(resp) {
					if (resp != "0") {
						alert("인증메일이 발송되었습니다.");
						$("#mail_div").css("display", "block");
						$("#mail_accept").on("click", function() {
							if ($("#mail_text").val() == resp) {
								$("#mail_text").attr("readonly", true);
								$("#mail_text").css("color", "blue");
								$("#mail_text").val("인증에 성공하였습니다.");

								$("#withdraw_result").css("display", "block");
							} else if ($("#mail_text").val() == "") {
								alert("인증 문자열을 입력해주세요.");
								$("#mail_text").val("");
								$("#mail_text").focus();
							} else {
								alert("인증 문자열이 일치하지 않습니다.");
								$("#mail_text").val("");
								$("#mail_text").focus();
							}
						})
					} else if (resp == "0") {
						alert("아이디 또는 이메일을 잘못 입력하였습니다.");
						$("#mail_text").val("");
						$("#mail_text").focus();
					}

				})
			}
		})
			//account_email regex
			$("#account_email")
					.focusout(
							function() {
								if ($("#account_email").val() != "") {
									var account_email = $("#account_email")
											.val();
									var account_emailregex = /[a-zA-Z0-9]*@[a-zA-Z0-9]*[.]{1}[a-zA-Z]{2,3}|([.]{1}[a-zA-Z]{2,3})$/;
									if (!account_emailregex.test(account_email)) {
										$("#account_email").val("");
										alert("유효한 이메일을 입력해주세요.");
										$("#account_email").focus();
									}
								}
							})
			$("#back").on("click", function() {
				location.replace("/member/mypage_myinfo");
			})

			$("#withdrawBtn").on("click", function(){
				var result = confirm("정말로 탈퇴하시겠습니까?");
				if(result){
					alert("그동안 감사했습니다.\nLet's eat together again!");
					$("#withdrawProc").submit();
				}else{
					return false;
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