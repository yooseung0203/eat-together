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

<!-- google font end-->

<!-- ******************* -->
<!-- header,footer용 css  -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/index-css.css">
<!-- header,footer용 css  -->
<!-- ******************* -->
<!-- mypage용 css  -->
<link rel="stylesheet" type="text/css" href="/resources/css/mypage.css">
<!-- ******************* -->
<!-- menubar용 css  -->
<link rel="stylesheet" type="text/css" href="/resources/css/menubar.css">
<!-- ******************* -->
<meta charset="UTF-8">
<title>내 모임</title>

</head>
<body>
	<!-- ******************* -->
	<!-- header  -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- hedaer  -->
	<!-- ******************* -->


	<div id=mypage-container>
		<jsp:include page="/WEB-INF/views/include/menubar.jsp" />
		<div id=contents>
			<table class="table" id="mypage_table">
				<thead class="thead-dark">
					<tr>
						<th scope="col" colspan=12>My Party</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">No.</th>
						<td class="myinfo_text">모임위치</td>
						<td class="myinfo_text">모임제목</td>
						<td class="myinfo_text"></td>
						<td class="myinfo_text">모임날짜</td>
					</tr>
					<c:choose>
						<c:when test="${empty partyList}">
							<tr>
								<td colspan=12 class="myinfo_text">진행중인 모임이 없습니다. 모임을
									시작해보세요!</td>
							</tr>
							<tr>
								<td class="myinfo_text"><button type="button"
										class="btn btn-warning" text-center
										onclick="location.href='/party/toParty_New'">모임 만들기</button></td>
							</tr>
						</c:when>
						<c:when test="${!empty partyList}">
							<c:forEach var="i" items="${partyList}">
								<tr>
									<th scope="row">${i.seq}</th>
									<td class="myinfo_text" align=left>${i.parent_name}<c:if
											test="${loginInfo.nickname eq i.writer}">
											<span class="badge badge-success">방장</span>
										</c:if> <c:if test="${loginInfo.nickname ne i.writer }">
										</c:if></td>
										<td class="myinfo_text" align=left>${i.title}</td>

									<td class="myinfo_text" align=right>
										<button type=button class="btn btn-light" id="toPartyContents"
											onclick="location.href='/party/party_content?seq=${i.seq}'">모임글
											보기</button>
										<button type=button class="btn btn-warning" id="toChatroom"
											onClick=" window.open('/chat/chatroom?roomNum='+ ${i.seq}, ${i.seq}, 'width = 800, height = 800, top = 100, left = 200, scrollbars=no')">채팅방
											들어가기</button>
										<button type=button class="btn btn-secondary"
											id="exitChatRoom">채팅방 나가기</button>
									</td>
									<td class="myinfo_text">${i.sDate}</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan=12 class="myinfo_text">
									<nav id="pagenavi">
										<ul class="pagination justify-content-center" id="navibtn">
											${navi}
										</ul>
									</nav>
								</td>
							</tr>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
	<script type="text/javascript">
$(document).on("click","#exitChatRoom", function() {
	var con = confirm("정말로 모임을 나가시겠습니까?");
		
if(con){
	var seq = $(this).closest("tr").children("th").text();
			$.ajax({
			type:"POST",
			url:"/chat/exit",
			data:{
				"roomNum" : seq},
			success:function(){
				$(this).closest("tr").remove();
				location.reload();
			},error:function(){
				console.log("실패");						
			}
				
		})
}
	
})
</script>
	<!-- ******************* -->
	<!-- footer  -->
	<div id=footer-container>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
	<!-- footer  -->
	<!-- ******************* -->
</body>
</html>