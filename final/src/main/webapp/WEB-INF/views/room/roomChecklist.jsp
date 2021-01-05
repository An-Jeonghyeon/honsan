<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/room/room.css"
	type="text/css">

<script type="text/javascript">
function deleteBoard(num) {
	<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin' }">
		if(confirm("게시물을 삭제 하시겠습니까 ?")) {
			var q="num="+num;
			var url="${pageContext.request.contextPath}/room/roomChecklistDelete?"+q;
			location.href=url;
		}
	</c:if>
	<c:if test="${sessionScope.member.userId!=dto.userId && sessionScope.member.userId!='admin' }"> 
		alert("게시글을 삭제할 수 없습니다.");
	</c:if>

}

function send(num){
	var f = document.checklistForm;
	var str;
	
	str = f.subject.value;
	str = str.trim();
	if(!str) {
		alert("제목을 입력하세요.");
		f.subject.focus();
		return;
	}
	

	<c:if test="${mode=='create'}">
		<c:if test="${dataCount>=5}">
			alert("5개까지만 저장할 수 있습니다.");
			return;
		</c:if>
		 f.action = "${pageContext.request.contextPath}/room/roomChecklistCreated";
		 f.submit();
	 </c:if>
	 <c:if test="${mode=='update'}">
		 f.action = "${pageContext.request.contextPath}/room/roomChecklistUpdate";
		 f.submit();
 	</c:if>
	
}

function article(num) {
	var url = "${pageContext.request.contextPath}/room/roomChecklistNum?num=" + num;
	location.href = url;
}

function newcheck(){
	<c:if test="${dataCount>=5}">
		alert("5개까지만 저장할 수 있습니다.");
		return;
	</c:if>
	<c:if test="${dataCount<5}">
		location.href="${pageContext.request.contextPath}/room/roomChecklist";
	</c:if>
}

</script>


	<hr>
