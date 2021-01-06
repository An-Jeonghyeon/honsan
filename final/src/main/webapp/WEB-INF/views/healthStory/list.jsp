<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/health/healthStory.css" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">

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
                	현대인에게 운동은 선택이 아니라 필수!
                <br>오늘 의 운동을 다른 사람들과 공유해주세요
            </p>
            </div>
            <div class="btnsinsta">
            <button class='btns_moreinsta'>오늘 운동 인증하기</button>
            </div>
            </div>
            </div>
             <div class="container_outer_imginsta">
             <div class="img-innerinsta">
             <img src='${pageContext.request.contextPath}/resources/images/health/run.jpg' class="container_imginsta"/>
                   </div>
                 </div>
              </div>
            <div class="overlayinsta"></div>
            <!-- 여기까지  -->

        <div class = "insta_box2">
            <div class="insta_top">
                <!-- 작성자 프로필 사진  -->
            <div class="userImg">
                <img src="${pageContext.request.contextPath}/uploads/profile/${dto.profileImg}">
            </div>
            <!-- 아이디 -->
            <div class="top_right">
                <div class="userIddiv">
                    ${dto.userName}
                </div>
            </div>
        </div>
        <!-- 메인 사진  -->
        <div class="imgup">
            <img src="${pageContext.request.contextPath}/uploads/interior/${dto.mainImg}" ></a>
        </div>
    <!-- 좋아요줄  -> 누르면 좋아요만 되도록.. -->
    <div  class ="likeplusbtn">
        <div class="likebox">
            <div><i class="far fa-heart fa-2x"></i></div>
        </div>
        <div class = "updatedelete"> 
            <button type="button" class="updatebtnn">수정</button>
            <button type="button" class="deletebtnn">삭제</button>
        </div>
    </div>
    <!-- 좋아요 갯수-->
    <div class="likeCountdiv">
        10명이 좋아합니다
    </div>
    <div class="contentdivv">
        <b>아이디</b> 내용 
    </div>
    <!-- 다른유저 아이디 및 댓글  -->
    <div class="reviewdiv">
        <div class="reviewcontent">
            <b>${dto.replyuserId}</b>  ${dto.replycontent}
            <br>댓글 더보기
        </div>
    </div>
    <div class="createdDate">
        <p>2020.01.22</p>
    </div>
    <div class = "reviewwirte">
        <input type="text"  class ="reviewinput" placeholder="댓글 쓰기">
        <button type="button" class="reviewinputbtn">등록</button>
    </div>
    </div> <!--두번쨰div-->
</div>
</section>