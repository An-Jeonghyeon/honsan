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
	$(".cookTip_content-box .cookTip_content").each(function(){
		color = '#';
		color += letters[Math.floor(Math.random() * letters.length)]; 
		$(this).css("background", color);
	});
});

function cookTip_searchList() {
	var f=document.cookTip_searchForm;
	f.submit();
}

</script>

<script type="text/javascript">
function ajaxJSON(url, method, query, fn) {
	$.ajax({
		type:method
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			fn(data);
		}
		,beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status===403) {
	    		login();
	    		return false;
	    	}
	    	
	    	console.log(jqXHR.responseText);
	    }
	});
}

function ajaxHTML(url, method, query, selector) {
	$.ajax({
		type:method
		,url:url
		,data:query
		,success:function(data) {
			$(selector).html(data);
		}
		,beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status===403) {
	    		login();
	    		return false;
	    	}
	    	
	    	console.log(jqXHR.responseText);
	    }
	});
}

</script>

<div class="cookTip_list-container">
<!-- 
	<div class="cookTip_list-header">
		<div class="cookTip_list-banner">아아 여기는 배너</div>
		<div class="honCooq-tabs">
			<button type="button" class="honCooq-tab-button">요리 정보</button>
			<button type="button" class="honCooq-tab-button">CookTip</button>
			<button type="button" class="honCooq-tab-button">오늘 뭐 먹지?</button>
		</div>
	</div>
 -->

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
				총 ${dataCount}건 / ${total_page} 페이지 <span class="cookTip_list-dataCount-small"> * 게시판 성격에 맞지않은 글은 예고없이 삭제됩니다.</span>
			</div>
			<div class="cookTip_list-search">
					<form name="cookTip_searchForm" action="${pageContext.request.contextPath}/cook/honCooq/cookTip/list" method="post">
						<select name="condition" class="cookTip_select cookTip_list_select">
							<option value="all" ${condition=="all"?"selected='selected'":""}>전체</option>
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
 
			<c:forEach var="dto" items="${list}">
			<div class="cookTip_content-box">
				<div class="cookTip_content">
							<c:choose>
								<c:when test="${not empty dto.imageFilename}">
									<div class="cookTip_content_info_img">
										<div class="cookTip_category_img">
											<span>${dto.category!=null? dto.category : "설거지 및 주방정리"}</span>
										</div>
				
										<div class="cookTip_listImg">
											<img class="cookTip_img" src="${dto.imageFilename}">
										</div>

										<div class="cookTip_title_img"> <a
											href="${articleUrl}&num=${dto.num}">${dto.subject} (${dto.replyCount})</a>
										</div>
										<div class="cookTip_flex">
											<div class="cookTip_dataAndUtil_img">
												<ul>
													<li class="cookTip_li_data cookTip_li_data-userName_img"><span><i class="far fa-user"></i> ${dto.userName}</span></li>
													<li class="cookTip_li_data cookTip_li_data-created_img"><span><i class="far fa-clock"></i> ${dto.register_date}</span></li>
													<li class="cookTip_li_data cookTip_li_data-hitCount_img"><span><i class="far fa-eye"></i> ${dto.hitCount}</span></li>
													<li class="cookTip_li_util cookTip_li_util-reply_img"><span><i class="far fa-comment-dots"></i> ${dto.replyCount}</span></li>
													<li class="cookTip_li_util cookTip_li_util-like_img"><span><i class="far fa-heart" id="cookTip-like"></i>${dto.cookTipLikeCount}</span></li>
												</ul>
											</div>
										</div>
									</div>
									
								</c:when>
								<c:otherwise>
									<div class="cookTip_content_info">
										<div class="cookTip_category">
											<span>${dto.category!=null? dto.category : "설거지 및 주방정리"}</span>
										</div>
				
										<div class="cookTip_title"> <a
											href="${articleUrl}&num=${dto.num}">${dto.subject} (${dto.replyCount})</a>
										</div>
										<div class="cookTip_data">
											<ul>
												<li class="cookTip_li_data cookTip_li_data-userName"><span><i class="far fa-user"></i> ${dto.userName}</span></li>
												<li class="cookTip_li_data cookTip_li_data-created"><span><i class="far fa-clock"></i> ${dto.register_date}</span></li>
												<li class="cookTip_li_data cookTip_li_data-hitCount"><span><i class="far fa-eye"></i> ${dto.hitCount}</span></li>
											</ul>
										</div>
										<div class="cookTip_util">
											<ul>	<!-- db에서 댓글 수, 좋아요 수 가져오도록 차후 수정 -->
												<li class="cookTip_li_util cookTip_li_util-reply"><span><i class="far fa-comment-dots"></i> ${dto.replyCount}</span></li>
												<li class="cookTip_li_util cookTip_li_util-like"><span><i class="far fa-heart" id="cookTip-like"></i>${dto.cookTipLikeCount}</span></li>
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
    
    <div class="cookTip_floating-button">
    	<a href="${pageContext.request.contextPath}/cook/honCooq/cookTip/created"><span>
    		<i class="fas fa-pen"></i> CookTip 쓰기</span>
    	</a>
    </div>

	<div class="cookTip_list-page">
		<button type="button" class="cookTip_reload-btn" onclick="javascript:location.href='${pageContext.request.contextPath}/cook/honCooq/cookTip/list';">새로고침</button>
		
		${dataCount==0?"등록된 게시물이 없습니다.":paging}

<!-- 		<div class="cookTip_list-paging">&lt;</div>
		<div class="cookTip_list-pagingBody">1</div>
		<div class="cookTip_list-pagingBody">2</div>
		<div class="cookTip_list-pagingBody">3</div>
		<div class="cookTip_list-pagingBody">4</div>
		<div class="cookTip_list-paging">&gt;</div> -->
	</div>

</div>

