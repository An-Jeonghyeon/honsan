<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	function searchList() {
		var f = document.dressTipCleanCreatedFrom;
		f.submit();
	}
$(function(){
	$(".dress-InnerImg1").click(function(){
		location.href="${pageContext.request.contextPath}/dressTip/list";
	})
	$(".dress-InnerImg2").click(function(){
		location.href="${pageContext.request.contextPath}/dressTipClean/list";
	})
})
	
</script>
<div class="dress-TipMainImg">
</div>
 <div class="dress-TipMainBody">
                <div class="dress-TipMainBodySub">
                    <div class="dress-TipMenuBody1">
                        <div class="dress-TipMenu1" >
                            <div class="dress-InnerImg1">
                                <a href="${pageContext.request.contextPath}/dressTip/list">
                                    <span>옷 보관법</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="dress-TipMenuBody2">
                        <div class="dress-TipMenu2" >
                            <div class="dress-InnerImg2">
                                <a href="${pageContext.request.contextPath}/dressTipClean/list">
                                    <span>옷 세탁법</span>
                                </a>
                            </div>
                        </div>
                    </div>
                      <div class="paginger">
                      ${dataCount}개(${pageNo}/${total_page} 페이지)
                     </div>
                </div>
                <div class="dress-TipMainShowArticleBody">
                <c:forEach var="dto" items="${list}">
                    <div class="dress-TipShowArticleBody">
                        <div class="dress-TipShowMenu">[세탁법]</div>
                        <div class="dress-Subject"><a href="${articleUrl}&num=${dto.num}">${dto.subject}</a></div>
                        <div class="dress-UserName">${dto.userName}</div>
                        <div class="dress-Created">${dto.register_date}</div>
                        <div class="dress-HitCountName">조회수</div>
                        <div class="dress-HitCount">${dto.hitCount}</div>
                    </div>
                </c:forEach>
                </div>
                <form name="dressTipCleanCreatedFrom" method="post" action="${pageContext.request.contextPath}/dressTipClean/list">
                    <div class="dress-searchFormBody">
                        <div class="dress-pagingNum">  ${dataCount==0?"등록된 게시물이 없습니다.":paging}</div>
                        <div class="dress-searchBody">
                            <button class="dress-Resetbtn dress-Btn" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/dressTipClean/list';">
                                <i class="fas fa-redo-alt fa-2x"></i></button>
                            <select class="dress-Selectbtn" name="condition">
                                  <option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
				                  <option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
				                  <option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
				                  <option value="userName" ${condition=="userName"?"selected='selected'":""}>작성자</option>
				                  <option value="register_date" ${condition=="register_date"?"selected='selected'":""}>등록일</option>
                            </select>
                            <input class="dress-Search" type="text"  name="keyword" value="${keyword}">
                            <button class="dress-Searchbnt dress-Btn" type="button" onclick="searchList();">검색</button>
                            <button class="dress-Createdbtn dress-Btn" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/dressTipClean/created';">글쓰기</button>
                        </div>
                    </div>
                </form>
            </div>