<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.fa-thumbs-up {
	color: #35c5f0;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/interior/boardItem.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/interior/boardItem.js"></script>
<script>

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
$(function(){
	if($("#interiorLikeCount").attr("data-userLike")=="1") { // 데이터값이 1이면 
		$("#thumbs").removeClass("far").addClass("fas"); // 클래스명 삭제 , 삽입으로 변경 
	}


	$(".btnSendInteriorLike").click(function(){
		var userLike=$("#interiorLikeCount").attr("data-userLike"); // 스팬 데이터값이 0이면 
		if(userLike=="0") {
			var url="${pageContext.request.contextPath}/interior/insertInteriorLike";
			var num="${dto.num}"; 
			// var query={num:num}; 이렇게 써도 아래와 같은 의미
			var query="num="+num; 
			// ajoxjson 좋아요 +1 DB작업 처리 후 결과를 state 에 반환 
			var fn = function(data){
				var state=data.state;
				if(state==="true") {
					var count = data.interiorLikeCount;
					$("#interiorLikeCount").text(count);
					$("#interiorLikeCount").attr("data-userLike", "1"); //삽입후 이미지변경을위해 1로 변경
					$("#thumbs").removeClass("far").addClass("fas"); // 1로변경되었으니 이미지 변경 
					
				} else if(state==="false") {					
					alert("좋아요 추가에 문제가 발생했습니다.");
				}
			};		
		} else {			//이미 좋아요가 눌려져있을경우 , 데이터가 1인경우 
			var url="${pageContext.request.contextPath}/interior/deleteInteriorLike";
			var num="${dto.num}";
			var query="num="+num;
			//	좋아요 -1 DB작업 처리 후 결과를 state 에 반환 
			var fn = function(data){
				var state=data.state;
				if(state==="true") {
					var count = data.interiorLikeCount;
					$("#interiorLikeCount").text(count);
					$("#interiorLikeCount").attr("data-userLike", "0"); //취소 후 라서 1을 0으로 변경
					$("#thumbs").removeClass("fas").addClass("far"); // 이미지도 변경 
	
				} else if(state==="false") {
					alert("좋아요 삭제에 문제가 발생했습니다.");
				}
			};								
		}	
		ajaxJSON(url, "post", query, fn);   
	});
	
});


</script>
<section>
<form name="Interior_form" >
	
    <div class="board_interior_box">
        <div class="board_interior_leftbox">
            
            <!-- 게시판 제목 부분  -->
            <div class="board_interior_leftbox_header">
                <div class="leftbox_header_subject">
                    ${dto.subject}
                </div>
                <div class="leftbox_header_created">
                    ${dto.register_date}
                </div>
            </div>
            <!-- 메인 사진 -->   	
		            <div class="leftbox_mainImg">
		            
		                <a href="#"><img class="leftbox_mainImg_img" src="${pageContext.request.contextPath}/uploads/interior/${dto.mainImg}"></a>
		            </div>
		       
 
		            <!-- 서브 사진들 -->
		            <div class="leftbox_subImg">
		     <c:forEach var="fto" items="${flist}" begin="0" end="6" step="1">       
		                <div class="leftbox_subImg_obj">
		                    <!-- 서브 사진들 1  -->
		                    <a href=""><img class="leftbox_subImg_obj_sub" src="${pageContext.request.contextPath}/uploads/interior/${fto.saveFilename}"></a>
		                </div>
		        
           </c:forEach>            
					</div>
            <!-- 간단한 내용 -->
            <p class="leftbox_content">${dto.content}</p>
            
            <!-- # 태그가 있을시 for 문 돌려서 사용할것 ! -->
            <ul class="leftbox_tag_ul">
				<c:forEach var="tag" items="${categorylist}" varStatus="n">
               		<li class="leftbox_tag_li"><a class="leftbox_tag_li_a">${tag}</a></li>
				</c:forEach>
            </ul>

            <p class="leftbox_item_box_p">
                <span class="leftbox_item_box_span">조회수 ${dto.hitCount}</span>
                <span class="leftbox_item_box_span">댓글 64</span>
                <span class="leftbox_item_box_span">찜 58</span>
                <button class="leftbox_item_box_button">신고</button>
            </p>

            <div class="leftbox_comment_box">
                <div class="leftbox_comment_box_atr">
                    <h1>댓글&nbsp;<span>64</span></h1>
                

                <form class="leftbox_comment_insert">
                    <div class="leftbox_comment_userImg">
                        <img src="${pageContext.request.contextPath}/resources/images/interior/comment.png">
                    </div>
                    <div class="leftbox_comment_usercomment">
                        <div class="leftbox_comment_usercomment_input">
                            <div class="leftbox_comment_usercomment_input2">
                               <textarea placeholder="메모" onkeydown="resize(this)" onkeyup="resize(this)" class="comment_content"></textarea>
                            </div>
                        </div>
                        <div class="leftbox_comment_usercomment_button">
                            <button>등록</button>
                        </div>
                    </div>
                </form>
                <!-- 댓글 반복 구간  -->
                <ul class="comment_list_box">
                    <li class="comment_list_item">
                        <article class="comment_fild_item">
                            <p class="comment_fild_item_content">
                                <a href="#"><img src="${pageContext.request.contextPath}/resources/images/interior/t1.webp"><span>이 카드는</span></a>
                                <span>적절한 댓글에 무릎을 탁 치고 갑니다..!
                                    갬성에 마음이 눈녹듯 녹아버리네요..
                                </span>
                                <nav class="comment_fild_tfoot">
                                    <span style="font-size: 13px;" class="comment_fild_tfoot_span">8 시간전 </span>
                                    <span class="comment_fild_tfoot_like">
                                        <button class="comment_fild_tfoot_like_img"><img src="${pageContext.request.contextPath}/resources/images/interior/h5.png" alt=""></button>
                                        <span class="comment_fild_tfoot_like_count">1</span>
                                    </span>
                                    <button class="comment_fild_tfoot_like_count">좋아요 · </button>
                                    <button class="comment_fild_tfoot_like_count">답글 달기 · </button>
                                    <button class="comment_fild_tfoot_singo">신고</button>
                                </nav>

                            </p>
                        </article>
                        <div class="comment_reply_list">
                            <ul class="comment_reply_list_ul">
                                <!-- 답변의 답변 반복 구간  -->
                                <li class="comment_reply_list_li">
                                    <article class="comment_reply_list_item">
                                        <p class="comment_fild_item_content">
                                            <a href="#"><img src="${pageContext.request.contextPath}/resources/images/interior/t1.webp"><span>이 카드는</span></a>
                                            <span><a class="reply_idTag" href="#">@이카드는</a>&nbsp;적절한 댓글에 무릎을 탁 치고 갑니다..!
                                                갬성에 마음이 눈녹듯 녹아버리네요..
                                            </span>
                                            <nav class="comment_fild_tfoot">
                                                <span style="font-size: 13px;" class="comment_fild_tfoot_span">8 시간전 </span>
                                                <span class="comment_fild_tfoot_like">
                                                    <button class="comment_fild_tfoot_like_img"><img src="${pageContext.request.contextPath}/resources/images/interior/h5.png" alt=""></button>
                                                    <span class="comment_fild_tfoot_like_count">1</span>
                                                </span>
                                                <button class="comment_fild_tfoot_like_count">좋아요 · </button>
                                                <button class="comment_fild_tfoot_like_count">답글 달기 · </button>
                                                <button class="comment_fild_tfoot_singo">신고</button>
                                            </nav>
            
                                        </p>
                                    </article>
                                </li>

                            </ul>
                        </div>
                    </li>

                    <ul class="comment_list_box">
                        <li class="comment_list_item">
                            <article class="comment_fild_item">
                                <p class="comment_fild_item_content">
                                    <a href="#"><img src="${pageContext.request.contextPath}/resources/images/interior/t1.webp"><span>이 카드는</span></a>
                                    <span>적절한 댓글에 무릎을 탁 치고 갑니다..!
                                        갬성에 마음이 눈녹듯 녹아버리네요..
                                    </span>
                                    <nav class="comment_fild_tfoot">
                                        <span style="font-size: 13px;" class="comment_fild_tfoot_span">8 시간전 </span>
                                        <span class="comment_fild_tfoot_like">
                                            <button class="comment_fild_tfoot_like_img"><img src="${pageContext.request.contextPath}/resources/images/interior/h5.png" alt=""></button>
                                            <span class="comment_fild_tfoot_like_count">1</span>
                                        </span>
                                        <button class="comment_fild_tfoot_like_count">좋아요 · </button>
                                        <button class="comment_fild_tfoot_like_count">답글 달기 · </button>
                                        <button class="comment_fild_tfoot_singo">신고</button>
                                    </nav>
    
                                </p>
                            </article>
                            <div class="comment_reply_list">
                                <ul class="comment_reply_list_ul">
                                    <!-- 답변의 답변 반복 구간  -->
                                    <li class="comment_reply_list_li">
                                        <article class="comment_reply_list_item">
                                            <p class="comment_fild_item_content">
                                                <a href="#"><img src="${pageContext.request.contextPath}/resources/images/interior/t1.webp"><span>이 카드는</span></a>
                                                <span><a class="reply_idTag" href="#">@이카드는</a>&nbsp;적절한 댓글에 무릎을 탁 치고 갑니다..!
                                                    갬성에 마음이 눈녹듯 녹아버리네요..
                                                </span>
                                                <nav class="comment_fild_tfoot">
                                                    <span style="font-size: 13px;" class="comment_fild_tfoot_span">8 시간전 </span>
                                                    <span class="comment_fild_tfoot_like">
                                                        <button class="comment_fild_tfoot_like_img"><img src="${pageContext.request.contextPath}/resources/images/interior/h5.png" alt=""></button>
                                                        <span class="comment_fild_tfoot_like_count">1</span>
                                                    </span>
                                                    <button class="comment_fild_tfoot_like_count">좋아요 · </button>
                                                    <button class="comment_fild_tfoot_like_count">답글 달기 · </button>
                                                    <button class="comment_fild_tfoot_singo">신고</button>
                                                </nav>
                
                                            </p>
                                        </article>
                                    </li>
    
                                </ul>
                            </div>
                        </li>
     



                    <li class="comment_list_item"></li>


                    <!-- 페이징 처리  -->
                    <div class="comment_paging_box">
                        1 2 3
                    </div>
                </ul>

                </div>
                <article>

                </article>

            </div>


            
            
            
        </div>
            <div class="board_interior_rightbox">
                <div class="board_interior_userpage">
                    <div class="board_interior_userpage_atr">
                        <div class="board_interior_userpage_bar">
                            <div class="board_interior_userpage_barbox">
                                <button>
									<i id="heart" class="far fa-heart"></i>
                                    <span class="userpage_span">30</span>
                                </button>
                            </div>
                            <div class="board_interior_userpage_barbox">
                                <button type="button" class="btnSendInteriorLike">
									<i id="thumbs" class="far fa-thumbs-up" ></i>
									<span id="interiorLikeCount" class="userpage_span" data-userLike="${userLike}">${interiorLikeCount}</span>
                                    
                                </button>
                            </div>
                        </div>
                        <div class="board_interior_users">
                            <div class="board_interior_users_subject">
                                <div class="board_interior_users_subject_atr">
                                    <a class="board_interior_users_subject_a" href="${pageContext.request.contextPath}/interior/mList?userId=${dto.userId}">
                                        <img class="board_interior_users_subject_profle" src="${pageContext.request.contextPath}/resources/images/interior/a1.jpg">${dto.userName}
                                    </a>
                                    <p class="board_interior_users_subject_userid">
                                        ${dto.userId}
                                    </p>
                                </div>
                            </div>

                            <div class="board_interior_users_imgs">
                                <div class="board_interior_users_imgs_bar"> 
                            <c:forEach var="uto" items="${ublist}" varStatus="n"> 
                                    <c:if test="${n.index==2}">
                                    	<c:out value="</div><div class='board_interior_users_imgs_bar'>" escapeXml="false"/>
                                    </c:if>
                                    <div class="board_interior_users_imgs_img">
                                        <!-- 회원 게시판 최근 1  -->
                                        <a href="${pageContext.request.contextPath}/interior/boardItem?num=${uto.num}"><img class="board_interior_users_imgs_a_img"
                                             src="${pageContext.request.contextPath}/uploads/interior/${uto.mainImg}"></a>
                                    </div>
                            </c:forEach>
                            <c:forEach var="i" begin="${ublistCount+1}" end="4" step="1" varStatus="n">
                            	    <c:if test="${n.index==3}">
                                    	<c:out value="</div><div class='board_interior_users_imgs_bar'>" escapeXml="false"/>
                                    </c:if>
                            	    <div class="board_interior_users_imgs_img">
                                        <!-- 회원 게시판 최근 1  -->
                                        <a><img class="board_interior_users_imgs_a_img"></a>
                                    </div>
                            </c:forEach>
								</div>
                            </div>
                            <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin' }">
		                        <div class="board_interior_userpage_buttonbar">
		                            <div class="board_interior_userpage_buttonbarbox">
		                                <button type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/interior/update?num=${dto.num}';" >
		                                	<span class="userpage_buttonspan">수정</span>
		                                 </button>
		                            </div>
		                            <div class="board_interior_userpage_buttonbarbox">
		                                <button>
		                                    <span class="userpage_buttonspan">삭제</span>
		                                </button>
		                            </div>
		                        </div>
	                        </c:if>
                        </div>
                    </div>
                </div>
            </div>
    </div>	
</form> 
</section>