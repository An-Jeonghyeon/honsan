<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adm/health/list.css" type="text/css">

<div id="wrapper">
	<div id="page-wrapper">
	  	
	  	<div class="header"> 
           <h2 class="page-header jyheader">
               	[오늘운동 챌린지] 목록
           </h2>
           
   		</div>
   		
		<!-- 전체 게시판 크기  -->
        <div id="page-inner"> 
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
<!--                     <div class="card"> -->
                        <div class="card-content">
                	        <div class="chList_createbtn">
                				<button type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/adm/health/created';">챌린지 등록</button>
            				</div>
       
                            <div class="table-responsive">
                     	        <div class="chList_total">총 3개 [1페이지/3페이지]</div> 
                                <table class="table table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr class="warning">
                                            <th class="col-md-1 center">번호</th>
                                            <th class="col-md-5 center">챌린지명</th>
                                            <th class="col-md-2 center">등록일</th>
                                            <th class="col-md-2 center">진행중인 회원</th>
                                            <th class="col-md-2 center">수정/삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="odd gradeX">
                                            <td class="center">Trident</td>
                                            <td>Internet Explorer 4.0</td>
                                            <td class="center">Win 95+</td>
                                            <td class="center">4</td>
                                            <td class="center chListupanddel">
                                            	<button type="button" class="jbtn btn-xs btn-outline-dark">수정</button>
                                            	<button type="button" class="jbtn btn-xs btn-outline-dark">삭제</button>
                                            </td>
                                        </tr>
                                        <tr class="even gradeC">
                                            <td>Trident</td>
                                            <td>Internet Explorer 5.0</td>
                                            <td>Win 95+</td>
                                            <td class="center">5</td>
                                            <td class="center">C</td>
                                        </tr>
                                        <tr class="gradeC">
                                            <td>Misc</td>
                                            <td>IE Mobile</td>
                                            <td>Windows Mobile 6</td>
                                            <td class="center">-</td>
                                            <td class="center">C</td>
                                        </tr>
                                        <tr class="gradeC">
                                            <td>Misc</td>
                                            <td>PSP browser</td>
                                            <td>PSP</td>
                                            <td class="center">-</td>
                                            <td class="center">C</td>
                                        </tr>
                                        <tr class="gradeU">
                                            <td>Other browsers</td>
                                            <td>All others</td>
                                            <td>-</td>
                                            <td class="center">-</td>
                                            <td class="center">U</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="chList_paging"> 1 2 3</div>
                            </div>
                            
                        </div>
<!--                     </div> -->
                    <!--End Advanced Tables -->
                </div>
            </div>    	
        	
		</div>  <!-- /. page-inner  -->
    </div> <!-- /.page-wrapper -->
</div> <!-- wrapper -->
