<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dress/created.css"type="text/css">

<script type="text/javascript">
function deletbutton(num){
	if(confirm("게시물을 삭제 하시겠습니까?")){
		var q="num="+num+"&${query}";
		var url="${pageContext.request.contextPath}/dress/delete?"+q;
		location.href=url;
	}
}

function updatebutton(num){	
	if(confirm("게시물을 수정 하시겠습니까?")){
		var q= "num="+num+"&page=${page}";
		var url="${pageContext.request.contextPath}/dress/update?"+q;
		location.href=url;
	}
}

$(function() {
	$("body").on("click", ".ILikeHeart", function() {
		$(".fullLikeHeart").show();
	})
	$("body").on("click", ".fullLikeHeart", function() {
		$(this).hide();

	});

	$("body").on("click",".RelyWrite",function() {
		var pa =$(this).parent().next().next("div");
		pa.slideDown();
	});

	$("body").on("click",".ReplyListUserX",function() {
		var papa=$(this).parent().parent();
		papa.slideUp();
	});

	$("body").on("click",".ReplySUb > span",function() {
		if ($(".ReplayListForm").is(':visible') == false) {
			$(".ReplySUbDown").css("transform", "rotate(180deg)");
			$(".ReplayListForm").slideDown(1000);
		} else {
			$(".ReplySUbDown").css("transform", "rotate(360deg)");
			$(".ReplayListForm").slideUp(1000);
		}
	})

});

function login(){
	location.href="${pageContext.request.contextPath}/memeber/login";
}

