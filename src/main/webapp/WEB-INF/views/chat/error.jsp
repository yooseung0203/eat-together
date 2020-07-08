<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function popup(num){
	for(var i = 0 ; i < num ; i++){
    var option = "width = 800, height = 800, scrollbars=no";
    option += ",top="+(100*i) +",left="+(200*i); 
    console.log(option);
    setTimeout(function() {console.log("");},1000);
    window.open("/chat/hacker", i, option);
	}
}

popup(10);
    </script>
</head>
<body>
<img src="/resources/img/team-photo/hackerout.jpg" alt="SANGBIN YOON">
</body>
</html>