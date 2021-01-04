<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/interior/boardItem.css" type="text/css">
<style>

.interiorTipBoard_body {
	width: 100%;
	margin-top: 100px;
	border-top: 1px solid #cccccc;
}

.interiorTipBoard_body_tle{
	width: 700px;
	margin: 0 auto;
	padding-left: 55px;
	margin-top: 100px;
}

.interiorTipBoard_subject{
	font-size: 32px;
	font-weight: 700;
}

.interiorTipBoard_name{
	height: 50%;
	font-weight: 700;
	padding-left: 62px;
	letter-spacing: -1px;
}

.interiorTipBoard_created{
	height: 50%;
	padding-left: 62px;
	letter-spacing: -1px;
}

.interiorTipBoard_userimg{
	width: 50px;
	height: 50px;
	position: absolute;
	margin-left: -62px;
	margin-top : -6px;
	border-radius: 100%;
}

.btnSendBoardLike {
	height: 36px;
	width : 70px;
	border: none;
	background: #35c5f0;
	color: white;
	border-radius: 4px;
	text-align: center;
}

.fa-thumbs-up {
	font-size: 20px;
	color: white;
}

.btn{
	background: #35c5f0;
	color: white;
	font-weight: 600;
	border: none;
	border-radius: 4px;
	padding: 4px;
}


.interiorTipBoard_benner{

	width: 100%;
	height: 600px;
	background: url('${pageContext.request.contextPath}/resources/images/interior/interiorTipboardbenner1.webp');
	background-size: cover;
	background-position: center; 
	margin-top: 100px;
}

#curBox_sub{
	border: 1px solid #35c5f0;
	background:  #35c5f0;
	color: white;
	border-radius: 4px;
	font-weight: 700;
	font-size: 15px;
	font-weight:bold;
	height:28px;
	padding:4px 7px 4px 7px;
	margin-left:3px;
	line-height:normal;
	vertical-align:middle;
}


#numBox_sub{
	font-size: 15px;
	border : none;
	color : #424242;
	height:28px;
	font-weight:bold;
	text-decoration:none;
	padding:4px 7px 4px 7px;
	margin-left:3px;
	line-height:normal;
	vertical-align:middle;
}

#tlBox{
	font-size: 15px;
	border : none;
	border:1px solid #ccc;
	height:28px;color:#000000;
	text-decoration:none;
	padding:4px 10px 4px 10px;
	margin-left:3px;
	margin-right : 20px;
	line-height:normal;
	vertical-align:middle;
	outline:none; 
	border-radius: 4px;
}

#trBox{
	font-size: 15px;
	border : none;
	border:1px solid #ccc;
	height:28px;color:#000000;
	text-decoration:none;
	padding:4px 10px 4px 10px;
	margin-left:20px;
	margin-right : 3px;
	line-height:normal;
	vertical-align:middle;
	outline:none; 
	border-radius: 4px;
	
}


</style>

<script type="text/javascript">
function deleteBoard(num) {
   <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">
   if(confirm("게시물을 삭제 하시겠습니까 ?")) {
      var q="num="+num+"&${query}";
      var url="${pageContext.request.contextPath}/interiorTip/delete?"+q;
      location.href=url;
   }
   </c:if>
   
   <c:if test="${sessionScope.member.userId!=dto.userId  && sessionScope.member.userId!='admin'}}">
       alert("게시글을 살제할 수 없습니다.");
    </c:if>
}

function updateBoard(num) {
      <c:if test="${sessionScope.member.userId==dto.userId}">
         var q="num="+num+"&page=${page}";
         var url="${pageContext.request.contextPath}/interiorTip/update?"+q;
         location.href=url;
      </c:if>
      
      <c:if test="${sessionScope.member.userId!=dto.userId}">
         alert("게시글을 수정할 권한이 없습니다.");
      </c:if>
   }
   
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

