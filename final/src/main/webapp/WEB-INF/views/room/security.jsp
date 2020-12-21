<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/room/security.css"
	type="text/css">

	
<script>
/* Demo purposes only */
$(".hover").mouseleave(
  function () {
    $(this).removeClass("hover");
  }
);

</script>

<div class="body-container">
	<hr>
	<div class="totaldiv">
		
		<div class="selectbtndiv">
			<table>
			<tr>
				<td colspan="3" align="center"><p class="toptitleP"><i class="fas fa-hand-pointer" style="color: gray;"></i>이용할 서비스를 선택해 주세요.</p></td>
			</tr>
			<tr>
				<td align="center">
					
<figure class="snip1384">
  <img src="${pageContext.request.contextPath }/resources/images/room/securityTest.jpg" alt="보안 테스트" />
  <figcaption>
    <h3>보안 자가 진단 테스트</h3>
    <p><br>
    혼자 살기 무서운 세상!<br>
나의 생활이 위험으로 부터 안전한지 테스트를 해볼까요?
</p><i class="fas fa-angle-right"></i>
  </figcaption>
  <a href="${pageContext.request.contextPath }/security/securtiyTest"></a>
</figure>


	
				</td>
				
				<td align="center" style="padding: 50px;"></td>
				
				<td align="center">
					
<figure class="snip1384"><img src="${pageContext.request.contextPath }/resources/images/room/securityService.jpg" alt="sample92" />
  <figcaption>
    <h3>귀갓길을 부탁해</h3>
    <p><br>국가에서 지원하는 안심 서비스를 살펴보세요 </p><i class="fas fa-angle-right"></i>
  </figcaption>
  <a href="#"></a>
</figure>
					
					
				</td>
			</tr>
			
			
			</table>
		
		</div>
	
	</div>
	<hr>
</div>