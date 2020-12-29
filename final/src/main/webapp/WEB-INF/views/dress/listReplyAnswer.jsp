<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var ="vo" items="${listReplyAnswer}"> 
	<div class="ReplyAnswer">
		<span class="ReplyListUserName">${vo.userName}</span>
		<p>
			<span class="ReplyListContent">${vo.content }</span>
		</p>
		<span class="createdNumber">${vo.register_date}</span>
	<c:if test="${vo.userId == sessionScope.member.userId|| sessionScope.member.userId=='admin'}">
		<button class="ReplyListDeleteButton" data-replyNum='${vo.replyNum }' data-answer='${vo.answer}'>삭제</button>
	</c:if>
		
	</div>
</c:forEach>	