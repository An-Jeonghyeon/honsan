<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adm/health/created.css" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">

<script type="text/javascript">
function sendOk() {
	 var f = document.challengeForm;

		var str = f.name.value;
	    if(!str) {
	        alert("챌린지명을 입력하세요.");
	        f.name.focus();
	        return;
	    }
		var str = f.subName.value;
	    if(!str) {
	        alert("간단설명을 입력하세요.");
	        f.subName.focus();
	        return;
	    }
		var str = f.content.value;
	    if(!str) {
	        alert("상세설명을 입력하세요.");
	        f.content.focus();
	        return;
	    }
		var str = f.challengePeriod.value;
	    if(!str) {
	        alert("챌린지 기간을 입력하세요.");
	        f.challengePeriod.focus();
	        return;
	    }
	    
	    var obj;
	    var b=true;
	    $(".ch_content_more input[name=startDates]").each(function(){
	    	if(! $(this).val()) {
	    		obj = $(this);
	    		b=false;
	    		return false;
	    	}
	    });
	    if(! b) {
	    	 alert("시작일을 입력하세요.");
	    	 obj.focus();
	    	 return;
	    }

	    var b=true;
	    $(".ch_content_more input[name=endDates]").each(function(){
	    	if(! $(this).val()) {
	    		obj = $(this);
	    		b=false;
	    		return false;
	    	}
	    });
	    if(! b) {
	    	 alert("마지막일을 입력하세요.");
	    	 obj.focus();
	    	 return;
	    }
	    
	    var b=true;
	    $(".ch_content_more input[name=exContents]").each(function(){
	    	if(! $(this).val()) {
	    		obj = $(this);
	    		b=false;
	    		return false;
	    	}
	    });
	    if(! b) {
	    	 alert("상세내용을 입력하세요.");
	    	 obj.focus();
	    	 return;
	    }	

		f.action="${pageContext.request.contextPath}/adm/health/${mode}";

		f.submit();
}
</script>

<script type="text/javascript">
//추가버튼
$(function(){
	$(".plusbtn").click(function(){
		
		$check = $(this).closest(".morebody")
	    if($check.find(".start").val()=="") {
	    	alert("시작일을 입력해주세요");
	    	$check.find(".start").focus();
	        return false;
	    }
		
	    if($check.find(".end").val()=="") {
	    	alert("종료일을 입력해주세요");
	    	$check.find(".end").focus();
	        return false;
	    }
		
	    if($check.find(".excontent").val()=="") {
	    	alert("하루운동 상세를 입력해주세요");
	    	$check.find(".excontent").focus();
	        return false;
	    }
		
	    $table = $(this).closest(".morebody");

	    
	    
		var plus = $table.clone(true);
 		$table.find(".start").val("");
		$table.find(".end").val("");
		$table.find(".excontent").val(""); 
		//data-count 변경
		var count = $(this).data('addcount');
// 		console.log(count);
		
		count = count+1;
// 		console.log(count);
		
		$(this).data('addcount', count);
// 		var count1 = $(this).data('addcount');
// 		console.log(count1);
		
		
//		$(".ch_content_more").append(plus);

//  		plus .prependTo('.moreTable');
 		$(this).closest('.morebody').before(plus);
	});
});

//삭제버튼
$(function(){
	$(".deletebtn").click(function(){
		
		var $table = $(this).closest(".morebody") 
		var count = $table.find(".plusbtn").data('addcount');
//		console.log(count);
		
//		console.log($table.index());

		//제일 첫번째 tbody일 경우 삭제불가
		if($table.index()===0) { 
			alert("최소 1개의 상세정보를 입력해주세요.");
			return false;
		}
		$(this).closest(".morebody").remove();
		
	});
});

</script>

