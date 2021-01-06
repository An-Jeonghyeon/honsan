<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/infos.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/infos.js"></script>

<div id="top_img_banner">
	
</div>

<section>

<div class="top_menu">
	<div class="top_menu_atr" onclick="javascript:location.href='${pageContext.request.contextPath}/qna/qnalist';">
		<a href="${pageContext.request.contextPath}/qna/qnalist" class="top_menu_atr_name">Q&amp;A 게시판</a>
			<p class="top_menu_atr_name2"> Q&amp;A 이용안내를 위한 게시판 입니다.</p>
		
	</div>
	
	<div class="top_menu_atr" onclick="javascript:location.href='${pageContext.request.contextPath}/';">
		<a href="#" class="top_menu_atr_name">FAQ 게시판</a>
			<p class="top_menu_atr_name2"> FAQ 이용안내를 위한 게시판 입니다.</p>
	</div>
</div>




<div id="board_qna_faq">
	<div id="qnafaq"> <!-- Q&A 반복문  -->
	<h2 class="af_h2"><i class="fab fa-quora"></i>&nbsp;&nbsp;Q&amp;A 자주 묻는 질문</h2>
		<ul class="admin_controller">
			<li class="admin_subject">원티드 이력서 양식을 꼭 사용해야 하나요?</li>
			<li class="admin_content">필수 사항은 아니며, 자유양식으로 지원 가능합니다. </li>
		</ul>
		<ul class="admin_controller">
			<li class="admin_subject">기업 서비스 가입 , 이용 절차가 궁급합니다. </li>
			<li class="admin_content">필수 사항은 아니며, 자유양식으로 지원 가능합니다. </li>
		</ul>
		<ul class="admin_controller">	
			<li class="admin_subject">매치업 기업 서비스를 이용하고 싶습니다. </li>
			<li class="admin_content">필수 사항은 아니며, 자유양식으로 지원 가능합니다. </li>
		</ul>
		<ul class="admin_controller">	
			<li class="admin_subject">등록된 기업회원 회사 정보는 어디에 노출되나요 ?</li>
			<li class="admin_content">필수 사항은 아니며, 자유양식으로 지원 가능합니다. </li>
		</ul>
		<ul class="admin_controller">	
			<li class="admin_subject">포지션(공고문) 등록 방법이 궁급합니다. </li>
			<li class="admin_content">필수 사항은 아니며, 자유양식으로 지원 가능합니다. </li>
		</ul>
		<ul class="admin_controller">	
			<li>
				<a href="${pageContext.request.contextPath}/qna/qnalist" class="list_tag_a">+ 모두보기</a> <!-- 리스트 주소 -->
			</li>
		</ul>
		
	</div>

	<div id="qnafaq">  <!-- FAQ 반복문  -->
	<h2 class="af_h2"><i class="fab fa-foursquare"></i>&nbsp;&nbsp;FAQ 자주 묻는 질문</h2>
		<c:forEach var="dto" items="${faqList}" end="6">
		<ul class="admin_controller">
			<li class="admin_subject">${dto.question}</li>
			<li class="admin_content">${dto.questionAnswer }</li>
		</ul >
		</c:forEach>
		<ul class="admin_controller">	
			<li>
				<a href="${pageContext.request.contextPath}/faq/main" class="list_tag_a">+ 모두보기</a> <!-- 리스트 주소 -->
			</li>
		</ul>
	</div>
	
</div>
<div class="notice_title">
	<div class="notice_title_subject">
		<h2 class="notice_title_left" style="float: left;">Hollo 공지사항</h2>
		<a href="${pageContext.request.contextPath}/notice/list" class="notice_title_right">더보기 </a>
	</div>
	<div class="notice_content_box">
	
		<!--  공지 및 소식 리스트 반복 구간 rows 최대 7개 까지만 할것  -->
		<!-- 포문 작성시 첫번째와 마지막 에 $().css(border-radius : 5px 5px; 참고-->
		<c:forEach var="noticeDto" items="${noticeList}" end="6">
			<div class="notice_content">
				<a href="${pageContext.request.contextPath}/notice/article?page=1&num=${noticeDto.num}" class="notice_content_a">${noticeDto.subject}</a>
			</div>
		</c:forEach>
	</div>
</div>
</section>