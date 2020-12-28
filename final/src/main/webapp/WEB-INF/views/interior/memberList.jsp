<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/interior/memberList.css" type="text/css">

<section>
	    <div class="userPage_mainbody">
        <div class="userPage_box">
            <div class="userPage_leftbox">
                <div class="userPage_leftbox_controller">
                    <div class="user_prople">
                        <div class="user_prople_img">
                        </div>
                        <div class="user_prople_userId">
                            <span>회원닉네임</span>
                        </div>  
                        <div class="user_prople_atr">
                            좋아요 <span>1,264</span>
                        </div>
                        <div class="user_prople_likebuttonBox">
                            <button>좋아요</button>
                        </div>
                        <div class="user_prople_msg">
                            인풋 사이즈 크기 최대 28자로 할것 
                        </div>
                    </div>
                </div>
            </div>
            <div class="userPage_rightbox">
               <div class="userPage_listbox">
                    <div class="userPage_listbox_subject">
                        <h3>인테리어 <span style="color: #35c5f0;">58</span></h3>
                        <a class="userPage_listbox_send" href="${pageContext.request.contextPath}/interior/mListAll?userId=${userId}">전채보기</a>
                    </div>
                    <div class="userPage_listbox_items">
                        <c:forEach var="dto" items="${list}">
	                        <div class="userPage_listbox_item">
	                            <a href="${pageContext.request.contextPath}/interior/boardItem?num=${dto.num}">
	                                <img class="userPage_listbox_item_img" src="${pageContext.request.contextPath}/uploads/interior/${dto.mainImg}">
	                            </a>
	                        </div>
                     	</c:forEach>
                    </div> 
                </div>

                <div class="userPage_listbox">
                    <div class="userPage_listbox_subject">
                        <h3>TIP <span style="color: #35c5f0;">58</span></h3>
                        <a class="userPage_listbox_send" href="#">전채보기</a>
                    </div>
                    <div class="userPage_listbox_items">
                        <!-- 반복문은 여기서 돌리시오  -->
                        <div class="userPage_listbox_item">
                            <a href="#">
                                <img class="userPage_listbox_item_img" src="#">
                            </a>
                        </div>
                        <div class="userPage_listbox_item">
                            <a href="#">
                                <img class="userPage_listbox_item_img" src="#">
                            </a>
                        </div>
                        <div class="userPage_listbox_item">
                            <a href="#">
                                <img class="userPage_listbox_item_img" src="#">
                            </a>
                        </div>
                        <div class="userPage_listbox_item">
                            <a href="#">
                                <img class="userPage_listbox_item_img" src="#">
                            </a>
                        </div>                       
                    </div> 
                </div>

                <div class="userPage_listbox">
                    <div class="userPage_listbox_subject">
                        <h3>당근마켓 <span style="color: #35c5f0;">58</span></h3>
                        <a class="userPage_listbox_send" href="#">전채보기</a>
                    </div>
                    <div class="userPage_listbox_items">
                        <!-- 반복문은 여기서 돌리시오  -->
                        <div class="userPage_listbox_item">
                            <a href="#">
                                <img class="userPage_listbox_item_img" src="#">
                            </a>
                        </div>
                        <div class="userPage_listbox_item">
                            <a href="#">
                                <img class="userPage_listbox_item_img" src="#">
                            </a>
                        </div>
                        <div class="userPage_listbox_item">
                            <a href="#">
                                <img class="userPage_listbox_item_img" src="#">
                            </a>
                        </div>
                        <div class="userPage_listbox_item">
                            <a href="#">
                                <img class="userPage_listbox_item_img" src="#">
                            </a>
                        </div>                       
                    </div> 
                </div>

            </div>
        </div>
    </div>
</section>