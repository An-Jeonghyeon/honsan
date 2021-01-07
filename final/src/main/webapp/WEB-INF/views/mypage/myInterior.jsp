<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypage2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/health/myChallenge.css">

<script type="text/javascript">


</script>

<div class="cccontainer">
	<div class="mypage-top"></div>
	<div class="mych-body">
		<div class="mych-board">
   			<div class="mypa-title">My 인테리어</div>
   		<div class="supplement-bbs">
   		
             <table class="supplement-table">
                  <thead class="s-thead">
                      <tr>
                          <th class="s-table-num">좋아요</th>
                          <th class="s-table-category">인테리어 명</th>
                          <th class="s-table-sub">작성일</th>
                          <th class="s-table-user">조회수</th>
                          <th class="s-table-date">기타</th>
                      </tr>
                  </thead>
                  <tbody class="s-tbody">
                       <c:forEach var="vo" items="${list}">
                           <tr class="s-tbody-tr">
  								<td>${vo.interiorLikeCount}</td>
  								<td><a href="${pageContext.request.contextPath}/interior/boardItem?num=${vo.num}">${vo.subject}</a></td>
  								<td>${vo.register_date}</td>
  								<td>${vo.hitCount}</td>
  								<td></td>
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