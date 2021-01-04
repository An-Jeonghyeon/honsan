<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/room/security.css"
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
   				<td colspan="2" height="50" style="text-align: center; background-color: #cccccc;"> 수험 번호 </td>
   				<td colspan="2" style="text-align: center; background-color: #cccccc;"> 성 명 </td>
   				<td rowspan="2" style="text-align: center;"> [회원 사진] </td>
   			</tr>
   			<tr>
   				<td colspan="2" height="90" style="text-align: center;"> 00000-000000000 </td>
   				<td colspan="2" style="text-align: center;"> ${sessionScope.member.userName} </td>
   			</tr>
   			<tr>
   				<td height="70" style="text-align: center; background-color: #cccccc;"> 구  분 </td>
   				<td style="text-align: center;"> 건물 장치 부분 </td>
   				<td style="text-align: center;"> 생활 &amp; 일상 부분 </td>
   				<td style="text-align: center;"> 서비스 부분 </td>
   				<td style="text-align: center;"> 전체 </td>
   			</tr>
   			<tr>
   				<td height="70" style="text-align: center; background-color: #cccccc;"> 구  분 </td>
   				<td style="text-align: center;"> ${cate1 } </td>
   				<td style="text-align: center;"> ${cate2 } </td>
   				<td style="text-align: center;"> ${cate3 } </td>
   				<td style="text-align: center;"> ${total } </td>
   			</tr>
   			
   		</table>
   </div> 






</div>
<hr>