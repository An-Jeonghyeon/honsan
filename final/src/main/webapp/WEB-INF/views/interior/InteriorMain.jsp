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
	<table class="interior_box">

	     <c:forEach var="dto" items="${list}" varStatus="status">
	     	<c:if test="${status.index==0}">
	        	<tr class="interior_object">
            </c:if>
            <c:if test="${status.index!=0 && status.index%4==0}">
                <c:out value="</tr><tr class='interior_object'>" escapeXml="false"/>
            </c:if>
	            <!-- 모든 속성들을 담고있는 div  -->
	            <td class="interior_atr">
	            	<!-- 총제목  -->
	                <div class="interior_subject">
	                	<!-- 작성자 프로필 사진  -->
	                    <div class="interior_subject_user_img">
	                        <a href="${pageContext.request.contextPath}/interior/mList?userId=${dto.userId}">
	                        	<img src="${pageContext.request.contextPath}/uploads/profile/${dto.profileImg}">
	                        </a>
	                    </div>
	                    <!-- 아이디 , 좋아요  및 게시판 제목  -->
	                    <div class="interior_subject_id_title">
	                                <div class="interior_subject_userId">
	                                    <a class="interior_subject_userId_idTag">${dto.userName}</a>
	                                    ·<a class="interior_subject_userId_likeTag"> 팔로우 </a>
	                                </div>
	                                <div class="interior_subject_subject">
	                                    ${dto.subject}
	                                </div>
	                    </div>
	                </div>
	                <!-- 메인 사진  -->
	                <div class="interior_object_mainImg">
	                    <a href="${articleUrl}&num=${dto.num}"><img src="${pageContext.request.contextPath}/uploads/interior/${dto.mainImg}" ></a>
	                    
	                </div>
	                <!-- 카운트 숫자 게시판 (찜 , 댓글 , 좋아요 )  -->
	                <div class="interior_counts">
	                    <button type="button" class="interior_counts_box"  >
	                        <!-- 게시물 찜 -->
	                        <img src="${pageContext.request.contextPath}/resources/images/interior/h5.png">
	                        <span> 101</span>
	                    </button>
	                    <button type="button" class="interior_counts_box" onclick="javascript:location.href='${articleUrl}&num=${dto.num}';">
	                        <!-- 댓글 수 -->
	                        <img src="${pageContext.request.contextPath}/resources/images/interior/h1.png">
	                        <span> ${dto.replyCount}</span>
	                    </button>
	                    <button type="button" class="interior_counts_box" onclick="javascript:location.href='${articleUrl}&num=${dto.num}';">
	                        <!--  좋아요 수  -->
	                        <img src="${pageContext.request.contextPath}/resources/images/interior/h2.png">
	                        <span> ${dto.interiorLikeCount}</span>
	                    </button>
	                    
	                </div>
	                <!-- 게시판 내용  -->
	                <div class="interior_content">
	                    ${dto.content}
	                </div>
	                <!-- 다른유저 아이디 및 댓글  -->
	                <div class="interior_first_review">
	                    <div class="interior_first_review_img">
	                        <img class="" src="${pageContext.request.contextPath}/uploads/profile/${dto.replyProfileImg}" >
	                    </div>
	                    <div class="interior_first_review_content">
	                        <a>${dto.replyuserId}</a> ${dto.replycontent}
	                    </div>
	                </div>
	            </td>
	        
		</c:forEach>
    </table>
      <table style="width: 100%; border-spacing: 0px;">
         <tr height="35">
            <td align="center">
               ${dataCount==0?"등록된 게시물이 없습니다.":paging}
            </td>
         </tr>
      </table>
    <div class="floating-write" onclick="javascript:location.href='${pageContext.request.contextPath}/interior/created';">
        <div class="f-div">
             <div class="floating-image"></div>
             <p> 인테리어<br> 추가</p>
        </div>
    </div>
</section>