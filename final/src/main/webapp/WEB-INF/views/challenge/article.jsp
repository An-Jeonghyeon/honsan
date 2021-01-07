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
		var $ul = $(this).closest(".chaul");
		var $btn = $ul.find(".okbtn");
		
		var fn = function(data){
			//성공하면 completion을 밑에 값에 넣기
			var state=data.state;
			var completion3= data.completion3;
			var totall=data.totalCount;
// 			console.log(completion3);

			if(state==="true") {
// 				alert("성공..");	
				$(this).closest("ul").attr("data-completion", data.completion3);
				$div.css("background", "#dbdbdb")
				$this.prop("disabled", true)
				
				//마지막일자일 경우
				if(day=="${endDate}") {
					$btn.prop("disabled", true);
					$(".mytotal").text(totall);
					updateEnabled(num);
// 					var url = "${pageContext.request.contextPath}/challenge/updateEnabled";
// 					var query = "num="+num;
// 					var fn = function(data){
// 						//모달
// 					}
// 					ajaxJSON(url, "post", query, fn);
				}
				
			} else if(state==="false") {
				alert("왜실패..");	
			}
		};
		ajaxJSON(url, "post", query, fn);
	});
});

$(function(){
	var mode = "${mode}";
	if(mode=="articleGo"){
		
		$(".okbtn").attr("disabled", false);
		
		console.log("${enabled}");
		if("${enabled}"==1){
			$(".okbtn").attr("disabled", true);
		} 
		
		var list = new Array();
		list = ${comList};
// 		console.log(list); //나옴
		
		$(".chaul li").each(function(index1, item1){
	 		var listDay = $(this).find(".okbtn").attr("data-day"); //for문 돌린 날짜와
// 			console.log(listDay);
	 		
			var $this=$(this);
// 			console.log($this);
			
			var $div = $this.find(".chalicontent");
			var $btn = $this.find(".okbtn");
// 			console.log($this.find(".chalicontent"));

	 		for(var i=0; i<list.length; i++) {
// 	 				console.log("listDay" +listDay);
// 	 				console.log(" [i]" +list[i]);
	 			if(listDay==list[i]) {
// 	 				console.log(" 이프절");
// 	 				$div.append("sdfdsf");
	 				$div.css("background", "#dbdbdb");
	 				$btn.prop("disabled", true);
	 			}
	 		}
	 		
		});
	}
});
//완료시
function updateEnabled(num) {
	$(function(){
		var url = "${pageContext.request.contextPath}/challenge/updateEnabled";
		var query = "num="+num;
		var fn = function(data){
			var state = data.state;
			if(state=="true") {
				
				$("#modal").trigger("click");
// 			alert("축하드립니다!\n 챌린지를 모두 완료하였습니다.\n나의 챌린지 결과 : 총 ${endDate} 중 ${totalCount}일 성공");
			} else if(state=="false") {
				alert("왜실패..");	
			}
		}
		ajaxJSON(url, "post", query, fn);

	});
}
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
                <input type="checkbox" id="modal" class="hidden">
			<div class="box_modal">
			  <label for="modal" class="closer">x</label>
			  <div class="text">
			    <h3>✔챌린지 완료</h3>
			    <p><b>축하드립니다! 챌린지를 모두 완료하였습니다.</b></p>
			    <p><b>나의 챌린지 결과 : 총  ${endDate}일 중 <span class="mytotal"></span>일 성공</b></p>
			  </div>
			</div>
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
	                <button class="h-articlelistButton" onclick="javascript:location.href='${pageContext.request.contextPath}/challenge/myChallenge';">나의 챌린지리스트</button>
                </c:if>
        </div>
        
        <!--모달  -->
<!--         <input type="checkbox" id="modal" class="hidden"> -->
<!-- 			<div class="box_modal"> -->
<!-- 			  <label for="modal" class="closer">x</label> -->
<!-- 			  <div class="text"> -->
<!-- 			    <h3>챌린지를 완료하였습니다!!</h3> -->
<!-- 			    <p>축하드립니다! 챌린지를 모두 완료하였습니다.</p> -->
<%-- 			    <p>나의 챌린지 결과 : 총 ${endDate} 중 ${totalCount}일 성공</p> --%>
<!-- 			  </div> -->
<!-- 			</div> -->

    </div>
    
    
</section>