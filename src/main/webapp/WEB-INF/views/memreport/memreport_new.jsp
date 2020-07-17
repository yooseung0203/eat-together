<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- BootStrap4 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- BootStrap4 End-->
<title>Report</title>
<script type="text/javascript">
$(function() {
	$("#idcheck").on("click", function() {
		var nickname = $("#report_id").val();
		console.log(nickname);
		if(nickname == ""){
			alert("닉네임을 입력해 주세요.");
		}
		else if(nickname == "${nick }"){
			alert("본인은 신고할 수 없습니다.");
			$("#report_id").val("");
		}
		else{
			$.ajax({
				url : '../memreport/duplCheck?nickname=' + nickname,
				dataType : 'json',
				success : function(resp) {
					console.log(resp);
					if (resp == 0) {
						alert(nickname + "님을 신고합니다.");
						$("#report_id").val(nickname);
						$("#report_id").attr("readonly",true);
						$("#report_id").css("background-color","DarkGray");
						$("#idcheck").val("확인됨");
					} else if(resp == 1){
						alert("무분별한 신고를 막기 위해 한 회원 당 한번만 가능합니다.\n다시 한번 확인해주세요.");
						$("#report_id").val("");
					}else if(resp == 3){ 
						alert("관리자는 신고할 수 없습니다..\n다시 한번 확인해주세요.");
						$("#report_id").val("");
					}else{
						alert("존재하지 않는 회원입니다.\n다시 한번 확인해주세요.");
						$("#report_id").val("");
						//$("#idcheck").val("확인");
					}
				}
			})
		}
	});
});

</script>
<style>
	div {
		border: 1px solid black;
	}
</style>
</head>
<body>
<form id="report" action="/memreport/memReport">
	<div>신고 페이지</div>
	<div >
		신고자 닉네임 : ${nick }
		<input type="hidden" name="id" value="${nick }">
	</div>
	<div>
		신고 닉네임 : 
		<input type="text" name="report_id" id="report_id">
		<input type="button" id="idcheck" value="확인">
	</div>
	<div>
		제목 :
		<input type="text" name="title" id="title">
	</div>
	<div>
		신고 사유 :
	</div>
	<div>
		<textarea name="content" placeholder="신고 사유를 최대한 자세히 작성해 주세요."></textarea>
	</div>
	<div>파일 첨부</div>
	<div>
		<input type="submit" value="신고하기">
		<button type="button">돌아가기</button>
	</div>
</form>
</body>
</html>