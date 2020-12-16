<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

             <nav>
              	<div class="logo">
	                <c:if test="${empty sessionScope.member}">
		                <a href="${pageContext.request.contextPath}"></a>
	                </c:if>
	                <c:if test="${not empty sessionScope.member}">
		                <a href="${pageContext.request.contextPath}/home"></a>
	                </c:if>
                </div>
                
                <div class="menuBox"> <a href="${pageContext.request.contextPath}">오늘 뭐 입어?</a></div>
                <div class="menuBox"> <a href="${pageContext.request.contextPath}">혼자 뭐 먹지?</a></div>
                <div class="menuBox"> <a href="${pageContext.request.contextPath}">방구할래?</a></div>
                <div class="menuBox"> <a href="${pageContext.request.contextPath}">인테리어</a></div>
                <div class="menuBox"> <a href="${pageContext.request.contextPath}">건강챙기기</a></div>
                <div class="loginBox">
                    <div class="loginName">
              			<c:if test="${not empty sessionScope.member}">
                			  ${sessionScope.member.userName} 님
                	    </c:if>
          	            <c:if test="${empty sessionScope.member}">
	                    	<a href="${pageContext.request.contextPath}/member/login">로그인</a>
                  		</c:if> 
                    </div>
                    
                    	<c:if test="${sessionScope.member.userId =='admin'}">
							<a href="${pageContext.request.contextPath}/adm/adm" style="padding-left :10px; line-height: 100px; font-size: 0px;"><img style="width: 32px; height: 29px;" src="${pageContext.request.contextPath}/resources/images/setcon_1.jpg"></img></a>
						</c:if>
                    <div class="mypage">
                        <i class="fas fa-house-user fa-2x"></i>
           				<c:if test="${not empty sessionScope.member}">
	                       	<div class="userBox">
	                            <ul>
	                             	<li><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
		                            <li><a href="${pageContext.request.contextPath}">마이페이지</a></li>
	                           	</ul>
	                        </div>
                 		</c:if>
						<!-- 유저아이디 admin 이면 버튼생성 구간  -->

                    </div>
                </div>
            </nav>
            <div class="hideNav">
                <div class="innerhideNav">
                    <div class="PermenuObject">
                    <ul class="menuObject">
                        <li> <a href="${pageContext.request.contextPath}">오늘의 옷차림</a></li>
                        <li> <a href="${pageContext.request.contextPath}/dress/list">코디자랑</a></li>
                        <li> <a href="${pageContext.request.contextPath}/dressTip/list">팁</a></li>

                    </ul>
                    <ul class="menuObject">
                        <li> <a href="${pageContext.request.contextPath}">HONCOOQ</a></li>
                        <li> <a href="${pageContext.request.contextPath}">우리집 냉장고</a></li>
                        <li> <a href="${pageContext.request.contextPath}">우리동네 마트</a></li>
                        <li> <a href="${pageContext.request.contextPath}">나만의 요리 후기</a></li>
                    </ul>
                    <ul class="menuObject">
                        <li> <a href="${pageContext.request.contextPath}">방구할래?</a></li>
                        <li> <a href="${pageContext.request.contextPath}">부동산 팁</a></li>
                        <li> <a href="${pageContext.request.contextPath}">사생활 보안</a></li>
                        <li> <a href="${pageContext.request.contextPath}">귀갓길을 부탁해</a></li>
                    </ul>
                    <ul class="menuObject">
                        <li> <a href="${pageContext.request.contextPath}/interior/main">내집자랑</a></li>
                        <li> <a href="${pageContext.request.contextPath}">생활 팁</a></li>
                        <li> <a href="${pageContext.request.contextPath}">생활 팁</a></li>
                        <li> <a href="${pageContext.request.contextPath}">생활 팁</a></li>
                    </ul>
                    <ul class="menuObject">
                        <li> <a href="${pageContext.request.contextPath}/supplement/list">영양제 뭐 먹을까?</a></li>
                        <li> <a href="${pageContext.request.contextPath}">하루 운동 챌린지</a></li>
                        <li> <a href="${pageContext.request.contextPath}">오늘 운동을 보여줘</a></li>
                        <li> <a href="${pageContext.request.contextPath}">건강 지킴이</a></li>
                    </ul>
                </div>
                </div>
            </div>
 
