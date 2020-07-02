<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집갔다갈래 - FAQ</title>
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
<link rel="stylesheet" type="text/css" href="/resources/css/faq-css.css">

	<script>
$(function(){

	$("#toWriteBtn").on("click",function(){
		location.href="/faq/write";
	});
	
});

</script>
</head>
<body>
	<!-- ******************* -->
	<!-- header  -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- hedaer  -->
	<!-- ******************* -->


	<div class="container">
		<div class="row">
			<div class="col-12 mt-3">
				<h2 class="notice-title">FAQ</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<c:forEach var="i" items="${list}" varStatus="status">
					<div class="faq">
						<div class="faq-q" onclick="$(this).next().show()">
							<div class="row">
								<div class="col-12 col-sm-8">질문 : ${list.title}</div>
								<div class="col-12 col-sm-4">${list.sDate}</div>
							</div>
						</div>
						<div class="faq-a">답변 : ${list.contents}</div>
					</div>
				</c:forEach>
			</div>
		</div>




		<div class="row mb-5">
			<div class="col-2"></div>
			<div class="col-8">${navi}</div>
			<div class="col-2">
				<c:if test="${sessionScope.loginInfo.id eq 'administrator'}">
					<button class="btn btn-primary" id="toWriteBtn">글쓰기</button>
				</c:if>
			</div>
		</div>



		<!-- ******************* -->
		<!-- footer  -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />

		<!-- footer  -->
		<!-- ******************* -->
</body>
</html>