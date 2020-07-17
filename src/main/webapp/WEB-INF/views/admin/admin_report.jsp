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
<title>Admin-신고관리</title>
<script>

function toAccept(seq){
	var ask = confirm("회원의 신고가 접수 됩니다.");
	if(ask){
		location.href="/report/reportAccept?seq="+seq;
	}
};

$(function(){
	$(".reportView").on("click",function(){
		console.log($(this).siblings(".seq").val());
		$.ajax({
			url:"/admin/admin_reportContent",
			dataType:'Json',
			data:{seq:$(this).siblings(".seq").val()}
		}).done(function(resp){
			console.log(resp);
			$(".modal-title").html("#" + resp.seq);
			$(".modal-body #report_id").html(resp.report_id);
			$(".modal-body #id").html(resp.id);
			$(".modal-body #category").html(resp.category);
			$(".modal-body #report_date").html(resp.report_date);
			$(".modal-body #content").html(resp.content);
			$(".modal-body #status").html(resp.status);
		})
	});
	
	$("#refuse").on("click",function(){
		var check = confirm("회원의 신고를 반려 처리합니다. /n처리하시겠습니까?");
		if(check){
				
		}
	});
	
	$("#accept").on("click",function(){
		var check = confirm("회원의 신고를 승인합니다. /n처리하시겠습니까?");
		if(check){
			$.ajax({
			});	
		}
	})
});


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
						<h2 class="admin-h2">회원 신고 관리</h2>
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
											<th scope="col" class="text-center">번호</th>
											<th scope="col">신고 분류</th>
											<th scope="col">신고자 닉네임</th>
											<th scope="col">신고 닉네임</th>
											<th scope="col">신고일</th>
											<th scope="col">접수 상태</th>
											<th scope="col">접수</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="i" items="${list}" varStatus="status">
											<tr>
												<th scope="row" class="text-center">
													${status.index}													
												</th>
												
												<c:choose>
													<c:when test="${i.category eq 0}">
														<td>리뷰 신고</td>
													</c:when>
													<c:when test="${i.category eq 1}">
														<td>모임 글 신고</td>
													</c:when>
													<c:otherwise>
														<td>회원 신고</td>
													</c:otherwise>
												</c:choose>																							
												<td>${i.id}</td>	
												<td>${i.report_id}</td>
												<td>${i.sdate}</td>
												<td>
													<c:choose>
														<c:when test="${i.status == 0}">
															미접수
														</c:when>
														<c:otherwise>
															접수 온료
														</c:otherwise>
													</c:choose>
													<input type="hidden" class="seq" value="${i.seq }">
												</td>
												<td>
													<button type="button"  class="btn btn-secondary reportView" data-toggle="modal" data-target="#staticBackdrop">
  														상세 내용
													</button>
													<input type="hidden" class="seq" value="${i.seq }">
												</td>
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
							<div class="modal fade" id="mymodal"
								data-backdrop="static" data-keyboard="false" tabindex="-1"
								role="dialog" aria-labelledby="staticBackdropLabel"
								aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered">
									<div class="modal-content">
										<!-- header -->
										<div class="modal-header">
											<h5 class="modal-title" id="staticBackdropLabel">
												
											</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<!-- body -->
										<div class="modal-body">
											<table>
												<tbody>
													<tr>
														<th scope="row">신고 대상 아이디</th>
														<td id="report_id"></td>
													</tr>
													<tr>
														<th scope="row">신고자 아이디</th>
														<td id="id"></td>
													</tr>
													<tr>
														<th scope="row">신고 유형</th>
														<td id="category"></td>
													</tr>
													<tr>
														<th scope="row">제목  / 상호</th>
														<td id="write_date"></td>
													</tr>
													<tr>
														<th scope="row">신고 내용</th>
														<td id="content"></td>
													</tr>
													<tr>
														<th scope="row">처리 상태</th>
														<td id="status"></td>
													</tr>
												</tbody>
											</table>
										</div>
										<!-- footer -->
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">닫기</button>
											<button type="button" id="accept" class="btn btn-danger">접수</button>
											<button type="button" id="refuse" class="btn btn-warning">반려</button>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>


