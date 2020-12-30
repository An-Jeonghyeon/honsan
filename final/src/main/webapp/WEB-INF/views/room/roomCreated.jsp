<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/room/room.css"
	type="text/css">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.8.8/i18n/jquery.ui.datepicker-ko.js"></script>


<script type="text/javascript">
$(function(){
	   $("#accordion1").accordion({active:true, collapsible:true});
	   $("#accordion2").accordion({active:false, collapsible:true});
	   $("#accordion3").accordion({active:false, collapsible:true});
		
});

function roomOk(){
	var f = document.roomForm;
	var str;
	
	str = f.addr1.value;
	str = str.trim();
	if(!str) {
		alert("주소를 입력하세요.");
		f.addrbtn.focus();
		return;
	}
	
	
	str = f.addr2.value;
	str = str.trim();
	if(!str) {
		alert("상세 주소를 입력하세요.");
		f.addr2.focus();
		return;
	}
	
	str = f.depo.value;
	str = str.trim();
	if(!str) {
		alert("보증금을 입력하세요.");
		f.depo.focus();
		return;
	}
	if(!/^(\d+)$/.test(str)) {
	      alert("숫자만 가능합니다.");
	      f.depo.focus();
	      return;
	}
	
	str = f.mrent.value;
	str = str.trim();
	if(!str) {
		alert("월세를 입력하세요.");
		f.mrent.focus();
		return;
	}
	if(!/^(\d+)$/.test(str)) {
	      alert("숫자만 가능합니다.");
	      f.mrent.focus();
	      return;
	}
	
	str = f.roomtype.value;
	str = str.trim();
	if(!str) {
		alert("방 구조를 선택하세요.");
		f.roomtype.focus();
		return;
	}
	
	str = f.adcost.value;
	str = str.trim();
	if(!str) {
		alert("관리비를 입력하세요.");
		f.adcost.focus();
		return;
	}
	if(!/^(\d+)$/.test(str)) {
	      alert("숫자만 가능합니다.");
	      f.adcost.focus();
	      return;
	}
	
	var str1 = $("input[name='aditem']").is(":checked");
	var str2 = $('#aditem_none').is(":checked");
	if(str1==false && str2==false) {
		alert("관리비 포함 항목을 선택하세요.");
		f.aditem.focus();
		return;
	}
	
	
	str = f.m2.value;
	str = str.trim();
	if(!str) {
		alert("면적을 입력하세요.");
		f.m2.focus();
		return;
	}
	if(isNaN(str)) {
	      alert("숫자만 가능합니다.");
	      f.m2.focus();
	      return;
	}
	
	str = f.pyeoug.value;
	str = str.trim();
	if(!str) {
		alert("면적을 입력하세요.");
		f.pyeoug.focus();
		return;
	}
	if(isNaN(str)) {
	      alert("숫자만 가능합니다.");
	      f.m2.focus();
	      return;
	}
	
	str = f.totfloor.value;
	str = str.trim();
	if(!str) {
		alert("건물 층 수를 입력하세요.");
		f.totfloor.focus();
		return;
	}
	
	str = f.corfloor.value;
	str = str.trim();
	if(!str) {
		alert("해당 층 수를 입력하세요.");
		f.corfloor.focus();
		return;
	}
	
	str1 = $("input[name='options']").is(':checked');
	str2 = $('#options_none').is(':checked');
	if(!(str1==true) && !(str2==true)) {
		alert("옵션 포함 항목을 선택하세요.");
		f.options.focus();
		return;
	}
	
	str = f.park.value;
	str = str.trim();
	if(!str) {
		alert("주차 여부를 선택하세요.");
		f.park.focus(); //이건 어떻게 포커스 될까
		return;
	}
	
	str = f.elev.value;
	str = str.trim();
	if(!str) {
		alert("엘리베이터 여부를 선택하세요.");
		f.elev.focus(); //이건 어떻게 포커스 될까
		return;
	}
	
	str = f.movedate.value;
	str = str.trim();
	if(!str) {
		alert("입주가능일을 입력하세요.");
		f.movedate.focus();
		return;
	}
	
	str = f.subject.value;
	str = str.trim();
	if(!str) {
		alert("제목을 입력하세요.");
		f.subject.focus();
		return;
	}
	
	str = f.content.value;
	str = str.trim();
	if(!str) {
		alert("상세 내용을 입력하세요.");
		f.content.focus();
		return;
	}
	
	var img = new Image();
	 img.onerror=function(){
        alert(" 메인 사진 파일을 첨부해 주세요");
        return false;
    }
	 
	 <c:if test="${mode=='roomCreated'}">
	 str = f.mainUpload.value;
		str = str.trim();
		if(!str) {
			alert("메인 사진 파일을 첨부해 주세요");
			f.mainUpload.focus();
			return;
		}
	</c:if>
	 
/*	
    var fileCheck2 = document.getElementById("upload2").value;
    if(!fileCheck2){
        alert(" 주방 사진 파일을 첨부해 주세요");
        return false;
    }
    
    var fileCheck3 = document.getElementById("upload3").value;
    if(!fileCheck3){
        alert(" 화장실 사진 파일을 첨부해 주세요");
        return false;
    }
*/	
	/*
	<c:if test="${mode=='roomUpdate'}">
		<c:forEach var="vo" items="${listFile}">
			deleteFile('${vo.fileNum}');
		</c:forEach>
	</c:if>*/
	
	 f.action = "${pageContext.request.contextPath}/room/${mode}";

	 f.submit();
}


