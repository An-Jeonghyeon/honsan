<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice.css" type="text/css">

<script type="text/javascript">
function searchList() {
	var f=document.searchForm;
	f.submit();
}
</script>


<div class="body-container">
	<div class="noticeheader">
		<div style="width: 1000px; margin: 0px auto;">
			<table style="width:1000px; margin: 15px auto; border-spacing: 0px;">
				<tr>
					<td align="center" class="qnatitle"><br>공지사항</td>
				</tr>
				<tr>
					<td align="center">중요한 일정 및 이벤트를 공지사항을 통해 안내드립니다.</td>
				</tr>
			</table>
		</div>
	</div>
	
	
<!-- 리스트 부분 -->	
<div id="tab-content" style="width:1000px; margin:10px auto 150px; clear:both; padding: 60px 10px 30px;">
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
  <tr align="center" bgcolor="#ebebeb" height="40" style="border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
      <th width="60" style="color: #787878;">번호</th>
      <th style="color: #787878;">제목</th>
      <th width="100" style="color: #787878;">작성자</th>
      <th width="100" style="color: #787878;">작성일</th>
      <th width="80" style="color: #787878;">첨부</th>
      <th width="80" style="color: #787878;">조회</th>
  </tr>
 
 <c:forEach var="dto" items="${noticeList}">
  <tr align="center" bgcolor="#ffffff" height="40" style="border-bottom: 1px solid #cccccc;"> 
      <td><span style="display: inline-block; padding:1px 3px; background: #ED4C00;color: #FFFFFF">공지</span></td>
      <td align="left" style="padding-left: 10px;">
           <a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
      </td>
      <td>${dto.userName}</td>
      <td>${dto.created}</td>
      <td>
	      <c:if test="${dto.fileCount != 0}">
               <a href="${pageContext.request.contextPath}/notice/zipdownload?num=${dto.num}"><i class="far fa-file"></i></a>
	      </c:if>
      </td>
      <td>${dto.hitCount}</td>
  </tr>
</c:forEach>

<c:forEach var="dto" items="${list}">
  <tr align="center" bgcolor="#ffffff" height="40" style="border-bottom: 1px solid #cccccc;"> 
      <td>${dto.listNum}</td>
      <td align="left" style="padding-left: 10px;">
           <a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
      </td>
      <td>${dto.userName}</td>
      <td>${dto.created}</td>
      <td>
          <c:if test="${dto.fileCount != 0}">
               <a href="${pageContext.request.contextPath}/notice/zipdownload?num=${dto.num}"><i class="far fa-file"></i></a>
          </c:if>		
      </td>
      
      <td>${dto.hitCount}</td>
  </tr>
  </c:forEach>
</table>
 
<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
   <tr height="40">
	<td align="center">
       ${dataCount==0?"등록된 게시물이 없습니다.":paging}
	</td>
   </tr>
</table>

<table style="width: 100%; margin: 30px auto 10px; border-spacing: 0px;">
   <tr height="40">
      <td align="left" width="100">
          <button type="button" class="reset" onclick="reloadBoard();"><i class="fas fa-redo-alt"></i>새로고침</button>
      </td>
      <td align="center">
          <form name="searchForm" action="" method="post">
              <select id="condition" name="condition" class="selectField sup-bbs-select">
                  <option value="all" ${condition=="all"?"selected='selected'":""}>전체</option>
                  <option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
                  <option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
                  <option value="userName" ${condition=="userName"?"selected='selected'":""}>작성자</option>
                  <option value="created" ${condition=="created"?"selected='selected'":""}>작성일</option>
            </select>
            <input type="text" id="keyword" name="keyword" class="sup-bbs-input" value="${keyword}">
            <button type="button" class="sup-bbs-btn" onclick="searchList();">검색</button>
        </form>
      </td>
      <td align="right" width="100">
      	<c:if test="${sessionScope.member.userId=='admin'}">
          <button type="button" class="submitbtn" onclick="javascript:location.href='${pageContext.request.contextPath}/notice/created';">글올리기</button>
        </c:if>
   </tr>
</table>
</div>
</div>