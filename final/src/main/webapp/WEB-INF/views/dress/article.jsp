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

	})

	$("body").on("click",".RelyWrite",function() {
		var pa =$(this).parent().next("div");
		pa.slideDown();
	})

	$("body").on("click",".ReplyListUserX",function() {
		var papa=$(this).parent().parent();
		papa.slideUp();
	})

	$("body").on("click",".ReplySUb > span",function() {
		if ($(".ReplayListForm").is(':visible') == false) {
			$(".ReplySUbDown").css("transform", "rotate(180deg)");
			$(".ReplayListForm").slideDown(1000);
		} else {
			$(".ReplySUbDown").css("transform", "rotate(360deg)");
			$(".ReplayListForm").slideUp(1000);
		}
	})

})

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
	$(".Replybtn").click(function(){
		var num= ${dto.num};
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
			if(state=="true"){
			listpage(1);
				
			} else if(state==="false"){
				alert("댓글을 추가 하지 못했습니다.")
			}
				
		};
			ajaxJSON(url,"post",query,fn);
	});
});


$(function() {
	var counter = 0;
	$(".dress-thumbs-up").click(
			function() {

				if (counter >= 1) {
					confirm("공감을 취소 하시겠습니까?")
					$(this).css("background", "white")
					$(this).css("box-shadow",
							"0px 0px 5px  rgba(128, 128, 128, 0.529)")
					$(this).css("color", "rgb(136, 136, 136)")
					counter--;
					console.log(counter)
				} else {
					confirm("공감을 누르시겠습니까?")
					$(this).css("background", "rgb(174, 174, 174)")
					$(this).css("box-shadow",
							"0px 0px 15px  rgba(202, 164, 255, 0.529)")
					$(this).css("color", "aliceblue")
					counter++;
					console.log(counter)
				}
			})
})


</script>


  <div class="articleMainBody">
                <div class="articleMainHeader">
                    <div class="articleGo">
                        <span><a href="${pageContext.request.contextPath}/dress/list">자랑게시판
                                &gt;</a></span>
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
                <div class="EmpathyBotton"><i class="far fa-thumbs-up fa-4x dress-thumbs-up"></i></div>
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
                            <span>${dto.userName}</span>
                            <textarea placeholder="댓글을 남겨보세요"></textarea>
                            <div class="ReplySubmitButton">
                                <button class="Replybtn" type="button">등록</button>
                            </div>
                        </div>
                    </div>

                
                </div>
            </div>