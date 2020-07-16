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
	<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>


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
<link rel="stylesheet" type="text/css" href="/resources/css/admin.css">
<title>Admin-FAQ작성</title>

<script>
	$(function() {
		$("#fileAdd").on("click", function() {
			var fileComp = $("<div><input type=file name=attfiles></div>");
			$("#fileAdd").after(fileComp);
		})
	});

	$(function() {
		$("#toBackBtn").on("click", function() {
			location.href = "/admin/toAdmin_faq";
		});

		$("#form").on("submit", function() {
			$("#contents").val($('#summernote').summernote('code'));
			console.log($("#contents").val());
			if ($("#title").val() == "" || $("#contents").val() == "") {
				alert("글쓰기 내용을 입력해주세요!");
				return false;
			}
			
			var isCheckCategory = $('input:radio[name=category]').is(':checked');
			if (!isCheckCategory){
				alert("카테고리를 선택해주세요.");
				return false;
			}
			var title_RegEx = /[a-zA-Z0-9]{5,}$/;
			var title = $("#title").val();
			var contents = $("#contents").val();
			if (!write_RegEx.test(title)) {
				alert("제목은 5글자 이상 입력해주세요.");
				return false;
			}
			/* 
			 if (!write_RegEx.test(contents)) {
			 alert("내용은 5글자 이상 입력해주세요.");
			 return false;
			 }
			 */
		});

		$('#summernote').summernote({
			minHeight : 500, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			//  lang: "ko-KR",					// 한글 설정
			spellCheck : false,
			callbacks : { //이미지 첨부하는 부분
				onImageUpload : function(files) {
					uploadSummernoteImageFile(files[0], this);
				}
			}
		});

		function uploadSummernoteImageFile(file, editor) {
			data = new FormData();
			data.append("file", file);
			$
					.ajax({
						data : data,
						type : "POST",
						url : "/uploadSummernoteImageFile",
						contentType : false,
						processData : false,
						success : function(data) {
							//항상 업로드된 파일의 url이 있어야 한다.
							console.log(data)
							$(editor).summernote('insertImage',
									"/resources" + data.url);
						}
					});
		}
		;
	});
</script>
</head>
<body>
	<c:if test="${sessionScope.loginInfo.id ne 'administrator'}">
		<div class="mt-5 pt-5">
			<h2 class="text-center">접근권한이 없습니다.</h2>
		</div>
		<div class="mb-5 text-center">
			<a href="/">메인으로 돌아가기</a>
		</div>
	</c:if>
	<c:if test="${sessionScope.loginInfo.id eq 'administrator'}">
		<div class="container-fluid mx-0 px-0">
			<div class="row mx-0">

				<div class="col-2 mx-0 px-0"><jsp:include
						page="/WEB-INF/views/include/admin_sidebar.jsp" /></div>
				<div class="col-10 px-5">
					<div class="row">
						<div class="col-sm-12 mt-3 border-bottom border-dark">
							<h3 class="admin-h2">자주하는 질문(FAQ) 작성하기</h3>
						</div>
					</div>
					<div class="row">

						<div class="col-sm-12">
							<form id="form" action="/faq/writeProcInAdmin" method="post">
								<div class="row my-2">
									<div class="col-sm-2 text-center">카테고리</div>
									<div class="col-sm-10">
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="category"
												value="mem" id="category1"> <label
												class="form-check-label" for="category1">회원/정보관련</label>
										</div>

										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="category"
												value="how" id="category2"> <label
												class="form-check-label" for="category2">사이트이용관련</label>
										</div>
									

									</div>
								</div>
								<div class="row my-2">
									<div class="col-2 text-center">제목</div>
									<div class="col-8">
										<input type="text" class="form-control" name="title"
											id="title" >
									</div>
								</div>
								<div class="row my-2">
									<div class="col-2 text-center">내용</div>
									<div class="col-10">
										<div id="summernote"></div>
										<textarea id="contents" name="contents" style="display: none;"></textarea>
									</div>
								</div>
								<div class="row mb-5">
									<div class="col-2">
								<button type="button" id="toBackBtn" class="btn btn-light">목록으로</button>
							</div>
							<div class="col-10 text-center">
								<button type="submit" id="submit" class="btn btn-primary">작성하기</button>
							</div>
								</div>
							</form>
						</div>

					</div>
				</div>

			</div>


		</div>
	</c:if>

</body>
</html>