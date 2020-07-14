<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
	<c:when test="${empty list}">
		<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="endSearch">
			<span>검색 된 내용이 없습니다.</span>
		</div>
	</c:when>
	<c:otherwise>
		<!-- start column -->
		<c:forEach var="partyList" items="${list}">
			<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
				<div class="single-team-member">
					<div class="team-img">
						<a href="#"> <img src="${partyList.imgaddr}" alt=""></a>
						<div class="team-social-icon text-center">
							<ul>
								<li><a class="myBtn">상세 보기</a></li>
								<li style="display: none"><input type="hidden"
									class="party_seq" value="${partyList.seq}"></li>
							</ul>
						</div>
					</div>
					<div class="team-content text-center">
						<h3>${partyList.title }</h3>
						<br>
						<h5 class="card-subtitle mb-2 text-muted">${partyList.parent_name }</h5>
						<p>
							날짜 : ${partyList.sDate}<br> 지역 : ${partyList.parent_address }
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
		<!-- End column -->
	</c:otherwise>
</c:choose>