<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/interior/interior.css" type="text/css">

<script type="text/javascript">
    $(document).ready(function() {
    
        var floatPosition = parseInt($(".floating-write").css('top'));
        
        $(window).scroll(function() {
            var scrollTop = $(window).scrollTop();
            var newPosition = scrollTop + floatPosition + "px";
            
            $(".floating-write").stop().animate({
                "top" : newPosition
            }, 1);
    
        }).scroll();
    });
</script>

<section>
	<div class="interior_box">

        <div class="interior_object">
            <!-- 모든 속성들을 담고있는 div  -->
            <div class="interior_atr">
            	<!-- 총제목  -->
                <div class="interior_subject">
                	<!-- 작성자 프로필 사진  -->
                    <div class="interior_subject_user_img">
                        <img src="${pageContext.request.contextPath}/resources/images/interior/a1.jpg">
                    </div>
                    <!-- 아이디 , 좋아요  및 게시판 제목  -->
                    <div class="interior_subject_id_title">
                                <div class="interior_subject_userId">
                                    <a class="interior_subject_userId_idTag">2yujin22</a>
                                    ·<a class="interior_subject_userId_likeTag"> 좋아요 </a>
                                </div>
                                <div class="interior_subject_subject">
                                    작지만 소중한 우리집 @2yujin22
                                </div>
                    </div>
                </div>
                <!-- 메인 사진  -->
                <div class="interior_object_mainImg">
                    <a href="${pageContext.request.contextPath}/interior/boardItem"><img src="${pageContext.request.contextPath}/resources/images/interior/a1.jpg" ></a>
                    
                </div>
                <!-- 카운트 숫자 게시판 (찜 , 댓글 , 좋아요 )  -->
                <div class="interior_counts">
                    <button class="interior_counts_box">
                        <!-- 게시물 찜 -->
                        <img src="${pageContext.request.contextPath}/resources/images/interior/h5.png">
                        <span> 101</span>
                    </button>
                    <button class="interior_counts_box">
                        <!-- 댓글 수 -->
                        <img src="${pageContext.request.contextPath}/resources/images/interior/h1.png">
                        <span> 188</span>
                    </button>
                    <button class="interior_counts_box">
                        <!--  좋아요 수  -->
                        <img src="${pageContext.request.contextPath}/resources/images/interior/h2.png">
                        <span> 18</span>
                    </button>
                </div>
                <!-- 게시판 내용  -->
                <div class="interior_content">
                    크리스마스 분위기로 바꿔봤어요~ 그린은 워낙 많아서 빨간~ 쿠션추가하고 작은 미니트리를 들였어요
                </div>
                <!-- 다른유저 아이디 및 댓글  -->
                <div class="interior_first_review">
                    <div class="interior_first_review_img">
                        <img class="" src="${pageContext.request.contextPath}/resources/images/interior/a1.jpg" >
                    </div>
                    <div class="interior_first_review_content">
                        <a>지뚜9092</a>삐롱 혹시 빨간 쿠션 정보도 알수 있을까요 ? 크리스마스 인테리어 너무 좋네요 ㅠ ㅠ
                    </div>
                </div>
            </div>
        </div>

        <div class="interior_object">
            <div class="interior_atr">
                <div class="interior_subject">
                    <div class="interior_subject_user_img">
                        <img src="${pageContext.request.contextPath}/resources/images/interior/a1.jpg">
                    </div>
                    <div class="interior_subject_id_title">
                                <div class="interior_subject_userId">
                                    <a class="interior_subject_userId_idTag">2yujin22</a>
                                    ·<a class="interior_subject_userId_likeTag"> 좋아요 </a>22222222222222222222222222222222222222222222222222
                                </div>
                                <div class="interior_subject_subject">
                                    작지만 소중한 우리집 @2yujin22 22222222222222222222222222222222222222222222
                                </div>
                    </div>
                </div>
                <div class="interior_object_mainImg">
                    <img src="${pageContext.request.contextPath}/resources/images/interior/a1.jpg" >
                    
                </div>
                <div class="interior_counts">
                    <button class="interior_counts_box">
                        <!-- 게시물 찜 -->
                        <img src="${pageContext.request.contextPath}/resources/images/interior/h5.png">
                        <span> 101</span>
                    </button>
                    <button class="interior_counts_box">
                        <!-- 댓글 수 -->
                        <img src="${pageContext.request.contextPath}/resources/images/interior/h1.png">
                        <span> 188</span>
                    </button>
                    <button class="interior_counts_box">
                        <!--  좋아요 수  -->
                        <img src="${pageContext.request.contextPath}/resources/images/interior/h2.png">
                        <span> 18 k</span>
                    </button>
                </div>
                <div class="interior_content">
                    크리스마스 분위기로 바꿔봤어요~ 그린은 워낙 많아서 빨간~ 쿠션추가하고 작은 미니트리를 들였어요 
                    가가가가가가가ㅏ가가가가가가가가가가가가가가가가가가ㅏ가가가가가가
                </div>
                <div class="interior_first_review">
                    <div class="interior_first_review_img">
                        <img class="" src="${pageContext.request.contextPath}/resources/images/interior/a1.jpg" >
                    </div>
                    <div class="interior_first_review_content">
                        <a>지뚜9092</a>삐롱 혹시 빨간 쿠션 정보도 알수 있을까요 ? 크리스마스 인테리어 너무 좋네요 ㅠ ㅠ
                    </div>
                </div>
            </div>
        </div>

        <div class="interior_object">
            <div class="interior_atr">
                <div class="interior_subject">
                    <div class="interior_subject_user_img">
                        <img src="${pageContext.request.contextPath}/resources/images/interior/a1.jpg">
                    </div>
                    <div class="interior_subject_id_title">
                                <div class="interior_subject_userId">
                                    <a class="interior_subject_userId_idTag">2yujin22</a>
                                    ·<a class="interior_subject_userId_likeTag"> 좋아요 </a>
                                </div>
                                <div class="interior_subject_subject">
                                    작지만 소중한 우리집 @2yujin22
                                </div>
                    </div>
                </div>
                <div class="interior_object_mainImg">
                    <img src="${pageContext.request.contextPath}/resources/images/interior/a1.jpg" >
                    
                </div>
                <div class="interior_counts">
                    <button class="interior_counts_box">
                        <!-- 게시물 찜 -->
                        <img src="${pageContext.request.contextPath}/resources/images/interior/h5.png">
                        <span> 101</span>
                    </button>
                    <button class="interior_counts_box">
                        <!-- 댓글 수 -->
                        <img src="${pageContext.request.contextPath}/resources/images/interior/h1.png">
                        <span> 188</span>
                    </button>
                    <button class="interior_counts_box">
                        <!--  좋아요 수  -->
                        <img src="${pageContext.request.contextPath}/resources/images/interior/h2.png">
                        <span> 18</span>
                    </button>
                </div>
                <div class="interior_content">
                    크리스마스 분위기로 바꿔봤어요~ 그린은 워낙 많아서 빨간~ 쿠션추가하고 작은 미니트리를 들였어요
                </div>
                <div class="interior_first_review">
                    <div class="interior_first_review_img">
                        <img class="" src="${pageContext.request.contextPath}/resources/images/interior/a1.jpg" >
                    </div>
                    <div class="interior_first_review_content">
                        <a>지뚜9092</a>삐롱 혹시 빨간 쿠션 정보도 알수 있을까요 ? 크리스마스 인테리어 너무 좋네요 ㅠ ㅠ
                    </div>
                </div>
            </div>
        </div>

        <div class="interior_object">
            <!-- 모든 속성들을 담고있는 div  -->
            <div class="interior_atr">
            	<!-- 총제목  -->
                <div class="interior_subject">
                	<!-- 작성자 프로필 사진  -->
                    <div class="interior_subject_user_img">
                        <img src="${pageContext.request.contextPath}/resources/images/interior/a1.jpg">
                    </div>
                    <!-- 아이디 , 좋아요  및 게시판 제목  -->
                    <div class="interior_subject_id_title">
                                <div class="interior_subject_userId">
                                    <a class="interior_subject_userId_idTag">2yujin22</a>
                                    ·<a class="interior_subject_userId_likeTag"> 좋아요 </a>
                                </div>
                                <div class="interior_subject_subject">
                                    작지만 소중한 우리집 @2yujin22
                                </div>
                    </div>
                </div>
                <!-- 메인 사진  -->
                <div class="interior_object_mainImg">
                    <img src="${pageContext.request.contextPath}/resources/images/interior/a1.jpg" >
                    
                </div>
                <!-- 카운트 숫자 게시판 (찜 , 댓글 , 좋아요 )  -->
                <div class="interior_counts">
                    <button class="interior_counts_box">
                        <!-- 게시물 찜 -->
                        <img src="${pageContext.request.contextPath}/resources/images/interior/h5.png">
                        <span> 101</span>
                    </button>
                    <button class="interior_counts_box">
                        <!-- 댓글 수 -->
                        <img src="${pageContext.request.contextPath}/resources/images/interior/h1.png">
                        <span> 188</span>
                    </button>
                    <button class="interior_counts_box">
                        <!--  좋아요 수  -->
                        <img src="${pageContext.request.contextPath}/resources/images/interior/h2.png">
                        <span> 18</span>
                    </button>
                </div>
                <!-- 게시판 내용  -->
                <div class="interior_content">
                    크리스마스 분위기로 바꿔봤어요~ 그린은 워낙 많아서 빨간~ 쿠션추가하고 작은 미니트리를 들였어요
                </div>
                <!-- 다른유저 아이디 및 댓글  -->
                <div class="interior_first_review">
                    <div class="interior_first_review_img">
                        <img class="" src="${pageContext.request.contextPath}/resources/images/interior/a1.jpg" >
                    </div>
                    <div class="interior_first_review_content">
                        <a>지뚜9092</a>삐롱 혹시 빨간 쿠션 정보도 알수 있을까요 ? 크리스마스 인테리어 너무 좋네요 ㅠ ㅠ
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="floating-write" onclick="javascript:location.href='${pageContext.request.contextPath}/interior/created';">
        <div class="f-div">
             <div class="floating-image"></div>
             <p> 인테리어<br> 추가</p>
        </div>
    </div>
</section>