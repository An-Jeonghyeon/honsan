<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/interior/boardItem.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/interior/boardItem.js"></script>

<script>
function interior_created() {
	var f = document.insert_mainboard_form;
	
	
	 f.action = "${pageContext.request.contextPath}/interior/created";

	 f.submit();
}



</script>
<section>
    <form name="insert_mainboard_form" class="input-form" method="post" enctype="multipart/form-data">
    <div class="board_interior_box">
        <div class="board_interior_leftbox">
            
            <!-- 게시판 제목 부분  -->
            <div class="board_interior_leftbox_header">
                <div class="leftbox_header_subject">
                    <textarea name="subject" placeholder="제목을 입력해주세요." onkeydown="resize(this)" onkeyup="resize(this)" 
                                        class="leftbox_header_subject_textarea"></textarea>
                </div>

            </div>
            <!-- 메인 사진 -->
            <div class="leftbox_mainImg">
                <img class="leftbox_mainImg_img" >
            </div>
            <div class="mainImg_append"> 설정
                <input id="mainImg_upload" type="file" name="mainUpload" > <!--${dto.saveFilename} 다운받아져있는 이미지넣는다  -->
            </div>
            <!-- 서브 사진들 -->
            <div class="leftbox_subImg">
                <div class="miribogi_point">
                    <div class="leftbox_subImg_obj">
                        <!-- 서브 사진들 1  -->
                        <div class="miribogi_img1" >
                            <img class='leftbox_subImg_obj_sub'  >
                        </div>
                    </div>
                    <div class="miribogi_append">
                        <input id="ex1" type="file" name="upload" > 
                    </div>
                </div>

                <div class="miribogi_point">
                    <div class="leftbox_subImg_obj">
                        <!-- 서브 사진들 1  -->
                        <div class="miribogi_img2" >
                            <img class='leftbox_subImg_obj_sub'  >
                        </div>
                    </div>
                    <div class="miribogi_append">
                        <input id="ex2" type="file" name="upload"> 
                    </div>
                </div>

                <div class="miribogi_point">
                    <div class="leftbox_subImg_obj">
                        <!-- 서브 사진들 1  -->
                        <div class="miribogi_img3" >
                            <img class='leftbox_subImg_obj_sub' >
                        </div>
                    </div>
                    <div class="miribogi_append">
                        <input id="ex3" type="file" name="upload" > 
                    </div>
                </div>

                <div class="miribogi_point">
                    <div class="leftbox_subImg_obj">
                        <!-- 서브 사진들 1  -->
                        <div class="miribogi_img4" >
                            <img class='leftbox_subImg_obj_sub' >
                        </div>
                    </div>
                    <div class="miribogi_append">
                        <input id="ex4" type="file" name="upload" > 
                    </div>
                </div>

                <div class="miribogi_point">
                    <div class="leftbox_subImg_obj">
                        <!-- 서브 사진들 1  -->
                        <div class="miribogi_img5" >
                            <img class='leftbox_subImg_obj_sub' >
                        </div>
                    </div>
                    <div class="miribogi_append">
                        <input id="ex5" type="file" name="upload" > 
                    </div>
                </div>

                <div class="miribogi_point">
                    <div class="leftbox_subImg_obj">
                        <!-- 서브 사진들 1  -->
                        <div class="miribogi_img6" >
                            <img class='leftbox_subImg_obj_sub' >
                        </div>
                    </div>
                    <div class="miribogi_append">
                        <input id="ex6" type="file" name="upload" > 
                    </div>
                </div>

                <div class="miribogi_point">
                    <div class="leftbox_subImg_obj">
                        <!-- 서브 사진들 1  -->
                        <div class="miribogi_img7" >
                            <img class='leftbox_subImg_obj_sub' >
                        </div>
                    </div>
                    <div class="miribogi_append">
                        <input id="ex7" type="file" name="upload" > 
                    </div>
                </div>




            </div>
            <!-- 간단한 내용 -->
            <p class="leftbox_content">
                <textarea name="content" placeholder="내용을 입력해주세요" onkeydown="resize(this)" onkeyup="resize(this)" 
                class="leftbox_header_subject_textarea" ></textarea>
            </p>
            
            <!-- # 태그가 있을시 for 문 돌려서 사용할것 ! -->
            <input type="text" value="#" name="tag" id="rdTag"> <span class="tag_notice">※ 태그 취소는 태그를 클릭해주세요. </span> 
            <!-- <button type="button" id="tagButton">태그등록</button> -->
            <ul class="leftbox_tag_ul">
                
              
               
            </ul>
            

        </div>


            
            
            
        
            <div class="board_interior_rightbox">
                <div class="board_interior_userpage">
                    <div class="board_interior_userpage_sendButton">

                        <div class="board_interior_buttonpage_bar">
                            <div class="board_interior_buttonbox">
                                <button type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/interior/created'">
                                    <span class="buttonpage_span">초기화</span>
                                </button>
                            </div>
                            <div class="board_interior_buttonbox">
                                <button type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/interior/main'">
                                    <span class="buttonpage_span">취소</span>
                                </button>
                            </div>
                        </div>
                        
                        <div class="board_interior_sendbutton_div">
                            <button  type="button" class="board_interior_sendbutton" onclick="interior_created();">게시판 작성</button>

						
                        </div>
                        
                    </div>
                </div>
            </div>
    </div>
</form>
</section>