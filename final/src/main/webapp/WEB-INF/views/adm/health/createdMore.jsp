<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adm/health/created.css" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">

<script type="text/javascript">
function sendOk() {
	
}

</script>

<script type="text/javascript">
function ajaxJSON(url, method, query, fn) { 
	$.ajax({
		type:method
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			fn(data);
		}
		,beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status===403) {
	    		login();
	    		return false;
	    	}
	    	
	    	console.log(jqXHR.responseText);
	    }
	});
}

$(function(){
	$("#plusbtn").click(function(){
		var num="${dto.num}";
		var $div = $(this).closest(".ch_content_more");
		var startDate=$div.find("#startDate").val();
		var endDate=$div.find("#endDate").val();
		var dContent=$div.find("#dContent").val();
		
		console.log(startDate);
		console.log(endDate);
		console.log(dContent);
		
		if(! startDate) {
			$div.find("#startDate").focus();
			return false;
		}
		if(! endDate) {
			$div.find("#endDate").focus();
			return false;
		}
		if(! dContent) {
			$div.find("#dContent").focus();
			return false;
		}
		dContent = encodeURIComponent(dContent);
		
		var url="${pageContext.request.contextPath}/adm/health/insertMore";
		var query="num="+num+"&startDate="+startDate+"&endDate="+endDate+"&dContent="+dContent;
		
		//성공할 경우
		var fn = function(data){
			$div.find("#startDate").val("");
			$div.find("#endDate").val("");
			$div.find("#dContent").val("");
			
			var state= data.state;
			if(state==="true") {
				alert("등록 성공");				
			} else if(state==="false") {
				alert("등록 실패");				
			}
		}; 
		
		ajaxJSON(url, "post", query, fn);

	});
});
</script>

<div id="wrapper">
	<div id="page-wrapper">
	  	
	  	<div class="header"> 
           <h2 class="page-header jyheader">
               	[오늘운동 챌린지] 등록
           </h2>
   		</div>
   		
		<!-- 전체 게시판 크기  -->
        <div id="page-inner"> 
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
<!--                     <div class="card"> -->
                    
                        <form method="post" name="challengeMore" enctype="multipart/form-data">
					        <div class="challengeCreate">

					            <div class="ch_content">
					                <!-- 상세정보 -->
					                <div class="ch_content_more">
					                    <div class="more_title">  상세정보</div>
					                    <table border="1" class="ch_table">
					                        <tr>
					                            <th scope="row">상세기간</th>
					                            <td class="chperiod">
					                                <input type="text" name="startDate" id="startDate"> 일차  ~
					                                <input type="text" name="endDate" id="endDate"> 일차
					                            </td>
					                        </tr>
					                        <tr>
					                            <th scope="row">하루 운동상세</th>
					                            <td class="chsub">
					                                <input type="text" name="dContent" id="dContent">
					                                <br><small>* 여러항목 등록시 '/' 로 구분작성</small>
					                            </td>
					                        </tr>
					                    </table>
					                    <div class="morebtn">
					                        <button type="button" id="plusbtn" data-exNum="">추가</button>
					                    </div>
					                </div>
					       		 </div>
						
						        <div class="h-buttonBoxBody">
						            <button type="button" id="CencelSubmit" onclick="javascript:location.href='${pageContext.request.contextPath}/adm/health/created';">이전</button>
						            <button type="reset" id="resetSubmit">다시입력</button>
						            <button type="submit" id="writeSubmit" onclick="sendOk();">등록하기</button>
						        </div>
						     </div>
						 </form>
                    
                    </div>
                </div>
<!--         	</div> -->
		</div>  <!-- /. page-inner  -->
    </div> <!-- /.page-wrapper -->
</div> <!--wrapper  -->
