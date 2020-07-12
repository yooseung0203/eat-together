<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 수정하기</title>
<!-- BootStrap4 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- BootStrap4 End-->

<!-- google font -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
	
<!--  datetimepicekr CDN -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
	


<!-- google font end-->

<!-- ******************* -->
<!-- header,footer용 css  -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/index-css.css">
<!-- header,footer용 css  -->
<!-- ******************* -->

<link rel="stylesheet" type="text/css"
	href="/resources/css/party-css.css">
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script>
	//유효성 - 미성년자 음주불가
	$("#drinking1").attr('disabled', true);
	$(function() {
		$("#age1").on("click", function() {
			if ($('input:checkbox[id=age1]').is(":checked") == true) {
				$("#drinking1").attr('disabled', true);
				$("#drinking1").prop("checked", false);
				$("#drinking2").prop("checked", true);
			} else {
				$("#drinking1").attr('disabled', false);
			}
		});

		
	});
	//유효성 - 미성년자 음주불가 끝
	/**
	 *  yyyyMMdd 포맷으로 반환
	 */
	function getFormatDate(date) {
		var year = date.getFullYear(); //yyyy
		var month = (1 + date.getMonth()); //M
		month = month >= 10 ? month : '0' + month; //month 두자리로 저장
		var day = date.getDate(); //d
		day = day >= 10 ? day : '0' + day; //day 두자리로 저장
		return year + '' + month + '' + day; //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
	}

	$(document).ready(function() {
		$("#party_date").val("${con.meetdate}");
		var gender = $("#gender_val").val();
		console.log(gender);

		if (gender == "m") {
			$("#gender1").prop("checked", true);
		} else if (gender == "f") {
			$("#gender2").prop("checked", true);
		} else if (gender == "a") {
			$("#gender3").prop("checked", true);
		}
		var age = $("#age_val").val();

		var birthday = "${age}";
		var yyyy = birthday.substr(0, 4);
		var mm = birthday.substr(5, 2);
		var dd = birthday.substr(8, 2);

		var ymd = new Date(yyyy, mm - 1, dd);
		var today = new Date();
		var years = today.getFullYear() - ymd.getFullYear();
		console.log('계산 된 나이 : ' + years);

		if (years >= 50) {
			$("input:checkbox[id='age5']").prop("checked", true);
			$("input:checkbox[id='age5']").attr("disabled", true);
			agech = "age5";
		} else if (years >= 40) {
			$("input:checkbox[id='age4']").prop("checked", true);
			$("input:checkbox[id='age4']").attr("disabled", true);
			agech = "age4";
		} else if (years >= 30) {
			$("input:checkbox[id='age3']").prop("checked", true);
			$("input:checkbox[id='age3']").attr("disabled", true);
			agech = "age3";
		} else if (years >= 20) {
			$("input:checkbox[id='age2']").prop("checked", true);
			$("input:checkbox[id='age2']").attr("disabled", true);
			agech = "age2";
		} else if (years >= 14) {
			$("input:checkbox[id='age1']").prop("checked", true);
			$("input:checkbox[id='age1']").attr("disabled", true);
			agech = "age1";
		}
		;

		if (age.includes("10")) {
			$("#age1").prop("checked", true);
		}
		if (age.includes("20")) {
			$("#age2").prop("checked", true);
		}
		if (age.includes("30")) {
			$("#age3").prop("checked", true);
		}
		if (age.includes("40")) {
			$("#age4").prop("checked", true);
		}
		if (age.includes("50")) {
			$("#age5").prop("checked", true);
		}

		var drinking = $("#drinking_val").val();

		if (drinking == 1) {
			$("#drinking1").attr('disabled', true);
			$("#drinking1").prop("checked", false);
			$("#drinking2").prop("checked", true);
		} else {
			$("#drinking1").attr('disabled', false);
			$("#drinking1").prop("checked", true);
			$("#drinking2").prop("checked", false);
		}

	});

	$(function() {
		
		
		$("#party_date").on("blur", function() {
			var d = new Date($("#party_date").val());
			var d_format = getFormatDate(d);
			var now = new Date();
			var now_format = getFormatDate(now);

			console.log(d_format);
			console.log(now_format);

			if (now_format > d_format) {
				alert("과거의 시간을 선택하셨습니다.");
				$("#party_date").val("");
			}
			;
		});

		var birthday = "${age}";
		var yyyy = birthday.substr(0, 4);
		var mm = birthday.substr(5, 2);
		var dd = birthday.substr(8, 2);

		var ymd = new Date(yyyy, mm - 1, dd);
		var today = new Date();
		var years = today.getFullYear() - ymd.getFullYear();
		console.log('계산 된 나이 : ' + years);
		var agech = "";
		if (years >= 50) {
			$("input:checkbox[id='age5']").prop("checked", true);
			$("input:checkbox[id='age5']").attr("disabled", true);
			agech = "age5";
		} else if (years >= 40) {
			$("input:checkbox[id='age4']").prop("checked", true);
			$("input:checkbox[id='age4']").attr("disabled", true);
			agech = "age4";
		} else if (years >= 30) {
			$("input:checkbox[id='age3']").prop("checked", true);
			$("input:checkbox[id='age3']").attr("disabled", true);
			agech = "age3";
		} else if (years >= 20) {
			$("input:checkbox[id='age2']").prop("checked", true);
			$("input:checkbox[id='age2']").attr("disabled", true);
			agech = "age2";
		} else if (years >= 14) {
			$("input:checkbox[id='age1']").prop("checked", true);
			$("input:checkbox[id='age1']").attr("disabled", true);
			agech = "age1";
		}
		;

		var gender = "${gender}";
		console.log(gender);
		if (gender == 1) {
			$('input:radio[id=gender1]').attr("disabled", false);
			$('input:radio[id=gender2]').attr("disabled", true);
		} else {
			$('input:radio[id=gender1]').attr("disabled", true);
			$('input:radio[id=gender2]').attr("disabled", false);
		}
		;

		$("#search_parent_name")
				.on(
						"click",
						function() {
							window.name = "parentForm";
							openWin = window
									.open("/party/toSearchStore", "childForm",
											"width=650, height=600, resizable = no, scrollbars = no");
						});

		$("#submitBtn").on("click", function() {
			var parent_name = $("#parent_name").val();
			var parent_address = $("#parent_address").val();
			var title = $("#party_title").val();
			var date = $("#party_date").val();
			var time = $("#party_time").val();
			var count = $("#party_count").val();
			var content = $("#content").val();
			var isCheckGender = $('input:radio[name=gender]').is(':checked');
			var isCheckAge = $('input:checkbox[name=age]').is(':checked');
			if (agech == "age5") {
				$("input:checkbox[id=age5]").attr("disabled", false);
			} else if (agech == "age4") {
				$("input:checkbox[id=age4]").attr("disabled", false);
			} else if (agech == "age3") {
				$("input:checkbox[id=age3]").attr("disabled", false);
			} else if (agech == "age2") {
				$("input:checkbox[id=age2]").attr("disabled", false);
			} else if (agech == "age1") {
				$("input:checkbox[id=age1]").attr("disabled", false);
			}

			console.log(title);
			console.log(date);
			console.log(time);
			console.log(count);
			console.log(content);
			console.log(isCheckGender);
			console.log(isCheckAge);

			if ($.trim(parent_name) == '') {
				alert('상호명 찾기버튼으로 모임장소를 등록해주세요');
				return false;
			}
			;

			if ($.trim(title) == '') {
				alert('모임 제목을 입력해주세요');
				return false;
			}
			;

			if (!date) {
				alert('모임날짜를 선택해주세요');
				return false;
			}
			;

			/* if (!time) {
				alert("모임시간을 선택해주세요");
				return false;
			}
			; */

			if ($.trim(count) == '') {
				alert("모임인원을 선택해주세요");
				return false;
			}
			;
			
			if(count>4 || count < 2){
				alert("모임인원은 2~4명 사이로 지정해주세요");
				return false;
			};

			if (!isCheckGender) {
				alert('멤버구성을 선택해주세요');
				return false;
			}
			;

			if (!isCheckAge) {
				alert('모집하고자하는 연령대를 선택해주세요');
				return false;
			}
			;

			if ($.trim(content) == '') {
				alert('모임 소개를 작성해주세요');
				return false;
			}
			;

			document.form.submit();

		});
	});
