<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adm/health/list.css" type="text/css">

<script type="text/javascript">
function searchList() {
	var f=document.searchForm;
	f.submit();
}
	
function deleteChallenge(num) {
	var url="num="+num+"&page="+${page};
	var url2="${pageContext.request.contextPath}/adm/health/delete?"+url;
	
	if(confirm("게시물을 삭제하시겠습니까?")) {
		location.href=url2;
	}
	
}
function updateChallenge(num) {
	var url="num="+num+"&page="+${page};
	var url2="${pageContext.request.contextPath}/adm/health/update?"+url;
	
	location.href=url2;
}

</script>
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
                 			<form name="searchForm" action="${pageContext.request.contextPath}/adm/health/list" method="post">
                        	<div class="chlist_top">
	                        	<div class="chlist_search">
	                        		<select class="form-control searchSelect" name="condition">
			                           <option value="name" ${condition=="name"?"selected='selected'":""}>챌린지명</option>
			                           <option value="created" ${condition=="created"?"selected='selected'":""}>등록일</option>
	                        		</select>
	                        		<input type="text" class="form-control form-inline col-md-4 keywordPointer" name="keyword" value="${keyword}">
                    		       <button type="button" class="btn btn-default" onclick="searchList();">검색</button>
	                        	</div>
	                	        <div class="chList_createbtn">
	                				<button type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/adm/health/created';">챌린지 등록</button>
	            				</div>
                        	</div>
                        	</form>
       
                            <div class="table-responsive">
                     	        <div class="chList_total">총 ${dataCount}개 [${page}/${total_page}페이지]</div> 
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
                                    <c:forEach var="dto" items="${list}">
                                        <tr class="odd gradeX">
                                            <td class="center">${dto.listNum}</td>
                                            <td class="chsub"><a href="${pageContext.request.contextPath}/challenge/article?num=${dto.num}"><small>${dto.subName}</small> ${dto.name}</a></td>
                                            <td class="center">${dto.created}</td>
                                            <td class="center">${dto.playMember}</td>
                                            <td class="center chListupanddel">
<%--                                             	<button type="button" class="jbtn btn-xs btn btn-default" onclick="javascript:location.href='${pageContext.request.contextPath}/adm/health/update?num=${dto.num}&page=${page}';">수정</button> --%>
                                            	<button type="button" class="jbtn btn-xs btn btn-default" onclick="updateChallenge(${dto.num});">수정</button>
                                            	<button type="button" class="jbtn btn-xs btn btn-default" data-num="${dto.num}" onclick="deleteChallenge(${dto.num});">삭제</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div class="chList_paging">
                                	${dataCount==0?"등록된 게시물이 없습니다.":paging}
                                </div>
                                
	             				  <div class="healthadmin_search">
	                  				 <div class="col-md2">
	                   	   				 <button type="button" class="btn btn-default" onclick="javascript:location.href='${pageContext.request.contextPath}/adm/health/list';"><i class="fas fa-redo-alt"></i>&nbsp;새로고침</button>
	                   				</div>
	               				</div>
                            </div>
                            
                        </div>
<!--                     </div> -->
                    <!--End Advanced Tables -->
                </div>
            </div>    	
        	
		</div>  <!-- /. page-inner  -->
    </div> <!-- /.page-wrapper -->
</div> <!-- wrapper -->
