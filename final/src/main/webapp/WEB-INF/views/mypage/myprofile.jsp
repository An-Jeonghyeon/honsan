<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/mypage2.css">


<style>

.updateF{
	width: 80%;
	height: 80%;
	background: yellow;
	margin: 0 auto;
}

.userImage{
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
$(function(){
	$('.myMessage').on('keyup', function() {
	
		if($(this).val().length > 28) {
	
			alert("글자수는 112byte로 제한됩니다.");
	
			$(this).val($(this).val().substring(0, 28));
	
		}
	
	});

});

function sendProfileUpdate(){
	
	f = document.sendProfile_F;
	
	f.action = "${pageContext.request.contextPath}/mypage/profileUpdate";
	f.submit();
}


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
	var url="${pageContext.request.contextPath}/interiorTip/deleteMainFile";
	$.post(url, {userId:userId}, function(data){
		//다른 제이쿼리에 삭제를 넣어놈 
	}, "json");
}
</c:if>

</script>
<form name="sendProfile_F" method="post" enctype="multipart/form-data">
<div class="main-content-container">
		<div class="mypage-left">
				<div class="mypage-left-container">
					<div class="profile-image">
						<div class="profile-image-box" >
								<!-- 유저 프로필 이미지 -->
								<!-- 
								<img class="userImage" alt="user"
								src="${pageContext.request.contextPath}/resources/images/user.png">
								 -->
								 <img class="userImage" alt="user"
								src="${pageContext.request.contextPath}/uploads/profile/${dto.profileImg}">
						</div>
							<div class="mainImg_append">
				                <input id="mainImg_upload" type="file" name="profileUpload"  onchange="javascript:deleteMainFile('${dto.userId}');"> <!-- 다운받아져있는 이미지넣는다  -->
				                <input type="text" value="${dto.profileImg}">
				            </div>
					</div>
					<div class="profile-userBasicInfo">
						<div class="profile-userName">
							<span>
							${sessionScope.member.userName!=null? sessionScope.member.userName : "또리"}
							</span>
						</div>
						<div class="profile-follow">
							
						</div>
						<div class="profile-update-userBasicInfo profile-center">
							<button class="btn btn-default" type="button" onclick="sendProfileUpdate();">프로필 수정 완료</button>
							
							<input type="hidden" name="userId" value="${dto.userId}">
							
						</div>				
					</div>
					<div class="profile-like">
						<div class="profile-like-container">
							<div>
								<span>상태 메세지</span>
							</div>
							<textarea name="profileMsg" class="profileMsg">${dto.profileMsg}</textarea>
						</div>
					</div>
			
				</div>
		</div>
	
		<div class="mypage-right-update" >
			<div class="updateF">
				
			</div>
		</div>
	</div>
</form>