<div class="body-containercheck">
	
	<div style="width: 1200px; height:1800px; margin: 0px auto; padding-top:20px;  float: left;">
		<div class="toptitle" style="padding-bottom: 30px;">
			<p class="toptitleP"><i class="fas fa-check" style="color: gray;"></i>방을 보러 다니며 놓치는 사항이 없는지 확인하세요!</p>
		</div>
		
		<form name="checklistForm" method="post">

		<div class="checklist">
		
		
		<div class="listdiv">
		<table class="listTable">
		<tr>
				<td align="center" colspan="2"><input type="text" name="subject" class="listname" placeholder="-리스트 이름 작성-" value="${dto.subject }"></td>
		</tr>
		<tr>
			<td align="right" colspan="2"><p style="height: 25px; padding-right: 20px;"> 상 &nbsp;&nbsp; 중  &nbsp;&nbsp; 하 </p></td>
		</tr>
		
		<tr class="checklistTr" height="49">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck1" class="checkbox" ${fn:contains(dto.item, "ck1") ? "checked='checked'":""} > 집 위치 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="a1" value="a1" ${fn:contains(dto.item, "a1") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="a1" value="a2" ${fn:contains(dto.item, "a2") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="a1" value="a3" ${fn:contains(dto.item, "a3") ? "checked='checked'":""}>  &nbsp;&nbsp;
			</td>
		</tr>
		
		
		
		<tr class="checklistTr" height="49">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck2" class="checkbox" ${fn:contains(dto.item, "ck2") ? "checked='checked'":""}> 보증금 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="b2" value="b1" ${fn:contains(dto.item, "b1") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="b2" value="b2" ${fn:contains(dto.item, "b2") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="b2" value="b3" ${fn:contains(dto.item, "b3") ? "checked='checked'":""}>  &nbsp;&nbsp;
			</td>
		</tr>
		
		
		<tr class="checklistTr" height="50">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck3" class="checkbox" ${fn:contains(dto.item, "ck3") ? "checked='checked'":""}> 질문은 차차 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="c3" value="c1" ${fn:contains(dto.item, "c1") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="c3" value="c2" ${fn:contains(dto.item, "c2") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="c3" value="c3" ${fn:contains(dto.item, "c3") ? "checked='checked'":""}>  &nbsp;&nbsp;
			</td>
		</tr>
		
		
		<tr class="checklistTr" height="50">
			<td class="checkleftTd"><input type="checkbox" name="ck"  value="ck4" class="checkbox" ${fn:contains(dto.item, "ck4") ? "checked='checked'":""}> 정해지는  </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="d4" value="d1" ${fn:contains(dto.item, "d1") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="d4" value="d2" ${fn:contains(dto.item, "d2") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="d4" value="d3" ${fn:contains(dto.item, "d3") ? "checked='checked'":""}>  &nbsp;&nbsp;
			</td>
		</tr>
		
		
		<tr class="checklistTr" height="49">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck5" class="checkbox" ${fn:contains(dto.item, "ck5") ? "checked='checked'":""}> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="e5" value="e1" ${fn:contains(dto.item, "e1") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="e5" value="e2" ${fn:contains(dto.item, "e2") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="e5" value="e3" ${fn:contains(dto.item, "e3") ? "checked='checked'":""}>  &nbsp;&nbsp;
			</td>
		</tr>
		
		
		<tr class="checklistTr" height="52">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck6" class="checkbox" ${fn:contains(dto.item, "ck6") ? "checked='checked'":""}> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="f6" value="f1" ${fn:contains(dto.item, "f1") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="f6" value="f2" ${fn:contains(dto.item, "f2") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="f6" value="f3" ${fn:contains(dto.item, "f3") ? "checked='checked'":""}>  &nbsp;&nbsp;
			</td>
		</tr>
		
		<tr class="checklistTr" height="48">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck7" class="checkbox" ${fn:contains(dto.item, "ck7") ? "checked='checked'":""}> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="g7" value="g1" ${fn:contains(dto.item, "g1") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="g7" value="g2" ${fn:contains(dto.item, "g2") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="g7" value="g3" ${fn:contains(dto.item, "g3") ? "checked='checked'":""}>  &nbsp;&nbsp;
			</td>
		</tr>
		
		
		<tr class="checklistTr" height="52">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck8" class="checkbox" ${fn:contains(dto.item, "ck8") ? "checked='checked'":""}> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="h8" value="h1" ${fn:contains(dto.item, "h1") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="h8" value="h2" ${fn:contains(dto.item, "h2") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="h8" value="h3" ${fn:contains(dto.item, "h3") ? "checked='checked'":""}>  &nbsp;&nbsp;
			</td>
		</tr>
		
		<tr class="checklistTr" height="48">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck9" class="checkbox" ${fn:contains(dto.item, "ck9") ? "checked='checked'":""}> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="i9" value="i1" ${fn:contains(dto.item, "i1") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="i9" value="i2" ${fn:contains(dto.item, "i2") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="i9" value="i3" ${fn:contains(dto.item, "i3") ? "checked='checked'":""}>  &nbsp;&nbsp;
			</td>
		</tr>
		
		<tr class="checklistTr" height="50">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck10" class="checkbox" ${fn:contains(dto.item, "ck10") ? "checked='checked'":""}> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="j10" value="j1" ${fn:contains(dto.item, "j1") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="j10" value="j2" ${fn:contains(dto.item, "j2") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="j10" value="j3" ${fn:contains(dto.item, "j3") ? "checked='checked'":""}>  &nbsp;&nbsp;
			</td>
		</tr>
		
		<tr class="checklistTr" height="50">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck11" class="checkbox" ${fn:contains(dto.item, "ck11") ? "checked='checked'":""}> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="k11" value="k111" ${fn:contains(dto.item, "k111") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="k11" value="k112" ${fn:contains(dto.item, "k112") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="k11" value="k113" ${fn:contains(dto.item, "k113") ? "checked='checked'":""}>  &nbsp;&nbsp;
			</td>
		</tr>
		
		<tr class="checklistTr" height="48">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck12" class="checkbox" ${fn:contains(dto.item, "ck12") ? "checked='checked'":""}> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="l12" value="l1" ${fn:contains(dto.item, "l1") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="l12" value="l2" ${fn:contains(dto.item, "l2") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="l12" value="l3" ${fn:contains(dto.item, "l3") ? "checked='checked'":""}>  &nbsp;&nbsp;
			</td>
		</tr>
		
		<tr class="checklistTr" height="52">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck13" class="checkbox" ${fn:contains(dto.item, "ck13") ? "checked='checked'":""}> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="m13" value="m1" ${fn:contains(dto.item, "m1") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="m13" value="m2" ${fn:contains(dto.item, "m2") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="m13" value="m3" ${fn:contains(dto.item, "m3") ? "checked='checked'":""}>  &nbsp;&nbsp;
			</td>
		</tr>
		
		<tr class="checklistTr" height="48">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck14" class="checkbox" ${fn:contains(dto.item, "ck14") ? "checked='checked'":""}> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="n14" value="n1" ${fn:contains(dto.item, "n1") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="n14" value="n2" ${fn:contains(dto.item, "n2") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="n14" value="n3" ${fn:contains(dto.item, "n3") ? "checked='checked'":""}>  &nbsp;&nbsp;
			</td>
		</tr>
		
		<tr class="checklistTr" height="52">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck15" class="checkbox" ${fn:contains(dto.item, "ck15") ? "checked='checked'":""}> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="o15" value="o1" ${fn:contains(dto.item, "o1") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="o15" value="o2" ${fn:contains(dto.item, "o2") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="o15" value="o3" ${fn:contains(dto.item, "o3") ? "checked='checked'":""}>  &nbsp;&nbsp;
			</td>
		</tr>
		
		<tr class="checklistTr" height="48">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck16" class="checkbox" ${fn:contains(dto.item, "ck16") ? "checked='checked'":""}> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="p16" value="p1" ${fn:contains(dto.item, "p1") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="p16" value="p2" ${fn:contains(dto.item, "p2") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="p16" value="p3" ${fn:contains(dto.item, "p3") ? "checked='checked'":""}>  &nbsp;&nbsp;
			</td>
		</tr>
		
		<tr class="checklistTr" height="49">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck17" class="checkbox" ${fn:contains(dto.item, "ck17") ? "checked='checked'":""}> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="q17" value="q1" ${fn:contains(dto.item, "q1") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="q17" value="q2" ${fn:contains(dto.item, "q2") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="q17" value="q3" ${fn:contains(dto.item, "q3") ? "checked='checked'":""}>  &nbsp;&nbsp;
			</td>
		</tr>
		
		<tr class="checklistTr" height="52">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck18" class="checkbox" ${fn:contains(dto.item, "ck18") ? "checked='checked'":""}> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="r18" value="r1" ${fn:contains(dto.item, "r1") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="r18" value="r2" ${fn:contains(dto.item, "r2") ? "checked='checked'":""}>  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="r18" value="r3" ${fn:contains(dto.item, "r3") ? "checked='checked'":""}>  &nbsp;&nbsp;
			</td>
		</tr>
		
		
		
		
		
		
		
		
		
		</table>
		</div>
		
		
		<table style="margin-left: 230px">
		<tr>
			<td width="80" style="font-weight: bold; font-size: 20px;">메&nbsp;&nbsp;&nbsp;모</td>
			<td align="center" height="100"><textarea name="memo" rows="5" cols="100" style="resize: none;">${dto.memo }</textarea></td>
		</tr>
		</table>
		<table style="margin-left: 350px;">
		<tr>
			<td align="center"><button type="button" class="bottonbtn" onclick="send('${dto.num}');">저장하기</button></td>
			<c:if test="${mode!='update'}">
				<td align="center" width="150">&nbsp;&nbsp;&nbsp;</td>
			</c:if>
			<td align="center"><button type="reset" class="bottonbtn" onclick="newcheck();">새로 작성</button></td>
			<c:if test="${mode=='update'}">
				<td align="center">
					<input type="hidden" name="num" value="${dto.num }">
				<td align="center"><button type="button" class="bottonbtn" onclick="deleteBoard('${dto.num}');">삭제하기</button></td>
			</c:if>
		</tr>
		
		
		</table>
		
		
		</div>
	
	
	
	
		</form>
		
		

	
	
	</div>
	
	
	<div class="rightdiv" style="width: 250px; height:1800px; margin: 0px auto; border-left:1px solid #eee; padding-top:20px; float: left;">
	
		<div style="width: 100%; margin: 0px auto; padding-top: 30px; position: sticky; top: 0; padding-bottom: 100px;">
			<table>
			<tr>
				<td style="padding-left:40px; padding-bottom:30px; text-align: center;">
					<p class="mylisttit">나의 체크리스트${dataCount }</p>
				</td>
			</tr>
			
			<c:forEach var="dto" items="${list}" varStatus="status">
			
			<tr>
				<td style="padding-left: 60px;">
					<div class="memoimg" onclick="article('${dto.num}');">
						${dto.subject }
					</div>
				</td>
			</tr>
			
			</c:forEach>
			
			</table>
		</div>
	
	</div>
	
	
	
</div>
	<hr style="clear: both;">