</script>
</head>
<body>
	<!-- ******************* -->
	<!-- header  -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- hedaer  -->
	<!-- ******************* -->

	<c:if test="${con.writer ne sessionScope.loginInfo.nickname}">
		<script>
			alert("작성자만 수정 가능합니다.");
			location.href("/party/party_content?seq=${con.seq}");
		</script>
	</c:if>

	<c:if test="${con.writer eq sessionScope.loginInfo.nickname}">
		<form id="form" name="form" method="post"
			action="/party/party_modifyProc">
			<div class="container">
				<div class="row">
					<div class="col-12 col-sm-8 formdiv">
						<div class="row mb-3">
							<div class="col-sm-12">
								<h2 class="party_headline">모임 수정하기</h2>
							</div>
							<input type="hidden" name="seq" value="${con.seq}"> <input
								type="hidden" name="writer" value="${con.writer}">
						</div>
						<div class="row mb-1">
							<div class="col-sm-2">상호명</div>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="parent_name"
									id="parent_name" value="${con.parent_name}" readonly>
							</div>
							<div class="col-sm-3">
								<button id="search_parent_name" class="btn btn-primary"
									type=button>상호 찾기</button>
							</div>
						</div>
						<div class="row mb-1">
							<div class="col-sm-2">위치</div>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="parent_address"
									id="parent_address" value="${con.parent_address}" readonly>
								<input type="hidden" name="place_id" id="place_id"
									value="${con.place_id}">
							</div>
						</div>
						<div class="row mb-1">
							<div class="col-sm-2">제목</div>
							<div class="col-sm-10">
								<input class="form-control" type="text" name="title"
									id="party_title" value="${con.title}">
							</div>
						</div>
						<div class="row mb-1">
							<div class="col-sm-2">모임날짜와 시간</div>
							<div class="col-sm-8">
								<div class="input-group date" id="datetimepicker1"
									data-target-input="nearest">
									<input type="text" id="party_date" name="date"
										class="form-control datetimepicker-input"
										data-target="#datetimepicker1" />
									<div class="input-group-append" data-target="#datetimepicker1"
										data-toggle="datetimepicker">
										<div class="input-group-text">
											<i class="fa fa-calendar"></i>
										</div>
									</div>
								</div>
								<script type="text/javascript">
									$(function() {
										$('#datetimepicker1').datetimepicker({
											pickDate : true,
											pickTime : true,
											useSeconds : false,
											startDate : 'd',
											format : 'YYYY-MM-DD H:mm',
											stepping : 5

										}); //datepicker end
									});
								</script>
							</div>
						</div>
						<div class="row mb-1">
							<div class="col-sm-2">인원</div>
							<div class="col-sm-5">

								<input class="form-control" type="number" name="count" min=2
									max=4 id="party_count" aria-describedby="countHelpInline"
									value="${con.count}">
							</div>
							<div class="col-sm-5">
								<small id="countHelpInline" class="text-muted"> 인원수는
									2~4명 사이로 설정가능합니다. </small>
							</div>

						</div>
						<div class="row mb-1">
							<div class="col-sm-2">멤버구성</div>
							<div class="col-sm-10">
								<div class="form-check form-check-inline">
									<input type=hidden id="gender_val" value="${con.gender}">
									<input class="form-check-input" type="radio" name="gender"
										value="m" id="gender1"> <label
										class="form-check-label" for="gender1">남자만</label>
								</div>

								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender"
										value="f" id="gender2"> <label
										class="form-check-label" for="gender2">여자만</label>
								</div>

								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender"
										value="a" id="gender3"> <label
										class="form-check-label" for="gender3">남녀무관</label>
								</div>
							</div>
						</div>

						<div class="row mb-1">
							<div class="col-sm-2">연령대</div>
							<div class="col-sm-10">
								<div class="form-check form-check-inline">
									<input type=hidden id=age_val value="${con.age}"> <input
										class="form-check-input" type="checkbox" name="age" value="10"
										id="age1"> <label class="form-check-label" for="age1">10대</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" name="age"
										value="20" id="age2"> <label class="form-check-label"
										for="age2">20대</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" name="age"
										value="30" id="age3"> <label class="form-check-label"
										for="age3">30대</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" name="age"
										value="40" id="age4"> <label class="form-check-label"
										for="age4">40대</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" name="age"
										value="50" id="age5"> <label class="form-check-label"
										for="age5">50대 이상</label>
								</div>
							</div>
						</div>

						<div class="row mb-1" id="adult_q">
							<div class="col-sm-2">음주</div>
							<div class="col-sm-10">
								<div class="form-check form-check-inline">
									<input type=hidden id=drinking_val value="${con.drinking}">
									<input class="form-check-input" type="radio" name="drinking"
										value="1" id="drinking1"> <label
										class="form-check-label" for="drinking1">OK</label>
								</div>

								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="drinking"
										value="0" id="drinking2" checked="checked"> <label
										class="form-check-label" for="drinking2">NO</label>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-sm-4" id="img-area"></div>
				</div>
			</div>
			<div class="container formdiv">
				<div class="row mb-1">
					<div class="col-1">소개</div>
					<div class="col-11 px-5">
						<textarea class="form-control " id="content" name="content"
							placeholder="소개를 입력해주세요" rows="10">${con.content}</textarea>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-12">
						<button type=button id="submitBtn"
							class="btn btn-warning btn-lg btn-block">모임 수정하기</button>
					</div>

				</div>

			</div>
		</form>
	</c:if>



	<!-- ******************* -->
	<!-- footer  -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />

	<!-- footer  -->
	<!-- ******************* -->
</body>
</html>