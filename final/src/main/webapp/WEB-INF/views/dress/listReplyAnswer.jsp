<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var ="vo" items="${listReplyAnswer}"> 
	<div class="ReplyAnswer">
		<div class="dress-ReplyLike">
			<span>좋아요</span><i class="far fa-thumbs-up"></i>13
		</div>
	
		<span class="ReplyListUserName">${vo.userName}</span>
		<p>
			<span class="ReplyListContent">여러 항목을 체크해야죠 ㅡㅡ;</span>
		</p>
		<span class="createdNumber">${vo.register_date}</span>
	</div>
</c:forEach>	