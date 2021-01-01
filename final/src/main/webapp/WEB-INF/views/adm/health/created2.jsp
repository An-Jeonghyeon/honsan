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
	    
		f.action="${pageContext.request.contextPath}/adm/health/created";

		return true;

}

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
                    
                        <form method="post" name="challengeForm" enctype="multipart/form-data">
					        <div class="challengeCreate">

					            <div class="ch_content">
					                <!-- 기본정보 -->
					                <div class="ch_content_basic">
					                    <div class="basic_title">  기본정보</div>
					                    <table border="1" class="ch_table">
					                        <tr>
					                            <th scope="row">챌린지명</th>
					                            <td class="chname"><input type="text" class="form-control" name="name"></td>
					                        </tr>
					                        <tr>
					                            <th scope="row">간단설명</th>
					                            <td class="chsub"><input type="text" name="subName"></td>
					                        </tr>
					                        <tr>
					                            <th scope="row">상세설명</th>
					                            <td class="chdet"><textarea name="content" rows="15" style="margin: 0px; width: 770px; height: 207px;"></textarea></td>
					                        </tr>
					                        <tr>
					                            <th scope="row">챌린지 기간</th>
					                            <td class="chdate"><input type="text" name="challengePeriod"> 일</td>
					                        </tr>
					                        <tr>
					                            <th scope="row">총 칼로리</th>
					                            <td class="chkcal"><input type="text" name="calorie"> kcal</td>
					                        </tr>
					                        <tr>
					                            <th scope="row">대표이미지</th>
					                            <td><input type="file" name="upload"></td>
					                        </tr>
					                        <tr>
					                            <th scope="row">동영상 주소(유튜브 url)</th>
					                            <td class="cvideo"><input type="text" name="video"></td>
					                        </tr>
					                    </table>
					                </div>
						
							        <div class="h-buttonBoxBody">
							            <button type="button" id="CencelSubmit" onclick="javascript:location.href='${pageContext.request.contextPath}/adm/health/list';">${mode=='update'?'수정취소':'등록취소'}</button>
							            <button type="reset" id="resetSubmit">다시입력</button>
							            <button type="submit" id="writeSubmit" onclick="sendOk();">다음</button>
							        </div>
						   	 	</div>
						   	 </div>
						   	  
						 </form>
                    
                    </div>
                </div>
<!--         	</div>  -->
		</div>  <!-- /. page-inner  -->
    </div> <!-- /.page-wrapper -->
</div> <!--wrapper  -->
