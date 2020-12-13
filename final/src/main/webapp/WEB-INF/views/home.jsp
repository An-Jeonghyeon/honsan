<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="loginMainBody">
                <div class="slideshow-container">
                    <div class="slide slide1">
                        backgounr img 1 
                    </div>
                    <div class="slide slide2">
                        backgounr img 2 
                    </div>
                    <div class="slide slide3">
                        backgounr img 3 
                    </div>
                </div>
            </div>
            <div class="categories-Recommendation1">
                <div class="categoriesName">
                    <span>오늘 뭐입어? 추천 게시판</span>
                </div>
                            <a href="${pageContext.request.contextPath}">
                                <div class="categories-content">추천게시물</div>
                            </a>
            </div>
            <div class="categories-Recommendation1">
                <div class="categoriesName">
                    <span>혼자 뭐먹지? 추천 게시판</span>
                </div>
                        <a href="${pageContext.request.contextPath}">
                            <div class="categories-content">추천게시물</div>
                        </a>
            </div>
            <div class="categories-Recommendation1">
                <div class="categoriesName">
                    <span>방구할래? 추천 게시판</span>
                </div>
                        <a href="${pageContext.request.contextPath}">
                            <div class="categories-content">추천게시물</div>
                        </a>
            </div>