<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta http-equiv="X-Frame-Options" content="deny" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/health/challengeArticle.css" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">
    
<section>
	 <div class= "challengeArticle"> 
        <div class="articleHeader">
            <div class="headertitle">
                <span class="hollotext">Hollo</span>
                <span class="haru">하루운동 챌린지</span>
            </div>
            <div class="hrr"></div>
            <div class="charsubject">
                <div class="subnamediv"><span>${dto.subName}</span></div>
                <div class="namediv">
                    <span>${dto.name}</span>
                    <div class="mitgul"></div>
                </div>
            </div>
        </div>
        <div class="articleBody">
            <div class="videodiv">
                <div class="videoyou">
					<object type="text/html" width="100%" height="600" data="//${dto.video}" allowFullScreen></object>
                </div>
            </div>
            <div class="intro">
                    <div class="introtext">
                        <img src="${pageContext.request.contextPath}/resources/images/health/notice.png"> <span>챌린지 소개</span>
                    </div>
                    <div class="introbox">
                        <p class="introboxtext">${dto.content}</p>
                    </div>
            </div>

        </div>
        <div class="articleChallenge">
            <div class="dalbox">
                <ul class="chaul">
                	<c:forEach var="dto2" items="${contentList}" >
	                    <li class="chali">
	                        <div class="chaliday"><span>DAY ${dto2.dDate}</span></div>
	                        <div class="chalicontent">
	                          	  <p>${dto2.exContent}</p>
	                        </div>
	                    </li>
	                </c:forEach>
<%--                 	<c:forEach var="vo" items="${contentList}" > --%>
<%-- 		                <c:forEach var="i" begin="1" end="${dto.challengePeriod}"> --%>
<!-- 	                    <li class="chali"> -->
<%-- 	                        <div class="chaliday"><span>DAY ${i}</span></div> --%>
<!-- 	                        <div class="chalicontent"> -->
<%-- 	                          	  <p>${vo.name}</p> --%>
<!-- 	                        </div> -->
<!-- 	                    </li> -->
<%-- 	                	</c:forEach> --%>
<%-- 	                </c:forEach> --%>
                </ul>
            </div>
        </div>
        <div class="gobut">
            <div class="gobutton">
                <button type="button" class="gobtngo"> 도 전 하 기 </button>
                <button class="h-listButton" onclick="javascript:location.href='${pageContext.request.contextPath}/challenge/list?${query}';">목록</button>
                <c:if test="${sessionScope.member.userId =='admin'}">
	                <button class="h-adminButton" onclick="javascript:location.href='${pageContext.request.contextPath}/adm/health/list';">관리자 리스트</button>
                </c:if>
                
            </div>
        </div>

    </div>
</section>