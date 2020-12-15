<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">

<section>	
<div class="honCooq-container">
	<div class="honCooq-title">
		<h3>HOONCOOQ</h3>
	</div>
	
	<div class="">
		<div>
			<ul class="tabs">
				<li id="tab-0" data-categoryNum="0">모두</li>
				<li id="tab-0" data-categoryNum="0">요리정보</li>
				<li id="tab-0" data-categoryNum="0">주방 Tip</li>
				<li id="tab-0" data-categoryNum="0">오늘 뭐 먹지?</li>
				<c:forEach var="dto" items="${listCategory}">
					<li id="tab-${dto.categoryNum}" data-categoryNum="${dto.categoryNum}">${dto.category}</li>
				</c:forEach>
			</ul>
		</div>
		<div id="tab-content"></div>
	</div>
</div>

<form name="honCooqSearchForm" method="post">
    <input type="hidden" name="condition" value="all">
    <input type="hidden" name="keyword" value="">
</form>
	
</section>