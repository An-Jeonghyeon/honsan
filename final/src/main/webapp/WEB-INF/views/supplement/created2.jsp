<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/health/created.css" type="text/css">

<script type="text/javascript">
function check() {
    var f = document.supplementForm;

	var str = f.subject.value;
    if(!str) {
        alert("제목을 입력하세요.");
        f.subject.focus();
        return false;
    }

    str = f.content.value;
    if(!str || str=="<p>&nbsp;</p>") {
    	alert("내용을 입력하세요. ");
 		f.content.focus();
    	return false;
    }
    
    var mode="${mode}";
   	if(mode=="created") {
   		if(f.upload.value=="") {
		alert('대표 이미지를 업로드해주세요.');
		f.upload.focus();
		return false;
   		}
   	} 
   	
   	if(f.upload.value) {
		if(! /(\.gif|\.jpg|\.png|\.jpeg)$/i.test(f.upload.value)) {
			alert('이미지 파일만 선택 가능합니다.');
			f.upload.focus();
			return false;
		}
	}

	f.action="${pageContext.request.contextPath}/supplement/${mode}";

	return true;
}
</script>
<form method="post" name="supplementForm" enctype="multipart/form-data" onsubmit="return submitContents(this);">
    <article class="h-writeBody">
        <div class="h-writeBodyHeader">
            <span><i class="fas fa-capsules"></i> 영양제 추천하기</span>
        </div>
    
        <div class="h-subjectBody">
            <input type="text" class="h-title-font" name="subject" id="subject" placeholder="제목을 입력해 주세요." value="${dto.subject}">
        </div>
        
        <div class="h-contentBody">
            <div class="h-inputBody1">
                <textarea class="h-textarea" name="content" id="content" >${dto.content}</textarea>                
            </div>
    
            <div class="h-image ">
                <div class="h-image-title"><i class="fas fa-check"></i> 대표 이미지</div>
	                <input type="file" class="h-imageFile" name="upload" id="img22" accept="image/*">
            </div>

            <div class="h-tagBody">
                <div class="h-inputBody2">
                    <div class="h-tag-title"><i class="fas fa-hashtag"></i> 태그</div>
                       <div class="h-tag-tag">
                        <div class="h-InputTag">
                            <span>#</span><input type="text" class="h-tag1" name="hashtag" placeholder="태그 입력(최대5개)">
                        </div>
                        <div class="h-tagbtnBody">
                            <button class="h-Tag-btn" type="button" onclick="TagbtnSend()">TAG</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="h-buttonBoxBody">
            <button type="button" id="CencelSubmit" onclick="javascript:location.href='${pageContext.request.contextPath}/supplement/list';">${mode=='update'?'수정취소': '등록취소'}</button>
            <button type="submit" id="writeSubmit">${mode=='update'?'수정완료': '등록하기'}</button>
            <c:if test="${mode=='update'}">
            	<input type="hidden" name="num" value="${dto.num}" >
            	<input type="hidden" name="page" value="${page}" >
            	<input type="hidden" name="imageFilename" value="${dto.imageFilename}" >
            </c:if>
        </div>
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
