<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
function deleteBoard() {
	<c:if test="${sessionScope.member.userId=='admin' || sessionScope.member.userId==dto.userId}">
		var q = "num=${dto.num}&${query}";
		var url = "${pageContext.request.contextPath}/cook/honCooq/cookTip/delete?" + q;

		if(confirm("위 자료를 삭제 하시 겠습니까 ? ")) {
				location.href=url;
		}
	</c:if>    
	<c:if test="${sessionScope.member.userId!='admin' && sessionScope.member.userId!=dto.userId}">
		alert("게시물을 삭제할 수  없습니다.");
	</c:if>
	}

	function updateBoard() {
	<c:if test="${sessionScope.member.userId==dto.userId}">
		var q = "num=${dto.num}&page=${page}";
		var url = "${pageContext.request.contextPath}/cook/honCooq/cookTip/update?" + q;

		location.href=url;
	</c:if>

	<c:if test="${sessionScope.member.userId!=dto.userId}">
		alert("게시물을 수정할 수  없습니다.");
	</c:if>
	}
</script>

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

//게시글 좋아요 여부
$(function(){
	if($("#cookTipLikeCount").attr("data-userLike")=="1") {
		$("#heart").removeClass("far").addClass("fas");
	}
	
	$(".btnSendCookTipLike").click(function(){
		var userLike=$("#cookTipLikeCount").attr("data-userLike");
		if(userLike=="0") {
			if(! confirm("게시물이 마음에 드세요?")) {
				return false;
			}
			var url="${pageContext.request.contextPath}/cook/honCooq/cookTip/insertCookTipLike";
			var num="${dto.num}";
			// var query={num:num}; 이렇게 써도 아래와 같은 의미
			var query="num="+num;
			
			var fn = function(data){
				var state=data.state;
				if(state==="true") {
					var count = data.cookTipLikeCount;
					$("#cookTipLikeCount").text(count);
					$("#cookTipLikeCount").attr("data-userLike", "1");
					$("#heart").removeClass("far").addClass("fas");
					
				} else if(state==="false") {					
					alert("좋아요 추가에 문제가 발생했습니다.");
				}
			};		
		} else {			
			if (! confirm("좋아요를 취소하실 건가요?")) {
				return false;
			}
			var url="${pageContext.request.contextPath}/cook/honCooq/cookTip/deleteCookTipLike";
			var num="${dto.num}";
			var query="num="+num;
			
			var fn = function(data){
				var state=data.state;
				if(state==="true") {
					var count = data.cookTipLikeCount;
					$("#cookTipLikeCount").text(count);
					$("#cookTipLikeCount").attr("data-userLike", "0");
					$("#heart").removeClass("fas").addClass("far");

				} else if(state==="false") {
					alert("좋아요 삭제에 문제가 발생했습니다.");
				}
			};								
		}	
		ajaxJSON(url, "post", query, fn);
	});
});

// 게시글 로딩시 페이징 처리
$(function() {
	listPage(1);
});

// 댓글 리스트 보이기
function listPage(page) {
	var url = "${pageContext.request.contextPath}/cook/honCooq/cookTip/listReply";
	var query = "num=${dto.num}&pageNo="+page;
	var selector = "#listCookTipReply";
	
	ajaxHTML(url, "get", query, selector);
}