function ajaxHTML(url, method, query, selector) {
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


//게시글 로딩시 페이징 처리
$(function() {
	listPage(1);
});

// 댓글 리스트 보이기
function listPage(page) {
	var url = "${pageContext.request.contextPath}/interiorTip/listReply";
	var query = "num=${dto.num}&pageNo="+page;
	var selector = ".comment_list_box";
	
	ajaxHTML(url, "get", query, selector);
}

$(function(){
	$(".btnSendReply").click(function(){ // 버튼클릭시 
		var num="${dto.num}"; // 댓글을 작성할 게시판의 넘 설정 
		//var $tb = $(this).closest("table");
		var $div = $(this).parents(".leftbox_comment_usercomment"); // content 를 찾을 위치 설정
		
//		var content=$tb.find("textarea").val().trim();
		var content=$div.find("textarea").val().trim(); // 부모값 밑 textarea 값으로 content 설정
		
		
		if(! content) {     // 값이 없으면 
			$div.find("textarea").focus(); // 댓글을 입력하는 곳에 마우스 포인트 
			return false; //펄스로 빠져나가기 
		}
		content = encodeURIComponent(content); // 한글 인코딩 
		
		var url="${pageContext.request.contextPath}/interiorTip/insertReply"; //컨트롤러로 보내질 주소 
		var query="num="+num+"&content="+content; //값으로 게시판번호 , 댓글내용 , 부모댓글로 사용할 넘버 
		
		var fn = function(data){
			$div.find("textarea").val(""); // 전송 후 댓글창 값 공백 입력 
			
			var state=data.state;
			if(state==="true") { // 성공하면 리스트 보이게 
				listPage(1);
			} else if(state==="false") { // 실패시 실패 안내 
				alert("댓글을 추가 하지 못했습니다.");
			}
		};
		
		ajaxJSON(url, "post", query, fn); // 만들어 놓은 재이슨으로 전송 
	});
});

</script>


<section>
<div class="interiorTipBoard_benner">

</div>

<div class="interiorTipBoard_body">
	<div class="interiorTipBoard_body_tle">

	
	   <div>
	      <table style="width: 100%; margin-top: 20px; border-spacing: 0px; border-collapse: collapse;">
	         <tr style="border : none;">
	            <td colspan="2" >
	               <div class="interiorTipBoard_subject"> ${dto.subject } </div>
	            </td>
	         </tr>
	         <tr height="30px"></tr>
	         <tr height="50px" style="border: none">
	            <td width="50%" align="left" style="padding-left: 5px;">
	               	<div class="interiorTipBoard_name"> 
	               		<a>
	               			<img src="${pageContext.request.contextPath}/uploads/profile/${dto.profileImg}" class="interiorTipBoard_userimg">${dto.userName }
	               		</a>
	               </div>
	               	<div class="interiorTipBoard_created"> ${dto.created}</div>
	            </td>
	            <td height="100%" width="50%" align="right" style="padding-right: 5px;">
	               	<button type="button" class="btn btnSendBoardLike" title="좋아요"><i class="far fa-thumbs-up"></i>&nbsp;&nbsp;<span id="boardLikeCount"></span></button> | &nbsp;&nbsp;조회수 ${dto.hitCount}
	            </td>
	         </tr>
	         <tr height="75px"></tr>
	         <tr style="border-bottom: 1px solid #cccccc;">
	            <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
	               ${dto.content }
	            </td>
	         </tr>
	         
	 
	         <tr height="35" style="border-bottom: 1px solid #cccccc;">
	            <td colspan="2" align="left" style="padding-left: 5px;">
	               이전글 :
	               <c:if test="${not empty preReadDto }">
	                  <a href="${pageContext.request.contextPath }/interiorTip/article?${query}&num=${preReadDto.num}&categorys=${categorys}">${preReadDto.subject }</a>
	               </c:if>
	            </td>
	         </tr>
	
	         <tr height="35" style="border-bottom: 1px solid #cccccc;">
	            <td colspan="2" align="left" style="padding-left: 5px;">
	               다음글 :
	               <c:if test="${not empty nextReadDto }">
	                  <a href="${pageContext.request.contextPath }/interiorTip/article?${query}&num=${nextReadDto.num}&categorys=${categorys}">${nextReadDto.subject }</a>
	               </c:if>
	            </td>
	         </tr>
	      </table>
	
	      <table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
	         <tr height="45">
	            <td width="300" align="left">
		            <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">
		               <button type="button" class="btn" onclick="updateBoard('${dto.num}');">수정</button>
		               <button type="button" class="btn" onclick="deleteBoard('${dto.num}');">삭제</button>
		               
		            </c:if>
	            </td>
	
	            <td align="right">
	               <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/interiorTip/list';">리스트</button>
	            </td>
	         </tr>
	      </table>
	   </div>
	   
	   <!-- 댓글 쓰기 -->
	       <div>
            <div class="leftbox_comment_box">
                <div class="leftbox_comment_box_atr">
                    <h1>댓글&nbsp;<span>${replyCount}</span></h1>
                

                <div class="leftbox_comment_insert">
                    <div class="leftbox_comment_userImg">
                        <img src="${pageContext.request.contextPath}/uploads/profile/${logindto.profileImg}">
                    </div>
                    <div class="leftbox_comment_usercomment">
                        <div class="leftbox_comment_usercomment_input">
                            <div class="leftbox_comment_usercomment_input2">
                               <textarea placeholder="메모" onkeydown="resize(this)" onkeyup="resize(this)" class="comment_content"></textarea>
                            </div>
                        </div>
                        <div class="leftbox_comment_usercomment_button">
                            <button class="btnSendReply">등록</button>
                        </div>
                    </div>
                </div>
                <!-- 댓글 반복 구간  -->
                <ul class="comment_list_box">
                    <!-- 첫번째 반복  -->
         			<!-- 두번째 반복  -->
                    <!-- 페이징 처리  -->

                
				</ul>
           		</div>
                <article>

                </article>

            </div>
	    
	    </div>
	   
	
	
	
	
	</div>
</div>
</section>