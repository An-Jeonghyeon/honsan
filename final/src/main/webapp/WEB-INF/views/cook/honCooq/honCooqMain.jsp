<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">

<script type="text/javascript">
$(function() {
		var url="${pageContext.request.contextPath}/cook/honCooq/recipe/list";
		var query="pageNo="+1;
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
	var tab = $tab.attr("data-tab"); // 활성화된 db에서 자료 가져오기
	
	var url="${pageContext.request.contextPath}/cook/honCooq/"+tab+"/list";
	var query="pageNo="+page;
	var search=$('form[name=honCooqSearchForm]').serialize();
	query=query+"&"+search;
	var selector = "#honCooq-tab-content"; // 결과 뿌리는 곳(jsp 제일 아래)
	
	ajaxHTML(url, "get", query, selector);
}

// 검색
function searchList() {
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

// 글쓰기폼
function insertForm() {
	var $tab = $(".honCooq-tabs .active");
	var tab = $tab.attr("data-tab");
	
	var url="${pageContext.request.contextPath}/honCooq/"+tab+"/created";
	var query="tmp="+new Date().getTime(); // get방식은 주소가 똑같기 때문에 구분하기 위해 넣어줌. 현재 컴퓨터 시간
	var selector = "#honCooq-tab-content"; // 쿼리가 바뀌면 주소가 동일해도 서버로 다시 감 
	
	ajaxHTML(url, "get", query, selector);
}

// 글등록, 수정등록, 답변등록
function sendOk(mode, page) {
	var $tab = $(".honCooq-tabs .active");
	var tab = $tab.attr("data-tab");
	
    var f = document.boardForm;

	var str = f.subject.value;
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

	str = f.content.value;
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }
    
/*     if(tab=="inquiry" && mode=="created") {
    	if(f.emailRecv.checked && ! f.email.value) {
    		alert("이메일을 입력하세요. ");
            f.email.focus();
            return;
    	}
    	
    	if(f.phoneRecv.checked && ! f.phone.value) {
    		alert("전화번호를 입력하세요. ");
            f.phone.focus();
            return;
    	}
    } */
	
    var url="${pageContext.request.contextPath}/honCooq/"+tab+"/"+mode;
    var query = new FormData(f); // IE는 10이상에서만 가능
    
	var fn = function(data){
		var state=data.state;
        if(state=="false")
            alert("게시물을 추가(수정)하지 못했습니다. !!!");

    	if(page==undefined || page=="")
    		page="1";
    	
    	if(mode=="created" || mode=="reply") {
    		reloadBoard()
    	} else {
    		listPage(page);
    	}
	};
	
	ajaxFileJSON(url, "post", query, fn);		
}

// 글쓰기 취소, 수정 취소, 답변 취소
function sendCancel(page) {
	if(page==undefined || page=="")
		page="1";
	
	listPage(page);
}

// 게시글 보기
function articleBoard(num, page) {
	var $tab = $(".honCooq-tabs .active");
	var tab = $tab.attr("data-tab");
	
	var url="${pageContext.request.contextPath}/honCooq/"+tab+"/article";
	var query="num="+num;
	var search=$('form[name=honCooqSearchForm]').serialize();
	query=query+"&pageNo="+page+"&"+search;
	var selector = "#honCooq-tab-content";
	
	ajaxHTML(url, "get", query, selector);
}

// 글 수정폼
function updateForm(num, page) {
	var $tab = $(".honCooq-tabs .active");
	var tab = $tab.attr("data-tab");
	
	var url="${pageContext.request.contextPath}/honCooq/"+tab+"/update";
	var query;
	if(tab=="board")
		query="boardNum="+num;
	else
		query="num="+num;
	query=query+"&pageNo="+page
	var selector = "#honCooq-tab-content";
	
	ajaxHTML(url, "get", query, selector);
}

// 글 답변폼
function replyForm(num, page) {
	var $tab = $(".honCooq-tabs .active");
	var tab = $tab.attr("data-tab");
	
	var url="${pageContext.request.contextPath}/honCooq/"+tab+"/answer";
	var query="num="+num+"&pageNo="+page
	var selector = "#honCooq-tab-content";
	
	ajaxHTML(url, "get", query, selector);
}

// 글 삭제
function deleteBoard(num, page, mode) {
	var $tab = $(".honCooq-tabs .active");
	var tab = $tab.attr("data-tab");
	var url="${pageContext.request.contextPath}/honCooq/"+tab+"/delete";
	
	var query="num="+num;
	if(tab=="qna") {
		query+="&mode="+mode;
	}
	
	if(! confirm("위 게시물을 삭제 하시 겠습니까 ? "))
		  return;
	
	var fn = function(data){
		listPage(page);
	};
	
	ajaxJSON(url, "post", query, fn);		
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
