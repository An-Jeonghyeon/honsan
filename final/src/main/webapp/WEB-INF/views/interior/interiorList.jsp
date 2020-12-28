<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/interior/interiorList.css" type="text/css">

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
                <div class="userPage_board_list">
	                <c:forEach var="dto" items="${list}" varStatus="n">
	                	<c:if test="${n.index!=0 and n.index%3==0}">
	                		<c:out value="</div><div class='userPage_board_list'>" escapeXml="false"/>
	                	</c:if>
	                    <div class="userPage_board_list_item">
	                        <div class="userPage_board_list_item_atr">
	                            <div class="userPage_board_list_item_atr_imgbox">
	                                <a><img class="userPage_board_list_item_atr_img" src="${pageContext.request.contextPath}/uploads/interior/${dto.mainImg}"></a>
	                            </div>
	                            <p class="userPage_board_list_item_atr_subject">${dto.subject}</p>
	                            <span class="userPage_board_list_item_atr_counts">좋아요 727 · 조회수 ${dto.hitCount}</span>
	                        </div>
	                    </div>
					</c:forEach>
                </div>

            </div>
        </div>
    </div>
</section>