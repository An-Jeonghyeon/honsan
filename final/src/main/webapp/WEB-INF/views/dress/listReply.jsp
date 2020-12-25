<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="vo" items="${listReply}">
	<div class="ReplyList">
		<div class="dress-ReplyLike">
			<span>좋아요</span><i class="far fa-thumbs-up"></i>13
		</div>
		<span class="ReplyListUserName">${vo.userName}</span>
		<p>
			<span class="ReplyListContent">${vo.content }</span>
		</p>
		<span class="createdNumber">${vo.register_date}</span>
		<button type="button" class="RelyWrite">답글쓰기</button>
	</div>
	<!-- <div class="ReplyAnswer">
		<div class="dress-ReplyLike">
			<span>좋아요</span><i class="far fa-thumbs-up"></i>13
		</div>
		<span class="ReplyListUserName">주다혜</span>
		<p>
			<span class="ReplyListContent">여러 항목을 체크해야죠 ㅡㅡ;</span>
		</p>
		<span class="createdNumber">2020.12.03. 01:03</span>
	</div> -->
	<div class="ReplyAnswerBody">
		<div class="ReplyAnswerContentBox">
			<span class="ReplyListUserX">x</span> <span
				class="ReplyAnswerContentUserName">주다혜</span>
			<textarea placeholder="댓글을 남겨보세요">여기는 대댓글</textarea>
			<div class="ReplySubmitButton">
				<button class="Replybtn" type="button">등록</button>
			</div>
		</div>
	</div>
</c:forEach>
<div class="pagingBody">
	<div class="pagingInnerBody">${paging }</div>
</div>