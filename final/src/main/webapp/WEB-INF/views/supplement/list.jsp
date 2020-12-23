<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/health/supplement.css" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">

<script type="text/javascript">
	function searchList() {
		var f=document.searchForm;
		f.submit();
	}
</script>
<script type="text/javascript">
$(function() {

	var floatPosition = parseInt($(".floating-write").css('top'));
	
	$(window).scroll(function() {
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";
		
		$(".floating-write").stop().animate({
			"top" : newPosition
		}, 300);

	}).scroll();
});
</script>


<section>
    <div class="supplement-body">
       <div class="supplement-top">
           <div class="top-text-all">
               <div class="top-title">
                    <span>오늘 영양제</span>
               </div>
               <div class="top-text">
                   <span>영양제 먹고 안먹고의 차이를 이것을 먹고 난 느꼈다 ! </span><br>
                   <span>내가 먹는 영양제를 같이 공유해봐요 </span>
               </div>
           </div>
       </div>
   
       <!-- 영양제 내용 -->
       <div class="supplement-content">
           <!-- 인기영양제 -->
           <div class="supplement-best">
               <div class="title-best">
                   <h2>인기 영양제</h2>
               </div>
   
               <div class="content-best">
               	<c:forEach var="dto" items="${bestList}">
                   <div class="s-best">
                       <div class="best-top"> 
                           <div class="best-image">
                               <img class="best-imageFile" src="${pageContext.request.contextPath}/uploads/supplement/${dto.imageFilename}" onclick="javascript:location.href='${article_url}&num=${dto.num}';">
                           </div>
                           <div class="best-num"><span class="best-num-span">${dto.bestNum}<small>위</small></span></div>
                       </div>
                       <div class="best-bottom">
                           <div class="best-subject"><a href="${articleUrl}">${dto.subject}</a></div>
                           <div class="best-user">${dto.userId}</div>
                           <div class="best-count"> 
                           	<span class="count-count"><i class="far fa-thumbs-up"></i></span> 
                           		<span>${dto.likeCount}</span></div>
                       </div>
                   </div>
               	</c:forEach>
               </div>
           </div>     
           <!-- 영양제 게시판 -->
           <div class="supplement-bbs">
               <table class="supplement-table">
                   <thead class="s-thead">
                       <tr>
                           <th class="s-table-num">번호</th>
                           <th class="s-table-sub">제목</th>
                           <th class="s-table-user">작성자</th>
                           <th class="s-table-date">날짜</th>
                           <th class="s-table-lisk">추천</th>
                           <th class="s-table-count">조회수</th>
                       </tr>
                   </thead>
                   <tbody class="s-tbody">
                       <c:forEach var="dto" items="${list}">
                           <tr class="s-tbody-tr">
                               <td>${dto.listNum}</td>
                               <td class="s-subject">
                                   <a href="${article_url}&num=${dto.num}">${dto.subject}</a></td>
                               <td>${dto.userId}</td>
                               <td>${dto.register_date}</td>
                               <td>${dto.likeCount}</td>
                               <td>${dto.hitCount}</td>
                           </tr>
                       </c:forEach>
                   </tbody>
               </table>
               <div class="supplement-paging">
                   ${dataCount==0?"등록된 게시물이 없습니다.":paging}
               </div>
   
   				<form name="searchForm" action="${pageContext.request.contextPath}/supplement/list" method="post">
	               <div class="supplement-bbs-search">
	                   <div class="search-reset">
	                       <button type="button" class="reset" onclick="javascript:location.href='${pageContext.request.contextPath}/supplement/list';"><i class="fas fa-redo-alt"></i>&nbsp;새로고침</button>
	                   </div>
		                   <div class="search-select-box">
		                       <select name="condition" class="sup-bbs-select">
		                           <option value="all" ${condition=="all"?"selected='selected'":""}>제목+내용</option>
		                           <option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
		                           <option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
		                           <option value="register_date" ${condition=="register_date"?"selected='selected'":""}>작성일</option>
		                           <option value="userId" ${condition=="userId"?"selected='selected'":""}>작성자</option>
		                       </select>
		                       <input type="text" class="sup-bbs-input" name="keyword" value="${keyword}">
		                       <button type="button" class="sup-bbs-btn" onclick="searchList();">검색</button>
		                   </div>
	               </div>
				</form>
           </div>
   
           <!-- 글쓰기 플로팅 -->
           <div class="floating-write" onclick="javascript:location.href='${pageContext.request.contextPath}/supplement/created';">
               <div class="f-div">
                   <div class="floating-image"></div>
                   <p> 영양제<br> 추천하기</p>
               </div>
           </div>
       </div>
   </div>
</section>