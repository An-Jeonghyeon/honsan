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

.profileMsg{
	width : 200px;
	text-overflow: ellipsis;
	white-space: normal;
	height: 3em;
}
</style>
<script>
	function sendUpdate() {
		f = document.mypage_profile;

		f.action = "${pageContext.request.contextPath}/mypage/updateForm";
		f.submit();
	};
	
	function memberUpdate() {
		location.href = '${pageContext.request.contextPath}/member/update?userId=${dto.userId}';

	};
	
	
	$(function () {
	    var sel_files = [];

	    $("body").on("change", "#mainImg_upload", function (e) {
	        
	        $(".userImage").remove();
	        //$("#mainImg_upload").parent().prependTo().css("background","none");
	        
	        // 사진이 없으면 ! 이거 표시 할수있으려나 
	        // $("#ex7").firstChild().css("background", url('camera1.png'));

	        var files = e.target.files;
	        var filesArr = Array.prototype.slice.call(files);
	        
	        filesArr.forEach(function (f ) {
	            // 이미지 파일이 아닌경우
	            if (!f.type.match("image.*")) {
	                return;
	            }             
	            sel_files.push(f);
	            
	            var reader = new FileReader();
	            reader.onload = function (e1 ) {
	                
	                var out = "<img class='userImage' alt='user'src='" + e1.target.result + "'>" ;
	               

	                $(".profile-image-box").append(out);
	            }
	            
	            reader.readAsDataURL(f);
	        });

	    });


	});





	
	function ajaxJSON(url, method, query, fn) {
		$.ajax({
			type:method
			,url:url
			,data:query
			,dataType:"json"
			,success:function(data) {
				fn(data);
			}
			,beforeSend:function(jqXHR) {
		        jqXHR.setRequestHeader("AJAX", true);
		    }
		    ,error:function(jqXHR) {
		    	if(jqXHR.status===403) {
		    		login();
		    		return false;
		    	}
		    	
		    	console.log(jqXHR.responseText);
		    }
		});
	}

	<c:if test="${mode=='update'}">

	function deleteMainFile(userId) {
		var url="${pageContext.request.contextPath}/mypage/deleteMainFile";
		$.post(url, {userId:userId}, function(data){
			//다른 제이쿼리에 삭제를 넣어놈 
		}, "json");
	}
	</c:if>
	
	
	$(function(){
		$('.profileMsg').on('keyup', function() {
		
			if($(this).val().length > 28) {
		
				alert("글자수는 112byte로 제한됩니다.");
		
				$(this).val($(this).val().substring(0, 28));
		
			}
		
		});

	});

		
	function sendProfileUpdate(){
		
		f = document.mypage_profile;
		
		f.action = "${pageContext.request.contextPath}/mypage/profileUpdate";
		f.submit();
	}
	
	
</script>



<form name="mypage_profile" method="post" enctype="multipart/form-data">
	<div class="main-content-container">
		<div class="mypage-top"></div>
		<div class="mypage-both">
			<div class="mypage-left">
				<div class="mypagetext">
					<span>My<br>Page</span>
				</div>
				<div class="mypage-left-container">
				
					<div class="profile-image">
						<div class="profile-image-box">
							<!-- 유저 프로필 이미지 -->
							<!-- 
								<img class="userImage" alt="user"
								src="${pageContext.request.contextPath}/resources/images/user.png">
								 -->
							<img class="userImage" alt="user"
								src="${pageContext.request.contextPath}/uploads/profile/${dto.profileImg}"
								onerror="this.src='${pageContext.request.contextPath}/resources/images/mypage/user.png'">
						</div>
						<c:if test="${mode=='update'}">
							<input id="mainImg_upload" type="file" name="profileUpload"  onchange="javascript:deleteMainFile('${dto.userId}');">
						</c:if>
					</div>
					<div class="profile-userBasicInfo">
						<div class="profile-userName">
							<span> ${sessionScope.member.userName!=null? sessionScope.member.userName : "이경태"}
							</span>
						</div>
						<div class="profile-follow">
							</span>
						</div>
						<div class="profile-update-userBasicInfo profile-center">
							<c:if test="${mode=='created'}">
								<button class="btn btn-default" type="button"
									onclick="sendUpdate();">프로필 수정</button>
								<button class="btn btn-default" type="button"
									onclick="memberUpdate();">정보 수정</button>
								<input type="hidden" name="userId"
									value="${sessionScope.member.userId}">
	
								<button class="btn btn-default" type="button"
									onclick="sendDelete();">회원 탈퇴</button>
							</c:if>
							
							<c:if test="${mode=='update'}">
								<button class="btn btn-default" type="button"
									onclick="sendProfileUpdate();" >수정 완료</button>
								<input type="hidden" name="userId"
									value="${sessionScope.member.userId}">
	
								<button class="btn btn-default" type="button"
									onclick="javascript:location.href='${pageContext.request.contextPath}/mypage/main'">수정 취소</button>
							</c:if>		
						</div>
					</div>
					<div class="profile-like">
						<div class="profile-like-container">
							<div>
								<c:if test="${mode=='update'}">
									<span>상대 메세지</span>
								</c:if>
							</div>
								<c:if test="${mode=='update'}">
									<textarea name="profileMsg" class="profileMsg">${dto.profileMsg}</textarea>
								</c:if>
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