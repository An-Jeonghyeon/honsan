<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/room/room.css"
	type="text/css">

<script type="text/javascript">
	function bgLabel(ob, id) {
		
		if (!ob.value && "${keyword}"!="") {
			document.getElementById(id).style.display = "";
		} else {
			document.getElementById(id).style.display = "none";
		}
	}

	function searchList() {
		var f = document.searchForm;
		f.submit();
	}

	function article(num) {
		var url = "${articleUrl}&num=" + num;
		location.href = url;
	}
</script>


	<div class="body-container">
	<hr>
	<div style="width: 1000px; margin: 0px auto; padding-top: 100px;">
		<!-- 검색 부분 -->
		<form name="searchForm"
			action="${pageContext.request.contextPath }/room/roomlist"
			method="post">
			<div class="searchlist">
				<table style="width:1000px; margin: 15px auto; border-spacing: 0px;">
					<tr height="60">
						<td align="center"><label for="town" id="lblTown" class="lbl"><i class="fas fa-search" style="color: gray;"></i>동네 이름
								ex)관악구</label> <input type="text" name="keyword" id="town"
							class="searchTF" maxlength="20" tabindex="2"
							onfocus="document.getElementById('lblTown').style.display='none';"
							onblur="bgLabel(this, 'lblTown');">
							<button type="button" class="searchbtn" onclick="searchList();">검색</button>
						</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" name="roomtype" value="원룸">
							원룸 <input type="checkbox" name="roomtype" value="1.5룸">
							1.5룸 <input type="checkbox" name="roomtype" value="투룸">
							투룸 <input type="checkbox" name="roomtype" value="쓰리룸">
							쓰리룸 <input type="checkbox" name="roomtype" value="오피스텔">
							오피스텔 <input type="checkbox" name="roomtype" value="복층">
							복층
						    <input type="checkbox" name="corfloor " value="반지하">
							반지하 <input type="checkbox" name="corfloor " value="옥탑">
							옥탑</td>
					</tr>
					<tr>		
						<td align="right">
						<button type="button" class="btn"
						onclick="javascript:location.href='${pageContext.request.contextPath}/room/roomlist';">새로고침</button>
						<button type="button" class="btn"
						onclick="javascript:location.href='${pageContext.request.contextPath}/room/roomCreated';">방
						올리기</button>
						</td>
					</tr>



				</table>
			</div>
		</form>

		<hr>

	
	<!-- 새로뜬 게시물 또는 인기 게시물 -->
	<div class="toplist">
		<table style="width: 100%;">
			<tr style="height: 50px;">
				<td align="center" colspan="4"> 최근 올라온 방 </td>
			</tr>
			<tr>
				<td class="toplistTd">
					<div class="topimg_box" id="topimg_box"
							style="background: url('${pageContext.request.contextPath}/room/roomlist/ ');">
					</div>
				</td>
				<td class="toplistTd">
					<div class="topimg_box" id="topimg_box"
							style="background: url('${pageContext.request.contextPath}/room/roomlist/ ');">
					</div>
				</td>
				<td class="toplistTd">
					<div class="topimg_box" id="topimg_box"
							style="background: url('${pageContext.request.contextPath}/room/roomlist/ ');">
					</div>
				</td>
				<td class="toplistTd">
					<div class="topimg_box" id="topimg_box"
							style="background: url('${pageContext.request.contextPath}/room/roomlist/ ');">
					</div>
				</td>
			
			</tr>
		
		
		
		</table>
	</div>


	<hr>
			<!-- 리스트 부분 -->
			<div class="roomlist">

				<table style="width: 100%;">
				
				<tr style="height: 50px;">
					<td align="right" colspan="4"> 
					<c:if test="${not empty keyword}">
					검색 결과 " ${keyword} " : 
					</c:if>
					 ${dataCount}개(${page}/${total_page} 페이지)</td>
				</tr>
				
				
			 <c:forEach var="dto" items="${list}" varStatus="status">
			 	<c:if test="${status.index==0 }">
			 	<tr align="center">
			 	</c:if>
			 	<c:if test="${status.index!=0 && status.index%4==0}">
			 		<c:out value="</tr><tr>" escapeXml="false"/>
			 	</c:if>
			 	
			 	<td class="listTd">
			 		<div class="imgLayout" onclick="article('${dto.num}');"style="margin: 10px;">
				 		<div class="img_box"style="background: url('${pageContext.request.contextPath}/uploads/room/${dto.mainimg}');
							background-position: center;background-size:cover;background-position:center;height: 110px; border-radius: 5px; border:2px solid silver;"></div>
						<br><p class="title-style">${dto.subject}<p>
						<div class="mainexplain">
							<p>${dto.dealtype } / ${dto.depo } / ${dto.mrent }</p>
						</div>
						<div class="mainexplain">
							<p>${dto.m2} m<sup>2</sup>  ${dto.pyeoug } 평</p>
						</div>
			 		</div>
			 	</td>
			 </c:forEach>
					<!-- n은 리스트 개수 -->
			<c:set var="n" value="${list.size()}"/>
			<c:if test="${n>0 && n%4!=0}">
				<c:forEach var="i" begin="${n%4+1}" end="4">
					<td width="210">
					<div class="imgLayout" style="cursor: default;">&nbsp;</div>
					</td>
				</c:forEach>
			</c:if>
			<c:if test="${n!=0}">
				<c:out value="</tr>" escapeXml="false"/>
			</c:if>
			</table>



		</table>


				<table style="width: 100%; border-spacing: 0;">
					<tr height="50">
           					<td align="center">
           						<span class="guest-more">게시글 더보기</span>
           					</td>
           				</tr>
				</table>


		</div>
				
	</div>
	<hr>
</div>
