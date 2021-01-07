<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cook/honCooq.css" type="text/css">
 --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/se/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<script type="text/javascript">
	function check() {
		var f = document.writeBodyForm;

		var str = f.subject.value;
		if (!str) {
			alert("제목을 입력하세요. ");
			f.subject.focus();
			return false;
		}

		str = f.category.value;
		if (!str || str == "::카테고리 선택하기::") {
			alert("분류를 선택하세요. ");
			f.category.focus();
			return false;
		}

		str = f.content.value;
		if (!str || str == "<p>&nbsp;</p>") {
			alert("내용을 입력하세요. ");
			f.content.focus();
			return false;
		}

		f.action = "${pageContext.request.contextPath}/cook/honCooq/cookTip/${mode}";

		return true;
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



<article class="cookTip_writeHeader">
	<div class="cookTip_writeheaderInnerText">
		<h3 class="cookTip_FadeinText">HOONCOOQ > CookTip</h3>
		<br> <small class="cookTip_FadeinText"> 혼자서 재료 준비는 물론 요리에
			주방 정리까지 하느라 바쁜 당신! <br> 그래도 스스로를 위해 요리를 하다 보면 점점 더 쉽고 편한 나만의 팁들을
			깨닫고는 하죠. <br> 오늘도 고군분투하고 있는 혼족들을 위해 나만의 요리팁이나 주방팁을 공유해 보는 건
			어떤가요?
		</small>
	</div>
	<!-- 
	<div class="cookTip_writeHeaderMenu">
		<ul>
			<li><a
				href="${pageContext.request.contextPath}/cook/honCook/cookTip/list">전체글보기</a></li>
			<li><a
				href="${pageContext.request.contextPath}/cook/honCook/cookTip/list">베스트글</a></li>
		</ul>
	</div>
	 -->
</article>
<form method="post" name="writeBodyForm"
	onsubmit="return submitContents(this)" enctype="multipart/form-data">
	<article class="cookTip_writeBody">
		<div class="cookTip_writeBodyHeader">
			<span class="cookTip_writeBodyHeader-Title">CookTip</span>
		</div>
		<div class="cookTip_subjectTitle">
			<span class="cookTip_smallTitle">제목</span>
		</div>
		<div class="cookTip_subjectBody">
			<input type="text" name="subject" id="subject"
				placeholder="제목을 입력해 주세요." value="${dto.subject}">
		</div>

		<div class="cookTip_subjectTitle">
			<span class="cookTip_smallTitle">분류선택</span>
		</div>
		<div class="">
			<select name="category" class="cookTip_select" id="category">
				<option value="::카테고리 선택하기::"
					${dto.category=="::카테고리 선택하기::"?"selected='selected'":"" }>::
					선택해 주세요 ::</option>
				<option value="장보기" ${dto.category=="장보기"?"selected='selected'":"" }>장보기</option>
				<option value="조미료 관리"
					${dto.category=="조미료 관리"?"selected='selected'":"" }>조미료 관리</option>
				<option value="음식 보관법"
					${dto.category=="음식 보관법"?"selected='selected'":"" }>음식 보관법</option>
				<option value="설거지 및 주방정리"
					${dto.category=="설거지 및 주방정리"?"selected='selected'":"" }>설거지
					및 주방정리</option>
			</select>
		</div>

		<div class="cookTip_contentBody">
			<div class="cookTip_editor-area">
				<ul class="cookTip_notice-list">
					<li>* 글쓰기 영역에서 ALT+0 (키보드 위쪽 0)을 누르면 도움말을 보실 수 있으며, 도움말 창을 닫으면
						다시 글쓰기 영역으로 갑니다.</li>
					<li>* ALT+.를 누르면 글쓰기 영역에서 빠져나갈 수 있습니다.</li>
					<li>* 이미지 업로드 시 이미지를 볼 수 없는 분들을 위해 대체할 문구(alt)를 작성해주세요.</li>
				</ul>
			</div>
			<div class="cookTip_inputBody1">
				<textarea name="content" id="content">${dto.content}</textarea>
			</div>
		</div>

		<div class="cookTip_subjectTitle">
			<span class="cookTip_smallTitle">유튜브 URL</span>
		</div>
		<div class="cookTip_subjectBody">
			<input type="text" name="yUrl" id="yUrl"
				placeholder="유튜브 영상코드를 입력해 주세요." value="">
		</div>

		<div class="cookTip_subjectTitle">
			<span class="cookTip_smallTitle">유튜브 영상 자막</span>
		</div>
		<div class="cookTip_subjectBody">
			<input type="text" name="ySub" id="ySub"
				placeholder="유튜브 영상 자막을 입력해 주세요." value="">
		</div>

		<div class="cookTip_buttonBoxBody">
			<button type="submit" id="cookTip_writeSubmit" class="cookTip_btn">${mode=='update'?'수정완료':'등록하기'}</button> 
			<button type="button" id="cookTip_CancelSubmit" class="cookTip_btn" onclick="javascript:location.href='${pageContext.request.contextPath}/cook/honCooq/main?m=2';">${mode=='update'?'수정취소':'등록취소'}</button>
		</div>
		<c:if test="${mode=='update'}">
			<input type="hidden" name="num" value="${dto.num}">
			<input type="hidden" name="saveFilename" value="${dto.saveFilename}">
			<input type="hidden" name="originalFilename"
				value="${dto.originalFilename}">
			<input type="hidden" name="page" value="${page}">
		</c:if>
	</article>
</form>
<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator
			.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "content",
				sSkinURI : "${pageContext.request.contextPath}/resources/se/SmartEditor2Skin.html",
				htParams : {
					bUseToolbar : true,
					fOnBeforeUnload : function() {
						// alert(" Ok !!!");
					},
					bUseVerticalResizer : false
				}, //boolean
				fOnAppLoad : function() {
					//예제 코드
					//oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
				},
				fCreator : "createSEditor2"
			});

	function pasteHTML() {
		var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
		oEditors.getById["content"].exec("PASTE_HTML", [ sHTML ]);
	}

	function showHTML() {
		var sHTML = oEditors.getById["content"].getIR();
		alert(sHTML);
	}

	function submitContents(elClickedObj) {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.

		try {
			// elClickedObj.form.submit();
			return check();
		} catch (e) {
		}
	}

	function setDefaultFont() {
		var sDefaultFont = '돋움';
		var nFontSize = 24;
		oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
	}
</script>
