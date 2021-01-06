<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>

.listpageCard{
	background: #337ab7;
    height: 36px;
    border-radius: 4px;
    color: white;
    text-align: center;
    line-height: 2.5;
    box-shadow: 1px 1px 1px grey;
}
</style>
<script>
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



// 댓글 리스트 보이기
function listPage() {
	location.href="${pageContext.request.contextPath}/adm/memberManage/memberMng";
}


$(function(){
	$("body").on("click", ".memberBlack", function(){
		if(! confirm("회원을 정지 하겠습니까 ? ")) {
		    return false;
		}
		var reason=$(this).parent().prev().find(".form-control").val();
		var memberIdx=$(this).attr("data-memberIdx");
		var page=$(this).attr("data-pageNo");
		
		var url="${pageContext.request.contextPath}/adm/memberManage/blackList";
		var query="memberIdx="+memberIdx+"&enabled="+0+"&reason="+reason;
		var fn = function(data){
			var state=data.state;
			console.log(state);
			if(state==="true") { // 성공하면 리스트 보이게 
				listPage();
			} else if(state==="false") { // 실패시 실패 안내 
				alert("수정 실패.");
			}
			
			
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});


$(function(){
	$("body").on("click", ".memberwhite", function(){
		if(! confirm("회원 정지를 해제 하겠습니까 ? ")) {
		    return false;
		}
		var memberIdx=$(this).attr("data-memberIdx");
		var page=$(this).attr("data-pageNo");
		
		var url="${pageContext.request.contextPath}/adm/memberManage/blackList";
		var query="memberIdx="+memberIdx+"&enabled="+1+"&reason="+"정지였던 기록이 있는 회원";
		var fn = function(data){
			var state=data.state;
			console.log(state);
			if(state==="true") { // 성공하면 리스트 보이게 
				listPage();
			} else if(state==="false") { // 실패시 실패 안내 
				alert("수정 실패.");
			}
			
			
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});


function listsearch(){
	var keyword = $(".keywordPointer").val();
	var query = "?page="+${page}+"&keyword="+keyword;
	location.href="${pageContext.request.contextPath}/adm/memberManage/memberMng"+query;
}

$(function(){
	$(".memberlistAll").click(function(){
		location.href="${pageContext.request.contextPath}/adm/memberManage/memberMng";
	});
});

$(function(){
	$(".memberBlackList").click(function(){
		var query = "?page=1&enabled=0";
		location.href="${pageContext.request.contextPath}/adm/memberManage/memberMng"+query;
	});
});

</script>

<div id="wrapper">
	<div id="page-wrapper">
	  	
	  	<div class="header"> 
           <h2 class="page-header jyheader">
               	회원 관리
           </h2>
           
           <!-- 각 게시판제목 아래 서브메뉴(ajax로 하면 될듯?)   -->
			<ol class="breadcrumb">
			  <li><a href="#">회원리스트</a></li>
			  <li class="active">회원관리</li>
			</ol> 
   		</div>
   		
		<!-- 전체 게시판 크기  -->
        <div id="page-inner"> 
            <div class="row">
                <div class="col-md-12 ">
                    <!-- Advanced Tables -->
<!--                     <div class="card"> -->
								<div class="col-md-12">
 	                    	        <div class="col-md-2 left">
 	                    	        	<p class="listpageCard">총 ${total_page} 개 [${page} 페이지 / ${total_page} 페이지]</p>
 	                    	        	
 	                    	        </div> 							
									<div class="col-md-4">
									</div>
									<div class="col-md-1">
										<button type="button" class="btn btn-warning memberlistAll" >List ALL</button>		  
									</div>
									<div class="col-md-1">
										<button type="button" class="btn btn-danger memberBlackList" >Black List</button>		  		
									</div>
									<div class="col-md-3 right">	
									 <div class="col-xs-10">
									 	<input type="text" class="form-control keywordPointer"  style="border-radius :4px; background-color: white;"
									 			name="keyword" placeholder="아이디를 검색.">
									 </div>								 
									  <div class="col-xs-1 right">
									    <button type="button" class="btn btn-primary" onclick="listsearch();">검색</button>
									  </div>
									</div> 
								</div>
                                <table class="table table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr class="warning">
                                            <th class="col-md-1 center">회원 번호</th>
                                            <th class="col-md-1 center">회원 아이디</th>
                                            <th class="col-md-2 center">회원 닉네임</th>
                                            <th class="col-md-1 center">가입 날자</th>
                                            <th class="col-md-2 center">정지 사유</th>
                                            <th class="col-md-1 center">정지 날자</th>
                                            <th class="col-md-2 center">구 분</th>
                                            <th class="col-md-2 center">정지 / 활성화 </th>
                                        </tr>
                                    </thead>
                                    <tbody>
	                                    <c:forEach var="dto" items="${list}">
	                                        <tr class="odd gradeX">
	                                            <td class="center">${dto.memberIdx}</td>
	                                            <td class="center">${dto.userId}</td>                                            
	                                            <td class="center">${dto.userName}</td>
	                                            <td class="center">${dto.created_date}</td>
	                                            <td class="center">${dto.reason}</td>
	                                            <td class="center">${dto.black_date}</td>
	                                            <td class="center">
													<select name="reason" class="form-control">
	                                            		<option value="">선택하세요</option>
	                                            		<option value="음란물 및 사행성 게시">음란물 및 사행성 게시</option>
	                                            		<option value="불법 프로그램  사용">불법 프로그램  사용</option>
	                                            		<option value="욕설 및  비하 발언">욕설 및  비하 발언</option>
	                                            		<option value="허위사실  유포 및  선동">허위사실  유포 및  선동</option>
	                                            		<option value="게시글 도배 ">게시글 도배</option>       		
	                                            	</select>     
	                                            </td>
		                                        <td class="center chListupanddel">
		                                          <button type="button" class="jbtn btn-xs btn-outline-dark memberBlack" 
		                                          				data-memberIdx="${dto.memberIdx}" data-pageNo="${page}" >회원 정지</button>
		                                          
		                                          <button type="button" class="jbtn btn-xs btn-outline-dark memberwhite" 
		                                          				data-memberIdx="${dto.memberIdx}" data-pageNo="${page}" >회원 활성</button>
		                                        </td>
	                                       	</tr>
										</c:forEach>
                                    </tbody>   
                                </table>
                                <table style="width: 100%; border-spacing: 0px;">
							         <tr height="35">
							            <td align="center">
							               ${dataCount==0?"등록된 게시물이 없습니다.":paging}
							            </td>
							         </tr>
						      </table>

<!--                     </div> -->
                    <!--End Advanced Tables -->
                </div>
            </div>    	
        	
		</div>  <!-- /. page-inner  -->
    </div> <!-- /.page-wrapper -->
</div> <!-- wrapper -->
