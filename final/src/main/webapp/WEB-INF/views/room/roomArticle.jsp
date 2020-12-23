<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/room/room.css"
	type="text/css">
	
	
<div class="body-container">
	<hr>
	<div style="width: 1000px; margin: 0px auto; padding-top: 100px;">	
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
				aditem 고치고 넣기
			</div>
			
			<div class="linediv">
				<p style="margin: 10px;">옵션</p>
				<c:if test="${dto.option.indexOf('에어컨') != 0}">
					<div class="option">에어컨</div>
				</c:if>
				<c:if test="${dto.option.indexOf('냉장고') != 0}">
					<div class="option" >냉장고</div>
				</c:if>
				<c:if test="${dto.option.indexOf('세탁기') != 0}">
					<div class="option">세탁기</div>
				</c:if>
				<c:if test="${dto.option.indexOf('가스레인지') != 0}">
					<div class="option">가스레인지</div>
				</c:if>
				<c:if test="${dto.option.indexOf('인덕션') != 0}">
					<div class="option">인덕션</div>
				</c:if>
				<c:if test="${dto.option.indexOf('전자레인지') != 0}">
					<div class="option">전자레인지</div>
				</c:if>
				<c:if test="${dto.option.indexOf('책상') != 0}">
					<div class="option">책상</div>
				</c:if>
				<c:if test="${dto.option.indexOf('책장') != 0}">
					<div class="option">책장</div>
				</c:if>
				<c:if test="${dto.option.indexOf('침대') != 0}">
					<div class="option">침대</div>
				</c:if>
				<c:if test="${dto.option.indexOf('옷장') != 0}">
					<div class="option">옷장</div>
				</c:if>
				<c:if test="${dto.option.indexOf('신발장') != 0}">
					<div class="option">신발장</div>
				</c:if>
				<c:if test="${dto.option.indexOf('싱크대') != 0}">
					<div class="option">싱크대</div>
				</c:if>
			</div>
			
			
			
			
		</div>		
		
		
		
	</div>
<hr>
</div>
