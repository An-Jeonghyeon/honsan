<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/room/room.css"
	type="text/css">


<div class="body-container">
	<hr>
	<div class="toptitle">
		<p class="toptitleP"><i class="fas fa-check" style="color: gray;"></i>방을 보러 다니며 놓치는 사항이 없는지 확인하세요!</p>
	</div>
	
	
	<div style="width: 900px; margin: 0px auto; padding-top: 50px;">
		
		<form action="">

		<div class="checklist">
		
		
		<div class="listdiv">
		<table class="listTable">
		<tr>
				<td align="center" colspan="2"><input type="text" class="listname" value="리스트 이름"></td>
		</tr>
		<tr>
			<td align="right" colspan="2"><p style="height: 26px; padding-right: 20px;"> 상 &nbsp;&nbsp; 중  &nbsp;&nbsp; 하 </p></td>
		</tr>
		
		
		
		
		
		<tr class="checklistTr" height="40">
			<td class="checkleftTd"><input type="checkbox" class="checkbox"> 집 위치 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="1" value="1">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="1" value="2">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="1" value="3">  &nbsp;&nbsp;
			</td>
		</tr>
		
		
		
		<tr class="checklistTr" height="40">
			<td class="checkleftTd"><input type="checkbox" class="checkbox"> 보증금 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="2" value="1">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="2" value="2">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="2" value="3">  &nbsp;&nbsp;
			</td>
		</tr>
		
		
		<tr class="checklistTr" height="40">
			<td class="checkleftTd"><input type="checkbox" class="checkbox"> 질문은 차차 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="3" value="1">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="3" value="2">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="3" value="3">  &nbsp;&nbsp;
			</td>
		</tr>
		
		
		<tr class="checklistTr" height="40">
			<td class="checkleftTd"><input type="checkbox" class="checkbox"> 정해지는  </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="4" value="1">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="4" value="2">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="4" value="3">  &nbsp;&nbsp;
			</td>
		</tr>
		
		
		<tr class="checklistTr" height="40">
			<td class="checkleftTd"><input type="checkbox" class="checkbox"> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="5" value="1">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="5" value="2">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="5" value="3">  &nbsp;&nbsp;
			</td>
		</tr>
		
		
		
		
		
		
		
		
		
		
		
		</table>
		</div>
		
		
		<table style="margin-left: 180px">
		<tr>
			<td align="center" colspan="3" height="100"><textarea rows="5" cols="80" style="resize: none;"></textarea></td>
		</tr>
		<tr>
			<td align="center"><button type="button" class="bottonbtn">등록하기</button></td>
			<td align="center">&nbsp;&nbsp;&nbsp;</td>
			<td align="center"><button type="reset" class="bottonbtn">되돌리기</button></td>
		</tr>
		
		
		</table>
		
		
		<div class="mychecklist">
			<button type="button" class="mylistbtn"> 마이 체크리스트 </button>
		</div>
		
		</div>
	
	
	
	
		</form>
		
		

	
	
	</div>
	<hr>
</div>



