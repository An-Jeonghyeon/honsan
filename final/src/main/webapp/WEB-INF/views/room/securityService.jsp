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

<script type="text/javascript">
$(document).ready(function() {
    $(window).scroll( function(){
        $('.policeimg').each( function(i){
            
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
<div class="body-containertestService">
    <div class="maindiv">
    	<table class="maintable">
   		<tr>
   			<td height="650" colspan="2"><img alt="타이틀" src="${pageContext.request.contextPath}/resources/images/room/servicetitle.PNG"
   					style="margin-right:50px; height: 300px;" width=""></td>
   			<td><img class="policeimg" alt="타이틀" src="${pageContext.request.contextPath}/resources/images/room/servicepolice.png"></td>
   		</tr>
    	<tr>
   			<td width="400"><img alt="타이틀" src="${pageContext.request.contextPath}/resources/images/room/servicesubtitle1.PNG"
   					style="height: 55px;"></td>
   			<td colspan="2"><img alt="타이틀" src="${pageContext.request.contextPath}/resources/images/room/servicesubtitle2.PNG"
   					style="height: 50px; padding-left: 100px;"></td>
   		</tr>
    	<tr>
   			<td width="200"><img alt="타이틀" src="${pageContext.request.contextPath}/resources/images/room/servicetime.PNG"
   					style="height: 350px; padding: 20px;"></td>
   			<td colspan="2"><img alt="타이틀" src="${pageContext.request.contextPath}/resources/images/room/servicemap.PNG"
   					style="height: 350px; padding: 20px 0 20px 0;"></td>		
   		</tr>
   		<tr>
   			<td><p class="expl">밤 10시 부터 새벽 1시 까지 서비스를 신청한 여성과 함께 주거지까지 동행해 주는 서비스</p></td>
   			<td></td>
   			<td></td>
   		</tr>
    	<tr>
   			<td width="480">
   			<div style="height: 140px; float: left;">
   				<img alt="타이틀" src="${pageContext.request.contextPath}/resources/images/room/servicemonday.PNG" style="height: 100px; padding: 20px;"> 
   			</div>
   			<div style="height: 100px; float: left; padding-top: 40px;">
   				<p class="expl">오후 10시 ~ 자정 전까지</p>
   			</div>
   			</td>
   			<td colspan="2">
			<div style="height: 140px; float: left;">
   				<img alt="타이틀" src="${pageContext.request.contextPath}/resources/images/room/serviceweek.PNG" style="height: 100px; padding: 20px;"> 
   			</div>
   			<div style="height: 100px; float: left; padding-top: 40px;">
   				<p class="expl">오후 10시 ~ 새벽 1시</p>
   			</div>
			</td>		
   		</tr>
    	<tr>
   			<td colspan="3"><img alt="타이틀" src="${pageContext.request.contextPath}/resources/images/room/servicesubtitle3.PNG"
   					style="height: 50px; padding: 40px 10px 30px 10px;"></td>
   		</tr>
    	<tr>
   			<td width="450"><img alt="타이틀" src="${pageContext.request.contextPath}/resources/images/room/service01.PNG"
   					style="height: 350px; padding: 20px;"></td>
   			<td colspan="2"><img alt="타이틀" src="${pageContext.request.contextPath}/resources/images/room/service02.PNG"
   					style="height: 350px; padding: 20px 0 20px 70px;"></td>		
   		</tr>
    	<tr>
   			<td><p class="expl2">지하철역, 버스정류장 도착<br> 30분 전에 120으로 전화 또는<br> 앱으로 신청</p></td>
   			<td colspan="2"><p class="expl2" style="padding-left: 50px;">신청자와 만날 2인 1조<br> 스카우트 이름 정보 확인</p></td>
   		</tr>
   		<tr>
   			<td width="450"><img alt="타이틀" src="${pageContext.request.contextPath}/resources/images/room/service03.PNG"
   					style="height: 350px; padding: 20px;"></td>
   			<td colspan="2"><img alt="타이틀" src="${pageContext.request.contextPath}/resources/images/room/service04.PNG"
   					style="height: 350px; padding: 20px 0 20px 70px;"></td>		
   		</tr>
   		<tr>
   			<td><p class="expl2" style="padding-left: 0;">약속된 장소에 도착 후<br> 스카우트 신분증 확인</p></td>
   			<td colspan="2"><p class="expl2" style="padding-left: 50px;">스타우트와 함께 집 앞까지<br> 안전하게 귀가</p></td>
   		</tr>
   		<tr>
   			<td colspan="3">
	   			<img alt="타이틀" src="${pageContext.request.contextPath}/resources/images/room/servicebottem.PNG"
	   					style="height: 500px; padding-left: 180px;">
   			</td>
   		</tr>
   		
    	</table>

    </div>
	
	<div class="barogodiv">
		<div class="barogobtn">
			<div class="section">
			  <div class="section__item">
			    <a href="https://www.gov.kr/portal/service/serviceInfo/306000000190" class="r-link text-outlined text-outlined_v1">
			      <span class="text-outlined__label" style="width:80px; border-bottom : 3px solid #f6eade;">바로가기</span>
			    </a>
			  </div>
			</div>
		</div>
	</div>   
   





</div>
<hr>






