<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/health/reply.css" type="text/css">

  <table class="h-reply-table">
        <thead id='h-listReplyHeader'>
            <tr height='35'>
                <td colspan='2'>
                   <div style='clear: both;'>
                       <div>
                           <span  class="" >댓글 ${replyCount}개</span> 
                           <span>[${pageNo}/${total_page} 페이지]</span>
                        </div>
                       <div style='float: right; text-align: right;'></div>
                   </div>
                </td>
            </tr>
        </thead>
        
        <tbody id='listReplyBody'>
        <c:forEach var="vo" items="${listReply}">
            <tr class="replybody-tr">
               <td class="replybody-td1" >
                   <span><b>${vo.userName}</b></span>
                </td>
               <td class="replybody-td2" >
                   <small>${vo.register_date}</small> |
                   <c:if test="${vo.userId == sessionScope.member.userId ||  sessionScope.member.userId == 'admin' }">
                        <span class="h-deleteReply"  data-replyNum='${vo.replyNum}' data-pageNo='${pageNo}'>삭제</span>
                    </c:if>
                    <c:if test="${vo.userId != sessionScope.member.userId &&  sessionScope.member.userId != 'admin' }">
                        <span class="notifyReply">신고</span>
                    </c:if>
                </td>
            </tr>

            <tr>
                <td class="reply-content">
                      ${vo.content}
                </td>
            </tr>
            
            <tr class="replym">
                <td class="h-reply-count">
                    <button type='button' class='h-btnReplyAnswerLayout' data-replyNum='${vo.replyNum}'>
                            답글 <span id="answerCount${vo.replyNum}">${vo.answerCount}</span>
                    </button>
                </td>
                <td class="h-reply-like">
                    <button type='button' class='h-reply-btnlike sreplybtn' data-replyNum='${vo.replyNum}' data-replyLike='1' title="좋아요"><i class="far fa-thumbs-up"></i> <span>${vo.likeCount}</span></button>
                    <button type='button' class='h-reply-btnlike sreplybtn' data-replyNum='${vo.replyNum}' data-replyLike='0' title="싫어요"><i class="far fa-thumbs-down"></i> <span>${vo.disLikeCount}</span></button>	        
                </td>
            </tr>
        
            <tr class='replyAnswer' style='display: none;'>
                <td colspan='2'>
                    <div id='listReplyAnswer${vo.replyNum}' class='h-answerList'>

                    </div>
                    <div  class="h-replytextbox">
                        <div class="replyL">└</div>
                        <div class="replyareabox">
                            <textarea class="replyarea" cols='72' rows='12' ></textarea>
                         </div>
                    </div>
                     <div class="reply2button" >
                        <button type='button' class='h-sendreply2btn' data-replyNum='${vo.replyNum}'>답글 등록</button>
                    </div>
                
                </td>
            </tr>
        </c:forEach>
        </tbody>
        
        <tfoot id='h-listReplyFooter'>
            <tr height='40' align="center">
                <td colspan='2' >
                  ${paging}
                </td>
               </tr>
        </tfoot>
    </table>
