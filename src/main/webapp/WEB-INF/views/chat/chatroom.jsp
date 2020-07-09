<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/resources/css/chatroom.css?after">
<script>
	$(function() {
		var scrolled = false;
		var userenter = true;
		var viewed = 0;
		$(".input-area").empty();
		var ws = new WebSocket("ws://192.168.60.19/chat/chatroom")
		
		ws.onmessage = function(e) {
			var some = e.data.split(":");
			if (some[0] == "z8qTA0JCIruhIhmCAQyHRBpIqUKjS3VBT2oJndv61od6") {
				var line = $("<div>");
				line.attr("class", "enterdMsg");
				line.append(some[1] + " 님이 입장하셨습니다");
				$(".message-area").append(line);

				var child = $(".user_list").children("#" + some[1]).attr("id");
				if (child == null) {
					var useradd = $("<div>");
					useradd.attr("id", some[1]);
					useradd.attr("class", "exist");
					useradd.append("<b>" + some[1]);
					useradd
							.append("<div class=kick>강퇴</div><div class=post>쪽지</div>");

					$(".user_list").append(useradd);
				} else {
					$(".user_list").children("#" + some[1]).attr("class",
							"exist");
				}
				if(userenter){
					userenter = false;
					$('.message-area').scrollTop(viewed);
				}
			} else if (some[0] == "qCPxXT9PAati6uDl2lecy4Ufjbnf6ExYsrN7iZA6dA4e4X") {
				$(".user_list").children("#" + some[1])
						.attr("class", "noexist");
			} 
			else if(some[0] == "elgnNST1qytCBnpR3DYlHqMIBxbMA0Kl7ld6B10nvOr2jMhDAfMwo0"){
				viewed = $('.message-area')[0].scrollHeight;
				var line = $("<div>");
				line.attr("class", "viewed");
				line.append(some[1])
				$(".message-area").append(line);
			}
			else {
				var str = some[1];
				for (var i = 2; i < some.length; i++) {
					str += ":" + some[i];
				}
				if (some[0] == $(".message-area>div:last").attr("class")) {
					$(".message-area>div:last").append("<br><div>" + str);
				} else {
					var line = $("<div>");
					line.attr("class", some[0]);
					line.append(some[0]);
					line.append("<br><div>" + str)
					$(".message-area").append(line);
				}
				if (scrolled) {
						$('.message-area').scrollTop(
								$('.message-area')[0].scrollHeight);
				}
			}
		}

		$("#aaa").on("click", function() {
			$('.message-area').scrollTop(viewed);
		})
		$(".message-area")
				.on(
						"mousewheel",
						function(e) {
							var wheel = e.originalEvent.wheelDelta;
							if (wheel > 0) {
								scrolled = false;
							}
							if ($('.message-area')[0].scrollHeight - 50 <= ($(
									'.message-area').scrollTop() + $('.chat-box')[0].scrollHeight)) {
								$(".viewed").remove();
								scrolled = true;
							}
							console.log(scrolled);
						});

		$(".input-area").keydown(function(key) {
			if (key.keyCode == 13) {
				var text = $(".input-area").text();
				if (text.trim() != "") {
					scrolled = true;
					ws.send(text.trim());
				}
				$(".input-area").empty();
				return false;
			}
		})
		$("#exit")
				.on(
						"click",
						function() {
							var realExit = confirm("퇴장하시겠습니까?\n진행중인 대화방은 삭제되며 참가중인 모임에서도 퇴장하게 됩니다");
							if (realExit) {
								location.href = "/chat/exit?roomNum=" + $
								{
									roomNum
								}
								;
							}
						})
		$(".kick").on("click", function() {
			var kickedMember = $(this).parent().attr("id");

		})
	})
</script>

</head>
<body>
	<div class="chat-box">
		<div class="head-area">
			<br> <b>CHATROOM#${roomNum }</b>
		</div>
		<div class="message-area"></div>
		<div class="input-area" contenteditable="true"
			placeholder="Type a message"></div>
	</div>
	<div class="user_list">
		<b>채팅 그룹</b>
		<c:if test="${!empty memberList }">
			<c:forEach var="item" items="${memberList }">
					<div id="${item.participant}" class="${item.exist}">
				<b>${item.participant}</b>
				<div class="kick">강퇴</div>
				<div class="post">쪽지</div>
	</div>
	</c:forEach>
	</c:if>
	<div id="exit">나가기</div>
	</div>
</body>
</html>