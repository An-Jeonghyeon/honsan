<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/health/challenge.css" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">
    
    
<script type="text/javascript">
function ajaxJSON(url, method, query, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:"json", //서버가 나한테 보내는 데이터타입
		success:function(data) {
			fn(data);  //성공하면 데이터 다시 비우는거
		},
		beforeSend:function(jqXHR) { //서버로 전송하기전에
			jqXHR.setRequestHeader("AJAX", true); //리퀘스트한테 헤더를 하나 추가(ajax라는 헤더를 내가 만든거) //ajax이면서 로그인이 안됐으면 403반환
		},
		error:function(jqXHR) {
			if(jqXHR.status===403) { //로그인이 안되어있으면
				login(); //로그인으로 다시 가기 
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

$(function() { 
	listPage(1);
});

function listPage(page) {
	var url = "${pageContext.request.contextPath}/challenge/listAjax";
	var query = "page="+page;
	
	var fn = function(data) {
		printChallenge(data);
	}
	
	ajaxJSON(url, "get", query, fn);  //ajax 계속 써야하니까 아예 만들어둔거
}


function printChallenge(data) {
	var dataCount = data.dataCount;
	var page = data.page;
	var totalPage = data.total_page;

	$("#bodyul").attr("page", page); //처음에 페이지랑 토탈을 가져와서 밑에 넣어줌
	$("#bodyul").attr("totalPage", totalPage);
	
	$("#morebtn").hide();
	
	var out="";
	if(dataCount==0) { //데이터가 없으면
		out+="<tr height='45' align='center'>";
		out+="    <td colspan='2'>등록된 게시물이 없습니다.</td>";
		out+="</tr>"
		$("#bodyul").html(out);
		return;
	}
	
	if(page==1) {
		$("#bodyul").empty(); //1페이지면 내용만 지운다
	}
	
	for(var idx=0; idx<data.list.length; idx++) { //데이터가 있으면 돌아서 데이터 출력
		var num=data.list[idx].num;
		var name =data.list[idx].name;
		var subName =data.list[idx].subName;
		var challengeFilename=data.list[idx].challengeFilename;
		var playMember=data.list[idx].playMember;
		var articleUrl = data.articleUrl;
// 		console.log(articleUrl);
			
        out += "<li class='bodyli'>";
        out += " <div class='bodybox'>";
        out += "  <div class='imagech' onclick='article("+num+");'>";
        out += "    <div class='text1'>";
        out += "    	<p>"+subName+"</p>";
        out += "    	<h2>"+name+"</h2>";
        out += "    </div>";
        out += "     <img class='image1' src='${pageContext.request.contextPath}/uploads/challenge/"+challengeFilename+"'  height='130px' width='570px'>";
        out += "  </div>";
        out += "  <div class='textch'>진행중인 회원 "+playMember+"명</div>";
        out += " </div>";
        out += "</li>";
        
        
        console.log(challengeFilename);
	}

	$("#bodyul").append(out); //내용을 계속 추가해야하니까 append
// 	$bodyul.fadeIn(2000);
	
	if(page >= totalPage) { //더보기 나타나게 하기 
		$("#morebtn").hide();
	} else {
		$("#morebtn").show();
	}
}


$(function() {
	$(".hplus").click(function(){
		var page=$("#bodyul").attr("page"); //시작은 둘다 0 
		var totalPage=$("#bodyul").attr("totalPage");
		
		if(page<totalPage) { 
			page++; 
			listPage(page);
		}
	});
});

function article(num) {
	var url = "${pageContext.request.contextPath}/challenge/article?num=" + num;
	location.href = url;
}

</script>    

<section>
	<div class="challenge-content">
	    <div class="challenge-top">
	     </div>
	</div>
	
	<div class="challengebody">
	    <ul class="bodyul" id="bodyul" data-page ="0" data-totalPage="0">
<!-- 	        <li class="bodyli"> -->
<!-- 	            <div class="bodybox"> -->
<!-- 	                <div class="imagech"> -->
<!-- 	                    <div class="text1"> -->
<!-- 	                        <p>코어근육을 발달시키는</p> -->
<!-- 	                        <h2>스쿼트 30일 챌린지</h2> -->
<!-- 	                    </div> -->
<%-- 	                    <img class="image1" src="${pageContext.request.contextPath}/resources/images/health/squatimage.png"  height="130px" width="570px"> --%>
	                    
<!-- 	                </div> -->
<!-- 	                <div class="textch">진행중인 회원 3명</div> -->
<!-- 	            </div> -->
<!-- 	        </li> -->
	    </ul>
	
	    <button class="morebtn" id="morebtn">
	        <span class="hcircle">
	            <span class="iconplus"></span>
	        </span>
	        <span class="hplus">더보기</span>
	    </button>
	
	</div>
</section>