</script>


<script type="text/javascript">


function check(){
	if($('#fee_none').is(':checked') == true){
		$('#adcost').attr('readonly',true);
		$('#adcost').val(0);
	}else if ($("input:checkbox[name=fee_none]").is(":checked") == false) {
		$("input:text[name=adcost]").prop('readonly',false);
		$('#adcost').val("");
	}
}



<c:if test="${mode=='roomUpdate'}">
$(function(){
	$('.mainimg').attr("src","${pageContext.request.contextPath}/uploads/room/${dto.mainimg}");
});

function deleteFile(fileNum,uploadNum) {
		$('.mainimg'+uploadNum).removeAttr('src');
		var url="${pageContext.request.contextPath}/room/deleteFile";
		$.post(url, {fileNum:fileNum}, function(data){
			$("#f"+fileNum).remove();
		}, "json");
}
</c:if>

</script>





<!-- 방 상세 정보 스크립트 -->
<script type="text/javascript">

function calculator(chk){
	  if(chk==1){ 
		  document.getElementById('cal2').value = parseFloat(document.getElementById('cal1').value) * 3.3058;
	  }
	  else { 
	      document.getElementById('cal1').value = parseFloat(document.getElementById('cal2').value) / 3.3058;
	  }
}
$(function(){
	$(".mainimg").click(function(){
		$(".upload").click();
	});
	
	$(".mainimg1").click(function(){
		$(this).change(function(){
			<c:if test="${mode=='roomUpdate'}">
			$('.mainimg1').removeAttr('src');
			<c:forEach var="vo" items="${listFile}" varStatus="status">
				<c:if test="${status.count}==0">
					deleteFile('${vo.fileNum}');
				</c:if>
			</c:forEach>
			</c:if>
		});
		$(".upload1").click();
	});
	
	$(".mainimg2").click(function(){
		<c:if test="${mode=='roomUpdate'}">
		$('.mainimg2').removeAttr('src');
		<c:forEach var="vo" items="${listFile}" varStatus="status">
			<c:if test="${status.count}==1">
				deleteFile('${vo.fileNum}');
			</c:if>
		</c:forEach>
		</c:if>
		$(".upload2").click();
	});
	
	$(".mainimg3").click(function(){
		<c:if test="${mode=='roomUpdate'}">
		$('.mainimg3').removeAttr('src');
		<c:forEach var="vo" items="${listFile}" varStatus="status">
			<c:if test="${status.count}==2">
				deleteFile('${vo.fileNum}');
			</c:if>
		</c:forEach>
		</c:if>
		$(".upload3").click();
	});
	
});




</script>


<script type="text/javascript">

$(function(){
	   
var sel_files;
	   $("body").on("change", ".upload", function(e){ 
	       
	      var files = e.target.files;
	      var filesArr = Array.prototype.slice.call(files);
	      
	      filesArr.forEach(function(f) {
	         // 이미지 파일이 아닌경우
	         if(! f.type.match("image.*")) {
	        	alert("이미지 파일만 가능합니다.");
	            return;
	         }
	         
	         sel_files=f;
	         var reader = new FileReader();
	         reader.onload = function(e1) {
	            $("#mainimg").attr("src",e1.target.result);
	            
	         }
	         reader.readAsDataURL(f);
	      });
	       
	   });
	   
});
	   
