<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상호찾기</title>
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

<script>
	$(function() {
		$("#searchBtn").on("click", function() {
			if ($.trim($("#keyword").val()) == "") {
				alert("키워드를 입력해주세요");
				return false;
			}

			var keyword = $("#keyword").val();
			$.ajax({
				url : "/party/searchStoreProc?keyword=" + keyword,
				dataType : "json"
			}).done(function(resp) {
				console.log(resp);
			});
		});
	});
</script>

</head>
<body>
	<div class="container">
		<form id="form" name="form" action="/party/searchStoreProc">
			<div class="row mt-3">
				<div class="col-12">
					<h2>상호명 찾기</h2>
				</div>
			</div>
			<div class="row mb-3">

				<div class="col-8">
					<input type="text" id="keyword" name="keyword" class="form-control"
						aria-describedby="countHelpInline"> <small id="HelpInline"
						class="text-muted"> 예시 : 을지로 스타벅스, 홍대 락희돈 </small>
				</div>
				<div class="col-3">
					<button type=button id=searchBtn class="btn btn-primary">검색</button>
				</div>
			</div>
		</form>
		
		
		<!--  출력 라인  -->
		
		<c:forEach var="i" items="${resp.cafe.documents}" varStatus="status">
		<div class="row mb-2">
			<div class="col-12">
				<h5>검색결과</h5>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-7">${i.place_name}</div>
					<div class="col-5">${i.phone}</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-12">${i.road_address_name}</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<button id="chooseBtn" class="btn btn-light">선택</button>
				<hr />
			</div>
		</div>
		</c:forEach>
		<!--  출력 라인  끝-->

	</div>



</body>
</html>