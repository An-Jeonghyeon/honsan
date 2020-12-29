<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var ="vo" items="${listReplyAnswer}"> 
	<div class="ReplyAnswer">
		<div class="ReplyListdress-ReplyLike">
			<i class="far fa-thumbs-up"></i><span>13</span>
		</div>
		<div class="ReplyListdress-ReplyDisLike">
			<i class="far fa-thumbs-up fa-thumbs-down"></i><span>13</span>
		</div>
		<span class="ReplyListUserName">${vo.userName}</span>
		<p>
			<span class="ReplyListContent">${vo.content }</span>
		</p>
		<span class="createdNumber">${vo.register_date}</span>
	<c:if test="${vo.userId == sessionScope.member.userId|| sessionScope.member.userId=='admin'}">
		<button class="ReplyListDeleteButton">삭제</button>
	</c:if>
		
	</div>
</c:forEach>	