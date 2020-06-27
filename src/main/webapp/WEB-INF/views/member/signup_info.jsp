<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<!-- header,footer용 css  -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/index-css.css">
<!-- header,footer용 css  -->

<!-- signup_check css -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/signup-info.css">
<!-- signup_check css -->

<title>회원가입</title>
</head>
<script>
$(function() {
	$("#dublCheck").on("click", function() {
		$.ajax({
			url : "dublCheck.ajax",
			dataType : "json",
			type : "post",
			data : {
				id : $("#id").val()
			}
		}).done(function(resp) {
			console.log(resp);
			var result = resp.result;
			console.log(result);

			if (result) {
				$("#dublResult").html("사용가능한 id입니다.");
				$("#dublResult").css("color", "blue");
			} else {
				$("#dublResult").html("사용불가능한 id입니다.");
				$("#dublResult").css("color", "red");
			}
		}).fail(function(error1, error2) {
			console.log(error1);
			console.log(error2);
		})
	})

	$("#pwCorrection").on("keyup", function() {
		var pw1 = $("#pw").val();
		var pw2 = $("#pwCorrection").val();
		if (pw1 != pw2) {
			$("#result").html("비밀번호가 일치하지 않습니다.");
			$("#result").css("color", "red");
		} else {
			$("#result").html("비밀번호가 일치합니다.");
			$("#result").css("color", "blue");
		}
	})
</script>

<body>
	<!-- ******************* -->
	<!-- header  -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- hedaer  -->
	<!-- ******************* -->

	<form action="/" method="post">
		<div class="article container">
			<div class="signup_text">
				<label for="id" class="signup_text">아이디</label> <input type="text"
					class="form-control" id="id" name="id" placeholder="영문+숫자 4~10글자">
				<button type=button id=dublCheck>중복확인</button>
				<div id=dublResult>중복확인</div>
			</div>
			<div class="signup_text">
				<label for="pw" class="signup_text">비밀번호</label> <input
					type="password" class="form-control" id="pw1"
					placeholder="특수문자+숫자+영문 6~12글자">
			</div>
			<div class="signup_text">
				<label for="pw" class="signup_text">비밀번호 확인</label>
				<input type="password" class="form-control" id="pwCorrection">
				<div id="result"></div>
			</div>

			<div class="signup_text">
				<label for="nickname" class="signup_text">닉네임</label> <input type="text"
				class="form-control" id="nickname" name="nickname" placeholder="한글 2~6자">
			</div>


			<div class=column>이름ㆍ</div>
			<div>
				<input type=text id=name name=name class=input placeholder="ex)홍길동">
			</div>
			<div class=column>이메일ㆍ</div>
			<div>
				<input type=text id=email name=email
					placeholder="ex)asdf1234@naver.com"> <input type=button
					id=mail value="인증번호 받기"><br>
				<div id=mail_div style="display: none;">
					인증번호 : <input type=text id=mail_text>
					<button type=button id=mail_accept>인증</button>
				</div>
			</div>
			<div class=column>주소(선택)</div>
			<div>
				<input type=text readonly name=zipcode id=zipcode>
				<button type="button" id=add_api>우편번호검색</button>
			</div>
			<div>
				<input type=text readonly id=address1 name=address1 class="add">
				<input type=text id=address2 class="add" name=address2>
			</div>
			<div class=column>휴대폰ㆍ</div>
			<div>
				<input type="tel" id=phone name="phone" placeholder="ex)01000000000">
			</div>

			<div class=column>생년월일</div>
			<div>
				<input type=text id=birthday name=birthday class=birthday
					placeholder="ex)19970213">
			</div>
			<div class=column>사용 언어(다중 선택)</div>
			<div id=language_div>
				<input type=checkbox name=language value="Java">Java <input
					type=checkbox name=language value="C/C++">C/C++ <input
					type=checkbox name=language value="Python">Python <input
					type=checkbox name=language value="C#">C#<br> <input
					type=checkbox id=more_language>기타<input type=text
					name="language" readonly class=language_box> <input
					type=button class=add_language value="+">
			</div>
			<div align=center>
				<input type=submit id=btn value="회원가입"><input type=reset
					value="다시 작성" style="margin-left: 5px;">
			</div>
		</div>
	</form>

	<script>
            $("#more_language").on("click",function(){
            	if($("#more_language").is(":checked")){
                $(".language_box").removeAttr("readonly");
            	}else{
            		$(".language_box").val("");	
            		$(".language_box").attr("readonly",true);
            		$(".language_plus").parent().remove();
            	}
            })
            
            
            $("#add_api").on("click",function(){
             new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; // 도로명 주소 변수

                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address1").value = roadAddr;
            }
        }).open();	 
            })
            
            $("#id").focusout(function(){
                var id = $("#id").val();
                var idregex = /^[a-z][a-zA-Z0-9]{4,10}$/;
                if($("#id").val() != ""){
                if(!idregex.test(id)){
                alert("아이디 조건을 확인하세요.");
                $("#id").val("");
            }
           }
            })
            
            $("#id").keydown(function(){
            	if($("#id_text").html() != ""){
            		$("#id_text").html("");
            	}
            })
            
            $("#pw1").focusout(function(){
                var pw = $("#pw1").val();
                var pwregex = /^[a-zA-Z][a-zA-z0-9]{5,11}$/;
                if($("#pw1").val() != ""){
                    if(!pwregex.test(pw)){
                        alert("비밀번호 조건을 확인하세요.");
                        $("#pw1").val("");
                    }
                }
            })
            
            $("#pw2").focusin(function(){
            	if($("#pw1").val() == ""){
            		alert("비밀번호를 먼저 입력해주세요.");
            		$("#pw1").focus();
            	}else{
            		$("#pw2").focusout(function(){
            			if($("#pw2").val() != ""){
            			if($("#pw1").val() != $("#pw2").val()){
            				$("#pw2").val("");
            				alert("비밀번호가 일치하지 않습니다.");
            				$("#pw2").focus();
            			}else{
            				$("#pw_text").css("display","block");
            				$("#pw_text").css("color","blue");
            				$("#pw_text").html("비밀번호가 일치합니다.");
            			}
            		}
            		})
            	}
            })
            
            $("#name").focusin(function(){
            	if($("#hintA").val() == ""){
            		alert("비밀번호 답변을 입력해주세요.");
            		$("#hintA").focus();
            	}
            })
            
            $("#name").focusout(function(){
            	var name = $("#name").val();
            	var nameregex = /^[가-힣]{2,5}$/;
            	if($("#name").val() != ""){
            	 	if(!nameregex.test(name)){
            	 		$("#name").val("");
            	 		alert("한글 2~5글자를 입력하세요.");
            	 		$("#name").focus();
            	 	}
            	}
            })
            
            $("#email").focusout(function(){
            	if($("#email").val() != ""){
            		var email = $("#email").val();
            		 var emailregex = /[a-zA-Z0-9]*@[a-zA-Z0-9]*[.]{1}[a-zA-Z]{2,3}|([.]{1}[a-zA-Z]{2,3})$/;
            		 if(!emailregex.test(email)){
            			 $("#email").val("");
            			 alert("유효한 이메일을 입력해주세요.");
            			 $("#email").focus();
            		 }
            	}
            })
            
            $("#phone").focusout(function(){
            var phone = $("#phone").val();
           	var regex1 = /010[0-9]{8}$/;
           	if($("#phone").val() != ""){
            	if(regex1.test(phone)){
            		phone = phone.replace(/([0-9]{3})([0-9]{3,4})([0-9]{4})/,"$1-$2-$3");
            		$("#phone").val(phone);
            	}else{$("#phone").val("");
            		alert("유효한 휴대폰 번호를 입력해주세요.");
            	 $("#phone").focus();}
           	}
            })
            
            $("#birthday").focusout(function(){
            	var birthday = $("#birthday").val();
               	var regex1 = /19[0-9]{6}$/;
               	if($("#birthday").val() != ""){
                	if(regex1.test(birthday)){
                		birthday = birthday.replace(/(19[0-9]{2})([0-9]{2})([0-9]{2})/,"$1-$2-$3");
                		$("#birthday").val(birthday);
                	}else{$("#birthday").val("");
                		alert("올바른 생년월일을 입력해주세요.");
                	 $("#birthday").focus();}
               	}
            })
           
            $("#duplcheck").on("click",function(){
            	var loginpath =$("#ajax_loginpath").attr('data-path');
            	if($("#id").val() != ""){
                $.ajax({
                    url:"../duplcheck.mem",
           			dataType:"json",
           			type:"post",
           			data:{id:$("#id").val()}
           		}).done(function(resp){
           			$("#id_text").css("display","block");
           			$("#id_text").css("color","blue");
           			$("#id_text").html(resp.check);
           		}).fail(function(error){
           			console.log(error);
           			$("#id_text").css("display","block");
           			$("#id_text").css("color","red");
           			$("#id_text").html("사용 불가능한 아이디입니다.");
           			$("#id").val("");
           		})
            	}else{alert("아이디를 입력해주세요.");}
            })
            

       	$(document).on("click",".add_language",function(){
       		$("#language_div").append(
				"<div><input type=text name='language' class='language_box' style='margin-left: 45px;'>"
				+"<input type=button class='add_language language_plus' value='+'><input type=button class=del_language value='-' style='margin-left: 2px;'><div>");
       	})
       	
       	$(document).on("click",".del_language",function(){
       		$(this).parent().remove();
       	})
       	
       	$("#mail").on("click",function(){
       	 if ($("#email").val() == "") {
             alert("이메일을 입력해주십시오.");
             $("#email").focus();
          } else {            
             $.ajax({
                url : "../mail.mem",
                dataType : "json",
                data : {
                   email : $("#email").val()
                }
             }).done(function(resp) {
                if (resp.check) {
                   alert("인증번호가 발송되었습니다.");
                  	$("#mail_div").css("display","block");
                  	$("#mail_accept").on("click",function(){
                  		if($("#mail_text").val() == resp.number){
                  			$("#mail_text").attr("readonly",true);
                  			$("#mail_text").css("color","blue");
                  			$("#mail_text").val("인증에 성공하였습니다.");
                  		}else{
                  			alert("인증번호를 확인해주세요.");
                  			$("#mail_text").val("");
                  			$("#mail_text").focus();
                  		}
                  	})
                  	
                } else {
                   alert("이미 가입된 계정입니다.");
                   $("#email").val("");
                   $("#email").focus();
                }
             })
          }

       	})
       	
             $("#btn").on("click",function(){
            	if($("#id_text").html() == "사용 가능한 아이디입니다."){
            		if($("#pw_text").html() == "비밀번호가 일치합니다."){
            			if($("#name").val() != ""){
            				if($("#mail_mail").val() != ""){
            					if($("#phone").val() != ""){
            						if($("#birthday").val() != ""){
            							if($('input[name=language]').val() != null){

            								return true;
            								
            							}else{alert("사용가능 언어를 체크해주세요.");}
            						}else{alert("생년월일을 입력해주세요.")}
            					}else{alert("휴대폰 번호를 입력해주세요.")}
            				}else{alert("이메일 인증을 해주세요.");}
            			}else{alert("이름을 입력해주세요.");}
            		}else{alert("비밀번호를 확인해주세요.");}
            	}else{alert("아이디 중복체크를 진행해주세요."); $("#id").focus();}
            	return false;
            }) 

        </script>

	<!-- ******************* -->
	<!-- footer  -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- footer  -->
	<!-- ******************* -->

</body>
</html>