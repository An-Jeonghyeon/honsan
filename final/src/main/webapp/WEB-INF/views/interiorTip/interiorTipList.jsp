<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

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

.fa-angle-left:before{
}


#numBox_sub{
	font-size: 15px;
	border : none;
	color : #424242;
	height:28px;
	font-weight:bold;
	text-decoration: none;
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


.tip_topController{
    height: 65px;
    
}

.interiorTip_box{
    width: 1200px;
    min-height: 1px;
    
    margin: 0 auto;
}


.tip_topitems{
    width: 100%;
    height: 200px;
    margin-bottom: 60px;
    
    display: flex;
}

.tip_topitem{
    
    width: 12%;
    height: 90%;
    padding: 0px 10px;
    padding-top: 5px;
}

.tip_topitem img{
    width: 100%;
    height: 100%;
}

.tip_subController{
    height: 32px;
    
}
.interiorTip_itemTable{
    
    padding: 15px 0px;
    width: 100%;
    display: flex;
}


.interiorTip_item{
    
    height: 310px;
    width: 25%;
    
    
}
.interiorTip_item_top{
    
    width: 90%;
    height: 50%;
    margin: 0 auto;
   
}


.img {
    width: 100%;
    height:100%;
    background: black;
    border-radius: 8px;
    
}



.interiorTip_item_button{
    width: 90%;
    height: 45%;
    margin: 0 auto;
    
}

.iteriorTip_subject{
    
    width: 95%;
    margin: 0 auto;
    padding-top: 10px;
    letter-spacing: -1px;
}

.iteriorTip_subject > p{
    margin: 5px 0px;
    font-size: 12px;
    letter-spacing: 0;
    
}

.iteriorTip_subject > span{
    font-size: 18px;
    font-weight: 700;
    letter-spacing: 1px;

}

.toptoptop {
    width: 100%;
	margin-bottom: 150px;

}

.bodytop-container{
    width: 1000px;
    margin: 0 auto;

    margin-top: 100px;
}

.interiorTiplist{
    width: 100%;
    background: #f5f5f5;
}

.interiorTip_list{
    width: 100%; 
    border-spacing: 0px; 

    border-collapse: collapse;
    padding: 7px;
    box-sizing: border-box;

}

.interiorTip_list_row{

    height: 35px;
    display: flex;  
    margin-top: 7px;
    
    

}

.interiorTip_list_row_sub{
    width: 12%;
    padding: 5px;
    background: white;
    
}

.interiorTip_list_row_sub_hit{
    width: 16%;
    padding: 5px;
    background: white;
    
}
.interiorTip_list_row_subject{
    width: 50%;
    padding: 5px;
    background: white;
    
}

.interiprTip_foot{
   width: 100%; 
   margin: 10px auto;
   border-spacing: 0px;
   
}

.interiprTip_foot_row{
    height: 40px;

    display: flex;
    justify-content: space-between;

}
.interiprTip_foot_row_reset{
    width: 100px;
}

.interiprTip_foot_row_button{
    height: 100%;
    border-radius: 4px;
    border: none;
    background: #35c5f0;
    color: white;
    font-weight: 700;
    font-size: 15px;
    padding-left: 4px;
    padding-right: 4px;

}

.selectField{
    height: 100%;
    border-radius: 4px;
    border: 1px solid #dbdbdb;
    
}

.interiprTip_foot_row_input{

    height: 95%;
    border-radius: 4px;
    border: none;
    border: 1px solid #dbdbdb;
}

.interiorTip_list_row_subject_a{
	text-decoration: none;
	color: black;
	
}



.loading span {
  display: inline-block;
  margin: 0 -.075em;
  animation: loading .7s infinite alternate;
}
.loading span:nth-child(2) {
  animation-delay: .1s;
}
.loading span:nth-child(3) {
  animation-delay: .2s;
}
.loading span:nth-child(4) {
  animation-delay: .3s;
}
.loading span:nth-child(5) {
  animation-delay: .4s;
}
.loading span:nth-child(6) {
  animation-delay: .5s;
}
.loading span:nth-child(7) {
  animation-delay: .6s;
}
@keyframes loading {
  0% {
    transform: scale(1);
  }
  100% {
    transform: scale(0.8);
  }
}


.interiorTip_benner{

	width: 100%;
	height: 700px;
	background: url('${pageContext.request.contextPath}/resources/images/interior/125.jpg');
	background-size: cover;
	background-position: bottom;
	margin-top: 100px;
}


</style>


<script type="text/javascript">
function searchList() {
	var f=document.searchForm;
	f.submit();
}
</script>


