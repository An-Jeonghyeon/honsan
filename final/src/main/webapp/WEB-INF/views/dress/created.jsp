<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/dress/created.css"
	type="text/css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/se/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript">
	function check() {
		var f = document.writeBodyForm;

		var chk = f.subject.value;
		
		if (!chk) {
			alert("제목을 입력 해주세요.");
			f.subject.focus();
			return false;
		}

		chk = f.content.value;

		if (chk == "<p>&nbsp;</p>") {
			alert("내용을 입력 해주세요");
			f.content.focus();
			return false;
		}

		f.action = "${pageContext.request.contextPath}/dress/created";

		return true;
	}
	
</script>

<article class="writeHeader">
                <div class="writeheaderInnerText">
                    <h3 class="FadeinText">나혼자 코디자랑</h3>
                    <small class="FadeinText">오늘도 어김없이 혼자 무엇을 하려는 당신 <br> 오늘
                        하루 수고한 당신과 ,주변사람들을 위해 <br> 당신의 하루를 공유 해보는게 어떠세요?
                    </small>
                </div>
                <div class="writeHeaderMenu">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/dress/list">전체글보기</a></li>
                    </ul>
                </div>
            </article>

            <form method="post" name="writeBodyForm" onsubmit="return submitContents(this);"
                enctype="multipart/form-data">
                <article class="writeBody">
                    <div class="writeBodyHeader">
                        <span>코디자랑</span>
                    </div>
                    <div class="writeUserName">작성자: ${sessionScope.member.userName}</div>

                    <div class="subjectBody">
                        <input type="text" name="subject" id="subject" value="${dto.subject}"
                            placeholder="제목을 입력해 주세요.">
                    </div>

                    <div class="contentBody">
                        <div class="inputBody1">
                            <textarea id="content" name="content">${dto.content}</textarea>
                              <div class="">
                          </div>
                        </div>                     
                        <div class="tagBody">
                            <div class="plusTag">
                              
                            </div>
                            <div class="dress-TagSpanBodyBox">
                                <div class="dress-TagSpanBody"></div>
                            </div>
                            <div class="inputBody2">
                              <input type="hidden" value="" name="hashtag" id="rdTag" />
                                <input type="text" class="InputTag"  placeholder="#태그를 입렵해 주세요.(최대5개)">
                                <div class="tagbtnBody">
                                    <button class="Tag-btn" type="button" onclick="TagbtnSend()">TAG</button>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="buttonBoxBody">
                        <button type="button" id="CencelSubmit"
                            onclick="javascript:location.href='${pageContext.request.contextPath}/dress/list'">등록취소</button>
                        <button type="submit" id="writeSubmit">등록하기</button>
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
					}
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
