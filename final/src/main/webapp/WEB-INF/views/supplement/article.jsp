<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/health/article.css" type="text/css">

<section>
	<div class="h-divvv">
	    <div class="h-articleButton">
	        <div class="h-prebtn">
	            <i class="fas fa-chevron-left"></i> <span> 이전글</span>
	        </div>
	        <div class="h-nextbtn">
	            <span>다음글 </span> <i class="fas fa-chevron-right"></i>
	        </div>
	    </div>
	    <div class="h-articleMainBody">
	        <div class="h-articleMainHeader">
	            <div class="h-articleMainHeaderSubject">
	                <span>${dto.subject}</span>
	            </div>
	            <div class="h-articleSub">
	                <div class="h-articleMainHeaderUserName">
	                    <span>${dto.userId}</span> 
	                    <span class="h-createdNumber">${dto.register_date}</span> 
	                </div>
	                <div class="h-articleMainHeaderReply">
	                    <span>조회수 ${dto.hitCount}</span>
	                </div>
	            </div>
	        </div>
	
	        <div class="h-ContentBody">
	            <pre>
	                ${dto.content}
	             </pre>
	        </div>
	        <div class="h-LikeBox">
	            <div class="h-likecircle">
	                <div class="h-likelike"><i class="fas fa-thumbs-up fa-2x"></i></div>
	                <div class="h-likeCountdiv">${dto.likeCount}</div>
	            </div>
	        </div>
	        <div class="h-ReplyBody">
	            <div class="h-ReplySUb">
	                <span>댓글 12개</span>
	                <button class="h-listButton" onclick="javascript:location.href='${pageContext.request.contextPath}/supplement/list?${query}';">목록</button>
	            </div>
	            <div class="h-ReplyContentBox">
	                <span>주다혜</span>
	                <textarea name="" id="" placeholder="댓글을 남겨보세요"></textarea>
	                <div class="h-ReplySubmitButton">
	                    <button class="h-Replybtn" type="button">등록</button>
	                </div>
	            </div>
	        </div>
	        <div class="h-ReplyList">
	            <div class="h-replyList2">
	                
	            </div>
	        </div>
	    </div>
	</div>
</section>