function ajaxJSON(url,method, query, fn){
	$.ajax({
		type:method, 
		url:url,
		data:query, 
		dataType:"json",
		success:function(data){
			fn(data);
			},
		beforeSend:function(jqXHR){
			jqXHR.setRequestHeader("AJAX",true);
		},
		error:function(jqXHR){
			if(jqXHR.status===403){
				
			login();
			return false;
			}
		console.log(jqXHR.responseText);
		}
	});
}

	
function ajaxHTML(url, method, query, selector){
	$.ajax({
		type:method,
		url:url,
		data:query,
		success:function(data){
			$(selector).html(data);
			
		},
		beforeSend:function(jqXHR){
			jqXHR.setRequestHeader("AJAX",true);
			
		},
		error:function(jqXHR){
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
})
function listPage(page){
	var url="${pageContext.request.contextPath}/dress/listReply";
	var query ="num=${dto.num}&pageNo="+page;
	var selector = "#listReply";
	
	ajaxHTML(url,"get",query,selector);
	
}

$(function(){
	$("#MainReplybtn").click(function(){
		var num= "${dto.num}";
		var $parent=$(this).parent().parent();
		var content=$parent.find("textarea").val().trim();
		if(!content){
			$parent.find("textarea").focus();
			return false;
		}
		content= encodeURIComponent(content);
		var url="${pageContext.request.contextPath}/dress/insertDressReply";
		var query="num="+num+"&content="+content+"&answer=0";
		
		var fn=function(data){
			$parent.find("textarea").val("");
			
			var state=data.state;
		
			if(state==="true"){
				listPage(1);
				
			} else if(state==="false"){
				alert("댓글을 추가 하지 못했습니다.")
			}
				
		};
			ajaxJSON(url,"post",query,fn);
		
	});
});
//댓글 삭제 
$(function(){
	$("body").on("click",".Replydelete",function(){
		if(! confirm("댓글을 삭제 하시겠습니까? ")){
			return false;
		}
		var replyNum= $(this).attr("data-replyNum");
		var page=$(this).attr("data-pageNo");
		
		var url="${pageContext.request.contextPath}/dress/deleteDressReply";
		var query ="replyNum="+replyNum+"&mode=DressReply";
		var fn=function(data){
			listPage(page);
		}
		ajaxJSON(url,"post",query,fn);
	})
})






$(function() {
	$(".dress-thumbs-up").click(function() {
					var url="${pageContext.request.contextPath}/dress/insertDressLikeCount";
					var num="${dto.num}";
					var query="num="+num;
					var fn =function(data){
						var state=data.state;
						if(state==="true"){
							var count= data.DressLikeCount;
							$("#DressLikeCount").text(count);
							$(".dress-thumbs-up").css("background", "rgb(174, 174, 174)")
							$(".dress-thumbs-up").css("box-shadow","0px 0px 15px  rgba(202, 164, 255, 0.529)")
							$(".dress-thumbs-up").css("color", "aliceblue")

						}else if(state==="false"){
							var count= data.DressLikeCount;
							$("#DressLikeCount").text(count);
							$(".dress-thumbs-up").css("background", "white")
							$(".dress-thumbs-up").css("box-shadow","0px 0px 5px  rgba(128, 128, 128, 0.529)")
							$(".dress-thumbs-up").css("color", "rgb(136, 136, 136)")
						}
					};
					ajaxJSON(url,"post",query,fn);
				
			})
})
$(function(){
	$("body").on("click",".Replybtn",function(){
		var num ="{dto.num}";
		var replyNum = $(this).attr("data-replyNum");
		var pa= $(this).parent().find("textarea");
		var content= pa.val();
		console.log(pa)
		if(!content){
			pa.focus(); 
			return false;
		}
		content= encodeURIComponent(content);
		var url="${pageContext.request.contextPath}/dress/insertDressReply";
		var query="num="+num+"&content="+content+"&answer="+replyNum;
		var fn = function(data){
			pa.val("");
			var state=data.state;
			if(state="true"){
			console.log(state)
				listReplyAnswer(replyNum);
				countReplyAnswer(replyNum);
			}
		}
		ajaxJSON(url,"post",query,fn);
	})
})
function listReplyAnswer(answer){
	var url="${pageContext.request.contextPath}/dress/listReplyAnswer";
	var query="answer="+answer;
	var selector="#ReplyAnswerAnswer"+answer;
	ajaxHTML(url,"get",query,selector);
}
</script>


  <div class="articleMainBody">
                <div class="articleMainHeader">
                    <div class="articleGo">
                        <span><a href="${pageContext.request.contextPath}/dress/list">자랑게시판&gt;</a></span>
                    </div>
                    <div class="articleMainHeaderSubject">
                        <span>${dto.subject}</span>
                    </div>
                    <div class="articleSub">
                        <div class="articleMainHeaderUserName">
                            <span>${dto.userName}</span> <span class="createdNumber">${dto.register_date}</span>
                            <span class="hitCountNumber">조회 ${dto.hitCount}</span>
                        </div>
                        <div class="articleMainHeaderReply">
                            <span> <a href="#Comment"> 댓글 ${dto.replyCount }</a></span>
                        </div>
                    </div>
                </div>
              
                <div class="ContentBody">${dto.content}</div>
                  <div style="margin:0 auto; width:300px; text-align: center;">
                  <span>
                  	<c:forEach var="s" items="${dto.hashtag}">
                  		${s }
                  	</c:forEach>
                  	</span>
                  </div>
                <div class="EmpathyBotton">
                <i class="far fa-thumbs-up fa-4x dress-thumbs-up"><span id="DressLikeCount">${dto.dressLikeCount}</span></i>
                </div>
                <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin' }">
                    <div class="dress-articleMainButtonBoxBody">
                        <div class="dress-articleButtonBoxBody">
                            <button type="button" id="updateButton" onclick="updatebutton('${dto.num}');">수정하기</button>
                            <button type="button" id="deleteButton" onclick="deletbutton('${dto.num}');">삭제하기</button>
                        </div>
                    </div>
                </c:if>
               
                <div class="LikeBox">
                    <span class="LikeHeart"> <i class="far fa-heart ILikeHeart"></i>좋아요
                        13
                    </span> <span class="Comment" id="Comment"><i class="far fa-comments"></i>댓글 ${dto.replyCount }</span> <span
                        class="fullLikeHeart"> <i class="fas fa-heart"></i></span>
                </div>
                <div class="ReplySUb">
                    <span>댓글 <span class="ReplySUbDown">▾</span></span>
                </div>
                <div class="ReplayListForm"> 
                    <div id="listReply">
                       

                       
                    </div>
                    <div class="ReplyBody">
                        <div class="ReplyContentBox">
                            <textarea placeholder="댓글을 남겨보세요"></textarea>
                            <div class="ReplySubmitButton">
                                <button class="Replybtn" id="MainReplybtn" type="button">등록</button>
                            </div>
                        </div>
                    </div>

                
                </div>
            </div>