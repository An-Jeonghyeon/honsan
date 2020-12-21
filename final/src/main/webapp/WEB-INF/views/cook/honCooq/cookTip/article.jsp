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
		<span class="cookTip_LikeHeart"> <i class="far fa-heart ILikeHeart"></i>좋아요
			13
		</span> <span class="cookTip_Comment"><i class="far fa-comments"></i>댓글 54</span> <span
			class="cookTip_fullLikeHeart"> <i class="fas fa-heart"></i></span>
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


	<div class="cookTip_ReplyAll">
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
		<div class="cookTip_ReplyBody">
			<div class="cookTip_ReplyContentBox">
				<span>주다혜</span>
				<textarea class="cookTip_ReplyContentBox-textarea" id="" placeholder="댓글을 남겨보세요"></textarea>
				<div class="cookTip_ReplySubmitButton">
					<button class="cookTip_Replybtn" type="button">등록</button>
				</div>
			</div>
		</div>
	</div>
</div>