<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cook/honCooq.css" type="text/css">
 --%>

<div class="cookTip_list-container">
	<div class="cookTip_list-header">
		<div class="honCooq-tabs">
			<div class="honCooq-tab">요리 정보</div>
			<div class="honCooq-tab">CookTip</div>
			<div class="honCooq-tab">오늘 뭐 먹지?</div>
		</div>
	</div>

	<div class="cookTip_list-body">
		<div class="cookTip_inner-tab">
			<ul>
				<li><a href="" class="active" title="ALL">전체</a></li>
				<li><a href="" title="장보기">장보기</a></li>
				<li><a href="" title="조미료 관리">조미료 관리</a></li>
				<li><a href="" title="음식 보관법">음식 보관법</a></li>
				<li><a href="" title="설거지 및 주방정리">설거지 및 주방정리</a></li>
			</ul>
		</div>

		<div class="cookTip_list-dataCount">
			총 1234건 <small>* 게시판 성격에 맞지않은 글은 예고없이 삭제됩니다.</small>
		</div>

		<div class="cookTip_list">

			<c:forEach var="dto" items="${list}"></c:forEach>
			<div class="cookTip_content-box">
				<div class="cookTip_content">
					<div class="cookTip_content_info">

						<div class="cookTip_category">
							<span>${dto.category!=null? dto.category : "STORY"}</span>
						</div>

						<strong class="cookTip_title"> <a
							href="${pageContext.request.contextPath}/">${dto.subject} 쌀쌀한
								날씨 감기조심하세요</a>
						</strong>
						<div class="cookTip_data">
							<ul>
								<li><span>${dto.userName}작성자</span></li>
								<li><span>${dto.created}등록일</span></li>
								<li><span>${dto.register_date}조회수</span></li>
							</ul>
						</div>
						<div class="cookTip_util">
							<span class="like-reply-function"> <a href="javascript:;"
								class="fn-reply-count"><i class="icon-reply-count"></i><span
									class="sr-only">댓글 수</span><span>0</span></a> <a
								href="javascript:;" class="fn-reply-like check-sso action-like "
								data-id="story_bbs_01_28782"><i class="icon-reply-like"></i><span
									class="sr-only">좋아요 수</span><span>0</span></a>
							</span>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>



</div>

