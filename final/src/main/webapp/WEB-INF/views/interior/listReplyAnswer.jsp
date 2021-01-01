<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	<c:forEach var="vo" items="${listReplyAnswer}">	                                <!-- 답변의 답변 반복 구간  -->
        <li class="comment_reply_list_li">
            <article class="comment_reply_list_item">
                <p class="comment_fild_item_content">
                    <a href="#"><img src="${pageContext.request.contextPath}/resources/images/interior/t1.webp"><span>${vo.userName}</span></a>
                    <span><a class="reply_idTag" href="#"></a>&nbsp;${vo.content}
                    </span>
                    <nav class="comment_fild_tfoot">
                        <span style="font-size: 13px;" class="comment_fild_tfoot_span">${vo.register_date} </span>
                        <span class="comment_fild_tfoot_like">
                        </span>
                        <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin' }">
                            <button class="comment_fild_tfoot_like_count deleteReplyAnswer" 
                                style="cursor: pointer;" data-replyNum='${vo.replyNum}' data-answer='${vo.answer}'>삭제 · 
                            </button>
                        </c:if>
                        <button class="comment_fild_tfoot_singo">신고</button>
                    </nav>

                </p>
            </article>
        </li>
    </c:forEach>
       <li class="leftbox_comment_insert" >
           <div class="leftbox_comment_userImg">
               <img src="${pageContext.request.contextPath}/resources/images/interior/comment.png">
           </div>
           <div class="leftbox_comment_usercomment">
               <div class="leftbox_comment_usercomment_input">
                   <div class="leftbox_comment_usercomment_input2">
                      <textarea placeholder="메모" onkeydown="resize(this)" onkeyup="resize(this)" class="comment_content"></textarea>
                   </div>
               </div>
               <div class="leftbox_comment_usercomment_button">
                   <button type="button" class="btnSendReplyAnswer" data-replyNum='${replyNum}' >등록</button>
               </div>
           </div>
       </li>