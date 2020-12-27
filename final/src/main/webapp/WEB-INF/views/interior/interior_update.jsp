<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/interior/boardItem.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/interior/boardItem.js"></script>
<script>

<c:if test="${mode=='update'}">
function deleteFile(filenum) {
		var url="${pageContext.request.contextPath}/interior/deleteFile";
		$.post(url, {filenum:filenum}, function(data){
			//다른 제이쿼리에 삭제를 넣어놈 
		}, "json");
}


$("body").on("click",".subimg_delete_button" ,function(){
	$(this).next().attr('src','${pageContext.request.contextPath}/resources/images/interior/camera1.png');
});


function deleteMainFile(num) {
	var url="${pageContext.request.contextPath}/interior/deleteMainFile";
	$.post(url, {num:num}, function(data){
		//다른 제이쿼리에 삭제를 넣어놈 
	}, "json");
}
</c:if>

function interior_update(){
	var f = document.interiorUpdateForm;
	
	f.action="${pageContext.request.contextPath}/interior/update";
	f.submit();
}


</script>
<section>
<form name="interiorUpdateForm" method="post" enctype="multipart/form-data">
    <div class="board_interior_box">
        <div class="board_interior_leftbox">
            
            <!-- 게시판 제목 부분  -->
            <div class="board_interior_leftbox_header">
                <div class="leftbox_header_subject">
                    <textarea name="subject" onkeydown="resize(this)" onkeyup="resize(this)" 
                                        class="leftbox_header_subject_textarea">${dto.subject}</textarea>
                    <input type="hidden" name="num" value="${dto.num}">
                </div>

            </div>
            <!-- 메인 사진 -->
            <div class="leftbox_mainImg">
                <a href="#"><img class="leftbox_mainImg_img" src="${pageContext.request.contextPath}/uploads/interior/${dto.mainImg}"></a>
            </div>
            <div class="mainImg_append"> 설정
                <input id="mainImg_upload" type="file" name="mainUpload" onchange="javascript:deleteMainFile('${dto.num}');"> <!--${dto.saveFilename} 다운받아져있는 이미지넣는다  -->
            </div>
            <!-- 서브 사진들 -->
            <div class="leftbox_subImg">
            <c:forEach var="fto" items="${flist}" begin="0" end="6" step="1" varStatus="n"> 
	                <div class="miribogi_point">
	                    <div class="leftbox_subImg_obj">
	                        <!-- 서브 사진들 1  -->
	                        <div class="miribogi_img${n.count}" >
	                        	<button type="button" class="subimg_delete_button" onclick="javascript:deleteFile('${fto.filenum}');"><i class="far fa-times-circle"></i></button>
	                            <img class='leftbox_subImg_obj_sub' src="${pageContext.request.contextPath}/uploads/interior/${fto.saveFilename}">
	                        </div>
	                    </div>
	                    <div class="miribogi_append" style="background: none;">
	                        <input id="ex${n.count}" type="file" name="upload" onchange="javascript:deleteFile('${fto.filenum}');"> 
	                    </div>
	                    
	                </div>        
			</c:forEach>
			<c:forEach var="i" begin="${flistCount+1}" end="7" step="1" varStatus="n">
				<div class="miribogi_point">
                    <div class="leftbox_subImg_obj">
                        <!-- 서브 사진들 1  -->
                        <div class="miribogi_img${flistCount+n.count}" >
                            <img class='leftbox_subImg_obj_sub'  >
                        </div>
                    </div>
                    <div class="miribogi_append">
                        <input id="ex${flistCount+n.count}" type="file" name="upload" > 
                    </div>
                </div>
			</c:forEach>



            </div>
            <!-- 간단한 내용 -->
            <p class="leftbox_content">
                <textarea name="content" placeholder="내용을 입력해주세요" onkeydown="resize(this)" onkeyup="resize(this)" 
                class="leftbox_header_subject_textarea" >${dto.content}</textarea>
            </p>
            
            <!-- # 태그가 있을시 for 문 돌려서 사용할것 ! -->
            <input type="text" value="#" name="tag" id="rdTag"> <span class="tag_notice">※ 태그 취소는 태그를 클릭해주세요. </span> 
            <!-- <button type="button" id="tagButton">태그등록</button> -->
            <ul class="leftbox_tag_ul">
                <c:forEach var="tag" items="${categorylist}" varStatus="n">
	                <c:choose>
		                <c:when test="${n.index==0}">
		                	<li class='leftbox_tag_li' onclick=$(this).remove(); > <input name='category' type='text' class='leftbox_tag_li_a'
						 style="width:${tag.length() * 15}px;" value="${tag}"> </li>
		                </c:when>
		                <c:otherwise>
							<li class='leftbox_tag_li' onclick=$(this).remove(); > <input name='category' type='text' class='leftbox_tag_li_a'
							 style="width:${tag.length() * 15}px;" value="${tag}"> </li>
						</c:otherwise>
	                </c:choose>
				</c:forEach>
              
               
            </ul>





            
            
            
        </div>
        <div class="board_interior_rightbox">
                <div class="board_interior_userpage">
                        
         				<div class="board_interior_userpage_sendButton">
						<div class="spon_banner">
							
						</div>
                            <button  type="button" class="board_interior_sendbutton" onclick="interior_created();">수정 취소</button>			
                            <button  type="button" class="board_interior_sendbutton" style="margin-top: 10px;" onclick="interior_update();">수정 완료</button>		
                        </div>	

                        
                       



               </div>
        </div>
  	</div>
    
</form>
</section>