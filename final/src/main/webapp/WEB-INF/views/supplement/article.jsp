<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/health/article.css" type="text/css">
<script type="text/javascript">
function deleteSupplement() {
	var url="num=${dto.num}&${query}";
	var url2="${pageContext.request.contextPath}/supplement/delete?"+url;
	
	if(confirm("게시물을 삭제하시겠습니까?")) {
		location.href=url2;
	}
	
}
</script>
<script type="text/javascript">
//json으로 전송하는 함수만들어둠
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
//html로 전송하는 ajax
function ajaxHTML(url, method, query, selector){
	$.ajax({
		type:method
		,url:url
		,data:query
		,success:function(data) {
			$(selector).html(data);
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


//게시글 추천 
$(function() {
	if($("#likebtn").attr("data-userLike")=="1") {
		$(".h-likecircle").css("background", "#f3c04ac7")	
	}
	$("#likebtn").click(function(){
		var url="${pageContext.request.contextPath}/supplement/insertSupplementLike";
		var num ="${dto.num}";
		var query = "num="+num;
		
		var fn = function(data){
			var state = data.state;
			if(state==="true") {
				var count = data.supplementLikeCount;
				$("#slikeCount").text(count);
				$(".h-likecircle").css("background", "#f3c04ac7")
			} else if(state==="false") {
				var count = data.supplementLikeCount;
				$("#slikeCount").text(count);
				$(".h-likecircle").css("background", "#dbdbdb")
			}
		};
		
		ajaxJSON(url, "post", query, fn)
		
	});
});

//---댓글
//댓글 페이지
$(function(){
	listPage(1);
});

function listPage(page){
	var url = "${pageContext.request.contextPath}/supplement/listReply";
	var query = "num=${dto.num}&pageNo="+page;
	var selector = "#hreplyList2";

	ajaxHTML(url, "get", query, selector);
};

//댓글등록
$(function(){
	$("#hReplybtn").click(function(){
		var num="${dto.num}";
		var $div = $(this).closest("#hreplycontent");
		var content = $div.find("textarea").val().trim();
		//console.log(content);
		
		if(! content) {
			$div.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		var url="${pageContext.request.contextPath}/supplement/insertReply";
		var query = "num="+num+"&content="+content+"&answer=0";
		
		//성공시
		var fn = function(data){
			$div.find("textarea").val("");
			
			var state= data.state;
			if(state==="true") {
				listPage(1);				
			} else if(state==="false") {
				//console.log(data);			
				alert("댓글 등록에 실패하였습니다.");				
			}
		};
			
		ajaxJSON(url, "post", query, fn);
	});
});

//답글 버튼(댓글별 답글 등록폼 및 답글리스트)
$(function(){
	$("body").on("click", ".h-btnReplyAnswerLayout", function(){
		var $trReplyAnswer = $(this).closest("tr").next();
		
		var isVisible = $trReplyAnswer.is(':visible');
		var replyNum = $(this).attr("data-replyNum");
			
		if(isVisible) {
			$trReplyAnswer.hide();
		} else {
			$trReplyAnswer.show();
            
			// 답글 리스트
			listReplyAnswer(replyNum);
			
			// 답글 개수
			countReplyAnswer(replyNum);
		}
	});
	
});

//댓글 삭제(대댓글도 포함)
$(function(){
	$("body").on("click", ".h-deleteReply", function(){
		if(! confirm("게시물을 삭제하시겠습니까 ? ")) {
		    return false;
		}
		
		var replyNum=$(this).attr("data-replyNum");
		var page=$(this).attr("data-pageNo");
		
		var url="${pageContext.request.contextPath}/supplement/deleteReply";
		var query="replyNum="+replyNum+"&mode=reply";
		
		var fn = function(data){
			listPage(page);
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});

//     ----대댓글 ----
//댓글별 대댓글 리스트
function listReplyAnswer(answer) {
	var url="${pageContext.request.contextPath}/supplement/listReplyAnswer";
	var query="answer="+answer;
	var selector="#listReplyAnswer"+answer;
	
	ajaxHTML(url, "get", query, selector);
}
//댓글별 대댓글 갯수
function countReplyAnswer(answer) {
	var url="${pageContext.request.contextPath}/supplement/replyAnswerCount";
	var query="answer="+answer;
	
	var fn = function(data){
		var count=data.count;
		var vid="#answerCount"+answer;
		$(vid).html(count);
	};
	
	ajaxJSON(url, "post", query, fn);
}
//답글 등록 
$(function() {
	$("body").on("click", ".h-sendreply2btn", function() {
		var num = "${dto.num}";
		var replyNum = $(this).attr("data-replyNum");
		var $td = $(this).closest("td");
		
		var content = $td.find("textarea").val().trim()
		if(! content) {
			$td.find("textarea").focus();			
			return false;			
		}
		
		content = encodeURIComponent(content);
		
		var url="${pageContext.request.contextPath}/supplement/insertReply";
		var query="num="+num+"&content="+content+"&answer="+replyNum;
		
		var fn = function(data){
			$td.find("textarea").val("");
			
			var state=data.state;
			if(state==="true") {
				listReplyAnswer(replyNum);
				countReplyAnswer(replyNum);
			}
		};
		
		ajaxJSON(url, "post", query, fn);
		
	});
});

//대댓글 삭제 
$(function(){
	$("body").on("click", ".deleteReplyAnswer", function(){
		if(! confirm("게시물을 삭제하시겠습니까 ? ")) {
		    return;
		}
		
		var replyNum=$(this).attr("data-replyNum");
		var answer=$(this).attr("data-answer");
		
		var url="${pageContext.request.contextPath}/supplement/deleteReply";
		var query="replyNum="+replyNum+"&mode=answer";
		
		var fn = function(data){
			listReplyAnswer(answer);
			countReplyAnswer(answer);
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});

$(function(){
	// 댓글 좋아요 / 싫어요 등록
	$("body").on("click", ".h-reply-btnlike", function(){
		var replyNum=$(this).attr("data-replyNum");
		var replyLike=$(this).attr("data-replyLike");
		var $btn = $(this);
		
		

		var url="${pageContext.request.contextPath}/supplement/insertReplyLike";
		var query="replyNum="+replyNum+"&replyLike="+replyLike;
		
		var fn = function(data){
			var state=data.state;
			if(state==="true") {
				var likeCount=data.likeCount;
				var disLikeCount=data.disLikeCount;
				
				$btn.parent("div").children().eq(0).find("span").html(likeCount);
				$btn.parent("div").children().eq(1).find("span").html(disLikeCount);
			} else if(state==="false") {
				alert("댓글 좋아요/싫어요는 한 번만 가능합니다.");
			}
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});


$(document).ready(function() {
    
    var xOffset = 10;
    var yOffset = 30;

    $(document).on("mouseover",".imageout",function(e){ //마우스 오버시
		
		$("body").append("<p id='preview'><img src='${pageContext.request.contextPath}/uploads/supplement/${dto.imageFilename}'  width='300px' alt='이미지없음'></p>"); //보여줄 이미지를 선언						 
		$("#preview")
			.css("top",(e.pageY - xOffset) + "px")
			.css("left",(e.pageX + yOffset) + "px")
			.fadeIn("fast"); //미리보기 화면 설정 셋팅
	});
	
	$(document).on("mousemove",".imageout",function(e){ //마우스 이동시
		$("#preview")
			.css("top",(e.pageY - xOffset) + "px")
			.css("left",(e.pageX + yOffset) + "px");
	});
	
	$(document).on("mouseout",".imageout",function(){ //마우스 아웃시
		$("#preview").remove();
	});
     
});

</script>


<section>
	<div class="h-divvv">
	    <div class="h-articleButton">
	    	<c:if test="${not empty preReadDto}">
		        <div class="h-prebtn">
	           		<i class="fas fa-chevron-left"></i> <span> 
	            		 <a href="${pageContext.request.contextPath}/supplement/article?${query}&num=${preReadDto.num}"> 이전글</a>
	            	</span>
		        </div>
	    	</c:if>
 	    	<c:if test="${not empty nextReadDto}"> 
		        <div class="h-nextbtn">
		        	 <span> 
		        		<a href="${pageContext.request.contextPath}/supplement/article?${query}&num=${nextReadDto.num}"> 다음글</a>
		        	 </span> <i class="fas fa-chevron-right"></i>
		        </div>
 	    	</c:if> 
	    </div>
	    <div class="h-articleMainBody">
	        <div class="h-articleMainHeader">
	        	<div class="cate">
	        		<p class="cateP">${dto.category}</p>
	        	</div>
	            <div class="h-articleMainHeaderSubject">
	                <span>${dto.subject}</span>
	            </div>
	            <div class="imagetop">
	            	<p class="imgatetop2 imageout"><i class="far fa-image fa-2x imamge3"></i> <span class="imagespan"> 영양제 보기</span> <i class="fas fa-mouse-pointer"></i></p>
	            </div>
	            <div class="h-articleSub">
	                <div class="h-articleMainHeaderUserName">
	                    <span>${dto.userId}</span> 
	                    <span class="h-createdNumber">${dto.register_date}</span> 
	                </div>
	                <div class="h-articleMainHeaderReply">
	                    <span>조회수 ${dto.hitCount}</span>
	                </div>
	                
	            </div>
	        </div>
	
	        <div class="h-ContentBody">
	            <pre class="hpre">
	                ${dto.content}
	             </pre>
	        </div>
	        <div class="h-LikeBox">
	            <div class="h-likecircle" id="likebtn" data-userLike="${userLike}">
	                <div class="h-likelike"><i class="fas fa-thumbs-up fa-2x"></i></div>
	                <div class="h-likeCountdiv"><span id="slikeCount"> ${dto.likeCount}</span></div>
	            </div>
	        </div>
            <div class="list-buttons">
            	<c:if test="${sessionScope.member.userId == dto.userId}">
                	<button class="h-updateButton" onclick="javascript:location.href='${pageContext.request.contextPath}/supplement/update?num=${dto.num}&page=${page}';">수정</button>
            	</c:if>
            	<c:if test="${sessionScope.member.userId == dto.userId || sessionScope.member.userId =='admin'}">
                 <button class="h-deleteButton" onclick="deleteSupplement();">삭제</button>
            	</c:if>
                <button class="h-listButton" onclick="javascript:location.href='${pageContext.request.contextPath}/supplement/list?${query}';">목록</button>
            </div>
	        <div class="h-ReplyBody">
	            <div class="h-ReplyContentBox" id="hreplycontent">
	                <span>${sessionScope.member.userId}</span>
	                <textarea name="" id="" placeholder="댓글을 남겨보세요"></textarea>
	                <div class="h-ReplySubmitButton">
	                    <button class="h-Replybtn" id="hReplybtn" type="button">등록</button>
	                </div>
	            </div>
		        <div class="h-ReplyList">
		            <div class="h-replyList2" id="hreplyList2">
		                
		            </div>
		        </div>
	        </div>
	    </div>
	</div>
</section>