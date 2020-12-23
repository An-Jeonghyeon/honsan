<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/room/room.css"
	type="text/css">
	
	
<script type="text/javascript">
function deleteBoard(num) {
<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin' }">
	if(confirm("게시물을 삭제 하시겠습니까 ?")) {
		var q="num="+num+"&${query}";
		var url="${pageContext.request.contextPath}/room/roomDelete?"+q;
		location.href=url;
	}
</c:if>

<c:if test="${sessionScope.member.userId!=dto.userId || sessionScope.member.userId!='admin' }"> 
	alert("게시글을 삭제할 수 없습니다.");
</c:if>

}

function updateBoard(num) {
	<c:if test="${sessionScope.member.userId==dto.userId}">
		var q="num="+num+"&page=${page}";
		var url="${pageContext.request.contextPath}/room/roomUpdate?"+q;
		location.href=url;
	</c:if>
	<c:if test="${sessionScope.member.userId!=dto.userId}">
		alert("게시글을 수정할 수 없습니다.");
	</c:if>	
}

</script>	
	
<div class="body-container">
	<hr>
	<div style="width: 1000px; margin: 0px auto; padding-top: 100px; padding-bottom: 100px;">	
		<!-- 사진이 들어가는 곳 -->
		<div class="imagediv" style="border: 1px solid gray; margin: 10px auto 30px; height: 500px;">




		</div>
		
		<!-- 방 상세 정보 -->
		<div class="roomdetaildiv">
			<div class="linediv">
				<p class="listnum"> 등록 번호 : ${dto.num }</p>
				<p> ${dto.roomtype }</p>
			</div>
			<div class="linediv">
				<table style="width:100%; margin: 15px auto; border-spacing: 0px;">
					<tr>
						<td style="padding: 0 20px 0 20px; width:30%;">
							<div style="text-align: center; border: 1px solid gray; height: 70px;">
								<p>${dto.m2} m<sup>2</sup> / ${dto.pyeoug} 평</p>
							</div>
						</td>
						<td style="padding: 0 20px 0 20px; width:30%; "> 
							<div style="text-align: center; border: 1px solid gray; height: 70px;">
								<p>
								<c:if test="${dto.mrent>0 }">월세</c:if>
								<c:if test="${dto.mrent==0 }">전세</c:if>
								 &nbsp; ${dto.depo} / ${dto.mrent}</p>
							</div>
						</td>
						<td style="padding: 0 20px 0 20px; width:30%; "> 
							<div style="text-align: center; border: 1px solid gray; height: 70px;">
								<p>
								 ${dto.totfloor} / ${dto.corfloor}</p>
							</div>
						</td>
						
					</tr>
				</table>
			</div>
			<div class="linediv">
				<table style="width:100%; margin: 15px auto; border-spacing: 0px;">
				<tr height="40">
					<td style="width: 10%">주차</td>
					<td style="width: 90%;">
					<c:if test="${dto.park==1 }">가능</c:if>
					<c:if test="${dto.park==0 }">불가능</c:if>
					</td>
				</tr>
				<tr height="40">
					<td style="width: 10%">엘리베이터</td>
					<td style="width: 90%;">
					<c:if test="${dto.elev==1 }">가능</c:if>
					<c:if test="${dto.elev==0 }">불가능</c:if>
					</td>
				</tr>
				<tr height="40">
					<td style="width: 10%">입주가능일</td>
					<td style="width: 90%;">
					${dto.movedate }
					</td>
				</tr>
				<tr height="40">
					<td style="width: 10%">주소</td>
					<td style="width: 90%;">
					${dto.addr1 } &nbsp; ${dto.addr2 }
					</td>
				</tr>
				</table>
			</div>
			
			<div class="linediv">
				<p>관리비  &nbsp;&nbsp;| &nbsp;&nbsp; ${dto.adcost}</p>
				<c:if test="${not empty aditems}">
					<c:forEach var="list" items="${aditems}">
						<div class="option">${list}</div>
					</c:forEach>
				</c:if>
			</div>
			
			<!-- 스크립트에서 split으로 배열에 넣어서 여기서 foreach 로 돌려서 하나씩 비교? -->
			<div class="linediv">
				<p style="margin: 10px;">옵션</p>
				
				<c:if test="${not empty options}">
					<c:forEach var="list" items="${options}">
						<div class="option">${list}</div>
					</c:forEach>
				</c:if>
				
				
			</div>
			
			<div class="linediv">
				<p>상세 설명</p>
				<p>${dto.content }</p>
			</div>
			
			<div class="linediv">
				<p style="height: 100px;">지도를............</p>
			</div>
			
		</div>
		
		<div class="btndiv">
			
		
		</div>
		
		
		<div class="replydiv">
			<table style="width:100%; margin: 15px auto; border-spacing: 0px;">
			<tr>
				<td width="300" align="left">
					<button type="button" class="btn" onclick="updateBoard('${dto.num}');">수정</button>
					<button type="button" class="btn" onclick="deleteBoard('${dto.num}');">삭제</button>
				</td>

				<td align="right">
					<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/room/roomlist?${query}';">리스트</button>
				</td>
			</tr>
			</table>
		</div>
		
	</div>
<hr>
</div>
