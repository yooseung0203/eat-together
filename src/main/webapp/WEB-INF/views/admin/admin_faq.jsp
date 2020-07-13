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
<script>
function toModify(seq){
	location.href="/faq/modify?seq="+seq;
};

function toDelete(seq){
	var ask = confirm("정말 삭제하시겠습니까?");
	if(ask){
		location.href="/faq/delete?seq="+seq;
	}
};

$(function(){
	$("#toWriteBtn").on("click",function(){
		location.href="/faq/toWriteInAdmin";
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
											<th scope="col" class="text-center">번호</th>

											<th scope="col">카테고리</th>
											<th scope="col">타이틀</th>

											<th scope="col">수정</th>
											<th scope="col">삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="i" items="${list}" varStatus="status">
											<tr>
												<th scope="row" class="text-center">${i.seq}</th>

												<td>
												
												<c:if test="${i.category eq 'how'}">사이트이용관련</c:if>
												<c:if test="${i.category eq 'mem'}">회원정보관련</c:if>
												
												
												</td>
												<td><a href="#" data-toggle="modal"
													data-target="#exampleModal${i.seq}"><c:out value="${i.title}" /></a></td>
												<!-- Modal -->
												<div class="modal fade" id="exampleModal${i.seq}" tabindex="-1"
													role="dialog" aria-labelledby="exampleModalLabel"
													aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabel">
																<c:if test="${i.category eq 'how'}"><strong>[사이트이용관련]</strong></c:if>
												<c:if test="${i.category eq 'mem'}"><strong>[회원정보관련]</strong></c:if>
												<br>
																${i.title}</h5>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">${i.contents}</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-dismiss="modal">닫기</button>
																<button type="button" id="toModify${i.seq}" onclick="toModify(${i.seq})" class="btn btn-warning">수정</button>
																<button type="button" id="toDelete${i.seq}" onclick="toDelete(${i.seq})"class="btn btn-danger">삭제</button>
															</div>
														</div>
													</div>
												</div>
												<td><button type="button" id="toModify${i.seq}" onclick="toModify(${i.seq})" class="btn btn-warning">수정</button></td>
												<td><button type="button" id="toDelete${i.seq}" onclick="toDelete(${i.seq})"class="btn btn-danger">삭제</button></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row mb-5">
							<div class="col-2"><%-- <button type="button" id="toDelete${i.seq}" onclick="toSelectDelete()"class="btn btn-danger">선택삭제</button> --%></div>
							<div class="col-8">${navi}</div>
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


