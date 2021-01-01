<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">

<script type="text/javascript">
	function bgLabel(ob, id) {
		if (!ob.value) {
			document.getElementById(id).style.display = "";
		} else {
			document.getElementById(id).style.display = "none";
		}
	}

	function searchList() {
		var f = document.searchForm;
		f.submit();
	}

	function article(num) {
		var url = "${articleUrl}&num=" + num;
		location.href = url;
	}
	

</script>



<div class="body-container">


<!-- 검색 부분 -->
<div class="qnasearchlist">
<div style="width: 1000px; margin: 0px auto;">
	<form name="qnasearchForm"
		action="${pageContext.request.contextPath }/qna/qnalist"
		method="post">
			<table style="width:1000px; margin: 15px auto; border-spacing: 0px;">
				<tr>
					<td align="center" class="qnatitle"><br>질문과 답변</td>
				</tr>
				<tr>
					<td align="center">HOLLO에게 묻고 싶은 질문을 해보세요.</td>
				</tr>
				<tr height="60">
					<td align="center"><label for="town" id="lblTown" class="qnalbl"><i class="fas fa-search"></i>궁금한 것을 검색해보세요.
							</label> <input type="text" name="town" id="town"
						class="qnasearchTF" maxlength="20" tabindex="2"
						onfocus="document.getElementById('lblTown').style.display='none';"
						onblur="bgLabel(this, 'lblTown');">
						<button type="button" class="qnasearchbtn" onclick="searchList()">검색</button>
					</td>
				</tr>
				
				
			</table>
	</form>
</div>

</div>
	
	
<!-- 리스트 부분 -->	
<div id="tab-content" style="width:1000px;margin:10px auto; clear:both; padding: 20px 10px 0px;">
<div class="alert-info">
  <i class="fas fa-info-circle"></i>
    질문과 답변을 할 수 있는 공간입니다.
</div>

<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
   <tr height="35">
      <td align="left" width="50%">
          ${dataCount}개(${pageNo}/${total_page} 페이지)
      </td>
      <td align="right">
          &nbsp;
      </td>
   </tr>
</table>

<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
      <th width="60" style="color: #787878;">번호</th>
      <th width="100" style="color: #787878;">유형</th>
      <th style="color: #787878;">제목</th>
      <th width="100" style="color: #787878;">작성자</th>
      <th width="80" style="color: #787878;">문의일자</th>
      <th width="80" style="color: #787878;">처리결과</th>
  </tr>
 
<c:forEach var="dto" items="${list}">
  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
      <td>${dto.listNum}</td>
      <td>${dto.category}</td>
      <td align="left" style="padding-left: 10px;">
      	<c:choose>
      		<c:when test="${dto.questionPrivate==1}">
      			<i class="fa fa-lock" title="공개여부" style="color: #333333;"></i>
      			<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">
      				<a href="${pageContext.request.contextPath }/qna/article?num=${dto.num}">${dto.subject}</a>
      			</c:if>
      			<c:if test="${sessionScope.member.userId!=dto.userId && sessionScope.member.userId!='admin'}">
      				${dto.subject}
      			</c:if>
      		</c:when>
      		<c:otherwise>
      			<a href="${pageContext.request.contextPath }/qna/article?num=${dto.num}">${dto.subject}</a>
      		</c:otherwise>
      	</c:choose>
      </td>
      <td>${dto.userName}</td>
      <td>${dto.created}</td>
      <td>${dto.isAnswer==1?"답변완료":"답변대기"}</td>
  </tr>
  </c:forEach>

</table>
 
<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
   <tr height="35">
	<td align="center">
       ${dataCount==0?"등록된 게시물이 없습니다.":paging}
	</td>
   </tr>
</table>

<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
   <tr height="40">
      <td align="left" width="100">
          <button type="button" class="btn" onclick="reloadBoard();">새로고침</button>
      </td>
      <td align="center">
          <form name="searchForm" action="" method="post">
              <select id="condition" name="condition" class="selectField">
                  <option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
                  <option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
                  <option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
                  <option value="userName" ${condition=="userName"?"selected='selected'":""}>작성자</option>
                  <option value="created" ${condition=="created"?"selected='selected'":""}>작성일</option>
            </select>
            <input type="text" id="keyword" name="keyword" class="boxTF" value="${keyword}">
            <button type="button" class="btn" onclick="searchList();">검색</button>
        </form>
      </td>
      <td align="right" width="100">
          <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/qna/created';">글올리기</button>
      </td>
   </tr>
</table>




</div>
</div>

<hr>







