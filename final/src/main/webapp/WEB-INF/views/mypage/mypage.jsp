<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/mypage2.css">

<style>
.userImage {
	width: 100%;
	height: 100%;
	border-radius: 100%;
}
</style>
<script>
	function sendUpdate() {
		f = document.mypage_profile;

		f.action = "${pageContext.request.contextPath}/mypage/updateForm";
		f.submit();
	};
</script>



<form name="mypage_profile" method="post">
	<div class="main-content-container">
		<div class="mypage-top"></div>
		<div class="mypage-both">
			<div class="mypage-left">
				<div class="mypage-left-container">
					<div class="profile-image">
						<div class="profile-image-box">
							<!-- 유저 프로필 이미지 -->
							<!-- 
								<img class="userImage" alt="user"
								src="${pageContext.request.contextPath}/resources/images/user.png">
								 -->
							<img class="userImage" alt="user"
								src="${pageContext.request.contextPath}/uploads/profile/${dto.profileImg}">
						</div>
					</div>
					<div class="profile-userBasicInfo">
						<div class="profile-userName">
							<span> ${sessionScope.member.userName!=null? sessionScope.member.userName : "이경태"}
							</span>
						</div>
						<div class="profile-follow">
							<span> <a href="">팔로워 1</a> | <a href="">팔로잉 10</a>
							</span>
						</div>
						<div class="profile-update-userBasicInfo profile-center">
							<button class="btn btn-default" type="button"
								onclick="sendUpdate();">내 정보 수정</button>
							<input type="hidden" name="userId"
								value="${sessionScope.member.userId}">

							<button class="btn btn-default" type="button"
								onclick="sendDelete();">회원 탈퇴</button>
						</div>
					</div>
					<div class="profile-like">
						<div class="profile-like-container">
							<div>
								<span>좋아요</span> <span>스크랩</span>
							</div>
						</div>
					</div>

				</div>
			</div>

			<div class="mypage-right">
				<div class="mypage-heading">
					<h2 class="heading">My Contents</h2>
				</div>
				<div class="mypage-contents">
					<div class="mypage-content">
						<div class="mypage-content-item"
							onclick="location.href='${pageContext.request.contextPath}/';">
							<div class="hexagon">
								<!-- 아이콘 색 : #686868 -->
								<span><img class="items"
									src="${pageContext.request.contextPath}/resources/images/myCookingDiary.png"></span>
							</div>
							<div class="hexagon-title">
								<span>우리집 냉장고</span>
							</div>
						</div>
					</div>
					<div class="mypage-content">
						<div class="mypage-content-item"
							onclick="location.href='${pageContext.request.contextPath}/';">
							<div class="hexagon">
								<!-- 아이콘 색 : #686868 -->
								<span><img class="items"
									src="${pageContext.request.contextPath}/resources/images/myCookingDiary.png"></span>
							</div>
							<div class="hexagon-title">
								<span>마이 쿠킹다이어리</span>
							</div>
						</div>
					</div>
					<div class="mypage-content">
						<div class="mypage-content-item"
							onclick="location.href='${pageContext.request.contextPath}/';">
							<div class="hexagon">
								<span><img class="items"
									src="${pageContext.request.contextPath}/resources/images/exercise.png"></span>
							</div>
							<div class="hexagon-title">
								<span>하루 운동 챌린지</span>
							</div>
						</div>
					</div>
					<div class="mypage-content">
						<div class="mypage-content-item"
							onclick="location.href='${pageContext.request.contextPath}/';">
							<div class="hexagon">
								<span><img class="items"
									src="${pageContext.request.contextPath}/resources/images/homeCheck.png"></span>
							</div>
							<div class="hexagon-title">
								<span>부동산 체크리스트</span>
							</div>
						</div>
					</div>
					<div class="mypage-content">
						<div class="mypage-content-item"
							onclick="location.href='${pageContext.request.contextPath}/';">
							<div class="hexagon">
								<span><img class="items"
									src="${pageContext.request.contextPath}/resources/images/fashion.png"></span>
							</div>
							<div class="hexagon-title">
								<span>내 옷 자랑</span>
							</div>
						</div>
					</div>
					<div class="mypage-content">
						<div class="mypage-content-item"
							onclick="location.href='${pageContext.request.contextPath}/';">
							<div class="hexagon">
								<span><img class="items"
									src="${pageContext.request.contextPath}/resources/images/living-room.png"></span>
							</div>
							<div class="hexagon-title">
								<span>우리집 자랑</span>
							</div>
						</div>
					</div>
					<div class="mypage-content">
						<div class="mypage-content-item"
							onclick="location.href='${pageContext.request.contextPath}/';">
							<div class="hexagon">
								<span><img class="items"
									src="${pageContext.request.contextPath}/resources/images/meditation.png"></span>
							</div>
							<div class="hexagon-title">
								<span>찜 목록</span>
							</div>
						</div>
					</div>
					<div class="mypage-content">
						<div class="mypage-content-item"
							onclick="location.href='${pageContext.request.contextPath}/';">
							<div class="hexagon">
								<span><img class="items"
									src="${pageContext.request.contextPath}/resources/images/meditation.png"></span>
							</div>
							<div class="hexagon-title">
								<span>건강미 자랑</span>
							</div>
						</div>
					</div>
				</div>
				<div class="mypage-recent">
					<div class="myQna-content">
						<h2 class="heading">My QNA</h2>
						<div class="mypage-recent-contentBox">여기에 최근 질문글 내용 가져오기</div>
					</div>

					<div class="dontknow-content">
						<h2 class="heading">My ???</h2>
						<div class="mypage-recent-contentBox">또 가져오고 싶은 게시판 글 가져오기..</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</form>