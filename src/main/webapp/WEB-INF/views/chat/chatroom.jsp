<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/chatroom.css">

<script>
	$(function() {
		var scrolled = false;
		var viewed;
		$(".input-area").empty();
		var ws = new WebSocket("ws://192.168.0.8/chat/chatroom")
		ws.onmessage = function(e) {
			var some = e.data.split(":");
			var str = some[1];
			for (var i = 2; i < some.length; i++) {
				str += ":"+some[i];
			}
			if (some[0] == $(".message-area>div:last").attr("class")) {
				$(".message-area>div:last").append("<br><div>" + str);
			} else {
				var line = $("<div>");
				line.attr("class", some[0]);
				line.append(some[0]);
				line.append("<br><div>" +str)
				if (some[0] == "hereasd") {
					viewed = $('.message-area')[0].scrollHeight;
				}
				$(".message-area").append(line);
			}
			if (scrolled) {
				$('.message-area')
						.scrollTop($('.message-area')[0].scrollHeight);
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
								$(".hereasd").remove();

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
	})
</script>

</head>
<body>
	<div class="chat-box">
		<div class="head-area">
			<br>
			<b>CHATROOM#</b>
		</div>
		<div class="message-area"></div>
		<div class="input-area" contenteditable="true" placeholder="Type a message"></div>
	</div>
</body>
</html>