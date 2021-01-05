<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/health/challengeArticle.css" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">
    
    
<script type="text/javascript">
function goChallenge() {
	var query ="num=${dto.num}";
	var url="${pageContext.request.contextPath}/challenge/userInsert?"+query;
	
	if(confirm("챌린지에 도전하시겠습니까?")) {
		location.href=url;
	}
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

//이미 도전중인거는 도전 안뜨게
$(function(){
	var mode = "${mode}";
	if(mode=="articleNo"){
		alert("이미 도전중인 챌린지입니다.");
		//여기서 이제 그 내가 도전하는 리스트로 .....보내기...
	}
});

//도전 누르면
$(function(){
	$(".okbtn").click(function() {
		if(! confirm("오늘운동을 완료했나요?")) {
			return;
		}
		var num = ${dto.num};
		
		//며칠꺼인지 알아내는 방법 2(아래  day 값 가져오기)
		var day = $(this).attr("data-day");
// 		console.log("day : "+day); //이건 제대로 나옴
		
		var precompletion = $(this).closest("ul").attr("data-completion");
// 		console.log("data-에 있는 precompletion : "+precompletion); //0으로 처음엔 잘나옴
		
		var comple="";
		if(precompletion=='0') {
			comple = day //이것도 잘됨
		} else {
				comple = precompletion+","+day
		}
// 		console.log("comple(,로 합친거) : "+comple);
		
		$(this).closest("ul").attr("data-completion", comple);
		
		var url = "${pageContext.request.contextPath}/challenge/challengeOk";
		var query = "num="+num+"&completion="+comple;

		var $div = $(this).closest(".chalicontent");
		var $this = $(this);
		var fn = function(data){
			//성공하면 completion을 밑에 값에 넣기
			var state=data.state;
			var completion3= data.completion3;
			console.log(completion3);

			if(state==="true") {
// 				alert("성공..");	
				$(this).closest("ul").attr("data-completion", data.completion3);
				$div.css("background", "#dbdbdb")
				$this.prop("disabled", true)
				
			} else if(state==="false") {
				alert("왜실패..");	
			}
		};
		ajaxJSON(url, "post", query, fn);
	});
});

// $(function(){
// 	var mode = "${mode}";
// 	if(mode=="articleGo"){
// 		var listDay = $(".okbtn").attr("data-day");
// // 		if("${ch!='0'}"){
// // 			var checkDay = ${comList};
// // 		}
// 		var list = new Array();
// 		list = ${comList};
		
		
// 		$(".chaul li").each(function(index1, item1){
// 	 		var listDay = item1.find(".okbtn").attr("data-day"); //for문 돌린 날짜와
	 		
// 			$div = $(this).find(".chalicontent");
// 			$btn = $(this).find(".okbtn");
	 	
// 			checkDay.each(function(index2, item2){
// 				if(item1==item2){
// 					$div.css("background", "#dbdbdb")
// 					$btn.prop("disabled", true)
// 				}
// 			});	
	 	
// 		});
// 	}
// });
</script>

<section>
	 <div class= "challengeArticle"> 
        <div class="articleHeader">
            <div class="headertitle">
                <span class="hollotext">Hollo</span>
                <span class="haru">하루운동 챌린지</span>
            </div>
            <div class="hrr"></div>
            <div class="charsubject">
                <div class="subnamediv"><span>${dto.subName}</span></div>
                <div class="namediv">
                    <span>${dto.name}</span>
                    <div class="mitgul"></div>
                </div>
            </div>
        </div>
        <div class="articleBody">
            <div class="videodiv">
                <div class="videoyou">
					<object type="text/html" width="100%" height="600" data="//${dto.video}" allowFullScreen></object>
                </div>
            </div>
            <div class="intro">
                    <div class="introtext">
                        <img src="${pageContext.request.contextPath}/resources/images/health/notice.png"> <span>챌린지 소개</span>
                    </div>
                    <div class="introbox">
                        <p class="introboxtext">${dto.content}</p>
                    </div>
            </div>

        </div>
        <div class="articleChallenge">
            <div class="dalbox">
                <ul class="chaul" data-completion="${completion1}">
                	<c:forEach var="dto2" items="${contentList}" >
	                    <li class="chali">
	                        <div class="chaliday"><span>DAY ${dto2.dDate}</span></div>
	                        <div class="chalicontent">
	                          	  <p>${dto2.exContent}</p>
	                          	  <c:if test="${mode=='articleGo'}">
                        			<button type="button" class="okbtn" data-day="${dto2.dDate}">완료</button>
								</c:if>  
	                        </div>
	                    </li>
	                </c:forEach>
<%--                 	<c:forEach var="vo" items="${contentList}" > --%>
<%-- 		                <c:forEach var="i" begin="1" end="${dto.challengePeriod}"> --%>
<!-- 	                    <li class="chali"> -->
<%-- 	                        <div class="chaliday"><span>DAY ${i}</span></div> --%>
<!-- 	                        <div class="chalicontent"> -->
<%-- 	                          	  <p>${vo.name}</p> --%>
<!-- 	                        </div> -->
<!-- 	                    </li> -->
<%-- 	                	</c:forEach> --%>
<%-- 	                </c:forEach> --%>
                </ul>
            </div>
        </div>
        <div class="gobut">
            <c:if test="${mode=='article'}">
	            <div class="gobutton">
    	            <button type="button" class="gobtngo" id="gobtn" onclick="goChallenge();"> 도 전 하 기 </button>
        	    </div>
                </c:if>
            	    <button class="h-listButton" onclick="javascript:location.href='${pageContext.request.contextPath}/challenge/list?${query}';">목록</button>
                <c:if test="${sessionScope.member.userId =='admin'}">
	                <button class="h-adminButton" onclick="javascript:location.href='${pageContext.request.contextPath}/adm/health/list';">관리자 리스트</button>
                </c:if>
                <c:if test="${mode=='articleGo' || mode=='articleNo'}">
	                <button class="h-articlelistButton" onclick="javascript:location.href='${pageContext.request.contextPath}/';">나의 챌린지리스트</button>
                </c:if>
        </div>

    </div>
</section>