<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="/resources/css/admin.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.2/Chart.js"></script>      
        <title>Admin-main</title>
</head>
<script>
	
</script>
<body>
	<div class="container-fluid mx-0 px-0 admin_text">
		<div class="row mx-0">
			<div class="col-2 mx-0 px-0">
				<jsp:include page="/WEB-INF/views/include/admin_sidebar.jsp" />
			</div>
			<div class="col-10 px-5">
				<div class="row">
					<div class="col-12 col-sm-12 mt-3">
						<div class="container">
							<div class="row">
								<div class="col-sm-6">
								
									<div class="card">
										<div class="card-body">접수 대기 중 신고 : ${reportCount }</div>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="card">
										<div class="card-body">답변 대기 중 문의 : ${questionCount }</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-12 mt-3">
						 <canvas id="ageChart">
						 </canvas>
					</div>
				</div>
				<div class="row">
					<div class="col-12  col-sm-12">
					
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		// 연령대 별 회원 수 
		var ctx1 = document.getElementById("ageChart");
		
		var ageChart = new Chart(ctx1, {
	    	type: 'doughnut',
	    	data: {
	    		labels: ['10대','20대','30대','40대','50대 이상',],
	    		datasets:[{
	    			data:[
	    				${age[10]}, ${age[20]}, ${age[30]}, ${age[40]},${age[50]}
	    			],
	    			backgroundColor : [

						'rgba(255, 99, 132, 0.2)',

						'rgba(54, 162, 235, 0.2)',

						'rgba(255, 206, 86, 0.2)',

						'rgba(75, 192, 192, 0.2)',

						'rgba(153, 102, 255, 0.2)'

					],

					borderColor : [

						'rgba(255,99,132,1)',

						'rgba(54, 162, 235, 1)',

						'rgba(255, 206, 86, 1)',

						'rgba(75, 192, 192, 1)',

						'rgba(153, 102, 255, 1)'

					]
				}]
	    	},
	    	options: {
	    		title:{
	    			display:true,
	    			text:"연령대별 회원 수"
	    		}
	    	}
		});
	</script>
</body>
</html>