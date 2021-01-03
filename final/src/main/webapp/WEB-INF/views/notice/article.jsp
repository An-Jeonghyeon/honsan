<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice.css" type="text/css">

<script type="text/javascript">
function deleteNotice() {
	<c:if test="${sessionScope.member.userId=='admin'}">
	  var q = "num=${dto.num}&${query}";
	  var url = "${pageContext.request.contextPath}/notice/delete?" + q;

	  if(confirm("위 자료를 삭제 하시 겠습니까 ? "))
	  	location.href=url;
	</c:if>    
	<c:if test="${sessionScope.member.userId!='admin'}">
	  alert("게시물을 삭제할 수  없습니다.");
	</c:if>
	}

	function updateNotice() {
	<c:if test="${sessionScope.member.userId=='admin'}">
	  var q = "num=${dto.num}&page=${page}";
	  var url = "${pageContext.request.contextPath}/notice/update?" + q;

	  location.href=url;
	</c:if>

	<c:if test="${sessionScope.member.userId!='admin'}">
	 alert("게시물을 수정할 수  없습니다.");
	</c:if>
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
	

	<div id="tab-content" style="width:1000px; margin:10px auto 150px; clear:both; padding: 20px 10px 0px;">
			<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr height="100" style="border-bottom: 1px solid #cccccc;" class="subjecttr">
			    <td colspan="2" align="center">
				   <h1> ${dto.subject} </h1>
			    </td>
			</tr>
			
			<tr height="40" style="border-bottom: 1px solid #cccccc;">
			    <td width="50%" align="left" style="padding-left: 5px;">
			       이름 : ${dto.userName}
			    </td>
			    <td width="50%" align="right" style="padding-right: 5px;">
			        ${dto.created} | 조회 ${dto.hitCount}
			    </td>
			</tr>
			
			<tr style="border-bottom: 1px solid #cccccc;">
			  <td colspan="2" align="left" style="padding: 20px 5px;" valign="top" height="200">
			      ${dto.content}
			   </td>
			</tr>
			
			<c:forEach var="vo" items="${listFile}">
				<tr height="40">
				    <td colspan="2" align="left" style="padding-left: 5px;">
					      <i class="far fa-save"></i> <a href="${pageContext.request.contextPath}/notice/download?fileNum=${vo.fileNum}">${vo.originalFilename}</a>
				          (<fmt:formatNumber value="${vo.fileSize/1024}" pattern="0.00"/> KByte)
				    </td>
				</tr>
			</c:forEach>
			
			<tr height="40" style="border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       이전글 :
			         <c:if test="${not empty preReadDto}">
			              <a href="${pageContext.request.contextPath}/notice/article?${query}&num=${preReadDto.num}">${preReadDto.subject}</a>
			        </c:if>
			    </td>
			</tr>
			
			<tr height="40" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       다음글 :
			         <c:if test="${not empty nextReadDto}">
			              <a href="${pageContext.request.contextPath}/notice/article?${query}&num=${nextReadDto.num}">${nextReadDto.subject}</a>
			        </c:if>
			    </td>
			</tr>
			</table>
			
			<table style="width: 100%; margin: 10px auto 20px; border-spacing: 0px;">
			<tr height="45">
			    <td width="300" align="left">
			       <c:if test="${sessionScope.member.userId=='admin'}">				    
			          <button type="button" class="updatebtn" onclick="updateNotice();">수정</button>
			       </c:if>
			       <c:if test="${sessionScope.member.userId=='admin'}">				    
			          <button type="button" class="deletebtn" onclick="deleteNotice();">삭제</button>
			       </c:if>
			    </td>
			
			    <td align="right">
			        <button type="button" class="listbtn" onclick="javascript:location.href='${pageContext.request.contextPath}/notice/list?${query}';">리스트</button>
			    </td>
			</tr>
			</table>
    </div>
    
</div>