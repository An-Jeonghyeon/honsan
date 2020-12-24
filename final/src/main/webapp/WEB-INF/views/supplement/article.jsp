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
// 	 var likebtndiv = document.getElementById("likebtn");
// 	 likebtndiv.addEventListener('click', function (event) {
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
				console.log(data);			
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
	            <div class="h-articleMainHeaderSubject">
	                <span>${dto.subject}</span>
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
	            <pre>
	                ${dto.content}
	             </pre>
	        </div>
	        <div class="h-LikeBox">
	            <div class="h-likecircle" id="likebtn">
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