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
<title>Admin-1:1문의</title>
<script sre="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<script>
	function AnswerPopUp(msg_seq, msg_sender) {
		var name = msg_seq;
		var option = "width=500,height=550 location=no";
		window.open("questionAnswer?msg_seq=" + msg_seq + "&msg_sender="
				+ msg_sender, msg_sender, option);
	}
	function AdminQuestionDel(msg_seq) {
		location.href = "AdminQuestionDel?msg_seq=" + msg_seq;
		alert("삭제성공");
	}
	$(function() {
		$(document).on("click", ".answer", function() {
			var some = $(this).attr("id").split(":");
			console.log(some);
			AnswerPopUp(some[0], some[1]);
		})
	})
</script>
<body>
	<div class="container-fluid mx-0 px-0">
		<div class="row mx-0">

			<div class="col-3 mx-0 px-0"><jsp:include
					page="/WEB-INF/views/include/admin_sidebar.jsp" /></div>
			<div class="col-9">
				<div class="row">
					<div class="col-12 col-sm-12 mt-3">
						<h2 class="admin-h2">1:1문의</h2>
					</div>
				</div>

				<div class="row">
					<div class="col-12  col-sm-12">
						<div class="row">
							<div class="table-responsive">
								<table class="table border-bottom border-dark">
									<thead class="thead-dark">
										<tr>
											<th scope="col">문의번호</th>
											<th scope="col">아이디</th>
											<th scope="col">제목</th>
											<th scope="col">날짜</th>
											<th scope="col">답변여부</th>
											<th scope="col">삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${empty list}">
												<tr>
													<td colspan=12 class="myinfo_text">문의가 존재하지 않습니다.</td>
												</tr>
											</c:when>
											<c:when test="${!empty list}">
												<c:forEach var="i" items="${list}">
													<tr>
														<td class="admin_text">${i.msg_seq}</td>
														<td class="admin_text">${i.msg_sender}</td>
														<td class="admin_text">
														<c:choose>
															<c:when test="${i.msg_view==0||i.msg_view==1}">
															<a href="questionViewAdmin?msg_seq=${i.msg_seq}">${i.msg_title}</a>
															</c:when>
															<c:otherwise>
															<a href="questionViewAdmin?msg_seq=${i.msg_seq}" style="color:black;">${i.msg_title}</a>
															</c:otherwise>
														</c:choose>
														
														
														</td>
														<td class="admin_text">${i.date}</td>
														<c:choose>
															<c:when test="${i.msg_view==0||i.msg_view==1}">
																<td class="admin_text" style="color: red;">답변대기</td>
															</c:when>
															<c:otherwise>
																<td class="admin_text">답변완료</td>
															</c:otherwise>
														</c:choose>
														
														<c:choose>
															<c:when test="${i.receiver_del==1}">
															<td><button type="button" class="btn btn-outline-dark"
															onclick="location.href='javascript:AdminQuestionDel(${i.msg_seq})'">삭제</button></td>
															</c:when>
															<c:otherwise>
																<td class="myinfo_text">삭제불가</td>	
															</c:otherwise>
														</c:choose>
														
														
													</tr>
												</c:forEach>
											</c:when>
										</c:choose>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row mb-5">
							<div class="col-12">${navi}</div>

						</div>
					</div>
				</div>

			</div>

		</div>

	</div>



</body>
</html>