$(function(){	   
	   $("body").on("change", ".upload1", function(e){ 
	       
		      var files = e.target.files;
		      var filesArr = Array.prototype.slice.call(files);
		      
		      filesArr.forEach(function(f) {
		         // 이미지 파일이 아닌경우
		         if(! f.type.match("image.*")) {
		        	alert("이미지 파일만 가능합니다.");
		            return;
		         }
		         
		         sel_files=f;
		         var reader = new FileReader();
		         reader.onload = function(e1) {
		            $("#mainimg1").attr("src",e1.target.result);
		            
		         }
		         reader.readAsDataURL(f);
		      });
		       
		   });
	   
});

$(function(){		   
	   $("body").on("change", ".upload2", function(e){ 
	       
		      var files = e.target.files;
		      var filesArr = Array.prototype.slice.call(files);
		      
		      filesArr.forEach(function(f) {
		         // 이미지 파일이 아닌경우
		         if(! f.type.match("image.*")) {
		        	alert("이미지 파일만 가능합니다.");
		            return;
		         }
		         
		         sel_files=f;
		         var reader = new FileReader();
		         reader.onload = function(e1) {
		            $("#mainimg2").attr("src",e1.target.result);
		            
		         }
		         reader.readAsDataURL(f);
		      });
		       
		   });
	   
});

$(function(){		   
	   $("body").on("change", ".upload3", function(e){ 
	       
		      var files = e.target.files;
		      var filesArr = Array.prototype.slice.call(files);
		      
		      filesArr.forEach(function(f) {
		         // 이미지 파일이 아닌경우
		         if(! f.type.match("image.*")) {
		        	alert("이미지 파일만 가능합니다.");
		            return;
		         }
		         
		         sel_files=f;
		         var reader = new FileReader();
		         reader.onload = function(e1) {
		            $("#mainimg3").attr("src",e1.target.result);
		            
		         }
		         reader.readAsDataURL(f);
		      });
		       
		   });
});


</script>








<hr>

<div class="createdtoptitle">
		<p class="createdtoptitleP"><i class="fas fa-marker" style="color: gray;"></i>허위로 올리는 글은 신고를 받아 게시물이 삭제 될 수 있습니다.</p>
	</div>

<div class="totaldiv" style="">
<form class="roomForm" name="roomForm" method="post" enctype="multipart/form-data">

<!-- 주소 부분 -->
<div style="width: 1000px; margin: 0px auto; padding-top: 100px;">
	
		<div id="accordion1" class="acc" >
			<h3 style="background:#ffeb5e; height: 30px; font-size: 20px; color: black; border: none;"><i class="fas fa-map-marked-alt"></i>  주소</h3>
			<div>
			
				<span>주소가 들어갈 kakao api부분</span>
				<table>
					<tr>
				      <td width="100" valign="top" style="text-align: right; padding-top: 20px;">
				            <label style="font-weight: 900;">우편번호</label>
				      </td>
				      <td style="padding: 0 0 15px 15px;">
				        <p style="margin-top: 1px; margin-bottom: 5px;">
				            <input type="text" name="zip" id="zip"
				                       class="roomboxTF" readonly="readonly">
				            <button type="button" class="addrbtn" name="addrbtn" onclick="daumPostcode();">우편번호</button>          
				        </p>
				      </td>
				  </tr>
				  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">주소</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" name="addr1" id="addr1"  value="${dto.addr1}" maxlength="50" 
			                       class="roomboxTF" style="width: 95%;" placeholder="기본 주소" readonly="readonly">
			        </p>
			        <p style="margin-bottom: 5px;">
			            <input type="text" name="addr2" id="addr2" value="${dto.addr2}" maxlength="50" 
			                       class="roomboxTF" style="width: 95%;" placeholder="나머지 주소">
			        </p>
			      </td>
			  </tr>
				  
				</table>
				
				
			</div>
		</div>
	
</div>

