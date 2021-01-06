<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">

<script type="text/javascript">
$(function() {
		var m = "${m}";
		var page = "${page}";
		var condition = "${condition}";
		var keyword = "${keyword}";
		
		var url="${pageContext.request.contextPath}/cook/honCooq/recipe/list";
		if(m=="2") {
			url="${pageContext.request.contextPath}/cook/honCooq/cookTip/list";
		} else if(m=="3") {
			url="${pageContext.request.contextPath}/cook/honCooq/wdie/list";
		}
		
		var query="pageNo="+page;
/* 		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		} */
		
		var search=$('form[name=honCooqSearchForm]').serialize();
		query=query+"&"+search;
		var selector = "#honCooq-tab-content"; // 결과 뿌리는 곳(jsp 제일 아래)
		
		ajaxHTML(url, "get", query, selector);
});

$(function(){
	var menu = "${menuItem}";
	$("#tab-"+menu).addClass("active");	//	id=tab-recipe 등에 active 클래스를 줌.
	listPage(1);	

	$(".honCooq-tabs button").click(function() {
		tab = $(this).attr("data-tab");
		
		$(".honCooq-tabs button").each(function(){
			$(this).removeClass("active");
		});

		$("#tab-"+tab).addClass("active");
		
		// listPage(1);
		reloadBoard();
	});
});

function login() {
	location.href="${pageContext.request.contextPath}/member/login";
}

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

function ajaxFileJSON(url, method, query, fn) {
	$.ajax({
		type:method
		,url:url
        ,processData: false  // file 전송시 필수 : 서버로 전송할 데이터를 쿼리문자열로 변환하는지 여부 --> 현재줄, 아래줄 false여야 파일 전송이 제대로 됨. true면 키=값&키=값 으로 바꿔버림.
        ,contentType: false  // file 전송시 필수 : 서버에 전송할 데이터의 Content-type. 기본은 appication/x-www-urlencoded : 원래 파일의 정보를 인코딩하지 않고 보내기 위해서 multipart 사용해야 하니까 false로
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
	    ,error:function(jqXHR) { // 직접 만든 에러코드들
	    	if(jqXHR.status===403) {
	    		login();
	    		return false;
	    	} else if(jqXHR.status===410) {
	    		alert("삭제된 게시물입니다.");
	    		return false;
	    	} else if(jqXHR.status===402) {
	    		alert("권한이 없습니다.");
	    		return false;
	    	}

	    	console.log(jqXHR.responseText);
	    }
	});
}

// 글리스트 및 페이징 처리
function listPage(page) {
	var $tab = $(".honCooq-tabs .active"); // 누가 활성화 된 상태인지 가져오기
	console.log($tab);
	var tab = $tab.attr("data-tab"); // 활성화된 db에서 자료 가져오기
	console.log(tab);
	
	var url="${pageContext.request.contextPath}/cook/honCooq/"+tab+"/list";
	var query="pageNo="+page;
	var search=$('form[name=honCooqSearchForm]').serialize();
	query=query+"&"+search;
	var selector = "#honCooq-tab-content"; // 결과 뿌리는 곳(jsp 제일 아래)
	
	ajaxHTML(url, "get", query, selector);
}

// 검색
/* function searchList() {
	var f=document.honCooqSearchForm;
	f.condition.value=$("#condition").val();
	f.keyword.value=$.trim($("#keyword").val());

	listPage(1);
} */

// 검색1 - 레시피
function recipe_searchList() {
	var f=document.honCooqSearchForm;
	f.condition.value=$("#condition").val();
	f.keyword.value=$.trim($("#keyword").val());

	listPage(1);
}

// 검색2 - 레시피
function cookTip_searchList() {
	var f=document.honCooqSearchForm;
	f.condition.value=$("#condition").val();
	f.keyword.value=$.trim($("#keyword").val());

	listPage(1);
}

// 새로고침
function reloadBoard() {
	var f=document.honCooqSearchForm;
	f.condition.value="all";
	f.keyword.value="";
	
	listPage(1);
}


</script>

<div class="honCooq-container">	
	<div class="honCooq-header">
		<div class="honCooq-banner">아아 여기는 배너</div>
		<div class="honCooq-tabs">
			<button type="button" class="honCooq-tab-button" id="tab-recipe" data-tab="recipe">요리 정보</button>
			<button type="button" class="honCooq-tab-button" id="tab-cookTip" data-tab="cookTip">CookTip</button>
			<button type="button" class="honCooq-tab-button" id="tab-wdie" data-tab="wdie">오늘 뭐 먹지?</button>
		</div>
	</div>
	
	<div class="honCooq-tab-content" id="honCooq-tab-content"></div>
	
	<form name="honCooqSearchForm" action="" method="post">
	    <input type="hidden" name="condition" value="all">
	    <input type="hidden" name="keyword" value="">
	</form>

</div>
