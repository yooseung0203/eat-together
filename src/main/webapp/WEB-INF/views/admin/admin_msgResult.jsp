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
<title>Admin-쪽지관리</title>
<script>
$(function(){
	$(".table-responsive").find("#msg_text").keyup(function(){
		var word = $(this).val();
		var wordSize = word.length;
		console.log(wordSize);
		if(wordSize <=2000){
			$(".current").text(wordSize);
		}else{
			word=word.substr(0,2000);
			$(".current").text(word.length);
			$(this).val(word);
			alert("전체쪽지는 2000자 이하로 작성해주세요");
		}
	})
})

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
						<h2 class="admin-h2">쪽지 관리</h2>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col">
						<button type="button" class="btn btn-danger" onclick="location.href='/admin/toAdmin_msg'">공지</button>
						<button type="button" class="btn btn-warning">쪽지함</button>
						<button type="button" class="btn btn-dark">삭제된 쪽지함</button>
					</div>
				</div>
				<hr>
					<div class="row">
						<div class="col-12  col-sm-12">
							<div class="row">
								<div class="table-responsive">

									<table class="table border-bottom border-dark">
										<thead>
											<tr class="table-danger">
												<th scope="col" colspan=12 class="text-center">${result}명 의 회원에게 전송완료</th>
											</tr>
									</thead>
										<tbody>
										
										</tbody>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-12" align="center">
									<button class="btn btn-warning" id="back" onclick="location.href='/admin/toAdmin_msg'">돌아가기</button>
								</div>
							</div>

						</div>
					</div>
			</div>

		</div>


	</div>
</body>
</html>


