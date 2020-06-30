<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>맛집갔다갈래 - ${con.title} / ${con.writer}</title>
<!-- BootStrap4 -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <!-- BootStrap4 End-->
        
        <!-- google font -->
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;900&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
        
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
				</div>
				<div class="col-sm-12">
				작성자 : ${con.writer}</div>
			</div>
			<div class="row mb-1">
				<div class="col-sm-2 party-titlelabel">상호명</div>
				<div class="col-sm-3">
					${con.parent_name}
				</div>
			</div>
			<div class="row mb-1">
				<div class="col-sm-2 party-titlelabel">위치</div>
				<div class="col-sm-10">
					${con.parent_address}
				</div>
			</div>
			<%-- <div class="row mb-1">
				<div class="col-sm-2">제목</div>
				<div class="col-sm-10">
					${con.title}
				</div>
			</div> --%>
			<div class="row mb-1">
				<div class="col-sm-2 party-titlelabel">모임날짜</div>
				<div class="col-lg-2">
					${con.meetdate }
				</div>
			</div>
			<div class="row mb-1">
				<div class="col-sm-2 party-titlelabel">시간</div>
				<div class="col-lg-2">
					${con.meetdate }
				</div>
			</div>
			<div class="row mb-1">
				<div class="col-sm-2 party-titlelabel">인원</div>
				<div class="col-sm-2">
					${con.count }
				</div>
				
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
				<div class="col-sm-10">
					${con.age}
				</div>
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
				<div class="col-10">
					${con.content}
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-12">
					수정하기 삭제하기 목록으로
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