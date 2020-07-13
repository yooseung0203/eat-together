/******************* 상세 보기 ************************/
$(function(){
	$(".myBtn").on("click", function() {
		if ("${loginInfo.id}" == "") {
			alert("로그인 후 이용해주세요");
			location.replace('/member/loginview');
		} else {
			var select_seq = $(this).parent().siblings().children(".party_seq").val();
			$("#aaa").empty();
			$.ajax({
				url:"/party/party_content_include",
				data : {
					seq : select_seq
				}
			}).done(function(con) {
				console.log(con);
				$("#aaa").append(con);
				$("#mymodal").modal();
			});
		}
	});
});
/******************* 상세 보기 ************************/