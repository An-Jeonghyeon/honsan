<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypage2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/health/myChallenge.css">

<script type="text/javascript">
function deleteMyChallenge1(num){
	var query ="num="+num;
	var url="${pageContext.request.contextPath}/challenge/deleteMyChallenge?"+query;
	
	if( confirm("삭제시 기존에 진행된 내용은 모두 사라집니다. 삭제하시겠습니까?")) {
		location.href=url;
	}
}
function deleteMyChallenge(num){
	var query ="num="+num;
	var url="${pageContext.request.contextPath}/challenge/deleteMyChallenge?"+query;
	
	if( confirm("포기할 경우 진행중인 내용은 사라집니다.\n정말 그만두시겠습니까?")) {
		location.href=url;
	}
}


</script>

<div class="cccontainer">
	<div class="mypage-top"></div>
	<div class="mych-body">
		<div class="mych-board">
   			<div class="mypa-title">My운동챌린지</div>
   		<div class="supplement-bbs">
   		
             <table class="supplement-table">
                  <thead class="s-thead">
                      <tr>
                          <th class="s-table-num">번호</th>
                          <th class="s-table-category">챌린지명</th>
                          <th class="s-table-sub">진행률</th>
                          <th class="s-table-user">진행현황</th>
                          <th class="s-table-date">선택</th>
                      </tr>
                  </thead>
                  <tbody class="s-tbody">
                       <c:forEach var="dto" items="${list}">
                           <tr class="s-tbody-tr">
                               <td>${dto.listNum}</td>
                               <td class="s-subject">
                                   <a href="${pageContext.request.contextPath}/challenge/articleGo?num=${dto.num}">
                                   		${dto.subName} <b> ${dto.name}</b></a></td>
                               <td>${dto.totalCount}/${dto.challengePeriod}일</td>
                               	<c:if test="${dto.enabled==0}">
                               		<td style="color: blue; font-weight: 700;">진행중</td>
                               	</c:if>
                               	<c:if test="${dto.enabled==1}">
                               		<td style="color: red; font-weight: 700;">완료</td>
                               	</c:if>
                               	<c:if test="${dto.enabled==1}">
	                               <td><button type="button" class="pogi" onclick="deleteMyChallenge1(${dto.num});">삭제하기</button> </td>
                               	</c:if>
                               	<c:if test="${dto.enabled==0}">
	                               <td><button type="button" class="pogi" onclick="deleteMyChallenge(${dto.num});">그만두기</button> </td>
                               	</c:if>
                           </tr>
                        </c:forEach>
                   </tbody>
               </table>
               <div class="supplement-paging">
                   ${dataCount==0?"진행중인 챌린지가 없습니다":paging}
               </div>
		 	</div>
	 	</div>
	</div>
</div>