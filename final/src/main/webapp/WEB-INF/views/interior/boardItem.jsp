<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.fa-thumbs-up {
	color: #35c5f0;
}

#paginate #curBox_sub{
	border: 1px solid #35c5f0;
	background:  #35c5f0;
	color: white;
	border-radius: 4px;
	font-weight: 700;
	font-size: 15px;
}

#paginate #numBox_sub{
	font-size: 15px;
	border : none;

}

#paginate #tlBox{
	font-size: 15px;
	border : none;
}

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/interior/boardItem.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/interior/boardItem.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/interior/interiorLike.js"></script>

<script type="text/javascript">


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

function ajaxHTML(url, method, query, selector) {
	$.ajax({
		type:method
		,url:url
		,data:query
		,success:function(data) {
			$(selector).html(data);
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

//게시글 로딩시 페이징 처리
$(function() {
	listPage(1);
});

// 댓글 리스트 보이기
function listPage(page) {
	var url = "${pageContext.request.contextPath}/interior/listReply";
	var query = "num=${dto.num}&pageNo="+page;
	var selector = ".comment_list_box";
	
	ajaxHTML(url, "get", query, selector);
}

//리플 등록 
$(function(){
	$(".btnSendReply").click(function(){ // 버튼클릭시 
		var num="${dto.num}"; // 댓글을 작성할 게시판의 넘 설정 
		//var $tb = $(this).closest("table");
		var $div = $(this).parents(".leftbox_comment_usercomment"); // content 를 찾을 위치 설정
		
//		var content=$tb.find("textarea").val().trim();
		var content=$div.find("textarea").val().trim(); // 부모값 밑 textarea 값으로 content 설정
		
		
		if(! content) {     // 값이 없으면 
			$div.find("textarea").focus(); // 댓글을 입력하는 곳에 마우스 포인트 
			return false; //펄스로 빠져나가기 
		}
		content = encodeURIComponent(content); // 한글 인코딩 
		
		var url="${pageContext.request.contextPath}/interior/insertReply"; //컨트롤러로 보내질 주소 
		var query="num="+num+"&content="+content+"&answer=0"; //값으로 게시판번호 , 댓글내용 , 부모댓글로 사용할 넘버 
		
		var fn = function(data){
			$div.find("textarea").val(""); // 전송 후 댓글창 값 공백 입력 
			
			var state=data.state;
			if(state==="true") { // 성공하면 리스트 보이게 
				listPage(1);
			} else if(state==="false") { // 실패시 실패 안내 
				alert("댓글을 추가 하지 못했습니다.");
			}
		};
		
		ajaxJSON(url, "post", query, fn); // 만들어 놓은 재이슨으로 전송 
	});
});

//리플 삭제 
$(function(){
	$("body").on("click", ".deleteReply", function(){
		if(! confirm("게시물을 삭제하시겠습니까 ? ")) {
		    return false;
		}
		
		var replyNum=$(this).attr("data-replyNum");
		var page=$(this).attr("data-pageNo");
		
		var url="${pageContext.request.contextPath}/interior/deleteReply";
		var query="replyNum="+replyNum+"&mode=reply";
		
		var fn = function(data){
			// var state=data.state;
			listPage(page);
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});

//댓글별 답글 리스트
function listReplyAnswer(answer) {
	var url="${pageContext.request.contextPath}/interior/listReplyAnswer";
	var query="answer="+answer;
	var selector=".comment_reply_list_ul"+answer;
	
	ajaxHTML(url, "get", query, selector);
}

//답글 버튼(댓글별 답글 등록폼 및 답글리스트)

$(function(){		
	$("body").on("click", ".btnReplyAnswerLayout", function(){
		var $divReplyAnswer = $(this).closest(".comment_fild_item").next();
		// var $trReplyAnswer = $(this).parent().parent().next();
		// var $answerList = $trReplyAnswer.children().children().eq(0);
		var isVisible = $divReplyAnswer.is(':visible');
		var replyNum = $(this).attr("data-replyNum");
		
		
			
		if(isVisible) {
			$divReplyAnswer.hide();
		} else {
			$divReplyAnswer.show();
		} 
		listReplyAnswer(replyNum);
		
		// 답글 리스트
		
		// 답글 개수
		
	});		
});

// 대댓글 등록 
$(function(){
	$(".comment_list_box").on("click", ".btnSendReplyAnswer", function(){
		var num="${dto.num}";
		var replyNum=$(this).attr("data-replyNum");
		var $div=$(this).parent().prev();
		
		var content=$div.find("textarea").val().trim();
		if(! content) {
			$div.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		var url="${pageContext.request.contextPath}/interior/insertReply";
		var query="num="+num+"&content="+content+"&answer="+replyNum;
		
		var fn = function(data){
			$div.find("textarea").val("");
			
			var state=data.state;
			if(state==="true") {
				listReplyAnswer(replyNum);
			}
		};
		
		ajaxJSON(url, "post", query, fn);
		
	});
});

//댓글별 답글 삭제
$(function(){
	$("body").on("click", ".deleteReplyAnswer", function(){
		if(! confirm("게시물을 삭제하시겠습니까 ? ")) {
		    return;
		}
		
		var replyNum=$(this).attr("data-replyNum");
		var answer=$(this).attr("data-answer");
		
		var url="${pageContext.request.contextPath}/interior/deleteReply";
		var query="replyNum="+replyNum+"&mode=answer";
		
		var fn = function(data){
			listReplyAnswer(answer);

		};
		
		ajaxJSON(url, "post", query, fn);
	});
});

// 게시판 삭제 
$(function(){
	$(".interiorDeleteButton").click(function(){
		if(! confirm("게시물을 삭제하시겠습니까 ? ")) {
		    return;
		}
		
		var num=$(this).attr("data-Num");
		
		var url="${pageContext.request.contextPath}/interior/deleteInterior";
		var query="num="+num;
		
		var fn = function(data){
			
			var state=data.state;
			if(state==="true") { // 성공하면 리스트 보이게 
				location.href="${pageContext.request.contextPath}/interior/main";
			} else if(state==="false") { // 실패시 실패 안내 
				alert("게시판을 삭제하지 못했습니다.");
			}
		};
		
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
                    <input type="hidden" name="num" value="${dto.num}">
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
                    <h1>댓글&nbsp;<span>${replyCount}</span></h1>
                

                <div class="leftbox_comment_insert">
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
                            <button class="btnSendReply">등록</button>
                        </div>
                    </div>
                </div>
                <!-- 댓글 반복 구간  -->
                <ul class="comment_list_box">
                    <!-- 첫번째 반복  -->
         			<!-- 두번째 반복  -->
                    <!-- 페이징 처리  -->

                
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
		                                <button type="button" class="interiorDeleteButton" data-Num='${dto.num}'>
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