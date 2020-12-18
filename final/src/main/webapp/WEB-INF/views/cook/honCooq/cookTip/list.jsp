<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cook/honCooq.css" type="text/css">
 --%>

<script type="text/javascript">

// 상단의 배너 링크 관련 
el = document.getElementById("cookTip_list-banner");
el.onclick = links;

function links() {
  left = parseInt(getComputedStyle(el).getPropertyValue("background-position").split(" ", 1));
   
  /* DEFINE POSITIONS FOR CLICK EVENTS */
  if (left >= -400) {
  
    // First until about half way scrolled over
    alert("first");
    //window.open("https://www.google.com");
  
  } else if (left >= -1200) {
  
    // Second when half way scrolled either side
    alert("second");
    //window.open("https://www.google.com");
    
  } else if (left >= -1600) {
    
    // Third when over half way into banner
    alert("third");
    //window.open("https://www.google.com"); 
  }  
}

// 

$(function() {
	//$(".cookTip_content").on("mouseover", function() {
		// var color = '#'; 
		// var letters = ['f6c9cc', 'a8c0c0', 'FEBF36', 'FF7238', '6475A0', 'acc7bf', '5e5f67', 'c37070', 'eae160', 'bf7aa3', 'd7d967']; 
		// color += letters[Math.floor(Math.random() * letters.length)]; 
		//$(".cookTip_content").css("background-color", "red");
		
//	});
	$(document).ready(function() {
		$(".cookTip_content").css("background-color", "red");
	});
});	


</script>


<div class="cookTip_list-container">
	<div class="cookTip_list-header">
		<div class="cookTip_list-banner">아아 여기는 배너</div>
		<div class="honCooq-tabs">
			<button type="button" class="honCooq-tab-button">요리 정보</button>
			<button type="button" class="honCooq-tab-button">CookTip</button>
			<button type="button" class="honCooq-tab-button">오늘 뭐 먹지?</button>
		</div>
	</div>

	<div class="cookTip_list-body">
		<div class="cookTip_inner-tab">
			<ul>
				<li class="cookTip_li_category"><a href="" class="cookTip-tab" title="ALL">전체</a></li>
				<li class="cookTip_li_category"><a href="" class="cookTip-tab" title="장보기"><i class="fas fa-shopping-basket"></i> 장보기</a></li>

				<li class="cookTip_li_category"><a href="" class="cookTip-tab" title="조미료 관리"><i class="fas fa-spray-can"></i> 조미료 관리</a></li>
				<li class="cookTip_li_category"><a href="" class="cookTip-tab" title="음식 보관법"><i class="fas fa-carrot"></i> 음식 보관법</a></li>
				<li class="cookTip_li_category"><a href="" class="cookTip-tab" title="설거지 및 주방정리"><i class="fas fa-pump-soap"></i> 설거지 및 주방정리</a></li>
			</ul>
		</div>
		
		<div class="cookTip_list-dataCountAndSearch">
			<div class="cookTip_list-dataCount">
				총 1234건 <span class="cookTip_list-dataCount-small"> * 게시판 성격에 맞지않은 글은 예고없이 삭제됩니다.</span>
			</div>
			<div class="cookTip_list-search">
					<form name="cookTip_searchForm" action="${pageContext.request.contextPath}" method="post">
						<select name="condition" class="cookTip_select cookTip_list_select">
							<option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
							<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
							<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
							<option value="userName" ${condition=="userName"?"selected='selected'":""}>작성자</option>
							<option value="created" ${condition=="created"?"selected='selected'":""}>등록일</option>
						</select>
						<input type="text" name="keyword" value="${keyword}" class="cookTip_search-input">
						<button type="button" class="cookTip_search-btn" onclick="cookTip_searchList()">검색</button>
					</form>			
			</div>
		</div>

		<div class="cookTip_list">
	<!-- 
			<c:forEach var="dto" items="${list}"></c:forEach>
	 -->
			<div class="cookTip_content-box">
				<div class="cookTip_content">
					<div class="cookTip_content_info">

						<div class="cookTip_category">
							<span>${dto.category!=null? dto.category : "설거지 및 주방정리"}</span>
						</div>

						<div class="cookTip_title"> <a
							href="${pageContext.request.contextPath}/">${dto.subject} 쌀쌀한
								날씨 감기조심하세요</a>
						</div>
						<div class="cookTip_data">
							<ul>
								<li class="cookTip_li_data cookTip_li_data-userName"><span><i class="far fa-user"></i> ${dto.userName}작성자</span></li>
								<li class="cookTip_li_data cookTip_li_data-created"><span><i class="far fa-clock"></i> ${dto.created}2020.12.18</span></li>
								<li class="cookTip_li_data cookTip_li_data-hitCount"><span><i class="far fa-eye"></i> ${dto.register_date}조회수</span></li>
							</ul>
						</div>
						<div class="cookTip_util">
							<ul>
								<li class="cookTip_li_util cookTip_li_util-reply"><span><i class="far fa-comment-dots"></i> ${dto.userName}7</span></li>
								<li class="cookTip_li_util cookTip_li_util-like"><span><i class="far fa-heart" id="cookTip-like"></i> ${dto.created}2</span></li>
							</ul>						
						</div>
					</div>
				</div>
			</div>
			<div class="cookTip_content-box">
				<div class="cookTip_content">
					<div class="cookTip_content_info">

						<div class="cookTip_category">
							<span>${dto.category!=null? dto.category : "STORY"}</span>
						</div>

						<div class="cookTip_title"> <a
							href="${pageContext.request.contextPath}/">${dto.subject} 쌀쌀한
								날씨 감기조심하세요</a>
						</div>
						<div class="cookTip_data">
							<ul>
								<li class="cookTip_li_data cookTip_li_data-userName"><span><i class="far fa-user"></i> ${dto.userName}작성자</span></li>
								<li class="cookTip_li_data cookTip_li_data-created"><span><i class="far fa-clock"></i> ${dto.created}2020.12.18</span></li>
								<li class="cookTip_li_data cookTip_li_data-hitCount"><span><i class="far fa-eye"></i> ${dto.register_date}조회수</span></li>
							</ul>
						</div>
						<div class="cookTip_util">
							<ul>
								<li class="cookTip_li_util cookTip_li_util-reply"><span><i class="far fa-comment-dots"></i> ${dto.userName}7</span></li>
								<li class="cookTip_li_util cookTip_li_util-like"><span><i class="far fa-heart" id="cookTip-like"></i> ${dto.created}2</span></li>
							</ul>						
						</div>
					</div>
				</div>
			</div>

		</div>
		

	</div>
    
    <div class="cookTip_floating-button" href="#toast"><span><i class="fas fa-pen"></i> CookTip 쓰기</span></div>

	<div class="cookTip_list-page">
		<div class="cookTip_list-paging">&lt;</div>
		<div class="cookTip_list-pagingBody">1</div>
		<div class="cookTip_list-pagingBody">2</div>
		<div class="cookTip_list-pagingBody">3</div>
		<div class="cookTip_list-pagingBody">4</div>
		<div class="cookTip_list-paging">&gt;</div>
	</div>

</div>

