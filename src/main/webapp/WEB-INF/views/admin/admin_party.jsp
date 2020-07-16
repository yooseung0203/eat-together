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
<title>Admin-모임글관리</title>
<script>


function toDelete(seq){
	var ask = confirm("정말 삭제하시겠습니까?");
	if(ask){
		location.href="/party/partydeleteByAdmin?seq="+seq;
	}
};

		

</script>
</head>
<body>
	<div class="container-fluid mx-0 px-0">
		<div class="row mx-0">

			<div class="col-2 mx-0 px-0"><jsp:include
					page="/WEB-INF/views/include/admin_sidebar.jsp" /></div>
			<div class="col-10 px-5">
				<div class="row">
					<div class="col-12 col-sm-12 mt-3">
						<h2 class="admin-h2">모임글 관리</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-12 mt-3">
						<form action="/admin/partyByOption" method="post">
							<div class="form-group">
								<label for="partyByOption">조건정렬</label> <select
									class="form-control" id="partyByOption" name=option>
									<option value="meetdate">모임일</option>
									<option value="report">신고수</option>
								</select><br>
								<button type="submit" class="btn btn-dark">검색</button>
							</div>
						</form>
					</div>
				</div>

				<div class="row">
					<div class="col-12  col-sm-12">
						<div class="row">
							<div class="table-responsive">
								<table class="table border-bottom border-dark">
									<thead class="thead-dark">
										<tr>
											<th scope="col" class="text-center">글번호</th>

											<th scope="col">글제목</th>
											<th scope="col">모임장소</th>
											<th scope="col">작성자</th>
											<th scope="col">모임일</th>
											<th scope="col">모임상태</th>
											<th scope="col">신고수</th>
											<th scope="col">삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="i" items="${list}" varStatus="status">
											<tr>
												<th scope="row" class="text-center">${status.index}</th>

												<td><a href="/admin/admin_party_content?seq=${i.seq}">${i.title}</a>


												</td>
												<td>${i.parent_name }</td>
												<td>${i.writer}</td>
												<td>${i.sDate }</td>
												<td class="text-center"><c:if test="${i.status eq 1}">진행중</c:if> <c:if
														test="${i.status eq 0}">종료</c:if></td>
												<td>${i.report}</td>
												<td><button type="button" id="toDelete${i.seq}"
														onclick="toDelete(${i.seq})" class="btn btn-danger">삭제</button></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row mb-5">
							<div class="col-2"></div>
							<div class="col-8">
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">${navi}</ul>
								</nav>
							</div>
							<div class="col-2"></div>
						</div>









					</div>
				</div>

			</div>

		</div>

	</div>
</body>
</html>


