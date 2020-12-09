<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<article class="writeHeader">
                <div class="writeheaderInnerText">
                    <h3 class="FadeinText">혼자서 뭐입어?/혼자 뭐먹어?/혼자 방구해?</h3>
                    <small class="FadeinText">오늘도 어김없이 혼자 무엇을 하려는 당신 <br> 오늘 하루 수고한 당신과
                        ,주변사람들을 위해 <br> 당신의 하루를 공유 해보는게 어떠세요?
                    </small>
                </div>
                <div class="writeHeaderMenu">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}">전체글보기</a></li>
                        <li><a href="${pageContext.request.contextPath}">베스트글</a></li>
                    </ul>
                </div>
            </article>
            <form action="" method="post" name="writeBodyForm">
                <article class=" writeBody">
                    <div class="writeBodyHeader">
                        <span>혼자뭐먹지 자랑 글쓰기/...</span>
                    </div>

                    <div class="subjectBody">
                        <input type="text" name="subject" id="subject" placeholder="제목을 입력해 주세요.">
                    </div>
                    <div class="smartEditor">SmartEditor 영역</div>
                    <div class="contentBody">
                        <div class="inputBody1">
                            <p>
                                <input type="text" name="content">
                            </p>
                        </div>

                        <div class="tagBody">

                            <div class="plusTag">
                                <ul id="tag-list">

                                </ul>

                            </div>
                            <div class="inputBody2">
                                <input type="text" class="InputTag" name="tag" placeholder="#태그를 입렵해 주세요.(최대5개)">
                                <div class="tagbtnBody">
                                    <input type="hidden" name="tag" id="IdTag">
                                    <button class="Tag-btn" type="button" onclick="TagbtnSend()">TAG</button>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="buttonBoxBody">
                        <button type="button" id="writeSubmit" >등록하기</button>
                        <button type="button" id="CencelSubmit">등록취소</button>
                    </div>
                </article>
            </form>