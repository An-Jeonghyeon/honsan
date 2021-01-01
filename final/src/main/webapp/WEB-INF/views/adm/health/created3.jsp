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
					                    </table>
					                </div>
					                
					                <!-- 상세정보 -->
					                <div class="ch_content_more">
					                    <div class="more_title">  상세정보</div>
					                    <table border="1" class="ch_table">
					                        <tr>
					                            <th scope="row">상세기간</th>
					                            <td class="chperiod">
					                                <input type="text" name="startDate"> 일차  ~
					                                <input type="text" name="endDate"> 일차
					                            </td>
					                        </tr>
					                        <tr>
					                            <th scope="row">하루 운동상세</th>
					                            <td class="chsub">
					                                <input type="text" name="dContent">
					                                <br><small>* 여러항목 등록시 '/' 로 구분작성</small>
					                            </td>
					                        </tr>
					                    </table>
					                    <div class="morebtn">
					                        <button type="button" id="plusbtn">추가</button>
					                    </div>
					                </div>

									<!-- 추가누르면 생기는 리스트 -->
					                <div class="moreplus">
					                    <table class="moreplustable">
					                        <tr>
					                            <th class="plusnum center">번호</th>
					                            <th class="plusdate center">기간</th>
					                            <th class="plustotal center">총 일수</th>
					                            <th class="pluscontent center">내용</th>
					                        </tr>
					                        <tr>
					                            <td class="center">1</td>
					                            <td class="center">1 ~ 3 일차</td>
					                            <td class="center">3일 </td>
					                            <td>
					                                <div class="pluscontent_">
					                                  	  스쿼트 20회
					                                </div>
					                                <div class="pluscontent_btn">
						                                <button type="button" class="plusdelete">X</button>
					                                </div>
					                            </td>
					                        </tr>
					                    </table>
					                </div>
					       		</div>
						
						        <div class="h-buttonBoxBody">
						            <button type="button" id="CencelSubmit" onclick="javascript:location.href='${pageContext.request.contextPath}/adm/health/list';">${mode=='update'?'수정취소':'등록취소'}</button>
						            <button type="reset" id="resetSubmit">다시입력</button>
						            <button type="submit" id="writeSubmit" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
						        </div>
						     </div>
						 </form>
                    
                    </div>
                </div>
<!--         	</div> -->
		</div>  <!-- /. page-inner  -->
    </div> <!-- /.page-wrapper -->
</div> <!--wrapper  -->
