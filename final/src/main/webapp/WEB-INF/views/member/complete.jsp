<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">

<section>
        <div id="singup-content">
            <!-- 회원가입 헤더 -->
	            <article class="singup-header">
	                <div class="singup-title">
	                    <h1>회원가입 완료</h1>
	                </div>
	                <div class="singup-step">
	                    <!-- 이거 너무 어려워 ...일단 보류  -->
	                    <div class="step1">
	                        <div class="circle"> </div>
	                        <div class="line1"> </div>
	                        <p class="step-name">STEP 1</p>
	                    </div>
	                    <div class="step2">
	                        <div class="line2-1"> </div>
	                        <div class="circle2-1"> </div>
	                        <p class="step-name2">STEP 2</p>
	                    </div>
	                </div>
	            </article>
	
	            <div class="singup-ok">
	                <div class="ok-title">
	                    <i class="far fa-id-badge fa-9x"></i>
	                    <p >회원가입이 완료되었습니다.</p>
	                </div>
	                <div class="ok-sub">
	                    <p>회원가입이 정상적으로 완료되었습니다.</p>
	                    <p>로그인 후 더 많은 서비스를 이용해주세요.</p>
	                    <button type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/member/login';">로그인 하기</button>
	                </div>
	            </div>
        </div>
</section>