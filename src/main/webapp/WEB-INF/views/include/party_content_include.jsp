<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src='/resources/js/partyList.js?ver=31'></script>
	<div class="container">
		<div class="row mb-3">
			<div class="col-sm-12 mt-3">
            <h2 class="party_headline">${con.title}</h2>
            <input type="hidden" id ="party_seq" value="${con.seq}">
            <input type="hidden" id ="party_time" value="${con.sTime}">
           <c:choose>
					<c:when test="${con.status  eq '1'}">
						<span class="badge badge-success">멤버 모집중</span>
					</c:when>
					<c:when test="${con.status  eq '0'}">
						<span class="badge badge-secondary">모집마감</span>
					</c:when>
				</c:choose>
         </div>
         <div class="col-sm-12">작성자 : ${con.writer}</div>
      </div>

		<div class="row">
         <div class="col-sm-5">
            <div class="featImgWrap">
               <div class="cropping">
                  <!-- <img src="${img}" class="img"> -->
                  <img src="${con.imgaddr}" id="img">
               </div>
            </div>
         </div>
      </div>
		
		<div class="row mb-1">
         <div class="col-sm-2 party-titlelabel">상호명</div>
         <div class="col-sm-3">${con.parent_name}</div>
      </div>

		<div class="row mb-1">
			<div class="col-sm-2 party-titlelabel">위치</div>
			<div class="col-sm-10">${con.parent_address}</div>
		</div>
		<%-- <div class="row mb-1">
				<div class="col-sm-2">제목</div>
				<div class="col-sm-10">
					${con.title}
				</div>
			</div> --%>
		<div class="row mb-1">
			<div class="col-sm-2 party-titlelabel">모임날짜</div>
			<div class="col-lg-2">${con.sDate }</div>
		</div>
		<div class="row mb-1">
         <div class="col-sm-2 party-titlelabel">시간</div>
         <div class="col-sm-2" id="time"></div>
      </div>

		<div class="row mb-1">
			<div class="col-sm-2 party-titlelabel">인원</div>
			<div class="col-sm-2">${con.count }</div>

		</div>
		<div class="row mb-1">
			<div class="col-sm-2 party-titlelabel">멤버구성</div>
			<div class="col-sm-10">
				<c:choose>
					<c:when test="${con.gender  eq 'm'}">남자만</c:when>
					<c:when test="${con.gender  eq 'f'}">여자만</c:when>

					<c:otherwise> 남녀무관 </c:otherwise>
				</c:choose>

			</div>

		</div>


		<div class="row mb-1">
			<div class="col-sm-2 party-titlelabel">연령대</div>
			<div class="col-sm-10">${con.age}</div>
		</div>

		<div class="row mb-1" id="adult_q">
			<div class="col-sm-2 party-titlelabel">음주</div>
			<div class="col-sm-10">
				<c:choose>
					<c:when test="${con.drinking  eq '1'}">음주OK</c:when>
					<c:when test="${con.drinking  eq '0'}">음주NO</c:when>
				</c:choose>

			</div>
		</div>
		<div class="row mb-1">
			<div class="col-2 party-titlelabel">소개</div>
			<div class="col-10"> <c:out value='${con.content}' /></div>
		</div>
		<div class="row mb-1">
			<div class="col-2 party-titlelabel">SNS공유</div>
			<div class="col-10">
				<a href="#" data-toggle="sns_share" data-service="naver"
					data-title="네이버 SNS공유" class="btn btn-default">네이버 SNS 공유하기</a> <a
					href="#" data-toggle="sns_share" data-service="twitter"
					data-title="트위터 SNS공유" class="btn btn-default">트위터 SNS 공유하기</a> <a
					href="#" data-toggle="sns_share" data-service="facebook"
					data-title="페이스북 SNS공유" class="btn btn-default">페이스북 SNS 공유하기</a> <a
					href="#" data-toggle="sns_share" data-service="band"
					data-title="네이버밴드 SNS공유" class="btn btn-default">네이버 밴드 공유하기</a> <a
					href="#" data-toggle="sns_share" data-service="pinterest"
					data-title="핀터레스트 SNS공유" class="btn btn-default">핀터레스트 공유하기</a> <a
					href="#" data-toggle="sns_share" data-service="kakaostory"
					data-title="카카오스토리 SNS공유" class="btn btn-default">카카오스토리 공유하기</a>

			</div>
		</div>
		<div class="row mb-3">
         <div class="col-12 mb-5">
            
            <c:choose>
					<c:when
						test="${partyFullCheck eq false && partyParticipantCheck eq false}">
						<button type="button" id="toPartyJoin" class="btn btn-success">모임참가하기</button>
					</c:when>
					<c:when test="${partyParticipantCheck  eq true}">
						<button type="button" id="toChatroom" class="btn btn-primary">채팅방으로 이동</button>
					</c:when>
				</c:choose>
				
            <c:if test="${con.writer eq sessionScope.loginInfo.nickname }">
            	<c:choose>
            		<c:when test="${con.status  eq '1'}">
							<button type="button" id="toStopRecruit" class="btn btn-light">모집종료하기</button>
					</c:when>
					<c:when test="${con.status  eq '0'}">
					</c:when>
				</c:choose>
               <button type="button" id="partyModify" class="btn btn-warning">수정하기</button>
               <button type="button" id="partyDelete" class="btn btn-danger">삭제하기</button>
            </c:if>
            <c:if test="${con.writer ne sessionScope.loginInfo.nickname }">
            	<button type="button" id="partyReport" class="btn btn-info">신고하기</button>
            </c:if>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">목록으로</button>
			</div>
		</div>
	</div>