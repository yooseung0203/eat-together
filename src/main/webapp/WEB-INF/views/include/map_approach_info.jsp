  <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
  <!-- approach_info --> 
  <div class="map_approach m-1">
	<p class="m-0 pin_how_to">핀 사용법</p>
	<p class="mt-1"><small>지도에서 핀을 선택해 맛집 정보를 확인해주세요.</small></p>
	<div class="card mb-3 mt-3" style="max-width: 540px;">
	  <div class="row no-gutters ml-2 mr-2">
	    <div class="col-3 text-center p-2">
	      <img src="https://eat-together.s3.ap-northeast-2.amazonaws.com/Asset5.png">
	    </div>
	    <div class="col-9">
	      <div class="card-body p-1 pt-4">
	        <p class="card-text p-1"><small>일반 음식점</small></p>
	      </div>
	    </div>
	  </div>
	  <div class="row no-gutters ml-2 mr-2" data-toggle="tooltip" data-placement="bottom" title="모임이 종료된 가게는 회색 핀으로 표시됩니다.">
	    <div class="col-3 text-center p-2">
	      <img src="https://eat-together.s3.ap-northeast-2.amazonaws.com/Asset6.png">
	    </div>
	    <div class="col-9">
	      <div class="card-body p-1 pt-4">
	        <p class="card-text p-1"><small>일반 카페</small></p>
	      </div>
	    </div>
	  </div>
	  <div class="row no-gutters ml-2 mr-2">
	    <div class="col-3 text-center p-2">
	      <img src="https://eat-together.s3.ap-northeast-2.amazonaws.com/Asset4.png">
	    </div>
	    <div class="col-9">
	      <div class="card-body p-1 pt-4">
	        <p class="card-text p-1"><small>모임 모집이 개설된 음식점</small></p>
	      </div>
	    </div>
	  </div>
	  <div class="row no-gutters ml-2 mr-2" data-toggle="tooltip" data-placement="bottom" title="파란색 핀을 클릭해 모임에 참가해보세요!">
	    <div class="col-3 text-center p-2">
	      <img src="https://eat-together.s3.ap-northeast-2.amazonaws.com/Asset3.png">
	    </div>
	    <div class="col-9">
	      <div class="card-body p-1 pt-4">
	        <p class="card-text p-1"><small>모임 모집이 개설된 카페</small></p>
	      </div>
	    </div>
	  </div>
	  <div class="row no-gutters ml-2 mr-2">
	    <div class="col-3 text-center p-2">
	      <img src="https://eat-together.s3.ap-northeast-2.amazonaws.com/Asset1.png">
	    </div>
	    <div class="col-9">
	      <div class="card-body p-1 pt-4">
	        <p class="card-text p-1"><small>리뷰 별점 평균 Top5</small></p>
	      </div>
	    </div>
	  </div>
	  <div class="row no-gutters ml-2 mr-2" data-toggle="tooltip" data-placement="bottom" title="노란 핀이 다섯 개보다 적은 경우, 리뷰 별점 평균이 1점 이상인 가게가 충분하지 않다는 의미입니다.">
	    <div class="col-3 text-center p-2">
	      <img src="https://eat-together.s3.ap-northeast-2.amazonaws.com/Asset2.png">
	    </div>
	    <div class="col-9">
	      <div class="card-body p-1 pt-4">
	        <p class="card-text p-1"><small>리뷰 별점 평균 Top5</small></p>
	      </div>
	    </div>
	  </div>
	</div>
</div>
<div class="map_approach m-1">
	<p class="m-0">맛집 분포도</p>
	<div class="clusterer_desc m-2">
		<img src="/resources/img/clusterer_orange.png">
		<img src="/resources/img/clusterer_white.png">
		<div class="clusterer in_map"></div>
	</div>
	<p><small>오렌지색의 클러스터는 모임이 개설 중이거나 종료된 맛집, 흰색의 클러스터는 아직 모임이 한 번도 개설되지 않은 가게를 나타냅니다.</small></p>
</div>
 