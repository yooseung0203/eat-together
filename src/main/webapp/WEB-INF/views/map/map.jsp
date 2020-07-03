<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>지도 생성하기</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e156322dd35cfd9dc276f1365621ae9a&libraries=services"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.1/css/all.css" integrity="sha384-xxzQGERXS00kBmZW/6qxqJPyxW3UR0BPsL4c8ILaIWXva5kFi7TxkIIaMiKtqV1Q" crossorigin="anonymous">
<!-- header,footer용 css  -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/index-css.css">
	        <!-- google font -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<style>
	body{overflow-y:hidden;margin:0px;}
	#header{
		position:relative;
		height:5vh;
	}
	.container-fluid.all{
		width: 100vw;
        height: 100vh;
        padding:0px;
	}
	#sideBar{
	    float: left;
	    position: relative;
	    z-index: 25;
	    width: 300px;
	    height: 95vh;
	    background-color: #fcfcfc;
	}
	#map{
		z-index: 10;
		position:fixed;
		left:0px;
		float:right;
		width: 100%; 
		height: 100vh;
	}
	.search_area{background-color:#ff9900;height: 80px;padding-top:15px;padding-bottom:15px;}
	.searchbar{
		align:center;
		width: 90%;
	    height: 50px;
	    background-color: white;
	    border-radius: 5px;
	    padding: 10px;
    }
    .side{overflow-x: hidden;overflow-y:auto;}
    .search_count{padding: 20px;}
    .search_result .cafe_info{
    	align:center;
	    border-top:1px solid #ededed;
	    padding: 20px;
	    margin-top:10px;
	    font-size:10pt;
	}
    .search_result .food_info{
    	align:center;
	    border-top:1px solid #ededed;
	    padding: 20px;
	    margin-top:10px;
	    font-size:10pt;
	}
    .search_input{
	    color: black;
	    border: 0;
	    outline: 0;
	    background: none;
	    width: 200px;
	    line-height: 25px;
    }
    .search_icon{
	    height: 30px;
	    width: 40px;
	    float: right;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    color:#ffd900;
	    text-decoration:none;
	    border:0px;
	    background-color:white;
    }
    .search_icon:hover{
    	color:#ff9900;
    }
    .store_info{
		align:center;
	    border-top:1px solid #ededed;
	    padding: 20px;
	    font-size:10pt;
    }
    .store_info i{
    	color:#ffd900;
    }
    .partylist{
    	align:center;
	    border-top:1px solid #ededed;
	    padding: 20px;
	    margin-top:10px;
    }
    .partylist .party{
    	padding:5px;
    	background-color:white;
    	height:50px;
    	margin-top:0px;
	    position:relative;
	    font-size:10pt;
    }
    nav{margin-top:10px;}
    .page-item{margin-left:2px;margin-right:2px;}
    .page-link{
    	line-height:1 !important;
    	border-radius:20px !important;
    	border:0px;
    	color:#ff9900;
    }
    .page-item:hover .page-link{color:black;}
    .partylist .title{
    	float:left;
    	width:150px;
    }
    .partylist .join{
    	position:absolute;
    	right:5px;
    	background-color:#ff9900;
    	border:0px;
    	font-size:10pt;
    }
    #recruit{
    	background-color:#ff9900;
    	border:0px;
    	font-size:10pt;
    	width:100%;
    }
    .reviewlist .btn-sm{
    	background-color:#ff9900;
    	border:0px;}
    .reviewlist{
    	align:center;
	    height: 200px;
	    border-top:1px solid #ededed;
	    padding: 20px;
	    margin-bottom:20px;
    }
    .party:nth-child(2){margin-top:10px;}
    .review:nth-child(2){margin-top:10px;}
    .reviewlist .review{
    	background-color:white;
    	padding:10px;
    	font-size:8pt;	
	    border-bottom:1px solid #ededed;
    }
    .reviewlist .bottom{text-align:right;}
    .bg_bar {
    height: 11px;
    background-color: #e2e2e2;
    display: inline-block;
    width: 1px;
        margin: 6px 7px 0 8px;
	}
	.raty i{color:#ffd900;}
    .rating {float:left;}
    .rating:not(:checked) > input {
        position:absolute;
        clip:rect(0,0,0,0);
    }
    .rating:not(:checked) > label {
        float:right;
        width:1em;
        /* padding:0 .1em; */
        overflow:hidden;
        white-space:nowrap;
        cursor:pointer;
        font-size:120%;
        /* line-height:1.2; */
        color:#ddd;
    }
    .rating:not(:checked) > label:before {
        content: '★ ';
    }
    .rating > input:checked ~ label {
        color: #ffd900;

    }
    .rating:not(:checked) > label:hover,
    .rating:not(:checked) > label:hover ~ label {
        color: #ffd900;
    }
    .rating > input:checked + label:hover,
    .rating > input:checked + label:hover ~ label,
    .rating > input:checked ~ label:hover,
    .rating > input:checked ~ label:hover ~ label,
    .rating > label:hover ~ input:checked ~ label {
        color: #ffd900;
    }
    .rating > label:active {
        position:relative;
    }
    .input_content{
    	font-size:10pt;
    	height:100px;
    	overflow-y:auto;overflow-x:hidden;
    	background-color:white;
    }
    .review_comment{
		align:center;
	    height: 200px;
	    padding: 10px;
	    position:relative;
	}
    .review_comment .writer{font-size:10pt;}
    .review_comment i{position:absolute;right:10px;top:10px;color:#e2e2e2;}
    .review_comment i:hover{color:black;}
    .review_comment input[type=submit]{position:absolute;right:10px;bottom:30px;float:left;}
    .map_add{width:50px;height:50px;background-color:white;border-radius:50px;z-index:25;position:fixed;bottom:10px;right:10px;color:#ff9900;line-height:50px;}
    .foodInsert{width:50px;height:50px;background-color:white;border-radius:50px;z-index:25;position:fixed;bottom:190px;right:10px;color:#ff9900;line-height:50px;}
    .cafeInsert{width:50px;height:50px;background-color:white;border-radius:50px;z-index:25;position:fixed;bottom:250px;right:10px;color:#ff9900;line-height:50px;}
    .food{width:50px;height:50px;background-color:white;border-radius:50px;z-index:25;position:fixed;bottom:70px;right:10px;color:#ff9900;line-height:50px;}
    .cafe{width:50px;height:50px;background-color:white;border-radius:50px;z-index:25;position:fixed;bottom:130px;right:10px;color:#ff9900;line-height:50px;}
    .map_wrap {position:relative;width:100%;height:350px;}
    span.title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
    .badge-light{background-color:#ff9900;color:white;}
    #partyModal table td{border:0px;}
    #partyModal table th{border:0px;}
    #partyModal .content{font-size:10pt;}
	
	.featImgWrap {
	  width: 250px;
	}
	.featImgWrap {
	  position: relative;
	  padding-top: 56.57%;
	  /* 16:9 ratio */
	  overflow: hidden;
	}
	.featImgWrap .cropping {
	  position: absolute;
	  top: 0;
	  left: 0;
	  right: 0;
	  bottom: 0;
	  -webkit-transform: translate(50%, 50%);
	  -ms-transform: translate(50%, 50%);
	  transform: translate(50%, 50%);
	}
	.featImgWrap .cropping img {
	  position: absolute;
	  top: 0;
	  left: 0;
	  max-width: 100%;
	  height: auto;
	  -webkit-transform: translate(-50%, -50%);
	  -ms-transform: translate(-50%, -50%);
	  transform: translate(-50%, -50%);
	}
	.featImgWrap .cropping img.landscape {
	  max-height: 100%;
	  height: 100%;
	  max-width: none;
	}
	.featImgWrap .cropping img.portrait {
	  max-width: 100%;
	  width: 100%;
	  max-height: none;
	}
	#partyModal .badges div{float:left;padding-right:5px;}
</style>
<script>
	$(function(){
	    $('.cropping img').each(function (index, item) {
	        if ($(this).height() / $(this).width() < 0.567) {
	            $(this).addClass('landscape').removeClass('portrait');
	        } else {
	            $(this).addClass('portrait').removeClass('landscape');
	        }
	    });
	    $('#programModalSummary').on('shown.bs.modal', function (e) {
	        $('#programModalSummary .featImage > img').each(function (index, item) {
	            if ($(this).height() / $(this).width() < 0.567) {
	                $(this).addClass('landscape').removeClass('portrait');
	            } else {
	                $(this).addClass('portrait').removeClass('landscape');
	            }
	        });
	    })
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
		
		function createMapTableMarker(positions, image){
			positions.forEach(function(pos){
				var marker = new kakao.maps.Marker({
			        map: map, 
			        position: pos.latlng,
			        image: image
			    });
			    var iwRemoveable = true;
			    var infowindow = new kakao.maps.InfoWindow({
			        content: pos.content, 
			        removable : iwRemoveable
			    });
			    kakao.maps.event.addListener(marker, 'click', function(mouseEvent) {        
			        location.href = "/map/selectMarkerInfo?place_id="+pos.place_id;
			    });
			});
		}
		
		
		$.getJSON("/resources/json/mapData.json",function(data){
			var html = [];
			var cafePositions = [];
			var foodPositions = [];
			var cafePartyPositions = [];
			var foodPartyPositions = [];
			
			var normalCafeImageSrc = 'https://i.imgur.com/WSYwwXl.png', 
			normalFoodImageSrc = 'https://i.imgur.com/AvfFIoM.png'
			partyCafeImageSrc = 'https://i.imgur.com/RonPEnV.png',
			partyFoodImageSrc = 'https://i.imgur.com/pCTdyj4.png',   
		    baseImageSize = new kakao.maps.Size(40, 60), // 마커이미지의 크기입니다
		    baseImageOption = {offset: new kakao.maps.Point(20, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		    var normalCafeImage = new kakao.maps.MarkerImage(normalCafeImageSrc, baseImageSize, baseImageOption);
		    var normalFoodImage = new kakao.maps.MarkerImage(normalFoodImageSrc, baseImageSize, baseImageOption);
		    var partyCafeImage = new kakao.maps.MarkerImage(partyCafeImageSrc, baseImageSize, baseImageOption);
		    var partyFoodImage = new kakao.maps.MarkerImage(partyFoodImageSrc, baseImageSize, baseImageOption);
			
			$.each(data, function(i, item) { 
				if(item.category == '카페' && item.partyOn == 0){
					cafePositions.push({
		    	        content: '<div>'+ item.name +'</div>', 
		    	        latlng: new kakao.maps.LatLng(item.lat, item.lng),
		    	        place_id: item.place_id
		    		});
				}else if(item.category == '음식점' && item.partyOn == 0){
					foodPositions.push({
		    	        content: '<div>'+ item.name +'</div>', 
		    	        latlng: new kakao.maps.LatLng(item.lat, item.lng),
		    	        place_id: item.place_id
		    		});
				}else if(item.category == '카페' && item.partyOn > 0){
					cafePartyPositions.push({
		    	        content: '<div>'+ item.name +'</div>', 
		    	        latlng: new kakao.maps.LatLng(item.lat, item.lng),
		    	        place_id: item.place_id
		    		});
				}else if(item.category == '음식점' && item.partyOn > 0){
					foodPartyPositions.push({
		    	        content: '<div>'+ item.name +'</div>', 
		    	        latlng: new kakao.maps.LatLng(item.lat, item.lng),
		    	        place_id: item.place_id
		    		});
				}
			});
			// $('#target').html(html.join(''));
			createMapTableMarker(cafePositions, normalCafeImage); // 일반 카페
			createMapTableMarker(foodPositions, normalFoodImage); // 일반 음식점
			createMapTableMarker(cafePartyPositions, partyCafeImage); // 모임 모집중인 카페
			createMapTableMarker(foodPartyPositions, partyFoodImage); // 모임 모집중인 음식점
			
		    
		});
		
		// MakrerImage 객체를 생성하여 반환하는 함수입니다
		function createMarkerImage(markerSize, offset, markerImageSrc) {
		    var markerImage = new kakao.maps.MarkerImage(
		    	markerImageSrc, // 마커 이미지 URL
		        markerSize, // 마커의 크기
		        {
		            offset: offset, // 마커 이미지에서의 기준 좌표
		        }
		    );
		    return markerImage;
		}

	    
	    function addMarker(po) {
			var markerSize = new kakao.maps.Size(10, 10),
				markerOffset = new kakao.maps.Point(0, 0);
			var normalImageSrc = 'https://i.imgur.com/xZ0vFqM.png';
			var hoverImageSrc = 'https://i.imgur.com/whVKb3a.png';
			
	        var normalImage = createMarkerImage(markerSize, markerOffset, normalImageSrc),
	        	hoverImage = createMarkerImage(markerSize, markerOffset, hoverImageSrc);
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: po,
	            image: normalImage
	        });

		    /* var iwRemoveable = true;
		    var infowindow = new kakao.maps.InfoWindow({
		        content: po.content, 
		        removable : iwRemoveable
		    }); */
	        marker.normalImage = normalImage;
	        kakao.maps.event.addListener(marker, 'mouseover', function() {
	                marker.setImage(hoverImage);
	        });
	        kakao.maps.event.addListener(marker, 'mouseout', function() {
	                marker.setImage(normalImage);
	        });
	    }
	    
		$.getJSON("/resources/json/cafe.json",function(data){
			
			console.log(data);
			var positions = [];
			
			$.each(data, function(i, item) {
				for(var a = 0;a < data.cafe_list.length; a++){
					positions.push({
		    	        content: '<div>'+ data.cafe_list[a].cafe.place_name +'</div>', 
		    	        latlng: new kakao.maps.LatLng(data.cafe_list[a].cafe.y, data.cafe_list[a].cafe.x)
					});
				}
			});
		    for (var i = 0; i < positions.length; i ++) {
			    addMarker(positions[i].latlng);
			}
			
		});
		

  		$.getJSON("/resources/json/food.json",function(data){
  			console.log(data);
			var positions = [];

			$.each(data, function(i, item) {
				for(var a = 0;a < data.food_list.length; a++){
					positions.push({
		    	        content: '<div>'+ data.food_list[a].food.place_name +'</div>', 
		    	        latlng: new kakao.maps.LatLng(data.food_list[a].food.y, data.food_list[a].food.x)
					});
				}
			});
		    for (var i = 0; i < positions.length; i ++) {
			    addMarker(positions[i].latlng);
			}
		});
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		$("#centerLat").text(map.getCenter().getLat());
	    $("#centerLng").text(map.getCenter().getLng());
		
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
		/* kakao.maps.event.addListener(map, 'zoom_changed', function() {        
		    
		    // 지도의 현재 레벨을 얻어옵니다
		    var level = map.getLevel();
		    
		    var message = '지도를 확대해주세요.';
		    var resultDiv = document.getElementById('result');  
		    resultDiv.innerHTML = message;
		    
		}); */
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		infowindow = new kakao.maps.InfoWindow({zindex:30}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
		            var detailAddr = !!result[0].road_address ? '<div class="selectedRoad">도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
		            detailAddr += '<div class="selectedAddress">지번 주소 : ' + result[0].address.address_name + '</div>';
		            
		            var content = '<div class="bAddr">' +
		                            '<span class="title">주소정보</span>' + 
		                            detailAddr + 
		                        '</div>';

		            // 마커를 클릭한 위치에 표시합니다 
		            marker.setPosition(mouseEvent.latLng);
		            marker.setMap(map);

		            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
		            infowindow.setContent(content);
		            infowindow.open(map, marker);
		            $(".lat").html(mouseEvent.latLng.getLat());
		            $(".lng").html(mouseEvent.latLng.getLng());
		        }   
		    });
		});
		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
		    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		    $("#centerLat").text(map.getCenter().getLat());
		    $("#centerLng").text(map.getCenter().getLng());
		});

		function searchAddrFromCoords(coords, callback) {
		    // 좌표로 행정동 주소 정보를 요청합니다
		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
		}

		function searchDetailAddrFromCoords(coords, callback) {
		    // 좌표로 법정동 상세 주소 정보를 요청합니다
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        var infoDiv = document.getElementById('centerAddr');

		        for(var i = 0; i < result.length; i++) {
		            // 행정동의 region_type 값은 'H' 이므로
		            if (result[i].region_type === 'H') {
		                // infoDiv.innerHTML = result[i].address_name;
		                break;
		            }
		        }
		    }    
		}
		$(".map_add").on("click",function(){
			var selectedRoad = $(".selectedRoad").text().split(" : ")[1];
			var selectedAddress = $(".selectedAddress").text().split(" : ")[1];
			$(".modal-body .road_address").html(selectedRoad);
			$(".modal-body .address").html(selectedAddress);
		})
		
        var positions = [];
		$(".food").on("click",function(){
        	$.ajax({
        		url:"/map/food",
        		type:"get",
        		data:{
        			lat:$("#centerLat").text(),
        			lng:$("#centerLng").text()},
        		dataType:"JSON"
        	}).done(function(resp){
        		console.log(resp);
        		for(var i = 0;i < resp.documents.length;i++){
            		//console.log(resp.documents[i].place_name);
            		//console.log(resp.documents[i].x + " : " + resp.documents[i].y);
            		//console.log(resp.documents[i].place_url);
            		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
            		positions.push({
            		        content: '<form action="/map/insert" method="get" id="inputForm"><div style="padding:5px;">'
            		        			+'<div><input type=text readonly name="name" value="'+resp.documents[i].place_name+'"></div>'
            		        			+'<div><input type=text readonly name="address" value="'+resp.documents[i].address_name+'"></div>'
            		        			+'<div><input type=text readonly name="road_address" value="'+resp.documents[i].road_address_name+'"></div>'
            		        			+'<div><input type=text readonly name="category" value="'+resp.documents[i].category_group_name+'"></div>'
            		        			+'<div><input type=text readonly name="lat" value="'+resp.documents[i].y+'"></div>'
            		        			+'<div><input type=text readonly name="lng" value="'+resp.documents[i].x+'"></div>'
            		        			+'<div><input type=text readonly name="phone" value="'+resp.documents[i].phone+'"></div>'
            		        			+'<div><input type=text readonly name="place_url" value="'+resp.documents[i].place_url+'"></div>'
            		        			+'<div><input type=text readonly name="detail_category" value="'+resp.documents[i].category_name+'"></div>'
            		        			+'<div><input type=text readonly name="place_id" value="'+resp.documents[i].id+'"></div>'
            		        			+'<button type="submit" id="detail">맛집 등록</button></div></form>', 
            		        latlng: new kakao.maps.LatLng(resp.documents[i].y, resp.documents[i].x)
            		});
        		}
        		
        	    var imageSrc = 'https://i.imgur.com/rzDIRIP.png', // 마커이미지의 주소입니다    
        	    imageSize = new kakao.maps.Size(40, 60), // 마커이미지의 크기입니다
        	    imageOption = {offset: new kakao.maps.Point(20, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
        	    
        		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
        		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
        		
        		for (var i = 0; i < positions.length; i ++) {
        		    // 마커를 생성합니다
        		    var marker = new kakao.maps.Marker({
        		        map: map, // 마커를 표시할 지도
        		        position: positions[i].latlng, // 마커의 위치
        		        image: markerImage // 마커이미지 설정 
        		    });
        		    
        		    var iwRemoveable = true;
        		    // 마커에 표시할 인포윈도우를 생성합니다 
        		    var infowindow = new kakao.maps.InfoWindow({
        		        content: positions[i].content, // 인포윈도우에 표시할 내용
        		        removable : iwRemoveable
        		    });

        		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
        		    // 이벤트 리스너로는 클로저를 만들어 등록합니다
        		 	// 마커에 클릭이벤트를 등록합니다
        		 	
        		    kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
        		}
        	}).fail(function(error1,error2){
        		console.log(error1);
        		console.log(error2);
        	})
		})
		$(".cafe").on("click",function(){
        	$.ajax({
        		url:"/map/cafe",
        		type:"get",
        		data:{
        			lat:$("#centerLat").text(),
        			lng:$("#centerLng").text()},
        		dataType:"JSON"
        	}).done(function(resp){
        		var positions = [];
        		for(var i = 0;i < resp.documents.length;i++){
            		console.log(resp.documents[i].id);
            		//console.log(resp.documents[i].place_name);
            		//console.log(resp.documents[i].x + " : " + resp.documents[i].y);
            		//console.log(resp.documents[i].place_url);
            		positions.push({
        		        content: '<form action="/map/insert" method="get" id="inputForm"><div style="padding:5px;">'
        		        			+'<div><input type=text readonly name="name" value="'+resp.documents[i].place_name+'"></div>'
        		        			+'<div><input type=text readonly name="address" value="'+resp.documents[i].address_name+'"></div>'
        		        			+'<div><input type=text readonly name="road_address" value="'+resp.documents[i].road_address_name+'"></div>'
        		        			+'<div><input type=text readonly name="category" value="'+resp.documents[i].category_group_name+'"></div>'
        		        			+'<div><input type=text readonly name="lat" value="'+resp.documents[i].y+'"></div>'
        		        			+'<div><input type=text readonly name="lng" value="'+resp.documents[i].x+'"></div>'
        		        			+'<div><input type=text readonly name="phone" value="'+resp.documents[i].phone+'"></div>'
        		        			+'<div><input type=text readonly name="place_url" value="'+resp.documents[i].place_url+'"></div>'
        		        			+'<div><input type=text readonly name="detail_category" value="'+resp.documents[i].category_name+'"></div>'
        		        			+'<div><input type=text readonly name="place_id" value="'+resp.documents[i].id+'"></div>'
        		        			+'<button type="submit" id="detail">맛집 등록</button></div></form>', 
        		        latlng: new kakao.maps.LatLng(resp.documents[i].y, resp.documents[i].x)
        			});
        		}
        		
        	    var imageSrc = 'https://i.imgur.com/kKE28hx.png', // 마커이미지의 주소입니다    
        	    imageSize = new kakao.maps.Size(40, 60), // 마커이미지의 크기입니다
        	    imageOption = {offset: new kakao.maps.Point(20, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
        	    
        		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
        		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
        		for (var i = 0; i < positions.length; i ++) {
        		    var marker = new kakao.maps.Marker({
        		        map: map, 
        		        position: positions[i].latlng,
        		        image: markerImage
        		    });
        		    
        		    var iwRemoveable = true;
        		    var infowindow = new kakao.maps.InfoWindow({
        		        content: positions[i].content, 
        		        removable : iwRemoveable
        		    });
        		    kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
        		}
        		function makeOverListener(map, marker, infowindow) {
        		    return function() {
        		        infowindow.open(map, marker);
        		    };
        		}
        		function makeOutListener(infowindow) {
        		    return function() {
        		        infowindow.close();
        		    };
        		}
        	}).fail(function(error1,error2){
        		console.log(error1);
        		console.log(error2);
        	})
		})
		$(".foodInsert").on("click",function(){
        	$.ajax({
        		url:"/map/foodInsert",
        		type:"get",
        		data:{
        			lat:$("#centerLat").text(),
        			lng:$("#centerLng").text()},
        		dataType:"JSON"
        	}).done(function(resp){
        		console.log(resp);
        		alert("입력 완료");
        	}).fail(function(error1,error2){
        		var iCHK = 1;
        		for(var i = 0;i<iCHK;i++)
        		{
        		document.location.reload();
        		}
        		console.log(error1);
        		console.log(error2);
        	})
		})
		$(".cafeInsert").on("click",function(){
        	$.ajax({
        		url:"/map/cafeInsert",
        		type:"get",
        		data:{
        			lat:$("#centerLat").text(),
        			lng:$("#centerLng").text()},
        		dataType:"JSON"
        	}).done(function(resp){
        		var iCHK = 1;
        		for(var i = 0;i<iCHK;i++)
        		{
        		document.location.reload();
        		}
        		console.log(resp);
        		alert("입력 완료");
        	}).fail(function(error1,error2){
        		console.log(error1);
        		console.log(error2);
        	})
		})
		$(".join").on("click",function(){
			$.ajax({
				url:"/map/getPartyInfo",
				data:{seq:$(this).parent().find(".seq").text()}
			}).done(function(resp){
				$("#partyModal #exampleModalLabel b").text(resp.title);
				$("#partyModal .parent_name").text(resp.parent_name);
				$("#partyModal .parent_address").text(resp.parent_address);
				$("#partyModal .meetdate").text(resp.sDate);
				$("#partyModal .count").text(resp.count);
				if(resp.gender == 'a'){
					$("#partyModal .gender").text("혼성모임");
				}else if(resp.gender == 'f'){
					$("#partyModal .gender").text("여성만");
				}else if(resp.gender == 'm'){
					$("#partyModal .gender").text("남성만");
				}
				$("#partyModal .age").html("");
				if(resp.age.includes(", ")){
					var ages = resp.age.split(", ");
					for(var i = 0;i < ages.length();i++){
						$("#partyModal .age").append('<span class="badge badge-pill badge-light">'+ ages[i] + '대</span>');
					}
				}else{
					$("#partyModal .age").append("<span class='badge badge-pill badge-light'>" + resp.age + "대만</span>");
				}
				if(resp.drinking == 1){
					$("#partyModal .drinking").text("음주OK");
				}else if(resp.drinking == 0){
					$("#partyModal .drinking").text("음주NO");
				}
				$("#partyModal .content").text(resp.content);
			})
		})
		
		$("#search").on("click",function(){
			$.ajax({
				url:"/map/search",
				data:{keyword:$("#keyword").val()},
				dataType:"JSON"
			}).done(function(resp){
				$(".choose_info").html("");
				$(".search_result").html("");
				var count = resp.cafe_list.length + resp.food_list.length;
				$(".search_result").append("<div class='search_count'><b>장소</b> "+count+"</div>");
				$(".search_result").css('height','80vh');
				var line = $("<div class='search_list'></div>");
				for(var i = 0; i < resp.cafe_list.length; i++){
					var cafe = $("<div class='cafe_info'></div>");
					cafe.append("<div class='place_name'>"+resp.cafe_list[i].place_name+"</div>");
					cafe.append("<div class='address_name'>"+resp.cafe_list[i].address_name+"</div>");
					cafe.append("<div class='category_name'>"+resp.cafe_list[i].category_name+"</div>");
					cafe.append("<div class='phone'>"+resp.cafe_list[i].phone+"</div>");
					line.append(cafe);		
				}
				for(var i = 0; i < resp.food_list.length; i++){
					var food = $("<div class='food_info'></div>");
					food.append("<div class='place_name'>"+resp.food_list[i].place_name+"</div>");
					food.append("<div class='address_name'>"+resp.food_list[i].address_name+"</div>");
					food.append("<div class='category_name'>"+resp.food_list[i].category_name+"</div>");
					food.append("<div class='phone'>"+resp.food_list[i].phone+"</div>");
					line.append(food);			
				}
				$(".search_result").append(line);
				console.log(resp);
			})
		})
		
	})
</script>
</head>
<body>
	<!-- 상세정보 버튼을 누른 핀 좌표 -->
	<div style="display:none;" id="selectedLat"></div>
	<div style="display:none;" id="selectedLng"></div>
	<!-- 사용자가 보고 있는 중심 좌표 -->
	<div style="display:none;" id="centerLat"></div>
	<div style="display:none;" id="centerLng"></div>
	<!-- 선택해서 들어온 중심 좌표 -->
	<div style="display:none;" id="lat"></div>
	<div style="display:none;" id="lng"></div>
	<div class="container-fluid all">
		<div id="header"><jsp:include page="/WEB-INF/views/include/header.jsp" /></div>
		<div id="sideBar">
			<div class="search_area">
				<div class="searchbar mx-auto">
		          <input type="text" class="search_input" id="keyword" placeholder="음식점, 카페 상호명 검색">
		          <button type="button" class="search_icon" id="search"><i class="fas fa-search"></i></button>
		        </div>
			</div>
			<div class="side">
				<div class="search_result">
					
				</div>
				<div class="choose_info">
				<c:if test="${not empty mapdto}">
		        	<div class="store_info mx-auto">
		        		<div class="featImgWrap">
			        		<div class="cropping">
			        			<img src="${img}" id="mapimg">
			        		</div>		        		
		        		</div>
			        	<div class="category">${mapdto.category}</div>
			        	<div class="name">${mapdto.name}</div>
			        	<div class="address">${mapdto.address}</div>
			        	<div class="road_address">${mapdto.road_address}</div>
			        	<div class="rating_avg">
			        		<c:choose>
			        			<c:when test="${mapdto.rating_avg eq 0}"><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></c:when>
			        			<c:when test="${mapdto.rating_avg eq 1}"><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></c:when>
				        		<c:when test="${mapdto.rating_avg eq 2}"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></c:when>
				        		<c:when test="${mapdto.rating_avg eq 3}"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></c:when>
				        		<c:when test="${mapdto.rating_avg eq 4}"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i></c:when>
				        		<c:when test="${mapdto.rating_avg eq 5}"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></c:when>
				        		<c:when test="${mapdto.rating_avg < 1}"><i class="fas fa-star-half"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></c:when>
				        		<c:when test="${mapdto.rating_avg < 2}"><i class="fas fa-star"></i><i class="fas fa-star-half"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></c:when>
				        		<c:when test="${mapdto.rating_avg < 3}"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half"></i><i class="far fa-star"></i><i class="far fa-star"></i></c:when>
				        		<c:when test="${mapdto.rating_avg < 4}"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half"></i><i class="far fa-star"></i></c:when>
				        		<c:when test="${mapdto.rating_avg < 5}"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half"></i></c:when>
			        		</c:choose>
						</div>
			        	<div class="phone">${mapdto.phone}</div>
			        	<div class="place_url">${mapdto.place_url}</div>
		        	</div>
				</c:if>
	        <div class="partylist">
	        	<b>진행중인 모임</b>
	        	<c:if test="${not empty partyList}">
	        		<c:forEach var="i" items="${partyList}">
		        		<div class="party">
						    <div class="title">${i.title}</div>
						    <div class="seq" style="display:none;">${i.seq}</div>
						    <button type="button" class="btn btn-primary join" data-toggle="modal" data-target="#partyModal">참가</button>
						</div>
	        		</c:forEach>
	        	</c:if>
	        	<nav aria-label="Page navigation example">
				  <ul class="pagination pagination-sm justify-content-center">
				  	<c:if test="${not empty navi}">
				  		${navi}
				  	</c:if>
				  </ul>
				</nav>
				<button type="button" class="btn btn-primary" id="recruit">내가 직접 모집하기</button>
	        </div>
	        <div class="reviewlist">
		        	<b>리뷰</b>
		        	<div class="review_comment">
		        		<div class="writer"><b>아무개</b>님</div>
		        		<i class="fas fa-images"></i>
		        		<div contenteditable="true" class="input_content"></div>
		        		<div class="rating">
				            <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="매우 만족스러움">5 stars</label>
				            <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="조금 만족스러움">4 stars</label>
				            <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="보통이에요">3 stars</label>
				            <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="조금 별로">2 stars</label>
				            <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="매우 별로">1 star</label>
				        </div>	
		        		<input type=submit class="btn-sm btn-primary" value="작성">
		        	</div>
		        	<div class="review">
		        		<i class="fas fa-user fa-2x"></i>
		        		<div class="raty">
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="far fa-star"></i>
						</div>
		        		<div class="content">맛있어요~</div>
		        		<div class="bottom">
		        			홍길동<span class="bg_bar"></span>10:56 AM<span class="bg_bar"></span>신고
		        		</div>
		        	</div>
		        	<div class="review">
		        		<i class="fas fa-user fa-2x"></i>
		        		<div class="raty">
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="far fa-star"></i>
						</div>
		        		<div class="content">맛있어요~</div>
		        		<div class="bottom">
		        			홍길동<span class="bg_bar"></span>10:56 AM<span class="bg_bar"></span>신고
		        		</div>
		        	</div>
		        	<div class="review">
		        		<i class="fas fa-user fa-2x"></i>
		        		<div class="raty">
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="far fa-star"></i>
						</div>
		        		<div class="content">맛있어요~</div>
		        		<div class="bottom">
		        			홍길동<span class="bg_bar"></span>10:56 AM<span class="bg_bar"></span>신고
		        		</div>
		        	</div>
		        </div>
			</div>
			</div>
					
	        
		</div>
		<div id="map"></div>
		<div class="foodInsert text-center">FD6</div>
		<div class="cafeInsert text-center">CE7</div>
		<div class="food text-center"><i class="fas fa-hamburger"></i></div>
		<div class="cafe text-center"><i class="fas fa-coffee"></i></div>
		<div class="map_add text-center" data-toggle="modal" data-target="#exampleModal"><i class="fas fa-plus"></i></div>
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">일반 맛집 추가하기</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        	<table class="table">
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">선택한 맛집 정보</th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th scope="row">도로명 주소</th>
						      <td class="road_address"></td>
						    </tr>
						    <tr>
						      <th scope="row">지번 주소</th>
						      <td class="address"></td>
						    </tr>
						    <tr>
						      <th scope="row">위도</th>
						      <td class="lat"></td>
						    </tr>
						    <tr>
						      <th scope="row">경도</th>
						      <td class="lng"></td>
						    </tr>
						    <tr>
						      <th scope="row">가게명</th>
						      <td class="name"><input type="text" class="form-control form-control-sm" placeholder="가게명을 입력해주세요."></td>
						    </tr>
						    <tr>
						      <th scope="row">카테고리</th>
						      <td class="category">
						      	<select class="form-control form-control-sm">
						      		<option value="음식점">음식점</option>
						      		<option value="카페">카페</option>
								</select>
							  </td>
						    </tr>
						  </tbody>
					</table>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">등록</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- 맛집 참가 modal -->
		<div class="modal fade" id="partyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel"><b></b></h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        	<table class="table">
						  <tbody>
						    <tr>
						    	<td class="badges">
						      		<div><span class="badge badge-pill badge-light drinking"></span></div>
						      		<div><span class="badge badge-pill badge-light gender"></span></div>
						      		<div class="age"></div>
						    	</td>
						    </tr>
						    <tr>
						      <th scope="row">상호명</th>
						      <td class="parent_name"></td>
						      <th scope="row">위치</th>
						      <td class="parent_address"></td>
						    </tr>
						    <tr>
						      <th scope="row">모임날짜</th>
						      <td class="meetdate"></td>
						    </tr>
						    <tr>
						      <th scope="row">인원</th>
						      <td class="count"></td>
						    </tr>
						    <tr>
						      <th scope="row" colspan="2">소개말</th>
						    </tr>
						    <tr>
						      <td scope="row" class="content" colspan="2"></td>
						    </tr>
						  </tbody>
					</table>
		      </div>
		      <div class="modal-footer">
		      	<!-- 수정, 삭제 버튼 : 로그인 세션과 작성자 아이디 비교 필요 -->
		        <button type="button" class="btn btn-primary">수정</button>
		        <button type="button" class="btn btn-primary">삭제</button>
		        <button type="button" class="btn btn-primary" id="joinParty">채팅방 입장하기</button>
		      </div>
		    </div>
		  </div>
		</div>
		</div>
</body>
</html>

