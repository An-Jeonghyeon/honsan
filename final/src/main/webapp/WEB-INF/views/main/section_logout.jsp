<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">
    
 <section id="section1">
        <div class="section1Image">
            <div class="textBox">
                <h1 class="maintexttop">혼자 무엇을 먹을지 고민인가요?</h1>
                <h2 class="hh1">집을 어떻게 꾸밀지 고민인가요?</h2>
                <h3 class="hh2">집을 구하고 싶은데 괜찮은 부동산을 못찾겠나요?</h3>
                <h2 class="hh3">오늘 날씨에는 어떤 옷을 입을지 고민인가요?</h2>
                <h3 class="hh4">혼자 어떤 운동을 할지 고민인가요?</h3>
            </div>
        </div>
        </section>

        <section id="section2">
            <article class="article1">
                <div class="contentUp content1">
                    <div class="contentInner"></div>
                </div>
                <div class="contentUp content2">
                    <div class="contentInner"></div>
                </div>
                <div class="contentUp content3">
                    <div class="contentInner"></div>
                </div>
            </article>
            <article class="article2">
                <div class="contentDown content1">
                    <div class="contentInner"></div>
                </div>
                <div class="contentDown content2">
                    <div class="contentInner"></div>
                </div>
                <div class="contentDown content3">
                    <div class="contentInner"></div>
                </div>
            </article>
        </section>
        <form action="${pageContext.request.contextPath}/member/login" method="GET">
            <div class="login">
                <button class="logoutbtn" type="button" onclick="sendLogin();">로그인 하러가기</button>
            </div>
        </form>