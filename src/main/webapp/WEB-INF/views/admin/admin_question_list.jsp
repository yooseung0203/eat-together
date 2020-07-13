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
	function AnswerPopUp(msg_seq,msg_sender){
		var name = msg_seq;
		var option ="width=500,height=550 location=no";
		window.open("questionAnswer?msg_seq="+msg_seq+"&msg_sender="+msg_sender,msg_sender,option);
	}
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
														<td class="admin_text"><a href="questionViewAdmin?msg_seq=${i.msg_seq}">${i.msg_title}</a></td>
														<td class="admin_text">${i.msg_date}</td>
														<td class="admin_text"><c:choose>
																<c:when test="${i.msg_view==0}"><a href="javascript:AnswerPopUp(${i.msg_seq},${i.msg_sender})">답변대기</a>
																<form>
																	<input type="hidden" name="msg_seq">
																	<input type="hidden" name="msg_sender">
																</form>
																</c:when>
																<c:otherwise>답변완료</c:otherwise>
															</c:choose></td>
														<td class="myinfo_text">삭제</td>
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