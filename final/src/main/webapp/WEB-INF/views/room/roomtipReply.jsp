<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>





<div class="body-title">
    <h3><i class="fab fa-asymmetrik"></i> Tip </h3>
</div>

<div>	
		<div style="height: 200px;">
		
		<c:if test="${categoryNum==1 }">
			
		
		
		
		
		
		</c:if>
		
		</div>







         <form name="roomtipForm" method="post" action="">
         <div class="guest-write">
             <div style="clear: both;">
                  <span style="font-weight: bold;">팁 쓰기</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
          </div>
          <div style="clear: both; padding-top: 10px;">
                <textarea name="content" id="content" class="boxTF" rows="3" style="display:block; width: 100%; padding: 6px 12px; box-sizing:border-box;" required="required"></textarea>
           		<input type="hidden" name="categoryNum" id="categoryNum" class="categoryNum" value="${categoryNum}">
           </div>
           <div style="text-align: right; padding-top: 10px;">
                <button type="button" class="btn" onclick="sendGuest();" style="padding:8px 25px;"> 등록하기 </button>
           </div>           
     </div>
    </form>
  
    <div id="listGuest">
    		<table style="width: 100%; margin: 10px auto 0px; border-spacing: 0; border-collapse: collapse;">
    			<thead>
    				<tr height="35">
    					<td width="50%">
    						<span style="color: #3EA9CD; font-weight: 700;">목록</span>
       					</td>
       					<td width="50%">&nbsp;</td>
       				</tr>
       			</thead>
       			<tbody id="listGuestBody" data-pageNo="0" data-totalPage="0">
       			
     			<c:forEach var="dto" items="${list}">  			
	       			<tr height="35" bgcolor="#eeeeee">
					<td width="50%" style="padding-left: 5px; border:1px solid #cccccc; border-right:none;">${dto.userName}</td>
					<td width="50%" align="right" style="padding-right: 5px; border:1px solid #cccccc; border-left:none;">${dto.register_date}
					<c:if test="${dto.userId == sessionScope.member.userId ||  sessionScope.member.userId == 'admin' }">
						 | <span class="guest-delete" data-num="${dto.num}" data-pageNo="${pageNo}" data-categoryNum="${dto.categoryNum}">삭제</span>
					</c:if>
					<c:if test="${dto.userId != sessionScope.member.userId}">
						 | <span class="guest-notify">신고</span>
					</c:if>
					</td>
					</tr>
					<tr style="height: 50px;">
					<td colspan="2" style="padding: 5px;" valign="top">${dto.content}</td>
					</tr>
				</c:forEach>
				<tr height="35">
		            <td align="center">
		               ${dataCount==0?"등록된 게시물이 없습니다.":paging}
		            </td>
		         </tr>
		         
		         
		         
		         
       			</tbody>
       			
       		</table>
       </div>
       
</div>