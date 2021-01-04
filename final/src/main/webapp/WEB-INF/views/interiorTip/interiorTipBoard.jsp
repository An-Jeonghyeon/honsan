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