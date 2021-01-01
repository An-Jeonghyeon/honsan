<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

			<c:forEach var="dto" items="${listReply}">
                    <li class="comment_list_item">
                        <article class="comment_fild_item">
                            <p class="comment_fild_item_content">
                                <a href="#"><img src="${pageContext.request.contextPath}/resources/images/interior/t1.webp"><span>${dto.userName}</span></a>
                                <span>${dto.content}
                                </span>
                                <nav class="comment_fild_tfoot">
                                    <span style="font-size: 13px;" class="comment_fild_tfoot_span">${dto.register_date} </span>
                                    <span class="comment_fild_tfoot_like">
                                    <button type="button" class="comment_fild_tfoot_like_count  btnReplyAnswerLayout" data-replyNum='${dto.replyNum}'>&nbsp; 답글 달기 · </button>
                                    <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin' }">
                                    	<button class="comment_fild_tfoot_like_count deleteReply" 
                                    	style="cursor: pointer;" data-replyNum='${dto.replyNum}' data-pageNo='${pageNo}'>삭제 · 
                                    	</button>
                                    </c:if>
                                    <button class="comment_fild_tfoot_singo">신고</button>
                                </nav>

                            </p>
                        </article>
                        <div class="comment_reply_list" style="display: none;">
                            <ul class="comment_reply_list_ul${dto.replyNum}">
                                <!-- 답변의 답변 반복 구간  -->
								
                               
                            </ul>
                        </div>
                    </li>
          </c:forEach>
          <li>
          	<table style="width: 100%; border-spacing: 0px;">
	         <tr height="35">
	            <td align="center">
	               ${dataCount==0?"등록된 게시물이 없습니다.":paging}
	            </td>
	         </tr>
      		</table>
          </li>
          
          