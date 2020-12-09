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
	<div class="top_menu_atr">
		<a href="#" class="top_menu_atr_name">Q&A 게시판
			<p> Q&A 이용안내를 위한 게시판 입니다.</p>
		</a>
	</div>
	
	<div class="top_menu_atr">
		<a href="#" class="top_menu_atr_name">FAQ 게시판
			<p> FAQ 이용안내를 위한 게시판 입니다.</p>
		</a>
	</div>
</div>




<div id="board_qna_faq">
	<div id="qnafaq"> <!-- Q&A 반복문  -->
	<h2 class="af_h2">Q&A 자주 묻는 질문</h2>
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
				<a href="#" class="list_tag_a">+ 모두보기</a> <!-- 리스트 주소 -->
			</li>
		</ul>
		
	</div>

	<div id="qnafaq">  <!-- FAQ 반복문  -->
	<h2 class="af_h2">FAQ 자주 묻는 질문</h2>
		<ul class="admin_controller">
			<li class="admin_subject">원티드 이력서 양식을 꼭 사용해야 하나요?</li>
			<li class="admin_content">필수 사항은 아니며, 자유양식으로 지원 가능합니다. </li>
		</ul >
		<ul class="admin_controller">
			<li class="admin_subject">지원한 회사에서 피드백이 없습니다. 어떻게 하면 되나요 ?</li>
			<li class="admin_content">필수 사항은 아니며, 자유양식으로 지원 가능합니다. </li>
		</ul>
		<ul class="admin_controller">	
			<li class="admin_subject">지원했던 공고에 재지원 or 지원 취소하고 싶어요 </li>
			<li class="admin_content">필수 사항은 아니며, 자유양식으로 지원 가능합니다. </li>
		</ul>
		<ul class="admin_controller">	
			<li class="admin_subject">추천 채용 보상금은 어떻게 지급되나요 ?</li>
			<li class="admin_content">필수 사항은 아니며, 자유양식으로 지원 가능합니다. </li>
		</ul>
		<ul class="admin_controller">	
			<li class="admin_subject">구매한 영상 목록은 어디서 확인할 수 있나요 ?</li>
			<li class="admin_content">필수 사항은 아니며, 자유양식으로 지원 가능합니다. </li>
		</ul>
		<ul class="admin_controller">	
			<li>
				<a href="#" class="list_tag_a">+ 모두보기</a> <!-- 리스트 주소 -->
			</li>
		</ul>
	</div>
	
</div>
<div class="notice_title">
	<div class="notice_title_subject">
		<h2 class="notice_title_left" style="float: left;">띠리링 소식</h2>
		<a href="#" class="notice_title_right">더보기 </a>
	</div>
	<div class="notice_content_box">
	
		<!--  공지 및 소식 리스트 반복 구간 rows 최대 7개 까지만 할것  -->
		<!-- 포문 작성시 첫번째와 마지막 에 $().css(border-radius : 5px 5px; 참고-->
		
		<div class="notice_content">
			<a href="#" class="notice_content_a">개인정보 처리 방침 개정에 대해 안내드릅니다.( 2020.11.30)</a>
		</div>
		<div class="notice_content">
			<a href="#" class="notice_content_a">고객센터 운영시간 안내</a>
		</div>
		<div class="notice_content">
			<a href="#" class="notice_content_a">당신이 찾던 개발자, 디자이너가 여기에! "원티스 긱스"</a>
		</div>
		<div class="notice_content">
			<a href="#" class="notice_content_a">HR커뮤니티 "인살롱" 오픈 !</a>
		</div>
		<div class="notice_content">
			<a href="#" class="notice_content_a">개인정보 처리 방침 개정에 대해 안내드립니다. (2020.08.20)</a>
		</div>
		<div class="notice_content">
			<a href="#" class="notice_content_a">내 취향에 딱 맞는 회사 찾기 | 원티드 태그 검색</a>
		</div>
		<div class="notice_content">
			<a href="#" class="notice_content_a">리모트 워크 중 협업 가이드 </a>
		</div>
	</div>
</div>
</section>