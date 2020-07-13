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
								<table class="table">
									<thead class="thead-dark">
										<tr>
											<th scope="col" colspan=12>1:1문의</th>
										</tr>
									</thead>
									<tbody>
										<tr align="center">
											<th scope="col">제목</th>
											<th scope="col">${qdto.msg_title}</th>
										</tr>

										<tr align="center">
											<th scope="col">작성자</th>
											<th scope="col">${qdto.msg_sender}</th>
										</tr>
					
										<tr align="center">
											<th scope="col">작성 날짜</th>
											<th scope="col">${qdto.msg_date}</th>
										</tr>
										<tr align="center">
											<td scope="col" colspan=12><textarea
													style="width: 100%; padding: 10px; word-break: keep-all; height: 180px;"
													id="msg_text" name="msg_text" readonly>${qdto.msg_text}</textarea></td>
										</tr>
										<tr align="center">
											<td scope="col" colspan=12>
												<button type="button" id="close" class="btn btn-secondary">닫기</button>
											</td>
										</tr>
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