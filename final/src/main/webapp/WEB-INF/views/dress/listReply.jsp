<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="vo" items="${listReply}">
	<div class="ReplyList">
		<div class="dress-ReplyLike btnSendReplyLike" title="좋아요" data-replyNum="${vo.replyNum}" data-replyLike="1">
			<i class="far fa-thumbs-up"></i>
			<span>${vo.likeCount}</span>
		</div>
		<div class="dress-ReplyDisLike btnSendReplyLike" title="싫어요" data-replyNum='${vo.replyNum}' data-replyLike="0">
			<i class="far fa-thumbs-up fa-thumbs-down"></i>
			<span>${vo.disLikeCount}</span>
		</div>
		<span class="ReplyListUserName">${vo.userName}</span>
		<p>
			<span class="ReplyListContent">${vo.content }</span>
		</p>
		<span class="createdNumber">${vo.register_date}</span>
		<button type="button" class="RelyWrite" data-replyNum="${vo.replyNum}">답글쓰기 <span id="answerCount${vo.replyNum}">${vo.answerCount}</span></button>
		<c:if
			test="${vo.userId==sessionScope.member.userId || sessionScope.member.userId=='admin' }">
			<button type="button" class="Replydelete" data-replyNum='${vo.replyNum}' data-pageNo='${pageNo}'>삭제</button>
		</c:if>
	</div>

	<div id="listReplyAnswer${vo.replyNum}" class="listReplyAnswerHide"> 
	
	</div>

	<div class="ReplyAnswerBody">
		<div class="ReplyAnswerContentBox">
			<span class="ReplyListUserX">x</span> <span
				class="ReplyAnswerContentUserName">${vo.userName}</span>
			<textarea placeholder="댓글을 남겨보세요"></textarea>
			<div class="ReplySubmitButton">
				<button class="Replybtn" id="ReplybtnSubmit" data-replyNum="${vo.replyNum}"type="button">등록</button>
			</div>
		</div>
	</div>
</c:forEach>
<div class="pagingBody">
	<div class="pagingInnerBody">${paging }</div>
</div>