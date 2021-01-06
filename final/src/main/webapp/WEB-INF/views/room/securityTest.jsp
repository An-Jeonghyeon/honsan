<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/room/security.css"
	type="text/css">

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".inputLayout").hide();
	$(".inputLayout:first").show();	
	$("#btnPrev").text("테스트 취소");
	$("#btnNext").text("다음 장");	
	
	$("#btnNext").click(function() {
		
		var f=document.securityTestForm;
		
		var str;
		
		
		/*
		// 필수 입력사항 - 이 부분에서 유효성 검사하면 됨
		//현재 보이는 곳에서 required클래스를 가지고 있니?
		if ($(".inputLayout:visible").hasClass("required1")) {
			str = f.a1.value;
			str = str.trim();
			if(!str) {
				alert("1번 문제의 답을 입력하세요.");
				f.a1.focus();
				return;
			}
			str = f.b1.value;
			str = str.trim();
			if(!str) {
				alert("2번 문제의 답을 입력하세요.");
				f.b1.focus();
				return;
			}
			str = f.c1.value;
			str = str.trim();
			if(!str) {
				alert("3번 문제의 답을 입력하세요.");
				f.c1.focus();
				return;
			}
			str = f.d1.value;
			str = str.trim();
			if(!str) {
				alert("4번 문제의 답을 입력하세요.");
				f.d1.focus();
				return;
			}
			str = f.e1.value;
			str = str.trim();
			if(!str) {
				alert("5번 문제의 답을 입력하세요.");
				f.e1.focus();
				return;
			}
			
		}
		
		*/
		
		
		
		
		
		
		
		if ($("#btnNext").hasClass("last")) {
			// 마지막 레이아웃에서 가입 버튼을 클릭한 경우
			memberOk();
			return false; // jQuery에서 return false는 이벤트를 취소하는 것. return 써도 되지만.. 더 이상 클릭 처리하지 않겠다는 의미
		}
		
		// 마지막 레이아웃이 아닌 경우
		if (! $(".inputLayout").last().is(":visible")) { // last() 검색할 때 쓰임 
			$(".inputLayout:visible").hide().next(".inputLayout").fadeIn(100); //fadeIn은 애니메이션 효과주기 위해 사용. show 써도 됨
			$("#btnPrev").text("이전 장");
			$("#btnNext").text("다음 장");
			$("#btnNext").removeClass("last");			
		}
		
		// 마지막 레이아웃인 경우
		if ($(".inputLayout").last().is(":visible")) {
			$("#btnPrev").text("이전 장");
			$("#btnNext").text("제출 하기");
			$("#btnNext").addClass("last");		
		}
	});
});

$(function() {
	$("#btnPrev").click(function() {
		if ($(".inputLayout").first().is(":visible")) { // 회원가입 취소를 누르면
			location.href="${pageContext.request.contextPath }/room/security";
			return false; // 메인화면 보내면 됨
		}
		
		$("#btnPrev").text("이전 장");
		$(".inputLayout:visible").hide().prev(".inputLayout").fadeIn(100);
		
		if ($(".inputLayout").first().is(":visible")) {
			$("#btnPrev").text("테스트 취소");
		}
		
		if (! $(".inputLayout").last().is(":visible")) {
			$("#btnNext").text("다음 장");
			$("#btnNext").removeClass("last");
		}
		
	});
});

function memberOk() {
	if(confirm("테스트를 종료하시겠습니까 ? ")){
		var f=document.securityTestForm;
				
				f.action = "${pageContext.request.contextPath}/room/securityTestSubmit";
		
				f.submit();
			}
		}

</script>


