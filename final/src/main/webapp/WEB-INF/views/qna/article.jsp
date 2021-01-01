<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">


<style type="text/css">
  .questionQ{
    display: inline-block;
    padding:7px 10px;
	font-weight: bold;
	color: #ffffff;
	background: #027d87;
	text-align: center;
  }
  .questionSubject{
    display: inline-block;
    position:absolute;
    width:1100px;
    overflow:hidden;
    text-overflow:ellipsis;
    word-spacing:nowrap;
    box-sizing:border-box;
    padding:7px 3px;
    margin-left:1px;
	font-weight: bold;
	color: #ffffff;
	background: #027d87;
  }
  .answerA{
    display: inline-block;
    padding:7px 10px;
	font-weight: bold;
	color: #ffffff;
	background: #cc4901;
	text-align: center;
  }
  .answerSubject{
    display: inline-block;
    position:absolute;
    width:1100px;
    overflow:hidden;
    text-overflow:ellipsis;
    word-spacing:nowrap;
    box-sizing:border-box;
    padding:7px 3px;
    margin-left:1px;
	font-weight: bold;
	color: #ffffff;
	background: #cc4901;
  }
</style>


<script>
function deleteBoard(num,mode) {
	<c:if test="${sessionScope.member.userId==questionDto.userId || sessionScope.member.userId=='admin' }">
		if(confirm("게시물을 삭제 하시겠습니까 ?")) {
			var q="num="+num+"&mode="+mode;
			var url="${pageContext.request.contextPath}/qna/delete?"+q;
			location.href=url;
		}
	</c:if>

	<c:if test="${sessionScope.member.userId!=questionDto.userId && sessionScope.member.userId!='admin' }"> 
		alert("게시글을 삭제할 수 없습니다.");
	</c:if>

	}

// 글 답변폼
function replyForm(num) {
	var url="${pageContext.request.contextPath}/qna/answer";
	var query="?num="+num;
	location.href = url+query;
}

//글 수정폼
function updateForm(num) {
	
	var url="${pageContext.request.contextPath}/qna/update";
	var query;
	query="?num="+num;
	
	location.href=url+query;
}




</script>


<div class="body-container">
<div id="tab-content" style="width:1100px;margin:100px auto; clear:both; padding: 20px 10px 0px;">

<div class="alert-info">
    <i class="fas fa-info-circle"></i>
         질문과 답변을 할 수 있는 공간입니다.
</div>

<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
<tr height="35">
    <td colspan="2" align="left">
    	<span class="questionQ">Q</span><span class="questionSubject">[${questionDto.category}] ${questionDto.subject}</span>
    </td>
</tr>

<tr height="35" style="border-bottom: 1px solid #cccccc;">
    <td width="50%" align="left" style="padding-left: 5px;">
       작성자 : ${questionDto.userName}
    </td>
    <td width="50%" align="right" style="padding-right: 5px;">
     문의일자 : ${questionDto.created}
    </td>
</tr>

<tr>
  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
      ${questionDto.content}
   </td>
</tr>
</table>

<c:if test="${not empty answerDto}">
	<table style="width: 100%; margin: 10px auto 0px; border-spacing: 0px; border-collapse: collapse;">
	<tr height="35">
	    <td colspan="2" align="left">
    	<span class="answerA">A</span><span class="answerSubject">[RE] ${answerDto.subject}</span>
	    </td>
	</tr>
	
	<tr height="35" style="border-bottom: 1px solid #cccccc;">
	    <td width="50%" align="left" style="padding-left: 5px;">
	       담당자 : ${answerDto.userName}
	    </td>
	    <td width="50%" align="right" style="padding-right: 5px;">
	     답변일자 :  ${answerDto.created}
	    </td>
	</tr>
	
	<tr>
	  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
	      ${answerDto.content}
	   </td>
	</tr>
	</table>

</c:if>

<table style="width: 100%; margin: 0px auto 0px; border-spacing: 0px; border-collapse: collapse;">
<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
    <td colspan="2" align="left" style="padding-left: 5px;">
       이전글 :
        <c:if test="${not empty preReadDto}">
	      	<c:choose>
	      		<c:when test="${preReadDto.questionPrivate==1}">
	      			<i class="fa fa-lock" title="공개여부" style="color: #333333;"></i>
	      			<c:if test="${sessionScope.member.userId==preReadDto.userId || sessionScope.member.userId=='admin'}">
	      				<a href="${pageContext.request.contextPath }/qna/article?num=${preReadDto.num}">${preReadDto.subject}</a>
	      			</c:if>
	      			<c:if test="${sessionScope.member.userId!=preReadDto.userId && sessionScope.member.userId!='admin'}">
	      				${preReadDto.subject}
	      			</c:if>
	      		</c:when>
	      		<c:otherwise>
	      			<a href="${pageContext.request.contextPath }/qna/article?num=${preReadDto.num}">${preReadDto.subject}</a>
	      		</c:otherwise>
	      	</c:choose>
        </c:if>
    </td>
</tr>

<tr height="35" style="border-bottom: 1px solid #cccccc;">
    <td colspan="2" align="left" style="padding-left: 5px;">
       다음글 :
        <c:if test="${not empty nextReadDto}">
	      	<c:choose>
	      		<c:when test="${nextReadDto.questionPrivate==1}">
	      			<i class="fa fa-lock" title="공개여부" style="color: #333333;"></i>
	      			<c:if test="${sessionScope.member.userId==nextReadDto.userId || sessionScope.member.userId=='admin'}">
	      				<a href="${pageContext.request.contextPath }/qna/article?num=${nextReadDto.num}">${nextReadDto.subject}</a>
	      			</c:if>
	      			<c:if test="${sessionScope.member.userId!=nextReadDto.userId && sessionScope.member.userId!='admin'}">
	      				${nextReadDto.subject}
	      			</c:if>
	      		</c:when>
	      		<c:otherwise>
	      			<a href="${pageContext.request.contextPath }/qna/article?num=${nextReadDto.num}">${nextReadDto.subject}</a>
	      		</c:otherwise>
	      	</c:choose>
        </c:if>
    </td>
</tr>
</table>

<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
<tr height="45">
    <td width="400" align="left">
        <c:if test="${sessionScope.member.userId==questionDto.userId}">
            <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/qna/${mode}?num=${questionDto.num}';">질문수정</button>
        </c:if>
        <c:if test="${sessionScope.member.userId==questionDto.userId || sessionScope.member.userId=='admin'}">
            <button type="button" class="btn" onclick="deleteBoard('${questionDto.num}', 'question');">질문삭제</button>
        </c:if>
        <c:if test="${sessionScope.member.userId=='admin' && empty answerDto}">
            <button type="button" class="btn" onclick="replyForm('${questionDto.num}');">답변</button>
        </c:if>
        <c:if test="${not empty answerDto and sessionScope.member.userId=='admin'}">
            <button type="button" class="btn" onclick="updateForm('${answerDto.num}');">답변수정</button>
        </c:if>
        <c:if test="${not empty answerDto && sessionScope.member.userId=='admin'}">
            <button type="button" class="btn" onclick="deleteBoard('${answerDto.num}', 'answer');">답변삭제</button>
        </c:if>
    </td>

    <td align="right">
        <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/qna/qnalist';">리스트</button>
    </td>
</tr>
</table>

</div>

</div>
