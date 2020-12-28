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










</script>

<div class="cookTip_articleMainBody">
	<div class="cookTip_articleMainHeader">
<%-- 		<div class="cookTip_articleGo">
			<span><a href="${pageContext.request.contextPath}/cook/honCooq/cookTip/list">CookTip게시판
					&gt;</a></span>
		</div> --%>
		<div class="cookTip_ariticleBodyHeader">
			<span class="cookTip_articleBodyHeader-Title">CookTip</span>
		</div>
		<div class="cookTip_category article_category">
			<span>${dto.category!=null? dto.category : "설거지 및 주방정리"}</span>
		</div>		
		
		<div class="cookTip_articleMainHeaderSubject">
			<span>${dto.subject}</span>
		</div>
		<div class="cookTip_articleSub">
			<div class="cookTip_articleMainHeaderInfo">
				<div class="cookTip_writer"><span class="cookTip_articleInfo"><i class="far fa-user"></i> ${dto.userName}</span></div>
				<div class="cookTip_registerDateNumber"><span class="cookTip_articleInfo">등록일 ${dto.register_date}</span></div>
				<div class="cookTip_hitCountNumber"><span class="cookTip_articleInfo">조회수 ${dto.hitCount}</span></div>
			</div>
		</div>
	</div>

	<div class="cookTip_ContentBody">
			${dto.content}
	</div>
	<div class="cookTip_LikeBox">
		<span class="cookTip_LikeHeart"> 
			<button type="button" class="cookTip_LikeButton btnSendCookTipLike"><i class="far fa-heart ILikeHeart"></i><span id="cookTipLikeCount" data-userLike="${userLike}">${dto.cookTipLikeCount}</span></button>
		</span> 
	</div>
	<div class="cookTip_updateAndDelete">
		<div class="cookTip_articleButtons">
			<div class="cookTip_articleButtonBox ">
					<button class="cookTip_update" type="button" onclick="updateBoard('${dto.num}');">수정</button>
			</div>
			<div class="cookTip_articleButtonBox ">
					<button class="cookTip_delete" type="button" onclick="deleteBoard('${dto.num}');">삭제</button>			
			</div>
		</div>
	</div>
	<div class="cookTip_preAndNext">
		<div class="cookTip_articleButtons">			
				<div class="cookTip_articleButtonBox">
					<c:if test="${not empty preReadDto}">
						<button class="cookTip_preRead" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/cook/honCooq/cookTip/article?${query}&num=${preReadDto.num}';"><i class="fas fa-angle-left"></i></button>
						<span>이전글 |  ${preReadDto.subject}</span>
					</c:if>		
				</div>

			<div class="cookTip_articleButtonBox">
				<button class="cookTip_toList" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/cook/honCooq/cookTip/list?${query}';"><i class="fas fa-bars"></i></button><span> 리스트로</span>
			</div>			

			<div class="cookTip_articleButtonBox">
				<c:if test="${not empty nextReadDto}">
					<span>${nextReadDto.subject}  | 다음글</span>
					<button class="cookTip_nextRead" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/cook/honCooq/cookTip/article?${query}&num=${nextReadDto.num}';"><i class="fas fa-angle-right"></i></button>
				</c:if>	
			</div>		
		</div>
	</div>

	<div id="cookTip_listReply"></div>

	<div class="cookTip_ReplyAll">
		<!-- 여기부터 다음 주석까지 listReply로 -->
		<!-- 
		<div class="cookTip_ReplySub">
			<span>댓글 ${replyDataCount}7개</span>
		</div>
		<div class="cookTip_ReplyList">		
			<div class="cookTip_ReplyListBody">
					<div class="cookTip_replyList-userInfo">
						<div class="cookTip_replyList-userInfo-userName">작성자</div>
						<div class="cookTip_replyList-userInfo-etc">작성일</div>
					</div>
					<div class="cookTip_replyList-content">
						댓글 내용입니다.
					</div>
			</div>				
		</div>
		 -->
		 <div id="listCookTipReply"></div>
		<!-- -------------------------------------------------- -->
		<div class="cookTip_ReplyBody">
			<div class="cookTip_ReplyContentBox">
				<span>${sessionScope.member.userName}</span>
				<textarea class="cookTip_ReplyContentBox-textarea" id="" placeholder="댓글을 남겨보세요"></textarea>
				<div class="cookTip_ReplySubmitButton">
					<button class="cookTip_Replybtn btnSendReply" type="button">등록</button>
				</div>
			</div>
		</div>
	</div>
</div>