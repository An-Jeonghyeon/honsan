<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dress/created.css"type="text/css">

<script type="text/javascript">
function deletbutton(num){
	if(confirm("게시물을 삭제 하시겠습니까?")){
		var q="num="+num+"&${query}";
		var url="${pageContext.request.contextPath}/dressTipClean/delete?"+q;
		location.href=url;
	}
}

function updatebutton(num){	
	if(confirm("게시물을 수정 하시겠습니까?")){
		var q= "num="+num+"&page=${page}";
		var url="${pageContext.request.contextPath}/dressTipClean/update?"+q;
		location.href=url;
	}
}

</script>


  <div class="articleMainBody">
                <div class="articleMainHeader">
                    <div class="articleGo">
                        <span><a href="${pageContext.request.contextPath}/dressTipClean/list">옷 보관법 게시판&gt;</a></span>
                    </div>
                    <div class="articleMainHeaderSubject">
                        <span>${dto.subject}</span>
                    </div>
                    <div class="articleSub">
                        <div class="articleMainHeaderUserName">
                            <span>${dto.userId}</span> <span class="createdNumber">${dto.register_date}</span>
                            <span class="hitCountNumber">조회 ${dto.hitCount}</span>
                        </div>
                    </div>
                </div>
              
                <div class="ContentBody">${dto.content}</div>
                  <div style="margin:0 auto; width:300px; text-align: center;">
                
                  </div>
               
                <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin' }">
                    <div class="dress-articleMainButtonBoxBody">
                        <div class="dress-articleButtonBoxBody">
                            <button type="button" id="updateButton" onclick="updatebutton('${dto.num}');">수정하기</button>
                            <button type="button" id="deleteButton" onclick="deletbutton('${dto.num}');">삭제하기</button>
                        </div>
                    </div>
                </c:if>
               
            </div>