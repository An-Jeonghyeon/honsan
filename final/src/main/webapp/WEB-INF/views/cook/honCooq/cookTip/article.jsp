<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="articleButton">
	<button class="btn1" type="button">이전글</button>
	<button class="btn2" type="button">다음글</button>
</div>
<div class="articleMainBody">
	<div class="articleMainHeader">
		<div class="articleGo">
			<span><a href="${pageContext.request.contextPath}">자랑게시판
					&gt;</a></span>
		</div>
		<div class="articleMainHeaderSubject">
			<span>오늘하루도 수고 하셨습니다 여러분</span>
		</div>
		<div class="articleSub">
			<div class="articleMainHeaderUserName">
				<span>주다혜</span> <span class="createdNumber">2020.12.03.
					01:03</span> <span class="hitCountNumber">조회 670</span>
			</div>
			<div class="articleMainHeaderReply">
				<span> <a href="${pageContext.request.contextPath}"> 댓글
						54</a></span>
			</div>
		</div>
	</div>

	<div class="ContentBody">
		<pre>
가계약금 및 본인부담금 잘 체크하기
가계약금 및 본인부담금 잘 체크하기
가계약금 및 본인부담금 잘 체크하기
가계약금 및 본인부담금 잘 체크하기
가계약금 및 본인부담금 잘 체크하기
가계약금 및 본인부담금 잘 체크하기
가계약금 및 본인부담금 잘 체크하기
</pre>
	</div>
	<div class="LikeBox">
		<span class="LikeHeart"> <i class="far fa-heart ILikeHeart"></i>좋아요
			13
		</span> <span class="Comment"><i class="far fa-comments"></i>댓글 54</span> <span
			class="fullLikeHeart"> <i class="fas fa-heart"></i></span>
	</div>
	<div class="ReplySUb">
		<span>댓글</span>
	</div>
	<div class="ReplyList">여기는 댓글 리스트</div>
	<div class="ReplyBody">
		<div class="ReplyContentBox">
			<span>주다혜</span>
			<textarea name="" id="" placeholder="댓글을 남겨보세요"></textarea>
			<div class="ReplySubmitButton">
				<button class="Replybtn" type="button">등록</button>
			</div>
		</div>
	</div>
</div>