//리플 등록
$(function(){
	$(".btnSendReply").click(function(){
		var num="${dto.num}";
		//var $tb = $(this).closest("table");
		var $div = $(this).parents(".cookTip_ReplyContentBox"); 
		
//		var content=$tb.find("textarea").val().trim();
		var content=$div.find("textarea").val().trim();
		
		
		if(! content) {
			$div.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		var url="${pageContext.request.contextPath}/cook/honCooq/cookTip/insertReply";
		var query="num="+num+"&content="+content+"&answer=0";
		
		var fn = function(data){
			$div.find("textarea").val("");
			
			var state=data.state;
			if(state==="true") {
				listPage(1);
			} else if(state==="false") {
				alert("댓글을 추가 하지 못했습니다.");
			}
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});

//댓글 삭제
$(function(){
	$("body").on("click", ".deleteReply", function(){
		if(! confirm("게시물을 삭제하시겠습니까 ? ")) {
		    return false;
		}
		
		var replyNum=$(this).attr("data-replyNum");
		var page=$(this).attr("data-pageNo");
		
		var url="${pageContext.request.contextPath}/cook/honCooq/cookTip/deleteReply";
		var query="replyNum="+replyNum+"&mode=reply";
		
		var fn = function(data){
			// var state=data.state;
			listPage(page);
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});

//댓글 좋아요 / 싫어요
$(function(){
	// 댓글 좋아요 / 싫어요 등록
	$("body").on("click", ".btnSendReplyLike", function(){
		var replyNum=$(this).attr("data-replyNum");
		var replyLike=$(this).attr("data-replyLike");
		var $btn = $(this);
		
		var msg="댓글이 마음에 들지 않으신가요?";
		if(replyLike==='1') {
			msg="댓글이 마음에 드시나요?";
		}
		if(! confirm(msg)) {
			return false;
		}
		
		var url="${pageContext.request.contextPath}/cook/honCooq/cookTip/insertReplyLike";
		var query="replyNum="+replyNum+"&replyLike="+replyLike;
		
		var fn = function(data){
			var state=data.state;
			if(state==="true") {
				var likeCount=data.likeCount;
				var disLikeCount=data.disLikeCount;
				
				$btn.parent("div").children().eq(0).find("span").html(likeCount);
				$btn.parent("div").children().eq(1).find("span").html(disLikeCount);
			} else if(state==="false") {
				alert("댓글 좋아요/싫어요는 한 번만 가능합니다.");
			}
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});

//댓글별 답글 리스트
function listReplyAnswer(answer) {
	var url="${pageContext.request.contextPath}/cook/honCooq/cookTip/listReplyAnswer";
	var query="answer="+answer;
	var selector="#cookTip_listReplyAnswer"+answer;
	
	ajaxHTML(url, "get", query, selector);
}

//댓글별 답글 개수
function countReplyAnswer(answer) {
	var url="${pageContext.request.contextPath}/cook/honCooq/cookTip/countReplyAnswer";
	var query="answer="+answer;
	
	var fn = function(data){
		var count=data.count;
		var vid="#answerCount"+answer;
		$(vid).html(count);
	};
	
	ajaxJSON(url, "post", query, fn);
}

//답글 버튼(댓글별 답글 등록폼 및 답글리스트)
$(function(){	
	$("body").on("click", ".btnReplyAnswerLayout", function(){
		var $divReplyAnswer = $(this).closest("div").next();
		// var $trReplyAnswer = $(this).parent().parent().next();
		// var $answerList = $trReplyAnswer.children().children().eq(0);
		
		var isVisible = $divReplyAnswer.is(':visible');
		var replyNum = $(this).attr("data-replyNum");
			
		if(isVisible) {
			$divReplyAnswer.hide();
		} else {
			$divReplyAnswer.show();
            
			// 답글 리스트
			listReplyAnswer(replyNum);
			
			// 답글 개수
			countReplyAnswer(replyNum);
		}
	});	
});

//댓글별 답글 등록
$(function(){
	$("body").on("click", ".btnSendReplyAnswer", function(){
		var num="${dto.num}";
		var replyNum=$(this).attr("data-replyNum");
		var $div=$(this).closest("div");
		
		var content=$div.find("textarea").val().trim();
		if(! content) {
			$div.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		var url="${pageContext.request.contextPath}/cook/honCooq/cookTip/insertReply";
		var query="num="+num+"&content="+content+"&answer="+replyNum;
		
		var fn = function(data){
			$div.find("textarea").val("");
			
			var state=data.state;
			if(state==="true") {
				listReplyAnswer(replyNum);
				countReplyAnswer(replyNum);
			}
		};
		
		ajaxJSON(url, "post", query, fn);
		
	});
});

// 댓글별 답글 삭제
$(function(){
	$("body").on("click", ".deleteReplyAnswer", function(){
		if(! confirm("게시물을 삭제하시겠습니까 ? ")) {
		    return;
		}
		
		var replyNum=$(this).attr("data-replyNum");
		var answer=$(this).attr("data-answer");
		
		var url="${pageContext.request.contextPath}/cook/honCooq/cookTip/deleteReply";
		var query="replyNum="+replyNum+"&mode=answer";
		
		var fn = function(data){
			listReplyAnswer(answer);
			countReplyAnswer(answer);
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});

</script>

<script type="text/javascript">
// 2. This code loads the IFrame Player API code asynchronously.
var tag = document.createElement('script');

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

// 3. This function creates an <iframe> (and YouTube player)
//    after the API code downloads.
var player;
function onYouTubeIframeAPIReady() {
  player = new YT.Player('player', {
    height: '360',
    width: '640',
    videoId: 'M7lc1UVf-VE',
    events: {
      'onReady': onPlayerReady,
      'onStateChange': onPlayerStateChange
    }
  });
}

// 4. The API will call this function when the video player is ready.
function onPlayerReady(event) {
  event.target.playVideo();
}

// 5. The API calls this function when the player's state changes.
//    The function indicates that when playing a video (state=1),
//    the player should play for six seconds and then stop.
var done = false;
function onPlayerStateChange(event) {
  if (event.data == YT.PlayerState.PLAYING && !done) {
    setTimeout(stopVideo, 6000);
    done = true;
  }
}
function stopVideo() {
  player.stopVideo();
}
</script>

<div class="cookTip_articleMainBody">
	<div class="cookTip_articleMainHeader">
		<%-- 		<div class="cookTip_articleGo">
			<span><a href="${pageContext.request.contextPath}/cook/honCooq/cookTip/list">CookTip게시판
					&gt;</a></span>
		</div> --%>
		<div class="cookTip_ariticleBodyHeader">
			<span class="cookTip_articleBodyHeader-Title">Recipes</span>
		</div>
		<div class="cookTip_category article_category">
			<span>${dto.nation_nm!=null? dto.nation_nm : "기타"} ${dto.ty_code!=null? dto.ty_code : "기타"}</span>
		</div>

		<div class="cookTip_articleMainHeaderSubject">
			<span>${dto.recipe_nm_ko}</span>
		</div>
		<div class="cookTip_articleSub">
		<!-- 
			<div class="cookTip_articleMainHeaderInfo">
				<div class="cookTip_writer">
					<span class="cookTip_articleInfo"><i class="far fa-user"></i>
						${dto.userName}</span>
				</div>
				<div class="cookTip_registerDateNumber">
					<span class="cookTip_articleInfo">등록일 ${dto.register_date}</span>
				</div>
				<div class="cookTip_hitCountNumber">
					<span class="cookTip_articleInfo">조회수 ${dto.hitCount}</span>
				</div>
			</div>
		 -->
		</div>
	</div>

	<div class="cookTip_ContentBody">
		${dto.content}
		<div id="player"></div>
	</div>
	<div class="cookTip_LikeBox">
		<span class="cookTip_LikeHeart">
			<button type="button" class="cookTip_LikeButton btnSendCookTipLike">
				<i id="heart" class="far fa-heart"></i> <span id="cookTipLikeCount"
					data-userLike="${userLike}">${dto.cookTipLikeCount}</span>
			</button>
		</span>
	</div>
	<div class="cookTip_updateAndDelete">
		<div class="cookTip_articleButtons_updateAndDelete">
			<c:if test="${dto.userName == sessionScope.member.userId}">
				<div class="cookTip_articleButtonBox2">
					<button class="cookTip_update" type="button"
						onclick="updateBoard('${dto.num}');">수정</button>
				</div>
			</c:if>
			<c:if
				test="${dto.userName == sessionScope.member.userId ||  sessionScope.member.userId == 'admin' }">
				<div class="cookTip_articleButtonBox2">
					<button class="cookTip_delete" type="button"
						onclick="deleteBoard('${dto.num}');">삭제</button>
				</div>
			</c:if>
		</div>
	</div>
	<div class="cookTip_preAndNext">
		<div class="cookTip_articleButtons">
			<div class="cookTip_articleButtonBox">
				<c:if test="${not empty preReadDto}">
					<button class="cookTip_preRead" type="button"
						onclick="javascript:location.href='${pageContext.request.contextPath}/cook/honCooq/cookTip/article?${query}&num=${preReadDto.num}';">
						<i class="fas fa-angle-left"></i>
					</button>
					<span>이전글 | ${preReadDto.subject}</span>
				</c:if>
			</div>

			<div class="cookTip_articleButtonBox">
				<button class="cookTip_toList" type="button"
					onclick="javascript:location.href='${pageContext.request.contextPath}/cook/honCooq/cookTip/list?${query}';">
					<i class="fas fa-bars"></i>
				</button>
				<span> 리스트로</span>
			</div>

			<div class="cookTip_articleButtonBox">
				<c:if test="${not empty nextReadDto}">
					<span>${nextReadDto.subject} | 다음글</span>
					<button class="cookTip_nextRead" type="button"
						onclick="javascript:location.href='${pageContext.request.contextPath}/cook/honCooq/cookTip/article?${query}&num=${nextReadDto.num}';">
						<i class="fas fa-angle-right"></i>
					</button>
				</c:if>
			</div>
		</div>
	</div>

	<div id="cookTip_listReply"></div>

	<div class="cookTip_ReplyAll">
		<div id="listCookTipReply"></div>
		<!-- 댓글 불러오기 : ajax -->
		<div class="cookTip_ReplyBody">
			<div class="cookTip_ReplyContentBox">
				<span>${sessionScope.member.userName}</span>
				<textarea class="cookTip_ReplyContentBox-textarea" id=""
					placeholder="댓글을 남겨보세요"></textarea>
				<div class="cookTip_ReplySubmitButton">
					<button class="cookTip_Replybtn btnSendReply" type="button">등록</button>
				</div>
			</div>
		</div>
	</div>
</div>