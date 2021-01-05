<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	if($("#recipeLikeCount").attr("data-userLike")=="1") {
		$("#heart").removeClass("far").addClass("fas");
	}
	
	$(".btnSendRecipeLike").click(function(){
		var userLike=$("#recipeLikeCount").attr("data-userLike");
		if(userLike=="0") {
			if(! confirm("게시물이 마음에 드세요?")) {
				return false;
			}
			var url="${pageContext.request.contextPath}/cook/honCooq/recipe/insertRecipeLike";
			var num="${dto.recipe_id}";
			// var query={num:num}; 이렇게 써도 아래와 같은 의미
			var query="num="+num;
			
			var fn = function(data){
				var state=data.state;
				if(state==="true") {
					var count = data.recipeLikeCount;
					$("#recipeLikeCount").text(count);
					$("#recipeLikeCount").attr("data-userLike", "1");
					$("#heart").removeClass("far").addClass("fas");
					
				} else if(state==="false") {					
					alert("좋아요 추가에 문제가 발생했습니다.");
				}
			};		
		} else {			
			if (! confirm("좋아요를 취소하실 건가요?")) {
				return false;
			}
			var url="${pageContext.request.contextPath}/cook/honCooq/recipe/deleteRecipeLike";
			var num="${dto.recipe_id}";
			var query="num="+num;
			
			var fn = function(data){
				var state=data.state;
				if(state==="true") {
					var count = data.recipeLikeCount;
					$("#recipeLikeCount").text(count);
					$("#recipeLikeCount").attr("data-userLike", "0");
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
	var url = "${pageContext.request.contextPath}/cook/honCooq/recipe/listReply";
	var query = "num=${dto.recipe_id}&pageNo="+page;
	var selector = "#listRecipeReply";
	
	ajaxHTML(url, "get", query, selector);
}

//리플 등록
$(function(){
	$(".btnSendReply").click(function(){
		var num="${dto.recipe_id}";
		//var $tb = $(this).closest("table");
		var $div = $(this).parents(".recipe_ReplyContentBox"); 
		
//		var content=$tb.find("textarea").val().trim();
		var content=$div.find("textarea").val().trim();
		
		
		if(! content) {
			$div.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		var url="${pageContext.request.contextPath}/cook/honCooq/recipe/insertReply";
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
		
		var url="${pageContext.request.contextPath}/cook/honCooq/recipe/deleteReply";
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
		
		var url="${pageContext.request.contextPath}/cook/honCooq/recipe/insertReplyLike";
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
	var url="${pageContext.request.contextPath}/cook/honCooq/recipe/listReplyAnswer";
	var query="answer="+answer;
	var selector="#recipe_listReplyAnswer"+answer;
	
	ajaxHTML(url, "get", query, selector);
}

//댓글별 답글 개수
function countReplyAnswer(answer) {
	var url="${pageContext.request.contextPath}/cook/honCooq/recipe/countReplyAnswer";
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
		var num="${dto.recipe_id}";
		var replyNum=$(this).attr("data-replyNum");
		var $div=$(this).closest("div");
		
		var content=$div.find("textarea").val().trim();
		if(! content) {
			$div.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		var url="${pageContext.request.contextPath}/cook/honCooq/recipe/insertReply";
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
		
		var url="${pageContext.request.contextPath}/cook/honCooq/recipe/deleteReply";
		var query="replyNum="+replyNum+"&mode=answer";
		
		var fn = function(data){
			listReplyAnswer(answer);
			countReplyAnswer(answer);
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});

</script>

<div class="recipe_articleMainBody">
	<div class="recipe_articleMainHeader">
		<%-- 		<div class="recipe_articleGo">
			<span><a href="${pageContext.request.contextPath}/cook/honCooq/recipe/list">Recipe게시판
					&gt;</a></span>
		</div> --%>
		<div class="recipe_ariticleBodyHeader">
			<span class="recipe_articleBodyHeader-Title">Recipes</span>
		</div>
		<div class="recipe_recipe_category_box">
			<div class="recipe_recipe_category article_category">
				<span>${dto.nation_nm!=null? dto.nation_nm : "기타"}</span>
			</div>
			<div class="recipe_recipe_category article_category">
				<span>${dto.ty_code!=null? dto.ty_code : "기타"}</span>
			</div>
		</div>

		<div class="recipe_articleMainHeaderSubject">
			<span>${dto.recipe_nm_ko}</span>
		</div>
		<div class="recipe_articleSub">
		<!-- 
			<div class="recipe_articleMainHeaderInfo">
				<div class="recipe_writer">
				</div>
				<div class="recipe_registerDateNumber">
				</div>
				<div class="recipe_hitCountNumber">
				</div>
			</div>
		 -->
		</div>
	</div>

	<div class="recipe_ContentBody">
		<!-- 
		
		 -->
		<div id="player"></div>
	</div>
	<div class="recipe_LikeBox">
		<span class="recipe_LikeHeart">
			<button type="button" class="recipe_LikeButton btnSendRecipeLike">
				<i id="heart" class="far fa-heart"></i> <span id="recipeLikeCount"
					data-userLike="${userLike}">${dto.recipeLikeCount}</span>
			</button>
		</span>
	</div>
	<div class="recipe_updateAndDelete">
	</div>
	<div class="recipe_preAndNext">
		<div class="recipe_articleButtons">
			<div class="recipe_articleButtonBox">
				<c:if test="${not empty preReadDto}">
					<button class="recipe_preRead" type="button"
						onclick="javascript:location.href='${pageContext.request.contextPath}/cook/honCooq/recipe/article?${query}&num=${preReadDto.recipe_id}';">
						<i class="fas fa-angle-left"></i>
					</button>
					<span>이전글 | ${preReadDto.subject}</span>
				</c:if>
			</div>

			<div class="recipe_articleButtonBox">
				<button class="recipe_toList" type="button"
					onclick="javascript:location.href='${pageContext.request.contextPath}/cook/honCooq/main?${query}';">
					<i class="fas fa-bars"></i>
				</button>
				<span> 리스트로</span>
			</div>

			<div class="recipe_articleButtonBox">
				<c:if test="${not empty nextReadDto}">
					<span>${nextReadDto.subject} | 다음글</span>
					<button class="recipe_nextRead" type="button"
						onclick="javascript:location.href='${pageContext.request.contextPath}/cook/honCooq/recipe/article?${query}&num=${nextReadDto.recipe_id}';">
						<i class="fas fa-angle-right"></i>
					</button>
				</c:if>
			</div>
		</div>
	</div>

	<div id="recipe_listReply"></div>

	<div class="recipe_ReplyAll">
		<div id="listRecipeReply"></div>
		<!-- 댓글 불러오기 : ajax -->
		<div class="recipe_ReplyBody">
			<div class="recipe_ReplyContentBox">
				<span>${sessionScope.member.userName}</span>
				<textarea class="recipe_ReplyContentBox-textarea" id=""
					placeholder="댓글을 남겨보세요"></textarea>
				<div class="recipe_ReplySubmitButton">
					<button class="recipe_Replybtn btnSendReply" type="button">등록</button>
				</div>
			</div>
		</div>
	</div>
</div>