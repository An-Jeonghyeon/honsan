<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
	function searchList() {
		var f = document.dressCreatedFrom;
		f.submit();
	}
	
</script>
<div class="dress-Body">
	<div class="dress-MainBody">
		<span class="dress-paging">${dataCount}개(${page}/${total_page} 페이지)</span>
		<div class="dress-InnerBody">
			<div class="dress-MainContent">
				<div class="dress-BestContentName">
					<p>
						<i class="fas fa-crown fa-3x"></i>
					</p>
					<span class="dress-Text">인기</span><span>게시글</span>

				</div>
				<c:forEach var="best" items="${bestList}"> 
				<div class="dress-BestContent">
					<div class="dress-BestContent-InnerImage" onclick="javascript:location.href='${articleUrl}&num=${best.num}'">
						<img class="dress-img" src="${best.saveFilename}" onerror="this.src='${pageContext.request.contextPath}/resources/images/dress/dd.png'">
					</div>
					<div class="dress-bestContent-InnerText">
						<span>제목: ${best.subject}</span>
					</div>
						<div class="dress-bestContent-InnerImageInnerBox">
						<span class="dress-subContent-InnerUserName">작성자:${best.userName }</span>
						<span class="dress-subContent-InnerHitCount">조회수:${best.hitCount }</span>
						<span class="dress-subContent-InnerReplyCount">(${best.replyCount })</span>
						<span class="dress-subContent-InnerTags">
							 <c:forEach
								var="s" items="${best.hashtag}">
								<a href="${pageContext.request.contextPath}/dress/list?keyword=${s}">${s}</a>
							</c:forEach>
						</span>
					</div>
				</div>
				</c:forEach>
				<div class="dress-BestContentText">여기에 무엇을 넣어야 할까?</div>
			</div>
			<c:forEach var="dto" items="${list}">
			
				<div class="dress-subContent">
					<div class="dress-subContent-InnerImage" onclick="javascript:location.href='${articleUrl}&num=${dto.num}'">						
						<img class="dress-img" src="${dto.saveFilename}" onerror="this.src='${pageContext.request.contextPath}/resources/images/dress/dd.png'">
					</div>
					<div class="dress-subContent-InnerText">
						<a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
					</div>
					<div class="dress-subContent-InnerImageInnerBox">
						<span class="dress-subContent-InnerUserName">작성자:${dto.userName }</span>
						<span class="dress-subContent-InnerHitCount">조회수:${dto.hitCount }</span>
						<span class="dress-subContent-InnerReplyCount">(${dto.replyCount })</span>
						<span class="dress-subContent-InnerTags">
							 <c:forEach
								var="s" items="${dto.tags}" varStatus="n">
								<a href="${pageContext.request.contextPath}/dress/list?keyword=${fn:substring(s,1,s.length())}">${s}</a>
							</c:forEach>
						</span>
					</div>
				</div>
			
			</c:forEach>
		</div>
		<form action="${pageContext.request.contextPath}/dress/list"
			name="dressCreatedFrom" method="post">
			<div class="dress-searchFormBody">
				<div class="dress-pagingNum">${dataCount==0?"등록된 게시물이 없습니다.":paging}
				</div>
				<div class="dress-searchBody">
					<button class="dress-Resetbtn dress-Btn" type="button"
						onclick="javascript:location.href='${pageContext.request.contextPath}/dress/list'">
						<i class="fas fa-redo-alt fa-2x"></i>
					</button>
					<select class="dress-Selectbtn" name="condition">
						<option value="all" ${condition=="all" ?"selected='selected'":""}>모두</option>
						<option value=" subject"
							${condition=="subject"
                                        ?"selected='selected'":""}>제목</option>
						<option value=" content"
							${condition=="content"?"selected='selected'":""}>내용</option>
						<option value=" userName"
							${condition=="userName"
                                        ?"selected='selected'":""}>작성자</option>
						<option value=" created"
							${condition=="created"
                                        ?"selected='selected'":""}>등록일</option>
					</select> <input class=" dress-Search" type="text" name="keyword"
						value="${keyword}">
					<button class="dress-Searchbnt dress-Btn" type="button"
						onclick="searchList()">검색</button>
					<button class="dress-Createdbtn dress-Btn" type="button"
						onclick="javascript:location.href='${pageContext.request.contextPath}/dress/created'">글쓰기</button>
				</div>
			</div>
		</form>
	</div>
</div>