<!-- 거래 유형 및 방 상세 정보 입력 -->
<div style="width: 1000px; margin: 10px auto; padding-top: 20px;">
	
		<div id="accordion2" class="acc" >
			<h3 style="background:#ffeb5e; height: 30px; font-size: 20px; color: black; border: none;"><i class="fas fa-list-alt"></i>  거래 유형 및 방 상세 정보</h3>
			<div>
				<table class="add-table">
                <tbody><tr>
                    <th>보증금</th>
                    <td>
                        <input type="text" class="text" name="depo" value="${dto.depo }" onkeydown="return number_validate1(event);"> 만원
                        <span class="fc-red1">※무보증일 경우, 한 달 월세를 입력하세요</span>
                    </td>
                </tr>
                <tr>
                    <th>월세</th>
                    <td>
                        <input type="text" class="text" name="mrent" value="${dto.mrent }" onkeydown="return number_validate1(event);"> 만원
                        <span class="fc-red1">※전세일 경우, 0을 입력 하세요</span>
                    </td>
                </tr>
                <tr>
                    <th>방구조</th>
                    <td>
                        <select style="width:180px" name="roomtype">
                            <option value="">선택하세요</option>
                            <option value="오픈형 원룸 (방1)" ${dto.roomtype=="오픈형 원룸 (방1)"?"selected='selected'":""}>오픈형 원룸 (방1)</option>
                            <option value="분리형 원룸 (방1, 거실1)" ${dto.roomtype=="분리형 원룸 (방1, 거실1)"?"selected='selected'":""}>분리형 원룸 (방1, 거실1)</option>
                            <option value="복층형 원룸" ${dto.roomtype=="복층형 원룸"?"selected='selected'":""}>복층형 원룸</option>
                            <option value="투룸 (방2, 거실1)" ${dto.roomtype=="투룸 (방2, 거실1)"?"selected='selected'":""}>투룸 (방2, 거실1)</option>
                            <option value="쓰리룸+" ${dto.roomtype=="쓰리룸+"?"selected='selected'":""}>쓰리룸+</option>
                        </select>
                    </td>
                </tr>
                
                <tr height="70">
                    <th>관리비</th>
                    <td>
                        <input type="text" class="text" name="adcost" id="adcost" value="${dto.adcost }"> 만원
                        &nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;
                        <label><input type="checkbox" id="fee_none" name="fee_none" onclick="check()"> 없음</label>
                        <p class="i-gray">
                            <strong>관리비 포함 항목</strong>
                            <label><input name="aditem" id="aditem" type="checkbox" value="전기세"> 전기세</label>
                            <label><input name="aditem" id="aditem" type="checkbox" value="가스"> 가스</label>
                            <label><input name="aditem" id="aditem" type="checkbox" value="수도"> 수도</label>
                            <label><input name="aditem" id="aditem" type="checkbox" value="인터넷"> 인터넷</label>
                            <label><input name="aditem" id="aditem" type="checkbox" value="TV"> TV</label>
                            &nbsp;|&nbsp;
                            <label><input name="aditem_none" id="aditem_none" type="checkbox" value="없음" ${dto.aditem=="없음"?"checked='checked'":""}> 없음</label><br>
	                        <span class="fc-red1">※없음 선택 시 항목 없음</span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <th height="80">크기</th>
                    <td class="size">
                            계약면적 : <input type="text" class="text min" value="${dto.m2 }" name="m2" id="cal2" onkeyup="calculator(2);"> m<sup>2</sup> = <input type="text" class="text min" name="pyeoug" value="${dto.pyeoug }" id="cal1" onkeyup="calculator(1);"> P
                        <br>
                        <span class="fc-red1">※한 단위만 입력하면 자동으로 전환됩니다</span>
                    </td>
                </tr>
                <tr>
                    <th>층수</th>
                    <td class="floor">
                        건물 층 수:
                        <select name="totfloor">
                            <option value="">선택하세요</option>
                        <option value="1">1층</option><option value="2">2층</option><option value="3">3층</option><option value="4">4층</option><option value="5">5층</option><option value="6">6층</option><option value="7">7층</option><option value="8">8층</option><option value="9">9층</option><option value="10">10층</option><option value="11">11층</option><option value="12">12층</option><option value="13">13층</option><option value="14">14층</option><option value="15">15층</option><option value="16">16층</option><option value="17">17층</option><option value="18">18층</option><option value="19">19층</option><option value="20">20층</option><option value="21">21층</option><option value="22">22층</option><option value="23">23층</option><option value="24">24층</option><option value="25">25층</option><option value="26">26층</option><option value="27">27층</option><option value="28">28층</option><option value="29">29층</option><option value="30">30층</option><option value="31">31층</option><option value="32">32층</option><option value="33">33층</option><option value="34">34층</option><option value="35">35층</option><option value="36">36층</option><option value="37">37층</option><option value="38">38층</option><option value="39">39층</option><option value="40">40층</option><option value="41">41층</option><option value="42">42층</option><option value="43">43층</option><option value="44">44층</option><option value="45">45층</option><option value="46">46층</option><option value="47">47층</option><option value="48">48층</option><option value="49">49층</option><option value="50">50층</option><option value="51">51층</option><option value="52">52층</option><option value="53">53층</option><option value="54">54층</option><option value="55">55층</option><option value="56">56층</option><option value="57">57층</option><option value="58">58층</option><option value="59">59층</option><option value="60">60층</option><option value="61">61층</option><option value="62">62층</option><option value="63">63층</option><option value="64">64층</option><option value="65">65층</option><option value="66">66층</option><option value="67">67층</option><option value="68">68층</option><option value="69">69층</option><option value="70">70층</option><option value="71">71층</option><option value="72">72층</option><option value="73">73층</option><option value="74">74층</option><option value="75">75층</option><option value="76">76층</option><option value="77">77층</option><option value="78">78층</option><option value="79">79층</option><option value="80">80층</option></select>
                        &nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;
                        해당 층 :
                        <select name="corfloor">
                            <option value="">선택하세요</option>
                            <option value="반지하" ${dto.corfloor=="반지하"?"selected='selected'":""}>반지하</option>
                            <option value="옥탑방" ${dto.corfloor=="옥탑방"?"selected='selected'":""}>옥탑방</option>
                        <option value="1">1층</option><option value="2">2층</option><option value="3">3층</option><option value="4">4층</option><option value="5">5층</option><option value="6">6층</option><option value="7">7층</option><option value="8">8층</option><option value="9">9층</option><option value="10">10층</option><option value="11">11층</option><option value="12">12층</option><option value="13">13층</option><option value="14">14층</option><option value="15">15층</option><option value="16">16층</option><option value="17">17층</option><option value="18">18층</option><option value="19">19층</option><option value="20">20층</option><option value="21">21층</option><option value="22">22층</option><option value="23">23층</option><option value="24">24층</option><option value="25">25층</option><option value="26">26층</option><option value="27">27층</option><option value="28">28층</option><option value="29">29층</option><option value="30">30층</option><option value="31">31층</option><option value="32">32층</option><option value="33">33층</option><option value="34">34층</option><option value="35">35층</option><option value="36">36층</option><option value="37">37층</option><option value="38">38층</option><option value="39">39층</option><option value="40">40층</option><option value="41">41층</option><option value="42">42층</option><option value="43">43층</option><option value="44">44층</option><option value="45">45층</option><option value="46">46층</option><option value="47">47층</option><option value="48">48층</option><option value="49">49층</option><option value="50">50층</option><option value="51">51층</option><option value="52">52층</option><option value="53">53층</option><option value="54">54층</option><option value="55">55층</option><option value="56">56층</option><option value="57">57층</option><option value="58">58층</option><option value="59">59층</option><option value="60">60층</option><option value="61">61층</option><option value="62">62층</option><option value="63">63층</option><option value="64">64층</option><option value="65">65층</option><option value="66">66층</option><option value="67">67층</option><option value="68">68층</option><option value="69">69층</option><option value="70">70층</option><option value="71">71층</option><option value="72">72층</option><option value="73">73층</option><option value="74">74층</option><option value="75">75층</option><option value="76">76층</option><option value="77">77층</option><option value="78">78층</option><option value="79">79층</option><option value="80">80층</option></select>
                    </td>
                </tr>
                <tr>
                    <th>옵션</th>
                    <td class="i-options">
                        <label><input type="checkbox" id="options" name="options" value="에어컨"> 에어컨</label>
                        <label><input type="checkbox" id="options" name="options" value="냉장고"> 냉장고</label>
                        <label><input type="checkbox" id="options" name="options" value="세탁기"> 세탁기</label>
                        <label><input type="checkbox" id="options" name="options" value="가스레인지"> 가스레인지</label>
                        <label><input type="checkbox" id="options" name="options" value="인덕션"> 인덕션</label>
                        <label><input type="checkbox" id="options" name="options" value="전자레인지"> 전자레인지</label><br>
                        <label><input type="checkbox" id="options" name="options" value="책상"> 책상</label>
                        <label><input type="checkbox" id="options" name="options" value="책장"> 책장</label>
                        <label><input type="checkbox" id="options" name="options" value="침대"> 침대</label>
                        <label><input type="checkbox" id="options" name="options" value="옷장"> 옷장</label>
                        <label><input type="checkbox" id="options" name="options" value="신발장"> 신발장</label>
                        <label><input type="checkbox" id="options" name="options" value="싱크대"> 싱크대</label>
                        <p class="i-gray">
                            <label><input type="checkbox" name="options_none" id="options_none" value="없음" ${dto.options=="없음"?"checked='checked'":""}> 없음</label><br>
	                        <span class="fc-red1">※없음 선택 시 항목 없음</span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <th>주차</th>
                    <td class="has-col">
                        <label><input type="radio" name="park" value="1" ${dto.park=="1"?"checked='checked'":""}> 가능</label>
                        <label><input type="radio" name="park" value="0" ${dto.park=="0"?"checked='checked'":""}> 없음</label>
                    </td>
                </tr>
                <tr>
                	<th>엘리베이터</th>
                	<td class="elev">
                	 	<label><input type="radio" name="elev" value="1" ${dto.elev=="1"?"checked='checked'":""}> 있음</label>
                        <label><input type="radio" name="elev" value="0" ${dto.elev=="0"?"checked='checked'":""}> 없음</label>
                	</td>
                </tr>
                <tr>
                    <th>입주가능일</th>
                    <td>
                        <input type="text" value="${dto.movedate }" class="text max" name="movedate">
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td>
                        <input type="text" value="${dto.subject }" class="text max" name="subject">
                    </td>
                </tr>
                <tr>
                    <th>상세설명</th>
                    <td>
                        <textarea name="content" class="description" placeholder="해당 방에 대한 특징과 소개를 최소 50자 이상 입력해야 합니다.
