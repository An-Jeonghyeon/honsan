<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/interior/interior.css" type="text/css">

<style>

#curBox_sub{
	border: 1px solid #35c5f0;
	background:  #35c5f0;
	color: white;
	border-radius: 4px;
	font-weight: 700;
	font-size: 15px;
	font-weight:bold;
	height:28px;
	padding:4px 7px 4px 7px;
	margin-left:3px;
	line-height:normal;
	vertical-align:middle;
}


#numBox_sub{
	font-size: 15px;
	border : none;
	color : #424242;
	height:28px;
	font-weight:bold;
	text-decoration:none;
	padding:4px 7px 4px 7px;
	margin-left:3px;
	line-height:normal;
	vertical-align:middle;
}

#tlBox{
	font-size: 15px;
	border : none;
	border:1px solid #ccc;
	height:28px;color:#000000;
	text-decoration:none;
	padding:4px 10px 4px 10px;
	margin-left:3px;
	margin-right : 20px;
	line-height:normal;
	vertical-align:middle;
	outline:none; 
	border-radius: 4px;
}

#trBox{
	font-size: 15px;
	border : none;
	border:1px solid #ccc;
	height:28px;color:#000000;
	text-decoration:none;
	padding:4px 10px 4px 10px;
	margin-left:20px;
	margin-right : 3px;
	line-height:normal;
	vertical-align:middle;
	outline:none; 
	border-radius: 4px;
	
}


.exbar{
 height: 320px;
 background: url("${pageContext.request.contextPath}/resources/images/interior/interiorbanner.png");
 background-position: 50%;
 
 padding-left: 400px;
 padding-top: 80px;
 z-index: -1;
 pointer-events:none;
}
.search_bar{
	width: 100%;
	height: 60px;
	position: sticky;
	top: 0;
	background: white;
	border-bottom: 1px solid #dbdbdb;
	border-top: 1px solid #dbdbdb;
	
}

.search_bar_box{
	
	width: 1200px;
	height: 100%;
	margin: 0 auto;
	
}

.search_bar_box_right{
	
	height: 100%;
	width: 30%;
	float: right;
	
}
.search_bar_box_right_sub{
	float: right;
	height: inherit;
	width: 80%;
	padding-bottom: 8px;
	box-sizing: border-box;
}

.search_bar_input{
	width: 70%;
	height: 75%;
	margin-top: 10px;
	border-radius: 4px;
	border: 1px solid #dbdbdb;
	
	
}

.search_bar_button{
	width: 25%;
	height: 80%;
	margin-top: 10px;
	border-radius: 4px;
	border: 1px solid #35c5f0;
	background: #35c5f0;
	color: white;
	font-weight: 700;
	font-size: 20px;
	
}


/* 광고 배너 판  */

.exfont {

  font-family: 'Arial';
  color: black;
  text-transform: uppercase;
  font-weight: bold;
  font-size: 4.5rem;
  line-height: 0.75;
  
  
}

.spanEx {
  display: block;

  
}

.spanEx:not(.light) {
  opacity: 0;
  animation: flashText .5s ease-out alternate infinite;
}

.spanEx:hover{
	pointer-events:none;
}

.spanEx.light {
  position: relative;
  display: inline-block;
  
  &:before {
    position: absolute;
    left: 0;
    top: -10%;
    width: 100%;
    height: 120%;
    background: #fff;
    filter: blur(10px);
    content: "";
    opacity: 0;
    animation: flash .5s ease-out alternate infinite;
  }
}

@keyframes flash{
  to {
    opacity: 1;
    
  }
}

@keyframes flashText {
  to {
    opacity: 0.15;
    
  }
}


</style>
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
    
$(function(){
	$(".search_bar_button").click(function(){
		var keyword = $(".search_bar_input").val();
		var page = ${page};
		var query = "?keyword="+keyword+"&page="+page;
		
		location.href="${pageContext.request.contextPath}/interior/main"+query;
		
	});
});
</script>



<section>
	<div class="exbar">
		<h2 class="exfont">
		  <span class="spanEx">Welcome</span>  
		  <span class="spanEx">to the</span>  
		  <span class="light">INTERIOR</span> 
		  <span class="spanEx"> word</span> 

		</h2>
	</div>
	<div class="search_bar">
		<div class="search_bar_box">
			<div class="search_bar_box_right">
				<div class="search_bar_box_right_sub">
				<input type="text" name="keyowrd" class="search_bar_input" placeholder="&nbsp;인테리어 통합검색">
				<button type="button" class="search_bar_button">검색</button>
				</div>
			</div>
		</div>
	</div>
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
	                    <button type="button" class="interior_counts_box" onclick="javascript:location.href='${articleUrl}&num=${dto.num}';">
	                        <!-- 게시물 찜 -->
	                        <img src="${pageContext.request.contextPath}/resources/images/interior/h5.png">
	                        <span> ${dto.interiorZzimCount}</span>
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