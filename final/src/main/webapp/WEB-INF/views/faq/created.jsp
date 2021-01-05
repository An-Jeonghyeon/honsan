<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


 <style>
        * {
            margin: 0;
            padding: 0;
        }

        .MainBody {
            width: 1300px;
            height: 1000px;
            margin: 250px auto 0 auto;
        }

        form[name="faqCreatedForm"] {
            width: 100%;
            height: 550px;
           
        }

        .faqListTable {
            width: 1000px;
            margin: 0 auto;
        }

        .faqThead {
            width: 1000px;
            background: #9b9b9b;
            box-sizing: border-box;
           
        }

        .faqTheadTr {
            width: 300px;
            height: 100px;
            text-align: center;
            text-shadow: 1px 3px 3px gray;
            color: aliceblue;
            font-size: 23px;
            border-radius: 10px;
        }

        .faqButtonMain {
            width: 100%;
        }

        .faqButtonBody {
            width: 500px;
            margin: 0 auto;
            text-align: center;
        }

        .tableBody{
            width: 100%;
            height: 500px;
        }
        .faqmenubar{
            text-align: center;
            background:#dcdcdc;
            border-radius: 5px;
        }
        .select[name="condition"]{
            
        }
        .faqSubject{
            width:100%;
            height:30px;
            border: 0;
            background:#ebebeb;
            border-radius: 5px;
        }
        .faqtextarea{
            width:100%;
            height:300px;
            border: 0;
            background:#ebebeb;
            border-radius: 5px;
            resize: none;
        }
        .faqBtn{
            width:100px;
            height:30px;
            border: none;
            background: rgb(100,100,100);
            border-radius: 5px;
            color:aliceblue;
            text-shadow: 1px 3px 3px gray;
        }
    </style>
<script type="text/javascript">
function sendOk(){
	var f= document.faqCreatedForm;
		
	if(!f.question.value){
		f.question.focus();
		alert("제목을 입력해주세요");
		return false;
	}else if(!f.questionAnswer.value){
		f.questionAnswer.focus();
		alert("내용을 입력해주세요");
		return false;
	}
	f.action="${pageContext.request.contextPath}/faq/created";
	f.submit();
}


</script>
  <div class="MainBody">
        <form method="post" name="faqCreatedForm">
            <div class="tableBody">
                <table class="faqListTable">
                    <thead class="faqThead">
                        <tr>
                            <td colspan="3" class="faqTheadTr">
                                관리자 전용 FAQ 글작성
                            </td>
                        </tr>
                    </thead>
                    <tr>
                        <td class="faqmenubar">분류</td>
                        <td>
                            <select name="questionSelect">
                                <option value="회원관련"> &lt;회원관련&gt;</option>
                                <option value="이용관련">&lt;이용관련&gt;</option>
                                <option value="날씨관련">&lt;날씨관련&gt;</option>
                                <option value="주거관련">&lt;주거관련&gt;</option>
                                <option value="음식관련">&lt;음식관련&gt;</option>
                                <option value="건강관련">&lt;건강관련&gt;</option>
                                <option value="인테리어">&lt;인테리어&gt;</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="faqmenubar">제목</td>
                        <td>
                            <input class="faqSubject" type="text" name="question">
                        </td>
                    </tr>
                    <tr>
                        <td  class="faqmenubar">답변내용</td>
                        <td>
                            <textarea class="faqtextarea" name="questionAnswer"></textarea>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="faqButtonMain">
                <div class="faqButtonBody">
                    <button class="faqBtn" onclick="javascript:location.href='${pageContext.request.contextPath}/faq/article?num=${dto.num}&page=${page}'">${mode=='update'? '수정취소':'등록취소'}</button>
                    <button class="faqBtn" type="button" onclick="sendOk()">${mode=='update'?'수정완료':'등록하기'}</button>
                </div>
            </div>
             
        </form>
    </div>