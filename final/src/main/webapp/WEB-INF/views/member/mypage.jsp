<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member/mypage.css">

<div class="main-content-container">
	<div class="mypage-left">
		<div class="profile-image">
			<div class="profile-image-background">
				<span> <img class="userImage" alt="user"
					src="${pageContext.request.contextPath}/resources/images/user.png">
				</span>
			</div>
		</div>
		<div class="profile-userBasicInfo">
			<table>
				<thead>
					<tr>
						<td>${dto.userName!=null? dto.userName : "이경태"}님의 기본 정보</td>
						<td></td>
					</tr>
				</thead>
				<tbody class=".table-hover">
					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td>${dto.birth!=null? dto.birth : "2000.10.10"}</td>
					</tr>
					<tr>
						<td>휴대폰 번호</td>
						<td>${dto.tel!=null? dto.tel : "010-1111-1111"}</td>
					</tr>
					<tr>
						<td>E-mail</td>
						<td>${dto.email!=null? dto.email : "honsan@gmail.com"}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="profile-update-userBasicInfo">
			<button class="btn btn-default" type="button" onclick="sendUpdate()">내 정보 수정</button>
			<button class="btn btn-default" type="button" onclick="sendDelete()">회원 탈퇴</button>
		</div>
	</div>

	<div class="mypage-right">
		<h4 class="heading">Mypage</h4>
		<div class="mypage-contents">
			<div class="col-md-4 col-sm-8">
				<div class="mypage-content-item">
					<a href="#">
						<div class="hexagon">
							<!-- 아이콘 색 : #686868 -->
							<span><img class="items" src="${pageContext.request.contextPath}/resources/images/myCookingDiary.png"></span>
						</div>
						<span>마이 쿠킹다이어리</span>
					</a>
				</div>
			</div>
			<div class="col-md-4 col-sm-8">
				<div class="mypage-content-item">
					<a href="#">
						<div class="hexagon">
							<span><img class="items" src="${pageContext.request.contextPath}/resources/images/exercise.png"></span>
						</div>
						<span>하루 운동 챌린지</span>
					</a>
				</div>
			</div>
			<div class="col-md-4 col-sm-8">
				<div class="mypage-content-item">
					<a href="#">
						<div class="hexagon">
							<span><img class="items" src="${pageContext.request.contextPath}/resources/images/homeCheck.png"></span>
						</div>
						<span>부동산 체크리스트</span>
					</a>
				</div>
			</div>
			<div class="col-md-4 col-sm-8">
				<div class="mypage-content-item">
					<a href="#">
						<div class="hexagon">
							<span><img class="items" src="${pageContext.request.contextPath}/resources/images/fashion.png"></span>
						</div>
						<span>내 옷 자랑</span>
					</a>
				</div>
			</div>
			<div class="col-md-4 col-sm-8">
				<div class="mypage-content-item">
					<a href="#">
						<div class="hexagon">
							<span><img class="items" src="${pageContext.request.contextPath}/resources/images/living-room.png"></span>
						</div>
						<span>우리집 자랑</span>
					</a>
				</div>
			</div>
			<div class="col-md-4 col-sm-8">
				<div class="mypage-content-item">
					<a href="#">
						<div class="hexagon">
							<span><img class="items" src="${pageContext.request.contextPath}/resources/images/meditation.png"></span>
						</div>
						<span>건강미 자랑</span>
					</a>
				</div>
			</div>
		</div>
		<div class="mypage-recent"></div>
	</div>
</div>