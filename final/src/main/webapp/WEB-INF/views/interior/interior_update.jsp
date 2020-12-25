<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/interior/boardItem.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/interior/boardItem.js"></script>
<script>


</script>
<section>
    <div class="board_interior_box">
        <div class="board_interior_leftbox">
            
            <!-- 게시판 제목 부분  -->
            <div class="board_interior_leftbox_header">
                <div class="leftbox_header_subject">
                    <textarea name="subject" onkeydown="resize(this)" onkeyup="resize(this)" 
                                        class="leftbox_header_subject_textarea">${dto.subject}</textarea>
                </div>

            </div>
            <!-- 메인 사진 -->
            <div class="leftbox_mainImg">
                <a href="#"><img class="leftbox_mainImg_img" src="a1.jpg"></a>
            </div>
            <!-- 서브 사진들 -->
            <div class="leftbox_subImg">
                <div class="leftbox_subImg_obj">
                    <!-- 서브 사진들 1  -->
                    <a href=""><img class="leftbox_subImg_obj_sub" src="a1.jpg"></a>
                </div>
                <div class="leftbox_subImg_obj">
                    <!-- 서브 사진들 2  -->
                    <a href=""><img class="leftbox_subImg_obj_sub" src="a1.jpg"></a>                    
                </div>
                <div class="leftbox_subImg_obj">
                    <!-- 서브 사진들 3  -->
                    <a href=""><img class="leftbox_subImg_obj_sub" src="a1.jpg"></a>
                </div>
                <div class="leftbox_subImg_obj">
                    <!-- 서브 사진들 4  -->
                    <a href=""><img class="leftbox_subImg_obj_sub" src="a1.jpg"></a>
                </div>
                <div class="leftbox_subImg_obj">
                    <!-- 서브 사진들 5  -->
                    <a href=""><img class="leftbox_subImg_obj_sub" src="a1.jpg"></a>
                </div>
                <div class="leftbox_subImg_obj">
                    <!-- 서브 사진들 6  -->
                    <a href=""><img class="leftbox_subImg_obj_sub" src="a1.jpg"></a>
                </div>
                <div class="leftbox_subImg_obj">
                    <!-- 서브 사진들 7  -->
                    <a href=""><img class="leftbox_subImg_obj_sub" src="a1.jpg"></a>
                </div>
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
						 style="width:${tag.length() + 15}px;" value="# ${tag}"> </li>
		                </c:when>
		                <c:otherwise>
							<li class='leftbox_tag_li' onclick=$(this).remove(); > <input name='category' type='text' class='leftbox_tag_li_a'
							 style="width:${tag.length() * 15}px;" value="# ${tag}"> </li>
						</c:otherwise>
	                </c:choose>
				</c:forEach>
              
               
            </ul>





            
            
            
        </div>
            <div class="board_interior_rightbox">
                <div class="board_interior_userpage">
                    <div class="board_interior_userpage_atr">
                        <div class="board_interior_userpage_bar">
                            <div class="board_interior_userpage_barbox">
                                <button>
                                    <a>
                                        <img class="" src="h5.png">
                                    </a>
                                    <span class="userpage_span">30</span>
                                </button>
                            </div>
                            <div class="board_interior_userpage_barbox">
                                <button>
                                    <a>
                                        <img class="" src="h5.png">
                                    </a>
                                    <span class="userpage_span">27</span>
                                </button>
                            </div>
                        </div>
                        <div class="board_interior_users">
                            <div class="board_interior_users_subject">
                                <div class="board_interior_users_subject_atr">
                                    <a class="board_interior_users_subject_a">
                                        <img class="board_interior_users_subject_profle" src="a1.jpg">뀨뀨꺄꺄
                                    </a>
                                    <p class="board_interior_users_subject_userid">
                                        @pss1870
                                    </p>
                                </div>
                            </div>

                            <div class="board_interior_users_imgs">
                                <div class="board_interior_users_imgs_bar">
                                    <div class="board_interior_users_imgs_img">
                                        <!-- 회원 게시판 최근 1  -->
                                        <a><img class="board_interior_users_imgs_a_img" style="border-radius: 10px 0 0 0;"
                                             src="a1.jpg"></a>
                                    </div>
                                    <div class="board_interior_users_imgs_img">
                                        <!-- 회원 게시판 최근 2  -->
                                        <a><img class="board_interior_users_imgs_a_img" style="border-radius: 0 10px 0 0;"
                                             src="a1.jpg"></a>
                                    </div>
                                </div>
                                <div class="board_interior_users_imgs_bar">
                                    <div class="board_interior_users_imgs_img">
                                        <!-- 회원 게시판 최근 3  -->
                                        <a><img class="board_interior_users_imgs_a_img" style="border-radius: 0 0 0 10px;"
                                             src="a1.jpg"></a>
                                    </div>
                                    <div class="board_interior_users_imgs_img">
                                        <!-- 회원 게시판 최근 4  -->
                                        <a><img class="board_interior_users_imgs_a_img" style="border-radius: 0 0 10px 0;"
                                              src="a1.jpg"></a>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</section>