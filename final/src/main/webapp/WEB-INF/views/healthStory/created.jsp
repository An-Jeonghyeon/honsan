<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/health/healthStoryCreated.css" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">

<script>
function created(){
	var f = document.healthStoryForm;
	
	 f.action = "${pageContext.request.contextPath}/healthStory/${mode}";
	 f.submit();
}
</script>

<script type="text/javascript">
$(function(){
	$("form input[name=upload]").change(function(){
		if(! $(this).val()) return;
		
		var b=false;
		$("form input[name=upload]").each(function(){
			if(! $(this).val()) {
				b=true;
				return;
			}
		});
		if(b) {
			return false;
		}
			
		var $div = $(this).closest(".insta-file").clone(true); 
		$div.find("input").val("");
		$(".imgplus").append($div);
	});
});
</script>
<section>
    <div class="insta_box">
        <div class= 'containerinsta'>
            <div class="container_contentinsta">
	            <div class="container_content_innerinsta">
		            <div class="titleinsta">
		              <span>오늘 운동을 보여줘</span>
		            </div>
		            <div class="parinsta">
			            <p>
			                	오늘의 운동을 인증해주세요! 
			                <br>내가 운동한 장소를 올려도 되고, 야외 운동을 했다면 오늘의 하늘을 올려도 좋겠네요!
			                <br>나의 오늘 운동을 기록해보세요!
			            </p>
                        <div class="btnsinsta">
        			   		 <button class='btns_moreinsta' onclick="javascript:location.href='${pageContext.request.contextPath}/healthStory/list';">작성 취소</button>
           				 </div>
		            </div>
	            </div>
            </div>
             <div class="container_outer_imginsta">
				<form method="post" name="healthStoryForm" enctype="multipart/form-data">
		        <div class = "insta_box2">
					<div class="insta_top">
		                <!-- 작성자 프로필 사진  -->
			            <div class="userImg">
			                <img src="${pageContext.request.contextPath}/uploads/profile/${dto.profileImg}"
			                	onerror="this.src='${pageContext.request.contextPath}/resources/images/health/oh.jpg'">
			            </div>
			            <!-- 아이디 -->
			            <div class="top_right">
			                <div class="userIddiv">
			                    ${sessionScope.member.userName}
			                </div>
			            </div>
		       		 </div>
			        <!-- 메인 사진  -->
			        <div class="instaContent">
			                <textarea class="insta-textarea" name="content" id="content" placeholder="내용을 입력해주세요"></textarea>                
			        </div>
				    <!-- 파일 -->
				    <div class="imgplus">
				    <div  class ="insta-file">
				        <div class="likebox">
				            <input type="file" name="upload" multiple="multiple">
				        </div>
				    </div>
				    </div>
		
				    <div class = "reviewwirte">
				        <button type="button" class="gosubmit" onclick="created();">등록</button>
				    </div>
		   	    </div> <!--두번쨰div-->
		   	    </form>
             </div>
        </div>
        <div class="overlayinsta"></div>
            <!-- 여기까지  -->

	</div>
</section>