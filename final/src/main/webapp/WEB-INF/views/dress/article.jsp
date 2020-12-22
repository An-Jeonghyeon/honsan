<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/dress/created.css"
	type="text/css">


  <div class="articleMainBody">
                <div class="articleMainHeader">
                    <div class="articleGo">
                        <span><a href="${pageContext.request.contextPath}/dress/list">자랑게시판
                                &gt;</a></span>
                    </div>
                    <div class="articleMainHeaderSubject">
                        <span>${dto.subject}</span>
                    </div>
                    <div class="articleSub">
                        <div class="articleMainHeaderUserName">
                            <span>${dto.userName}</span> 
                            <span class="createdNumber">${dto.register_date}</span>
                            <span class="hitCountNumber">조회 ${dto.hitCount}</span>
                        </div>
                        <div class="articleMainHeaderReply">
                            <span> <a href="${pageContext.request.contextPath}"> 댓글 54</a></span>
                        </div>
                    </div>
                </div>
                <div class="ContentBody">
                    <pre>
                        ${dto.content}				
                    </pre>
                </div>
                <div class="LikeBox">
                    <span class="LikeHeart"> <i class="far fa-heart ILikeHeart"></i>좋아요
                        13
                    </span> <span class="Comment"><i class="far fa-comments"></i>댓글 54</span> <span
                        class="fullLikeHeart"> <i class="fas fa-heart"></i></span>
                </div>
                <div class="ReplySUb">
                    <span>댓글 <span class="ReplySUbDown">▾</span></span>
                </div>
                <form action="" method="post" name="ReplayListForm">
                    <div class="ReplyList">
                        <span class="ReplyListUserName">이지영</span>
                        <p>
                            <span class="ReplyListContent">어떤 항목을 체크 해야 하나요?</span>
                        </p>
                        <span class="createdNumber">2020.12.03. 01:03</span>
                        <button type="button" class="RelyWrite">답글쓰기</button>
                    </div>
                    <div class="ReplyAnswerBody">
                        <div class="ReplyAnswerContentBox">
                            <span class="ReplyListUserX">x</span>
                            <span class="ReplyAnswerContentUserName">주다혜</span>
                            <textarea name="" id="" placeholder="댓글을 남겨보세요">여기는 대댓글</textarea>
                            <div class="ReplySubmitButton">
                                <button class="Replybtn" type="button">등록</button>
                            </div>
                        </div>
                    </div>
                    <div class="ReplyAnswer">
                        <span class="ReplyListUserName">주다혜</span>
                        <p>
                            <span class="ReplyListContent">여러 항목을 체크해야죠 ㅡㅡ;</span>
                        </p>
                        <span class="createdNumber">2020.12.03. 01:03</span>
                    </div>
            
                    <div class="pagingBody">
                        <div class="pagingInnerBody">
                            <span>1</span>
                        </div>
                    </div>
            
                    <div class="ReplyBody">
                        <div class="ReplyContentBox">
                            <span>주다혜</span>
                            <textarea name="" id="" placeholder="댓글을 남겨보세요"></textarea>
                            <div class="ReplySubmitButton">
                                <button class="Replybtn" type="button">등록</button>
                            </div>
                        </div>
                    </div>
                    
                </form>
            </div>