<hr>
<div class="body-containertest">
    <div class="body-title">
        <p class="titlename"> &nbsp;&nbsp;&nbsp;2021년도 전국보안자가진단평가 문제지 </p>
        <br><br><br><br>
        <p class="titlename" style="font-size: 50px;"> 보안 탐구 영역 </p>
    </div>
    
        <div>
			<form name="securityTestForm" method="post">
				<div class='inputLayout'>
					<table class="firsttable" style="border:1px solid; border-collapse: collapse; text-align:center; width: 100%; margin-top: 20px; border-spacing: 0;">
					<tr>
						<td height="30" style="font-weight: bold;">종&nbsp;&nbsp;목</td>
						<td style="font-weight: bold;">시험 시간</td>
						<td style="font-weight: bold;">문제수</td>
					</tr>
					<tr>
						<td height="50">생활 보안 자가진단 테스트</td>
						<td>00시간 00분</td>
						<td>15</td>
					</tr>
					</table>
					<table class="firsttable">
					<tr>
						<td height="50" style="font-weight: bold;">수험 번호</td>
						<td>00000-00000000</td>
						<td style="font-weight: bold;">성&nbsp;&nbsp;명</td>
						<td>${sessionScope.member.userName}</td>
					</tr>
					</table>
					<table class="firsttable" style="border:1px solid; border-collapse: collapse; text-align:center; width: 100%; margin-top: 20px; border-spacing: 0;">
					<tr>
						<td height="30" style="font-weight: bold;">[ 수험자 유의사항 ]</td>
					</tr>
					<tr>
						<td style="padding: 20px; text-align: left;">
						<br><br>
							1. 답안은 각 문제마다 요구하는 가장 적합하거나 가까운 답 1개만을 선택하여야 합니다.<br><br>
							2. 문항에 따라 배점이 다릅니다. <br><br>
							3. 자신의 상황에 정확하고 솔직하게 답하시는 것이 좋습니다.<br><br>
							4. 테스트 문제 및 답의 일부 또는 전부를 옮겨 적거나 이를 유출하는 행위는 상관없느니 하셔도 무방합니다<br><br><br>
						</td>
					</tr>
					</table>
					<table class="firsttable" style="border:1px solid; border-collapse: collapse; text-align:center; width: 100%; margin-top: 20px; border-spacing: 0;">
					<tr>
						<td height="30" style="font-weight: bold;">[ 안 내 사 항 ]</td>
					</tr>
					<tr>
						<td style="padding: 20px; text-align: left;">
						<br><br>
							- 제시될 보안 자가진단 항목 중 개선이 되어야 할 항목이나 추가 되어야 할 사항이 있으면  hollo 고객센터로 의견을 보내주시면 감사하겠습니다.<br><br>
							- 시험자 여러분의 안전을 기원하며, 항상 고객만족에 최선을 다하겠습니다.<br><br><br><br><br><br>

							※ 테스트 결과는 참고용으로 활용하시고, 놓치는 보안에 주의하세요<br><br><br>
						</td>
					</tr>
					</table>
					
					<p class="pagenum"> - 1 - </p>
				</div>
			
				<div class='inputLayout required1'>
					<table style="width: 100%; margin-top: 10px; border-spacing: 0;">
					<tr>
					<td>
						<div style="width: 500px;height:400px; float: left; border-right: 1px solid #000;border-bottom : 1px solid #000;border-top : 1px solid #000; margin-left: 10px;padding:10px 0 10px 10px;">
							<div class="question">
								<p><strong>1.</strong> 나의 집 층수는 ? </p><br>
								<input type="radio" name="a1" value="1"> 지하~반지하  &nbsp; &nbsp;
								<input type="radio" name="a1" value="2"> 1층 &nbsp; &nbsp;
								<input type="radio" name="a1" value="3"> 2층  &nbsp; &nbsp;
								<input type="radio" name="a1" value="4"> 3~4층 <br><br>
								<input type="radio" name="a1" value="5"> 5층 이상 &nbsp; &nbsp;
								<input type="radio" name="a1" value="4"> 최고층 &nbsp; &nbsp;
								<input type="radio" name="a1" value="3"> 옥탑  <br><br><br>
							</div>
						
							<div class="question">
								<p><strong>2.</strong> 공동현관(건물 입구) 잠금 장치는 ? </p><br>
								<input type="radio" name="b1" value="1"> 문 없음(오픈형)&nbsp; &nbsp;
								<input type="radio" name="b1" value="2"> 잠금장치 없음&nbsp; &nbsp;
								<input type="radio" name="b1" value="3"> 열쇠<br><br>
								<input type="radio" name="b1" value="4"> 도어락 등 전자장치<br><br><br>
							</div>
						
							<div class="question">
								<p><strong>3.</strong> 건물 입구 및 내부 cctv 유무? </p><br>
								<input type="radio" name="c1" value="1"> 없음 &nbsp; &nbsp;
								<input type="radio" name="c1" value="2"> 집 앞&nbsp; &nbsp;
								<input type="radio" name="c1" value="3"> 공동현관(건물 입구)만&nbsp; &nbsp;
								<input type="radio" name="c1" value="4"> 집 복도, 현관까지<br><br><br>
							</div>
						
						
						
						</div>
						<div style="width: 500px;height:400px; float: left; border-bottom : 1px solid #000;border-top : 1px solid #000; padding:10px 0 10px 10px;">
							<div class="question">
								<p><strong>4.</strong> 집 현관 잠금 장치는 ?  </p><br>
								<input type="radio" name="d1" value="1"> 없음  &nbsp; &nbsp;
								<input type="radio" name="d1" value="2"> 열쇠 &nbsp; &nbsp;
								<input type="radio" name="d1" value="3"> 도어락 등 전자장치 <br><br>
								<input type="radio" name="d1" value="4"> 도어락+안전바 &nbsp; &nbsp;
								<input type="radio" name="d1" value="5"> 3가지 이상 <br><br><br>
							</div>
						
							<div class="question">
								<p><strong>5.</strong> 집 내부 창문 보안은 ? </p><br>
								<input type="radio" name="e1" value="1"> 잠금 장치 없음&nbsp; &nbsp;
								<input type="radio" name="e1" value="2"> 1중 창 잠금&nbsp; &nbsp;
								<input type="radio" name="e1" value="3"> 1중 창 잠금 + 보호 철창 <br><br>
								<input type="radio" name="e1" value="3"> 2중 창 잠금 &nbsp; &nbsp;
								<input type="radio" name="e1" value="4"> 2중 창 잠금 + 보호 철창 &nbsp; &nbsp;<br><br>
								<input type="radio" name="e1" value="5"> 그 외 추가 보안 설치<br><br><br>
							</div>

						</div>
					</td>
					</tr>	
					</table>

						<p class="pagenum"> - 2 - </p>	
				</div>
			
				<div class='inputLayout required2'>
					<table style="width: 100%; margin-top: 10px; border-spacing: 0; ">
										<tr>
					<td>
						<div style="width: 500px;height:400px; float: left; border-right: 1px solid #000;border-bottom : 1px solid #000;border-top : 1px solid #000; margin-left: 10px;padding:10px 0 10px 10px;">
							<div class="question">
								<p><strong>6.</strong> 택배 수령 하는 법 ?  </p><br>
								<input type="radio" name="f1" value="4"> 보안이 되어있는 택배함  &nbsp; &nbsp;
								<input type="radio" name="f1" value="3"> 보안 없이 있는 택배 보관 <br><br>
								<input type="radio" name="f1" value="2"> 택배 기사님임을 인증하고 집 앞으로  &nbsp; &nbsp;
								<input type="radio" name="f1" value="1"> 인증 없이 다이렉트로 집 앞으로 <br><br><br>
							</div>
						
							<div class="question">
								<p><strong>7.</strong> 외부에서 집 내부를 볼 경우 ? </p><br>
								<input type="radio" name="g1" value="1"> 없음 &nbsp; &nbsp;
								<input type="radio" name="g1" value="2"> 있음<br><br><br>
							</div>
						
							<div class="question">
								<p><strong>8.</strong> 집가는 길 도움을 요청할 장소가 많은가 ?  </p><br>
								<input type="radio" name="h1" value="5"> 집 도착까지 계속 &nbsp; &nbsp;
								<input type="radio" name="h1" value="4"> 5분거리 마다 있음&nbsp; &nbsp;
								<input type="radio" name="h1" value="3"> 드문드문 있임<br><br>
								<input type="radio" name="h1" value="2"> 거의 없음&nbsp; &nbsp;
								<input type="radio" name="h1" value="1"> 전혀 없음<br><br><br>
							</div>
						
						
						
						</div>
						<div style="width: 500px;height:400px; float: left; border-bottom : 1px solid #000;border-top : 1px solid #000; padding:10px 0 10px 10px;">
							<div class="question">
								<p><strong>9.</strong> 아 질문 뭐하지  </p><br>
								<input type="radio" name="i1" value="1"> 없음  &nbsp; &nbsp;
								<input type="radio" name="i1" value="2"> 열쇠 &nbsp; &nbsp;
								<input type="radio" name="i1" value="3"> 도어락 등 전자장치 <br><br>
								<input type="radio" name="i1" value="4"> 도어락+안전바 &nbsp; &nbsp;
								<input type="radio" name="i1" value="5"> 3가지 이상 <br><br><br>
							</div>
						
							<div class="question">
								<p><strong>10.</strong> 집 내부 창문 보안은 ? </p><br>
								<input type="radio" name="j1" value="1"> 잠금 장치 없음&nbsp; &nbsp;
								<input type="radio" name="j1" value="2"> 1중 창 잠금&nbsp; &nbsp;
								<input type="radio" name="j1" value="3"> 1중 창 잠금 + 보호 철창 <br><br>
								<input type="radio" name="j1" value="3"> 2중 창 잠금 &nbsp; &nbsp;
								<input type="radio" name="j1" value="4"> 2중 창 잠금 + 보호 철창 &nbsp; &nbsp;<br><br>
								<input type="radio" name="j1" value="5"> 그 외 추가 보안 설치<br><br><br>
							</div>

						</div>
					</td>
					</tr>
					</table>
					<p class="pagenum"> - 3 - </p>		
				</div>
			
				<div class='inputLayout required3'>
					<table style="width: 100%; margin-top: 10px; border-spacing: 0; border-collapse: collapse;">
										<tr>
					<td>
						<div style="width: 500px;height:400px; float: left; border-right: 1px solid #000;border-bottom : 1px solid #000;border-top : 1px solid #000; margin-left: 10px;padding:10px 0 10px 10px;">
							<div class="question">
								<p><strong>11.</strong> 나의 집 층수는 ? </p><br>
								<input type="radio" name="k1" value="1"> 지하~반지하  &nbsp; &nbsp;
								<input type="radio" name="k1" value="2"> 1층 &nbsp; &nbsp;
								<input type="radio" name="k1" value="3"> 2층  &nbsp; &nbsp;
								<input type="radio" name="k1" value="4"> 3~4층 <br><br>
								<input type="radio" name="k1" value="5"> 5층 이상 &nbsp; &nbsp;
								<input type="radio" name="a1" value="4"> 최고층 &nbsp; &nbsp;
								<input type="radio" name="a1" value="3"> 옥탑  <br><br><br>
							</div>
						
							<div class="question">
								<p><strong>12.</strong> 공동현관(건물 입구) 잠금 장치는 ? </p><br>
								<input type="radio" name="l1" value="1"> 문 없음(오픈형)&nbsp; &nbsp;
								<input type="radio" name="l1" value="2"> 잠금장치 없음&nbsp; &nbsp;
								<input type="radio" name="l1" value="3"> 열쇠<br><br>
								<input type="radio" name="l1" value="4"> 도어락 등 전자장치<br><br><br>
							</div>
						
							<div class="question">
								<p><strong>13.</strong> 건물 입구 및 내부 cctv 유무? </p><br>
								<input type="radio" name="m1" value="1"> 없음 &nbsp; &nbsp;
								<input type="radio" name="m1" value="2"> 집 앞&nbsp; &nbsp;
								<input type="radio" name="m1" value="3"> 공동현관(건물 입구)만&nbsp; &nbsp;
								<input type="radio" name="m1" value="4"> 집 복도, 현관까지<br><br><br>
							</div>
						
						
						
						</div>
						<div style="width: 500px;height:400px; float: left; border-bottom : 1px solid #000;border-top : 1px solid #000; padding:10px 0 10px 10px;">
							<div class="question">
								<p><strong>14.</strong> 집 현관 잠금 장치는 ?  </p><br>
								<input type="radio" name="n1" value="1"> 없음  &nbsp; &nbsp;
								<input type="radio" name="n1" value="2"> 열쇠 &nbsp; &nbsp;
								<input type="radio" name="n1" value="3"> 도어락 등 전자장치 <br><br>
								<input type="radio" name="n1" value="4"> 도어락+안전바 &nbsp; &nbsp;
								<input type="radio" name="n1" value="5"> 3가지 이상 <br><br><br>
							</div>
						
							<div class="question">
								<p><strong>15.</strong> 집 내부 창문 보안은 ? </p><br>
								<input type="radio" name="o1" value="1"> 잠금 장치 없음&nbsp; &nbsp;
								<input type="radio" name="o1" value="2"> 1중 창 잠금&nbsp; &nbsp;
								<input type="radio" name="o1" value="3"> 1중 창 잠금 + 보호 철창 <br><br>
								<input type="radio" name="o1" value="3"> 2중 창 잠금 &nbsp; &nbsp;
								<input type="radio" name="b1" value="4"> 2중 창 잠금 + 보호 철창 &nbsp; &nbsp;<br><br>
								<input type="radio" name="b1" value="5"> 그 외 추가 보안 설치<br><br><br>
							</div>

						</div>
					</td>
					</tr>
					</table>
					<p class="pagenum"> - 4 - </p>
				</div>
			
			  <div>
				  <table style="width: 100%; border-spacing: 0; margin-left: 120px;">
				     <tr height="80"> 
				      <td align="center" >
				        <button type="button" id="btnPrev" class="testbtn">테스트 취소</button>
				      </td>
				      <td width="10">
				      </td>
				      <td>
				        <button type="button" id="btnNext" class="testbtn">제출하기</button>
				      </td>
				    </tr>
				    <tr height="30">
				        <td align="center" style="color: blue;">${message}</td>
				    </tr>
				  </table>
			  </div>
			</form>
        </div>
</div>
<hr>