<div id="wrapper">
	<div id="page-wrapper">
	  	
	  	<div class="header"> 
           <h2 class="page-header jyheader">
               	[오늘운동 챌린지] 
               	<c:if test="${mode=='created'}">등록</c:if>
               	<c:if test="${mode=='update'}">수정</c:if>
           </h2>
   		</div>
   		
		<!-- 전체 게시판 크기  -->
        <div id="page-inner"> 
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
<!--                     <div class="card"> -->
                    
                        <form method="post" name="challengeForm" enctype="multipart/form-data">
					        <div class="challengeCreate">

					            <div class="ch_content">
					                <!-- 기본정보 -->
					                <div class="ch_content_basic">
					                    <div class="basic_title">  기본정보</div>
					                    <table border="1" class="ch_table">
					                        <tr>
					                            <th scope="row">챌린지명</th>
					                            <td class="chname"><input type="text" class="form-control" name="name" value="${dto.name}"></td>
					                        </tr>
					                        <tr>
					                            <th scope="row">간단설명</th>
					                            <td class="chsub"><input type="text" name="subName" value="${dto.subName}"></td>
					                        </tr>
					                        <tr>
					                            <th scope="row">상세설명</th>
					                            <td class="chdet"><textarea name="content" rows="15" style="margin: 0px; width: 770px; height: 207px;">${dto.content}</textarea></td>
					                        </tr>
					                        <tr>
					                            <th scope="row">챌린지 기간</th>
					                            <td class="chdate"><input type="text" name="challengePeriod" value="${dto.challengePeriod}"> 일</td>
					                        </tr>
					                        <tr>
					                            <th scope="row">총 칼로리</th>
					                            <td class="chkcal"><input type="text" name="calorie" value="${dto.calorie}"> kcal</td>
					                        </tr>
					                        <tr>
					                            <th scope="row">대표이미지</th>
					                            <td>
					                            	<input type="file" name="upload" accept="image/*">
					                            	<c:if test="${mode=='update'}">
					                            		<input type="hidden" name="challengeFilename" value="${dto.challengeFilename}">
					                            		${dto.challengeFilename}
					                            	</c:if>
					                            </td>
					                        </tr>
					                        <tr>
				                           		<th scope="row">동영상 주소(유튜브)</th>
					                            <td class="cvideo"><input type="text" name="video" value="${dto.video}">
					                            <small>ex) www.youtube.com/embed/IfJcq4LDXKE</small>
					                            </td>
					                        </tr>
					                    </table>
					                </div>
					                
					                <!-- 상세정보 -->
					                <!-- 추가될것 -->
					                
					                <div class="ch_content_more">
					                    <div class="more_title">상세정보</div>
					                    <div class="more-notice"><b>작성시 유의사항</b>  
					                    	<br> - 시작일과 종료일 동일시 하루로 계산됩니다.
					                    	<br> - 일차 순서대로 작성하여 주십시오.
					                    	<br> - 두개이상의 상세기간의 날짜가 겹칠 경우, 해당일차가 두번 생성되니 유의하여 작성하여주십시오  </div>
<!-- 					                    <div class="plustable"> -->
<!-- 					                   		여기 추가될것.. -->
<!-- 					                    </div> -->
					                    <table border="1" class="ch_table moreTable">
					                    	<c:if test="${mode=='created'}">
						                    	<tbody class="morebody">
						                        <tr>
						                            <th scope="row">상세기간</th>
						                            <td class="chperiod">
						                                <input type="text" name="startDates" class="start"> 일차  ~
						                                <input type="text" name="endDates" class="end"> 일차
						                                <button type="button" class="deletebtn">X</button>
						                            </td>
						                        </tr>
						                        <tr>
						                            <th scope="row">하루 운동상세</th>
						                            <td class="chsub">
						                                <input type="text" name="exContents" class="excontent">
						                                <button type="button" class="plusbtn" data-addcount="1">추가</button>
						                            </td>
						                        </tr>
						                    	</tbody>
					                    	</c:if>
					                    	
					                    	<c:if test="${mode=='update'}">
											   <c:forEach var="vo" items="${listChallenge2}">
							                    	<tbody class="morebody" id="f${vo.exNum}"> 
							                        <tr>
							                            <th scope="row">상세기간</th>
							                            <td class="chperiod">
							                                <input type="text" name="startDates" class="start" value="${vo.startDate}"> 일차  ~
							                                <input type="text" name="endDates" class="end" value="${vo.endDate}"> 일차
						                     	           <button type="button" class="deletebtn">X</button>
							                                <input type="hidden" name="exNum" value="${dto.exNum}">
							                                
							                            </td>
							                        </tr>
							                        <tr>
							                            <th scope="row">하루 운동상세</th>
							                            <td class="chsub">
							                                <input type="text" name="exContents" class="excontent" value="${vo.exContent}">
							                                <button type="button" class="plusbtn">추가</button>
							                            </td>
							                        </tr>
							                    	</tbody>
											   </c:forEach>
											</c:if>
					                    </table>
					                </div>

								
					       		</div>
						
						        <div class="h-buttonBoxBody">
						            <button type="button" id="CencelSubmit" onclick="javascript:location.href='${pageContext.request.contextPath}/adm/health/list';">${mode=='update'?'수정취소':'등록취소'}</button>
						            <button type="button" id="writeSubmit" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
           				         <c:if test="${mode=='update'}">
			         	 			<input type="hidden" name="num" value="${dto.num}">
			        	 			<input type="hidden" name="page" value="${page}">
			        			</c:if>
						        </div>
						        
						     </div>
						 </form>
                    
                    </div>
                </div>
<!--         	</div> -->
		</div>  <!-- /. page-inner  -->
    </div> <!-- /.page-wrapper -->
</div> <!--wrapper  -->
