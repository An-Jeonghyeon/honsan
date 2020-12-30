<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cook/honCooq.css" type="text/css">
 --%>


<script type="text/javascript">
$(function() {
	var color = '#'; 
	var letters = ['f6c9cc', 'a8c0c0', 'FEBF36', 'FF7238', '6475A0', 'acc7bf', 'c37070', 'eae160', 'bf7aa3', 'd7d967', 'a3d2ca', 'ff8e71', 'c6ebc9', 'a7c5eb', '949cdf', 'ffb396', 'c5a880']; 
	$(".recipe_content-box .recipe_content").each(function(){
		color = '#';
		color += letters[Math.floor(Math.random() * letters.length)]; 
		$(this).css("background", color);
	});
});

function recipe_searchList() {
	var f=document.recipe_searchForm;
	f.submit();
}
</script>


	<div class="recipe_list-body">
		<div class="recipe_inner-tab">
			<ul>
				<li class="recipe_li_category"><a href="" class="recipe-tab" title="ALL">전체</a></li>
				<li class="recipe_li_category"><a href="" class="recipe-tab" title="장보기"><i class="fas fa-shopping-basket"></i> 장보기</a></li>
				<li class="recipe_li_category"><a href="" class="recipe-tab" title="조미료 관리"><i class="fas fa-spray-can"></i> 조미료 관리</a></li>
				<li class="recipe_li_category"><a href="" class="recipe-tab" title="음식 보관법"><i class="fas fa-carrot"></i> 음식 보관법</a></li>
				<li class="recipe_li_category"><a href="" class="recipe-tab" title="설거지 및 주방정리"><i class="fas fa-pump-soap"></i> 설거지 및 주방정리</a></li>
			</ul>
		</div>
		
		<div class="recipe_list-dataCountAndSearch">
			<div class="recipe_list-dataCount">
				총 ${dataCount}건 / ${total_page} 페이지 <span class="recipe_list-dataCount-small"> * 게시판 성격에 맞지않은 글은 예고없이 삭제됩니다.</span>
			</div>
			<div class="recipe_list-search">
					<form name="recipe_searchForm" action="${pageContext.request.contextPath}/cook/honCooq/recipe/list" method="post">
						<select name="condition" class="recipe_select recipe_list_select">
							<option value="all" ${condition=="all"?"selected='selected'":""}>전체</option>
							<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
							<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
							<option value="userName" ${condition=="userName"?"selected='selected'":""}>작성자</option>
							<option value="created" ${condition=="created"?"selected='selected'":""}>등록일</option>
						</select>
						<input type="text" name="keyword" value="${keyword}" class="recipe_search-input">
						<button type="button" class="recipe_search-btn" onclick="recipe_searchList()">검색</button>
					</form>			
			</div>
		</div>

		<div class="recipe_list">
 
			<c:forEach var="dto" items="${list}">
			<div class="recipe_content-box">
				<div class="recipe_content">
							<c:choose>
								<c:when test="${not empty dto.imageFilename}">
									<div class="recipe_content_info_img">
										<div class="recipe_category_img">
											<span>${dto.category!=null? dto.category : "설거지 및 주방정리"}</span>
										</div>
				
										<div class="recipe_listImg">
											<img class="recipe_img" src="${dto.imageFilename}">
										</div>

										<div class="recipe_title_img"> <a
											href="${articleUrl}&num=${dto.num}">${dto.subject} (${dto.replyCount})</a>
										</div>
										<div class="recipe_flex">
											<div class="recipe_dataAndUtil_img">
												<ul>
													<li class="recipe_li_data recipe_li_data-userName_img"><span><i class="far fa-user"></i> ${dto.userName}</span></li>
													<li class="recipe_li_data recipe_li_data-created_img"><span><i class="far fa-clock"></i> ${dto.register_date}</span></li>
													<li class="recipe_li_data recipe_li_data-hitCount_img"><span><i class="far fa-eye"></i> ${dto.hitCount}</span></li>
													<li class="recipe_li_util recipe_li_util-reply_img"><span><i class="far fa-comment-dots"></i> ${dto.replyCount}</span></li>
													<li class="recipe_li_util recipe_li_util-like_img"><span><i class="far fa-heart" id="recipe-like"></i>${dto.recipeLikeCount}</span></li>
												</ul>
											</div>
										</div>
									</div>
									
								</c:when>
								<c:otherwise>
									<div class="recipe_content_info">
										<div class="recipe_category">
											<span>${dto.category!=null? dto.category : "설거지 및 주방정리"}</span>
										</div>
				
										<div class="recipe_title"> <a
											href="${articleUrl}&num=${dto.num}">${dto.subject} (${dto.replyCount})</a>
										</div>
										<div class="recipe_data">
											<ul>
												<li class="recipe_li_data recipe_li_data-userName"><span><i class="far fa-user"></i> ${dto.userName}</span></li>
												<li class="recipe_li_data recipe_li_data-created"><span><i class="far fa-clock"></i> ${dto.register_date}</span></li>
												<li class="recipe_li_data recipe_li_data-hitCount"><span><i class="far fa-eye"></i> ${dto.hitCount}</span></li>
											</ul>
										</div>
										<div class="recipe_util">
											<ul>	<!-- db에서 댓글 수, 좋아요 수 가져오도록 차후 수정 -->
												<li class="recipe_li_util recipe_li_util-reply"><span><i class="far fa-comment-dots"></i> ${dto.replyCount}</span></li>
												<li class="recipe_li_util recipe_li_util-like"><span><i class="far fa-heart" id="recipe-like"></i>${dto.recipeLikeCount}</span></li>
											</ul>						
										</div>
									</div>								
								</c:otherwise>
							</c:choose>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>


