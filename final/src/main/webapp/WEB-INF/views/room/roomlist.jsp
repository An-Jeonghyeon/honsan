<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/room/room.css"
	type="text/css">

<script type="text/javascript">
	function bgLabel(ob, id) {
		
		if (!ob.value && "${keyword}"!="") {
			document.getElementById(id).style.display = "";
		} else {
			document.getElementById(id).style.display = "none";
		}
	}

	function searchList() {
		var f = document.searchForm;
		
		
		f.action="${pageContext.request.contextPath}/room/roomlist";
		f.submit();
	}

	function article(num) {
		var url = "${pageContext.request.contextPath}/room/roomArticle?num=" + num;
		location.href = url;
	}
	

	
</script>
<script type="text/javascript">


function ajaxJSON(url, method, query,fn){
	$.ajax({
		type:method, //post 넘어옴
		url:url, //서버에서 넘겨줌
		data:query,
		dataType:"json",
		success:function(data){
			fn(data); //넘어온 함수 호출
		},
		beforeSend:function(jqXHR){ //서버 전송 전에, Request에 헤더를 추가, LoginCheckInterceptor.java 마지막에
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR){ //헤더 내용 등 전송하는 AJAX객체
			if(jqXHR.status===403){
				login();
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
	
}

$(function(){
	listPage(1);
});


function listPage(page){
	var url="${pageContext.request.contextPath}/room/roomlist1";
	var query="pageNo="+page;
	
	<c:if test="${not empty keyword || not empty roomtype}">
		query+= "&keyword=${keyword}";
	</c:if>
	<c:if test="${not empty roomtype}">
	query+= "&roomtype=${roomtype}";
</c:if>
	
	var fn=function(data){
		printGuest(data);
	}
	
	ajaxJSON(url,"get", query, fn);
}

function printGuest(data) {
	var dataCount = data.dataCount;
	var page = data.pageNo;
	var totalPage = data.total_page;
	var paging = data.paging;
	
	$("#listGuestBody").attr("pageNo", page);
	$("#listGuestBody").attr("totalPage", totalPage);
	
	$("#listGuestFooter").hide();
	
	var out="";
	if(dataCount==0) {
		out+="<tr align='center'>";
		out+="    <td colspan='4'>등록된 게시물이 없습니다.</td>";
		out+="</tr>"
		$("#listGuestBody").html(out);
		return;
	}
	
	if(page==1){
		$("#listGuestBody").empty(); //기존의 내용을 비움
	}
	
	for(var idx=0; idx<data.list.length; idx++) {
		var num=data.list[idx].num;
		var mainimg=data.list[idx].mainimg;
		var subject=data.list[idx].subject;
		var dealtype=data.list[idx].dealtype;
		var depo=data.list[idx].depo;
		var mrent=data.list[idx].mrent;
		var m2=data.list[idx].m2;
		var pyeoug=data.list[idx].pyeoug;
		
		if (idx==0) {
			out += " <tr align='center'>";
		}
		if (idx!=0 && idx%4 == 0) {
	 		out += "</tr><tr>";
		}
	 	
	 	out += " <td class='listTd'>";
	 		out += "<div class='imgLayout' onclick='article("+num+");' style='margin: 10px;'>";
	 			out += "<div class='img_box'style='background: url(${pageContext.request.contextPath}/uploads/room/"+mainimg+");";
	 				out += " background-position: center;background-size:cover;background-position:center;height: 200px; border-radius: 5px; border:1px solid silver; text-overflow: ellipsis;'></div>";
	 				out += "<br><p class='title-style'>"+subject+"<p>";
	 				out += "<div class='mainexplain'>";
	 				out += "<p>" + dealtype +" / " + depo + " / "+ mrent +"</p>";
	 				out += "</div>";
	 				out += "<div class='mainexplain'>";
	 				out += "<p>" + m2 +" m<sup>2</sup>  "+ pyeoug +" 평</p>";
	 				out += "</div>";
	 			out += "</div>";
	 		out += "</td>";
	
	}
		
	var n=data.list.length;
	if(n>0 && n%4!=0){
		for(var i= n%4+1 ; i<=4; i++){
			out += "<td width='210'>";
			out += "<div class='imgLayout' style='cursor: default;'>&nbsp;</div>";
			out += "</td>";
		}
	}
	if(n!=0){
		out += "</tr>";
	}
	
	   $("#listGuestBody").append(out);

	   if (page < totalPage) {
		      $("#listGuestFooter").show();      
		   }
	   
	   
}

$(function(){
	$(".guest-more").click(function(){
		var page=$("#listGuestBody").attr("pageNo");
		var totalPage=$("#listGuestBody").attr("totalPage");
		
		if(page<totalPage){
			page++;
			listPage(page);
		}
	});
});



</script>


	<div class="body-container">
	<hr>
	
	<div class="banner">
		
	
		<button type="button" class="createdbtn"
		onclick="javascript:location.href='${pageContext.request.contextPath}/room/roomCreated';">방	올리기</button>
	
	
	</div>
	
	<div style="position: sticky; top: 0;">
	<!-- 검색 부분 -->
		<form name="searchForm"
			method="post">
			<div class="searchlist">
				<table style="width:1000px; margin: 15px auto; border-spacing: 0px;">
					<tr height="60">
						<td align="center" style="padding: 15px 0 20px 0;"><label for="town" id="lblTown" class="lbl"><i class="fas fa-search" style="color: gray;"></i>동네 이름
								ex)관악구</label> <input type="text" name="keyword" id="town" value="${keyword }"
							class="searchTF" maxlength="20" tabindex="2"
							onfocus="document.getElementById('lblTown').style.display='none';"
							onblur="bgLabel(this, 'lblTown');">
							<button type="button" class="searchbtn" onclick="searchList();">검색</button>
						</td>
					</tr>
					<tr>
						<td align="center" style="searchcheckbox">
							<input type="checkbox" class="checkbox" name="roomtype" value="오픈형 원룸 (방1)" ${fn:contains(roomtype, "오픈형 원룸 (방1)") ? "checked='checked'":""}>&nbsp;원룸 &nbsp;&nbsp;
							<input type="checkbox" class="checkbox" name="roomtype" value="분리형 원룸 (방1, 거실1)" ${fn:contains(roomtype, "분리형 원룸 (방1, 거실1)") ? "checked='checked'":""}>&nbsp;1.5룸 &nbsp;&nbsp;
							<input type="checkbox" class="checkbox" name="roomtype" value="투룸 (방2, 거실1)" ${fn:contains(roomtype, "투룸 (방2, 거실1)") ? "checked='checked'":""}>&nbsp;투룸 &nbsp;&nbsp;
							<input type="checkbox" class="checkbox" name="roomtype" value="쓰리룸+" ${fn:contains(roomtype, "쓰리룸+") ? "checked='checked'":""}>&nbsp;쓰리룸 &nbsp;&nbsp;
							<input type="checkbox" class="checkbox" name="roomtype" value="복층형 원룸" ${fn:contains(roomtype, "복층형 원룸") ? "checked='checked'":""}>&nbsp;복층&nbsp;&nbsp;
							<input type="checkbox" class="checkbox" name="roomtype" value="반지하" ${fn:contains(roomtype, "반지하") ? "checked='checked'":""}>&nbsp;반지하 &nbsp;&nbsp;
							<input type="checkbox"  class="checkbox" name="roomtype" value="옥탑방" ${fn:contains(roomtype, "옥탑방") ? "checked='checked'":""}>&nbsp;옥탑방&nbsp;&nbsp;
						</td>
					</tr>
					<tr>		
						<td align="right">
						<button type="button" class="redobtn"
						onclick="javascript:location.href='${pageContext.request.contextPath}/room/roomlist';"><i class="fas fa-redo-alt"></i>새로고침</button>
						</td>
					</tr>



				</table>
			</div>
		</form>

		<hr>
	
	</div>
	
	<div style="width: 1300px; margin: 0px auto;">
		
	



			<!-- 리스트 부분 -->
			<div class="roomlist">


<table style="width: 100%;">
					<thead>
           			<tr style="height: 50px;">
						<td align="right" colspan="4"> 
						<input type="hidden" value="${list}">
						<c:if test="${not empty keyword || not empty roomtype}">
						검색 결과 " ${keyword} &nbsp;&nbsp; ${roomtype} " : 
						</c:if>
						 ${dataCount}개(${pageNo}/${total_page} 페이지)</td>
					</tr>
           			</thead>
           			<tbody id="listGuestBody" data-pageNo="0" data-totalPage="0"></tbody>
           			
           			<tfoot id="listGuestFooter">
           				<tr height="50">
           					<td align="center" colspan="4" >
           						<div class="section">
								  <div class="section__item">
								    <a class="r-link text-flat text-flat_v10">
								      <span class="text-flat__label guest-more">게시글 더보기</span>
								    </a>
								  </div>
								</div>
           					</td>
           				</tr>
           			</tfoot>
</table>












		</div>
				
	</div>
	<hr>
</div>
