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
		var nickname = $("#report_nick").val();
		console.log(nickname);
		if(nickname == ""){
			alert("닉네임을 입력해 주세요.");
		}
		else if(nickname == "${nick }"){
			alert("본인은 신고할 수 없습니다.");
			$("#report_nick").val("");
		}
		else{
			$.ajax({
				url : '../member/isNickAvailable?nickname=' + nickname,
				dataType : 'json',
				success : function(resp) {
					console.log(resp);
					if (resp==false) {
						alert(nickname + "님을 신고합니다.");
						$("#report_nick").val(nickname);
						$("#report_nick").attr("readonly",true);
						$("#report_nick").css("background-color","DarkGray");
						$("#idcheck").val("확인됨");
					} else {
						alert("존재하지 않는 회원입니다.\n다시 한번 확인해주세요.");
						$("#report_nick").val("");
						//$("#idcheck").val("확인");
					}
				}
			})
		}
	});
});
</script>
</head>
<body>
	<div>신고 페이지</div>
	<div>
		신고자 닉네임 : ${nick }
	</div>
	<div>
		신고 닉네임 : 
		<input type="text" name="report_nick" id="report_nick">
		<input type="button" id="idcheck" value="확인">
	</div>
	<div>
		신고 사유 : 
		<textarea placeholder="신고 사유를 최대한 자세히 작성해 주세요.">
			
		</textarea>
		<div>
			
		</div>
	</div>
	<div>
		<button>신고하기</button>
		<button type="button">돌아가기</button>
	</div>
</body>
</html>