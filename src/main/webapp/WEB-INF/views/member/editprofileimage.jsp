<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- BootStrap4 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- BootStrap4 End-->

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

<!-- editprofileimage css  -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/editprofileimage.css">
<!-- ******************* -->
<meta charset="UTF-8">
<title>프로필 이미지 수정</title>
</head>
<body>
	<form id="editProfileImageProc" action="editProfileImageProc">
		<input type=file name=file>
		<button type="button" id="editProfileBtn"class="btn btn-warning">프로필이미지 변경하기</button>
		<button type=button class="btn btn-light" id="back"
			onClick="window.close()">되돌아가기</button>
	</form>

	<script>
		$("#editProfileBtn").on("click", function() {
			alert("프로필 이미지가 변경되었습니다.");
			document.getElementById('editProfileImageProc').submit();
			window.open("about:blank", "_self").close();
		})
	</script>

</body>
</html>