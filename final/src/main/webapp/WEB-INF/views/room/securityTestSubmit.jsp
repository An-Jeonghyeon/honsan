<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/room/security.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/room/room.css"
	type="text/css">

<script>
$(document).ready(function() {
    $(window).scroll( function(){
        $('.submittable').each( function(i){
            
            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            
            if( bottom_of_window > bottom_of_element ){
                $(this).animate({'opacity':'1','margin-top':'20px'},500);
            }
            
        }); 
    });
});






</script>





<hr>
<div class="body-containertestsubmit">
    <div class="body-title">
        <p class="titlename"> &nbsp;&nbsp;&nbsp;2021년도 전국보안자가진단평가 성적통지표 </p>
        <br><br><br><br>
        <p class="titlename" style="font-size: 50px;"> 보안 탐구 영역 </p>
    </div>
   
   <div class='submitLayout'>
   		<table class="submittable">
   			<tr>
   				<td colspan="2" height="50" style="text-align: center; background-color: #cccccc; font-weight: bold;"> 수험 번호 </td>
   				<td colspan="2" style="text-align: center; background-color: #cccccc; font-weight: bold;"> 성 명 </td>
   				<td rowspan="2" style="text-align: center;"> [회원 사진] </td>
   			</tr>
   			<tr>
   				<td colspan="2" height="90" style="text-align: center;"> 00000-000000000 </td>
   				<td colspan="2" style="text-align: center;"> ${sessionScope.member.userName} </td>
   			</tr>
   			<tr>
   				<td height="70" style="text-align: center; background-color: #cccccc; font-weight: bold;"> 구  분 </td>
   				<td style="text-align: center;"> 건물 장치 부분 </td>
   				<td style="text-align: center;"> 생활 &amp; 일상 부분 </td>
   				<td style="text-align: center;"> 서비스 부분 </td>
   				<td style="text-align: center;"> 전체 </td>
   			</tr>
   			<tr>
   				<td height="70" style="text-align: center; background-color: #cccccc; font-weight: bold;"> 점 수 </td>
   				<td style="text-align: center;"> ${cate1 } </td>
   				<td style="text-align: center;"> ${cate2 } </td>
   				<td style="text-align: center;"> ${cate3 } </td>
   				<td style="text-align: center;"> ${total } </td>
   			</tr>
   			
   		</table>
   </div> 
   <div class="expltotaldiv">
		<div class="expldivimg">
			<c:if test="${total >= 53}">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/room/dojang2.png">
			</c:if>
			<c:if test="${total >= 30 && total<53}">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/room/dojang1.jpg">
			</c:if>
			<c:if test="${total < 30}">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/room/dojang3.jpg">
			</c:if>
		</div>
		<div class="expldivtext">
			<div class="expldivp">
			<p class="score">총 67점 중 <strong>${total}점</strong></p>
			</div>
			
			<div class="textdiv">
			<c:if test="${total >= 53}">
			
			<p class="underscore">
				점수가 높아요! 하지만 놓치는 보안이 있는 것 같으니 다시 살펴보세요<br><br>
				잘하고 있다고 방심하지 마시고 언제나 조심해야 해요<br><br>
				다양한 보안 제품이나 서비스 등을 조회해 보아요<br><br>
			</p>
			
			</c:if>
			<c:if test="${total >= 30 && total<53}">
			
			<p class="underscore">
				나쁘지는 않지만 생활에 위험이 있네요. 안심하지 마시고 안전에 집중!<br><br>
				놓친 항목들을 다시 보면서 하나씩 점수를 높여보아요<br><br>
				만점을 향한 그날까지!!<br><br>
			</p>
			
			</c:if>
			<c:if test="${total < 30}">
			
			<p class="underscore">
				이런 지금 장난하세요? 위험에 너무 노출되어 있어요<br><br>
				이전의 항목들을 다시 체크하며 간단한 보안부터 신경쓰세요<br><br>
				위험한 세상 조심하며 살아요!<br><br>
			</p>
			
			</c:if>
			</div>
			<div>
				<div class="section">
				  <div class="section__item">
				    <a href="#0" class="r-link text-flat text-flat_v9">
				      <span class="text-flat__label">보안 서비스 살펴보기</span>
				    </a>
				  </div>
				</div>
			</div>
		</div>
		
   </div>





</div>
<hr>