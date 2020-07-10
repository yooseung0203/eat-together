<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/admin.css">
<title>Admin-FAQ관리</title>
</head>
<body>
	<div class="container-fluid mx-0 px-0">
		<div class="row mx-0">

			<div class="col-3 mx-0 px-0"><jsp:include
					page="/WEB-INF/views/include/admin_sidebar.jsp" /></div>
			<div class="col-9">
				<div class="row">
					<div class="col-12 col-sm-12 mt-3">
						<h2 class="admin-h2">자주하는 질문(FAQ) 관리</h2>
					</div>
				</div>

				<div class="row">
					<div class="col-12  col-sm-12">
					<div class="row">
			<div class="table-responsive">
				<table class="table border-bottom border-dark">
					<thead class="thead-dark">
						<tr>
							<th scope="col" class="text-center">선택</th>
							<th scope="col">번호</th>
							<th scope="col">카테고리</th>
							<th scope="col">타이틀</th>
							<th scope="col">작성일</th>
							<th scope="col">수정</th>
							<th scope="col">삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" items="${contents}" varStatus="status">
						<tr>
							<th scope="row" class="text-center">
								${status.index}
							</th>

							
							<td><a href="/notice/contents?seq=${i.seq}"><c:out value="${i.title}"/></a></td>
							<td>${i.sDate}</td>
							<td><c:if test="${i.attachment ne '0'}">&#x1F4BE;</c:if></td>
							<td>${i.view_count}</td>
							
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row mb-5">
			<div class="col-2">
				
			</div>
			<div class="col-8">
				${navi}
			</div>
			<div class="col-2">
			<c:if test="${sessionScope.loginInfo.id eq 'administrator'}">
				<button class="btn btn-primary" id="toWriteBtn">글쓰기</button>
			</c:if>
			</div>
		</div>
					
					
					
					
					
					
					
					
					
					</div>
				</div>

			</div>

		</div>

	</div>
</body>
</html>