<section>
	<div class="interiorTip_benner">

	</div>
    <div class="tip_topController">

	    </div>
	    <div class="interiorTip_box">
	 
	        <div class="loading">
	            <span style="font-size: 60px; font-weight: 700;">L</span>&nbsp;
	            <span style="font-size: 60px; font-weight: 700;">i</span>&nbsp;
	            <span style="font-size: 60px; font-weight: 700;">f</span>&nbsp;
	            <span style="font-size: 60px; font-weight: 700;">e</span>&nbsp;
	            <span style="font-size: 60px; font-weight: 700;">T</span>&nbsp;
	            <span style="font-size: 60px; font-weight: 700;">i</span>&nbsp;
	            <span style="font-size: 60px; font-weight: 700;">p</span> 
	        </div>
	        <div class="tip_topitems">
	            <div class="tip_topitem">
	                <!-- 팁 종류 이동 이미지  -->
	                <a href="${pageContext.request.contextPath}/interiorTip/list"><img src="${pageContext.request.contextPath}/resources/images/interior/life4.png"></a>
	            </div>
	            <div class="tip_topitem">
	                <!-- 팁 종류 이동 이미지  -->
	                <a href="${pageContext.request.contextPath}/interiorTip/list?categorys=생활 팁"><img src="${pageContext.request.contextPath}/resources/images/interior/life1.png"></a>
	            </div>
	            <div class="tip_topitem">
	                <!-- 팁 종류 이동 이미지  -->
	                <a href="${pageContext.request.contextPath}/interiorTip/list?categorys=청소 팁"><img src="${pageContext.request.contextPath}/resources/images/interior/life2.png"></a>
	            </div>
	            <div class="tip_topitem">
	                <!-- 팁 종류 이동 이미지  -->
	                <a href="${pageContext.request.contextPath}/interiorTip/list?categorys=정리 팁"><img src="${pageContext.request.contextPath}/resources/images/interior/life3.png"></a>
	            </div>
	        </div>
	        
	        
	    <div class="toptoptop">
	        <div class="bodytop-container" >
	            <div class="body-title">
	                <div class="loading">
	                    <span style="font-size: 35px; font-weight: 700;">T</span>
	                    <span style="font-size: 35px; font-weight: 700;">i</span>
	                    <span style="font-size: 35px; font-weight: 700;">p</span>&nbsp;
	                    <span style="font-size: 35px; font-weight: 700;">T</span>
	                    <span style="font-size: 35px; font-weight: 700;">i</span>
	                    <span style="font-size: 35px; font-weight: 700;">p</span>
	                </div> 
	            </div>
	
	            <div>
	                <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
	                    <tr height="35">
	                        <td align="left" width="50%">
	                            <%-- ${dataCount }개(${page }/${total_page } 페이지) --%>
	                        </td>
	                        <td align="right">
	                            &nbsp;
	                        </td>
	                    </tr>
	                </table>
	                <div class="interiorTiplist" >
	                    <div class="interiorTip_list" >
	
	                        
	                        <c:forEach var="dto" items="${list }" varStatus="n">
	                        	<c:if test="${n.index==0}">
			                        <div class="interiorTip_list_row" align="center" bgcolor="#ffffff" height="35" style="margin-top: 0px;"> 
			                            <div class="interiorTip_list_row_sub">${dto.category}</div>
			                            <div class="interiorTip_list_row_subject" align="left" style="padding-left: 10px;">
			                            	<c:if test="${not empty categorys}">
				                                <a class="interiorTip_list_row_subject_a" href="${articleUrl}&num=${dto.num}&categorys=${categorys}">${dto.subject}</a>
				                            </c:if>
				                            <c:if test="${empty categorys}">
				                                <a class="interiorTip_list_row_subject_a" href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
				                            </c:if>
			                            </div>
			                            <div class="interiorTip_list_row_sub">${dto.userName}</div>
			                            <div class="interiorTip_list_row_sub">${dto.created}</div>
			                            <div class="interiorTip_list_row_sub_hit"  align="left">조회수 &nbsp; ${dto.hitCount}</div>	
			                        </div>
		                        </c:if>
								<c:if test="${n.index!=0}">
			                        <div class="interiorTip_list_row" align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
			                            <div class="interiorTip_list_row_sub">${dto.category}</div>
			                            <div class="interiorTip_list_row_subject" align="left" style="padding-left: 10px;">
				                            <c:if test="${not empty categorys}">
				                                <a class="interiorTip_list_row_subject_a" href="${articleUrl}&num=${dto.num}&categorys=${categorys}">${dto.subject}</a>
				                            </c:if>
				                            <c:if test="${empty categorys}">
				                                <a class="interiorTip_list_row_subject_a" href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
				                            </c:if>
			                            </div>
			                            <div class="interiorTip_list_row_sub">${dto.userName}</div>
			                            <div class="interiorTip_list_row_sub">${dto.created}</div>
			                            <div class="interiorTip_list_row_sub_hit" align="left">조회수 &nbsp; ${dto.hitCount}</div>
			
			                        </div>
								</c:if>
	                        </c:forEach>
	
	                    </div>
	                </div>
	                <table style="width: 100%; border-spacing: 0px;">
	                    <tr height="35">
	                        <td align="center">
	                            ${dataCount==0?"등록된 게시물이 없습니다":paging }
	                        </td>
	                    </tr>
	                </table>
	
	                <div class="interiprTip_foot" style="width: 100%; margin: 10px auto; border-spacing: 0px;">
	                    <div class="interiprTip_foot_row">
	                        <div class="interiprTip_foot_row_reset" align="left" width="100">
	                            <button type="button" class="btn interiprTip_foot_row_button" onclick="javascript:location.href='${pageContext.request.contextPath}/interiorTip/list';">새로고침</button>
	                        </div>
	                        <div style="height: 40px;" >
	                            <form name="searchForm" action="${pageContext.request.contextPath }/interiorTip/list" style="height: 100%;" method="post">
									<select name="condition" class="selectField">
										<option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
										<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
										<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
										<option value="userName" ${condition=="userName"?"selected='selected'":""}>작성자</option>
										<option value="created" ${condition=="created"?"selected='selected'":""}>등록일</option>
									</select>
	                                <input type="text" name="keyword" value="${keyword}" class="boxTF interiprTip_foot_row_input">
	                                <button type="button" class="btn interiprTip_foot_row_button" onclick="searchList()">&nbsp;검 색&nbsp; </button>
	                            </form>
	                        </div>
	                        <div align="right" width="100">
	                            <button type="button" class="btn interiprTip_foot_row_button" onclick="javascript:location.href='${pageContext.request.contextPath}/interiorTip/created';">글올리기</button>
	                        </div>
	                    </div>
	                </div>
	            </div>
	
	        </div>
	    </div>

    </div>
</section>