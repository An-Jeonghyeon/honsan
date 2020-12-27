<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/room/room.css"
	type="text/css">


	<hr>
<div class="body-containercheck">
	
	<div style="width: 1200px; height:1800px; margin: 0px auto; padding-top:20px;  float: left;">
		<div class="toptitle" style="padding-bottom: 30px;">
			<p class="toptitleP"><i class="fas fa-check" style="color: gray;"></i>방을 보러 다니며 놓치는 사항이 없는지 확인하세요!</p>
		</div>
		
		<form action="">

		<div class="checklist">
		
		
		<div class="listdiv">
		<table class="listTable">
		<tr>
				<td align="center" colspan="2"><input type="text" class="listname" value="리스트 이름"></td>
		</tr>
		<tr>
			<td align="right" colspan="2"><p style="height: 25px; padding-right: 20px;"> 상 &nbsp;&nbsp; 중  &nbsp;&nbsp; 하 </p></td>
		</tr>
		
		
		
		
		
		<tr class="checklistTr" height="49">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck1" class="checkbox" ${string.indexOf("ck1")>0 ?"checked='checked'":""}> 집 위치 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="1" value="a1">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="1" value="a2">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="1" value="a3">  &nbsp;&nbsp;
			</td>
		</tr>
		
		
		
		<tr class="checklistTr" height="49">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck2" class="checkbox"> 보증금 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="2" value="b1">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="2" value="b2">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="2" value="b3">  &nbsp;&nbsp;
			</td>
		</tr>
		
		
		<tr class="checklistTr" height="50">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck3" class="checkbox"> 질문은 차차 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="3" value="c1">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="3" value="c2">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="3" value="c3">  &nbsp;&nbsp;
			</td>
		</tr>
		
		
		<tr class="checklistTr" height="50">
			<td class="checkleftTd"><input type="checkbox" name="ck"  value="ck4" class="checkbox"> 정해지는  </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="4" value="d1">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="4" value="d2">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="4" value="d3">  &nbsp;&nbsp;
			</td>
		</tr>
		
		
		<tr class="checklistTr" height="49">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck5" class="checkbox"> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="5" value="e1">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="5" value="e2">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="5" value="e3">  &nbsp;&nbsp;
			</td>
		</tr>
		
		
		<tr class="checklistTr" height="52">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck6" class="checkbox"> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="6" value="f1">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="6" value="f2">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="6" value="f3">  &nbsp;&nbsp;
			</td>
		</tr>
		
		<tr class="checklistTr" height="48">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck7" class="checkbox"> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="7" value="g1">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="7" value="g2">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="7" value="g3">  &nbsp;&nbsp;
			</td>
		</tr>
		
		
		<tr class="checklistTr" height="52">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck8" class="checkbox"> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="8" value="h1">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="8" value="h2">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="8" value="h3">  &nbsp;&nbsp;
			</td>
		</tr>
		
		<tr class="checklistTr" height="48">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck9" class="checkbox"> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="9" value="i1">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="9" value="i2">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="9" value="i3">  &nbsp;&nbsp;
			</td>
		</tr>
		
		<tr class="checklistTr" height="50">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck10" class="checkbox"> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="10" value="j1">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="10" value="j2">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="10" value="j3">  &nbsp;&nbsp;
			</td>
		</tr>
		
		<tr class="checklistTr" height="50">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck11" class="checkbox"> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="11" value="k1">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="11" value="k2">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="11" value="k3">  &nbsp;&nbsp;
			</td>
		</tr>
		
		<tr class="checklistTr" height="48">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck12" class="checkbox"> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="12" value="l1">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="12" value="l2">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="12" value="l3">  &nbsp;&nbsp;
			</td>
		</tr>
		
		<tr class="checklistTr" height="52">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck13" class="checkbox"> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="13" value="m1">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="13" value="m2">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="13" value="m3">  &nbsp;&nbsp;
			</td>
		</tr>
		
		<tr class="checklistTr" height="48">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck14" class="checkbox"> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="14" value="n1">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="14" value="n2">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="14" value="n3">  &nbsp;&nbsp;
			</td>
		</tr>
		
		<tr class="checklistTr" height="52">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck15" class="checkbox"> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="15" value="o1">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="15" value="o2">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="15" value="o3">  &nbsp;&nbsp;
			</td>
		</tr>
		
		<tr class="checklistTr" height="48">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck16" class="checkbox"> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="16" value="p1">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="16" value="p2">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="16" value="p3">  &nbsp;&nbsp;
			</td>
		</tr>
		
		<tr class="checklistTr" height="49">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck17" class="checkbox"> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="17" value="q1">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="17" value="q2">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="17" value="q3">  &nbsp;&nbsp;
			</td>
		</tr>
		
		<tr class="checklistTr" height="52">
			<td class="checkleftTd"><input type="checkbox" name="ck" value="ck18" class="checkbox"> 근데 언제 정하지 </td>
			<td class="checkrightTd" align="right">
			<input type="radio" class="radio" name="18" value="r1">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="18" value="r2">  &nbsp;&nbsp;&nbsp;
			<input type="radio" class="radio" name="18" value="r3">  &nbsp;&nbsp;
			</td>
		</tr>
		
		
		
		
		
		
		
		
		
		</table>
		</div>
		
		
		<table style="margin-left: 230px">
		<tr>
			<td width="80">메&nbsp;&nbsp;&nbsp;모</td>
			<td align="center" height="100"><textarea rows="5" cols="100" style="resize: none;"></textarea></td>
		</tr>
		</table>
		<table style="margin-left: 250px;">
		<tr>
			<td align="center"><button type="button" class="bottonbtn">저장하기</button></td>
			<td align="center">&nbsp;&nbsp;&nbsp;</td>
			<td align="center"><button type="reset" class="bottonbtn">다시 입력</button></td>
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
					<p class="mylisttit">나의 체크리스트</p>
				</td>
			</tr>
			
			
			<tr>
				<td style="padding-left: 60px;">
					<div class="memoimg">
						<p>리스트 제목</p>
					</div>
				</td>
			</tr>
			
			<tr>
				<td style="padding-left: 60px;">
					<div class="memoimg">
						<p>리스트 제목</p>
					</div>
				</td>
			</tr>
			
			<tr>
				<td style="padding-left: 60px;">
					<div class="memoimg">
						<p>리스트 제목</p>
					</div>
				</td>
			</tr>
			
			<tr>
				<td style="padding-left: 60px;">
					<div class="memoimg">
						<p>리스트 제목</p>
					</div>
				</td>
			</tr>
			
			<tr>
				<td style="padding-left: 60px;">
					<div class="memoimg">
						<p>리스트 제목</p>
					</div>
				</td>
			</tr>
			
			</table>
		</div>
	
	</div>
	
	
	
</div>
	<hr style="clear: both;">