방의 위치와 교통, 주변 편의시설, 방의 특징과 장점, 보안시설, 옵션, 주차, 전체적인
방의 느낌 등을 작성해 주세요.      
다른 방에 대한 설명, 연락처, 홍보 메시지 등 해당 방과 관련없는 내용을 입력하거나 
해당 방에 대한 설명이 부적절할 경우 중개가 종료될 수 있습니다.
                                  ">${dto.content }</textarea>
                        <div class="i-description-status">
                            <em>방 설명을 최소 50자 이상 입력해 주세요.</em>
                        </div>
                    </td>
                </tr>
            </tbody></table>
				
			</div>
		</div>
	
</div>


<!-- 방 사진 올리는 부분 -->
<div style="width: 1000px; margin: 10px auto; padding-top: 20px; padding-bottom: 50px;">
	
		<div id="accordion3" class="acc" >
			<h3 style="background:#ffeb5e; height: 30px; font-size: 20px; color: black; border: none;"><i class="fas fa-camera"></i>  방 상세 사진</h3>
			<div>
			
				<div class="add-photo">
	                <p class="item-txt ischrome">
	                    · 사진 최소 5장 최대 15장 까지 등록할 수 있습니다.<br>
	                    · 아래에 등록 버튼을 클릭하여 사진을 선택하거나, 마우스로 사진을 끌어와서 등록할 수도 있습니다.<br>
	                    · 한꺼번에 여러 장 등록도 가능합니다.<br>
	                    <span class="fc-red1">· 직접 찍은 실제 방 사진의 원본을 등록해야 합니다.</span><br>
	                    <span class="fc-red1">· 워터마크, 날짜, 전화번호 등이 포함된 사진이나 방과 관련없는 사진을 등록할 경우 중개가 종료될 수 있습니다.</span>
	                </p>
	                <p class="item-txt isnotchrome" style="display:none">
	                    · 등록 버튼을 이용하여 사진 최소 5장 최대 15장 까지 등록할 수 있습니다.<br>
	                    · 사진을 여러장 선택하여 한번에 등록도 가능합니다.
	                </p>
	                <p class="item-txt islowIE" style="display:none">
	                    · 등록 버튼을 이용하여 사진 최소 5장 최대 15장 까지 등록할 수 있습니다.
	                </p>
            	</div>
            	
            	<div class="imgfilediv">
            	
            	<table>
            	<tr>
            		<td colspan="3" align="center">
            			<div>
					       <div class="imagePreView">
					       	<p style="position: relative;"> 메인 사진 </p>
					       	<img class="mainimg" alt="" id="mainimg" style="width: 600px; height: 300px;">

					       </div>
					    </div>
					    <div>
					          <input type="file" style="display: none;" name="mainUpload" class="upload" id="upload">
					    </div>
            		</td>
            	</tr>
            	<tr>
            	<c:if test="${mode=='roomUpdate'}">
            	<c:forEach var="vo" items="${listFile}" varStatus="status">
            		<td>
	            		<div>
					       <div class="imagePreView">
					       	<p style="position: relative;text-align: center;"> 서브 사진  ${status.count } <a href="javascript:deleteFile('${vo.fileNum}, ${status.count }');"><i class="far fa-trash-alt"></i></a></p>
					       	<img class="mainimg${status.count}" alt="" src="${pageContext.request.contextPath}/uploads/room/${vo.saveFile}" id="mainimg${status.count }" onerror="this.parentNode.style.display='none'">
					       </div>
					    </div>
					    <div>
					          <input type="file" style="display: none;" name="upload" class="upload${status.count }">
					    </div>
            		</td>
            	</c:forEach>
            	
            	<c:forEach begin="1" end="${3-listCount }" varStatus="status">
            		<td>
	            		<div>
					       <div class="imagePreView">
					       	<p style="position: relative; text-align: center;"> 서브 사진 ${listCount+status.index }</p>
					       	<img class="mainimg${listCount+status.index}" alt="" id="mainimg${listCount+status.index }">
					       </div>
					    </div>
					    <div>
					          <input type="file" style="display: none;" name="upload" class="upload${listCount+status.index }">
					    </div>
            		</td>
            	</c:forEach>
            	</c:if>
            	
            	
            	<c:if test="${mode=='roomCreated'}">
            		<td>
	            		<div>
					       <div class="imagePreView">
					       	<p style="position: relative;text-align: center;"> 주방 사진</p>
					       	<img class="mainimg1" alt="" id="mainimg1">
					       </div>
					    </div>
					    <div>
					          <input type="file" style="display: none;" name="upload" class="upload1">
					    </div>
            		</td>
            		<td>
            			<div>
					       <div class="imagePreView">
					       	<p style="position: relative;text-align: center;"> 화장실 사진</p>
					       	<img class="mainimg2" alt="" id="mainimg2">
					       </div>
					    </div>
					    <div>
					          <input type="file" style="display: none;" name="upload" class="upload2">
					    </div>
            		</td>
            		<td>
            			<div>
					       <div class="imagePreView">
					       	<p style="position: relative;text-align: center;"> 기타 사진</p>
					       	<img class="mainimg3" alt="" id="mainimg3">
					       </div>
					    </div>
					    <div>
					          <input type="file" style="display: none;" name="upload" class="upload3">
					    </div>
            		</td>
            	</c:if>
            	</tr>
            	
            	</table>
            	
				  
            	
            	</div>
            
            
			</div>
		</div>
	
</div>







<!-- 버튼 부분 -->
<div style="width: 1000px; margin: 10px auto; padding-top: 10px; padding-bottom: 50px;">

	<table style="width: 100%;">
	<tr>
		<c:if test="${mode=='roomUpdate'}">
			<input type="hidden" name="num" value="${dto.num}">
			<input type="hidden" name="page" value="${page}">
		</c:if>
		<td align="center"><button class="roomCreatedbtn" type="button" onclick="roomOk();">${mode=='roomUpdate'?'수정완료':'등록하기'}</button> </td>
		<td align="center"><button class="roomCreatedbtn" type="reset">다시 입력</button> </td>
		<td align="center"><button class="roomCreatedbtn" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/room/roomlist';">${mode=='roomUpdate'?'수정취소':'등록취소'}</button> </td>
	</tr>
	</table>

</div>

</form>
</div>




<hr>




<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            }
        }).open();
    }
</script>



