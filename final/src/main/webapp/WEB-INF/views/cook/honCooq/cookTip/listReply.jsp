<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

		<div class="cookTip_ReplySub">
			<span>댓글 ${replyCount}개</span> <span>[댓글 목록, ${pageNo}/${total_page} 페이지]</span>
		</div>
		<div class="cookTip_ReplyList">		
			<c:forEach var="vo" items="${listReply}">
				<div class="cookTip_ReplyListBody">
						<div class="cookTip_replyList-userInfo">
							<div class="cookTip_replyList-userInfo-userName">${vo.userName}</div>
							<div class="cookTip_replyList-userInfo-etc">${vo.register_date}
						           <c:if test="${vo.userId == sessionScope.member.userId ||  sessionScope.member.userId == 'admin' }">
						                <span class="deleteReply" style="cursor: pointer;" data-replyNum='${vo.replyNum}' data-pageNo='${pageNo}'>삭제</span>
						           	</c:if>
						           <c:if test="${vo.userId != sessionScope.member.userId &&  sessionScope.member.userId != 'admin' }">
						           		<span class="notifyReply">신고</span>
						           	</c:if>	
							</div>
						</div>
						<div class="cookTip_replyList-content">
							${vo.content}
						</div>
				</div>
							
			<div class="cookTip_replyAnswer">
				<div id="cookTip_listReplyAnswer${vo.replyNum}"></div>
				
			</div>
			
			
			</c:forEach>
			
			
			
			<div class="cookTip_ReplyList-footer">
				<div class="ReplyList-paging">
					${paging}
				</div>
			</div>
		</div>
