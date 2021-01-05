<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/room/room.css"
	type="text/css">

<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha'
	rel='stylesheet' type='text/css'>

<script type="text/javascript">
function deleteBoard(num) {
<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin' }">
	if(confirm("게시물을 삭제 하시겠습니까 ?")) {
		var q="num="+num+"&${query}";
		var url="${pageContext.request.contextPath}/room/roomDelete?"+q;
		location.href=url;
	}
</c:if>

<c:if test="${sessionScope.member.userId!=dto.userId && sessionScope.member.userId!='admin' }"> 
	alert("게시글을 삭제할 수 없습니다.");
</c:if>

}

function updateBoard(num) {
	<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin' }">
		var q="num="+num+"&page=${page}";
		var url="${pageContext.request.contextPath}/room/roomUpdate?"+q;
		location.href=url;
	</c:if>
	<c:if test="${sessionScope.member.userId!=dto.userId && sessionScope.member.userId!='admin' }">
		alert("게시글을 수정할 수 없습니다.");
	</c:if>	
}

</script>

<script type="text/javascript">
//답글
//json으로 전송하는 함수만들어둠
function ajaxJSON(url, method, query, fn) { 
	$.ajax({
		type:method
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			fn(data);
		}
		,beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status===403) {
	    		login();
	    		return false;
	    	}
	    	
	    	console.log(jqXHR.responseText);
	    }
	});
}
//html로 전송하는 ajax
function ajaxHTML(url, method, query, selector){
	$.ajax({
		type:method
		,url:url
		,data:query
		,success:function(data) {
			$(selector).html(data);
		}
		,beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status===403) {
	    		login();
	    		return false;
	    	}
	    	
	    	console.log(jqXHR.responseText);
	    }
	});
}
$(function(){
	listPage(1);
});

function listPage(page){
	var url = "${pageContext.request.contextPath}/room/listReplys";
	var query = "num=${dto.num}&pageNo="+page;
	var selector = "#hreplyList2";

	ajaxHTML(url, "get", query, selector);
};
$(function(){
	$("#hReplybtn").click(function(){
		var num="${dto.num}";
		var $div = $(this).closest("#hreplycontent");
		var content = $div.find("textarea").val().trim();
		//console.log(content);
		
		if(! content) {
			$div.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		var url="${pageContext.request.contextPath}/room/insertReply";
		var query = "num="+num+"&content="+content+"&answer=0";
		
		//성공시
		var fn = function(data){
			$div.find("textarea").val("");
			
			var state= data.state;
			if(state==="true") {
				listPage(1);				
			} else if(state==="false") {
				//console.log(data);			
				alert("댓글 등록에 실패하였습니다.");				
			}
		};
			
		ajaxJSON(url, "post", query, fn);
	});
});

//답글 버튼(댓글별 답글 등록폼 및 답글리스트)
$(function(){
	$("body").on("click", ".h-btnReplyAnswerLayout", function(){
		var $trReplyAnswer = $(this).closest("tr").next();
		
		var isVisible = $trReplyAnswer.is(':visible');
		var replyNum = $(this).attr("data-replyNum");
			
		if(isVisible) {
			$trReplyAnswer.hide();
		} else {
			$trReplyAnswer.show();
            
			// 답글 리스트
			listReplyAnswer(replyNum);
			
			// 답글 개수
			countReplyAnswer(replyNum);
		}
	});
	
});

//댓글 삭제(대댓글도 포함)
$(function(){
	$("body").on("click", ".h-deleteReply", function(){
		if(! confirm("게시물을 삭제하시겠습니까 ? ")) {
		    return false;
		}
		
		var replyNum=$(this).attr("data-replyNum");
		var page=$(this).attr("data-pageNo");
		
		var url="${pageContext.request.contextPath}/room/deleteReply";
		var query="replyNum="+replyNum+"&mode=reply";
		
		var fn = function(data){
			listPage(page);
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});

//     ----대댓글 ----
//댓글별 대댓글 리스트
function listReplyAnswer(answer) {
	var url="${pageContext.request.contextPath}/room/listReplyAnswer";
	var query="answer="+answer;
	var selector="#listReplyAnswer"+answer;
	
	ajaxHTML(url, "get", query, selector);
}
//댓글별 대댓글 갯수
function countReplyAnswer(answer) {
	var url="${pageContext.request.contextPath}/room/replyAnswerCount";
	var query="answer="+answer;
	
	var fn = function(data){
		var count=data.count;
		var vid="#answerCount"+answer;
		$(vid).html(count);
	};
	
	ajaxJSON(url, "post", query, fn);
}
//답글 등록 
$(function() {
	$("body").on("click", ".h-sendreply2btn", function() {
		var num = "${dto.num}";
		var replyNum = $(this).attr("data-replyNum");
		var $td = $(this).closest("td");
		
		var content = $td.find("textarea").val().trim()
		if(! content) {
			$td.find("textarea").focus();			
			return false;			
		}
		
		content = encodeURIComponent(content);
		
		var url="${pageContext.request.contextPath}/room/insertReply";
		var query="num="+num+"&content="+content+"&answer="+replyNum;
		
		var fn = function(data){
			$td.find("textarea").val("");
			
			var state=data.state;
			if(state==="true") {
				listReplyAnswer(replyNum);
				countReplyAnswer(replyNum);
			}
		};
		
		ajaxJSON(url, "post", query, fn);
		
	});
});

//대댓글 삭제 
$(function(){
	$("body").on("click", ".deleteReplyAnswer", function(){
		if(! confirm("게시물을 삭제하시겠습니까 ? ")) {
		    return;
		}
		
		var replyNum=$(this).attr("data-replyNum");
		var answer=$(this).attr("data-answer");
		
		var url="${pageContext.request.contextPath}/room/deleteReply";
		var query="replyNum="+replyNum+"&mode=answer";
		
		var fn = function(data){
			listReplyAnswer(answer);
			countReplyAnswer(answer);
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});





</script>

<hr>
<div class="body-container" style="margin-top: 200px;">
	<div
		style="width: 1000px; margin: 0px auto; padding-top: 100px; padding-bottom: 100px;">
		<!-- 사진이 들어가는 곳 -->
		<div class="imagediv" style="margin: 10px auto 50px; height: 500px;">


			<div id="wrapper">
				<div id="slider-wrap">
					<ul id="slider">

						<li>
							<div>
								<h3>메인사진</h3>
								<span>main image</span>
							</div> <img
							src="${pageContext.request.contextPath}/uploads/room/${dto.mainimg}">
						</li>

						<c:forEach var="vo" items="${listFile}" varStatus="status">

							<li>
								<div>
									<h3>#${status.count }</h3>
									<span>#${status.count }</span>
								</div> <img
								src="${pageContext.request.contextPath}/uploads/room/${vo.saveFile}">
							</li>

						</c:forEach>


					</ul>

					<!--controls-->
					<div class="btns" id="next">
						<i class="fa fa-arrow-right"></i>
					</div>
					<div class="btns" id="previous">
						<i class="fa fa-arrow-left"></i>
					</div>
					<div id="counter"></div>

					<div id="pagination-wrap">
						<ul>
						</ul>
					</div>
					<!--controls-->

				</div>

			</div>







		</div>

		<!-- 방 상세 정보 -->
		<div class="roomdetaildiv">
			<div class="linediv">
				<p class="listnum">등록 번호 : ${dto.num }</p>
				<p class="roomtype">${dto.roomtype }</p>
			</div>
			<hr>
			<div class="linediv">
				<table style="width: 100%; margin: 15px auto; border-spacing: 0px;">
					<tr>
						<td style="padding: 0 20px 0 20px; width: 40%;">
							<div style="height: 70px;">
								<p class="subtitles">전용 면적</p>
								<p class="firstexpl">${dto.m2}
									m<sup>2</sup> / ${dto.pyeoug} 평
								</p>
							</div>
						</td>
						<td style="padding: 0 20px 0 50px; width: 30%;">
							<div style="height: 70px;">
								<p class="subtitles">
									<c:if test="${dto.mrent>0 }">보증금 / 월세</c:if>
									<c:if test="${dto.mrent==0 }">전세</c:if>
								</p>
								<p class="firstexpl">${dto.depo}/ ${dto.mrent}</p>
							</div>
						</td>
						<td style="padding: 0 20px 0 20px; width: 30%;">
							<div style="height: 70px;">
								<p class="subtitles">전체 층수 / 해당 층수</p>
								<p class="firstexpl">${dto.totfloor} / ${dto.corfloor}</p>
							</div>
						</td>

					</tr>
				</table>
			</div>

			<hr>

			<div class="linediv">
				<table class="secondtable"
					style="width: 100%; margin: 15px auto; border-spacing: 0px;">
					<tr height="40">
						<td style="width: 20%; border-top: 1px solid gray;">주차</td>
						<td style="width: 80%; border-top: 1px solid gray;"><c:if
								test="${dto.park==1 }">가능</c:if> <c:if test="${dto.park==0 }">불가능</c:if>
						</td>
					</tr>
					<tr height="40">
						<td style="width: 20%">엘리베이터</td>
						<td style="width: 80%;"><c:if test="${dto.elev==1 }">가능</c:if>
							<c:if test="${dto.elev==0 }">불가능</c:if></td>
					</tr>
					<tr height="40">
						<td style="width: 20%">입주가능일</td>
						<td style="width: 80%;">${dto.movedate }</td>
					</tr>
					<tr height="40">
						<td style="width: 20%">주소</td>
						<td style="width: 80%;">${dto.addr1 } &nbsp; ${dto.addr2 }</td>
					</tr>
				</table>
			</div>

			<hr>

			<div class="linediv">
				<p class="subtitles">관리비 &nbsp;&nbsp;| &nbsp;&nbsp;
					${dto.adcost} 만원</p>
				<br>
				<p>관리비 포함 항목</p>
				<c:if test="${not empty aditems}">
					<c:forEach var="list" items="${aditems}">

						<c:if test="${fn:contains(list, '없음')!=false}">
						(전기, 가스, 수도, 인터넷, 티비 별도)
					</c:if>

						<c:if test="${fn:contains(list, '없음')!=true}">
							<div class="option">
								<c:if test="${fn:contains(list, '전기')}">
									<img alt=""
										src="${pageContext.request.contextPath}/resources/images/room/elec.png">
								</c:if>
								<c:if test="${fn:contains(list, '가스')}">
									<img alt=""
										src="${pageContext.request.contextPath}/resources/images/room/ggs.png">
								</c:if>
								<c:if test="${fn:contains(list, '인터넷')}">
									<img alt=""
										src="${pageContext.request.contextPath}/resources/images/room/internet.png">
								</c:if>
								<c:if test="${fn:contains(list, '수도')}">
									<img alt=""
										src="${pageContext.request.contextPath}/resources/images/room/water.png">
								</c:if>
								<c:if test="${fn:contains(list, 'TV')}">
									<img alt=""
										src="${pageContext.request.contextPath}/resources/images/room/telev.png">
								</c:if>
								<p>${list}</p>
							</div>
						</c:if>


					</c:forEach>
				</c:if>
			</div>

			<hr>

			<!-- 스크립트에서 split으로 배열에 넣어서 여기서 foreach 로 돌려서 하나씩 비교? -->
			<div class="linediv">
				<p class="subtitles" style="margin: 10px;">옵션</p>

				<c:if test="${not empty options}">
					<c:forEach var="list" items="${options}">
						<c:if test="${fn:contains(list, '없음')!=false}">
							옵션이 없습니다
						</c:if>

						<c:if test="${fn:contains(list, '없음')!=true}">
							<div class="option">
								<c:if test="${fn:contains(list, '에어컨')}">
									<img alt=""
										src="${pageContext.request.contextPath}/resources/images/room/acon.png">
								</c:if>
								<c:if test="${fn:contains(list, '침대')}">
									<img alt=""
										src="${pageContext.request.contextPath}/resources/images/room/bed.png">
								</c:if>
								<c:if test="${fn:contains(list, '책장')}">
									<img alt=""
										src="${pageContext.request.contextPath}/resources/images/room/books.png">
								</c:if>
								<c:if test="${fn:contains(list, '옷장')}">
									<img alt=""
										src="${pageContext.request.contextPath}/resources/images/room/clothestong.png">
								</c:if>
								<c:if test="${fn:contains(list, '책상')}">
									<img alt=""
										src="${pageContext.request.contextPath}/resources/images/room/desk.png">
								</c:if>
								<c:if test="${fn:contains(list, '가스레인지')}">
									<img alt=""
										src="${pageContext.request.contextPath}/resources/images/room/gas.png">
								</c:if>
								<c:if test="${fn:contains(list, '인덕션')}">
									<img alt=""
										src="${pageContext.request.contextPath}/resources/images/room/induc.png">
								</c:if>
								<c:if test="${fn:contains(list, '냉장고')}">
									<img alt=""
										src="${pageContext.request.contextPath}/resources/images/room/nag.png">
								</c:if>
								<c:if test="${fn:contains(list, '전자레인지')}">
									<img alt=""
										src="${pageContext.request.contextPath}/resources/images/room/range.png">
								</c:if>
								<c:if test="${fn:contains(list, '세탁기')}">
									<img alt=""
										src="${pageContext.request.contextPath}/resources/images/room/setac.png">
								</c:if>
								<c:if test="${fn:contains(list, '신발장')}">
									<img alt=""
										src="${pageContext.request.contextPath}/resources/images/room/sinbal.png">
								</c:if>
								<c:if test="${fn:contains(list, '싱크대')}">
									<img alt=""
										src="${pageContext.request.contextPath}/resources/images/room/sink.png">
								</c:if>

								<p>${list}</p>
							</div>
						</c:if>


					</c:forEach>
				</c:if>


			</div>

			<hr>

			<div class="linediv">
				<p class="subtitles">상세 설명</p>
				<p>${dto.content }</p>
			</div>

			<hr>

			<div class="linediv">
			
			
				<div id="map" style="width: 100%; height: 200px;"></div>
				
				
				
			</div>

		</div>

		<hr>

		<div class="btndiv">
			<table style="width: 100%; height:100px; margin: 15px auto; border-spacing: 0px;">
				<tr>
					<td width="300" align="left">
						<button type="button" class="btn"
							onclick="updateBoard('${dto.num}');">수정</button>
						<button type="button" class="btn"
							onclick="deleteBoard('${dto.num}');">삭제</button>
					</td>

					<td align="right">
						<button type="button" class="btn"
							onclick="javascript:location.href='${pageContext.request.contextPath}/room/roomlist?${query}';">리스트</button>
					</td>
				</tr>
			</table>

		</div>

<hr>

		<div class="h-ReplyBody">
	            <div class="h-ReplyContentBox" id="hreplycontent">
	                <span>${sessionScope.member.userId}</span>
	                <textarea name="" id="" placeholder="댓글을 남겨보세요"></textarea>
	                <div class="h-ReplySubmitButton">
	                    <button class="h-Replybtn" id="hReplybtn" type="button">등록</button>
	                </div>
	            </div>
		        <div class="h-ReplyList">
		            <div class="h-replyList2" id="hreplyList2">
		                
		            </div>
		        </div>
	        </div>

	</div>
	<hr>
</div>


<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dd27106c5a866b254e4716fef94d13ad&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center : new daum.maps.LatLng(36.633535, 127.425882), // 지도의 중심좌표
    level : 4
// 지도의 확대 레벨
};

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

var myAddress = [
        "${dto.addr1}"];

function myMarker(number, address) {
    // 주소로 좌표를 검색합니다
    geocoder
            .addressSearch(
                    //'주소',
                    address,
                    function(result, status) {
                        // 정상적으로 검색이 완료됐으면 
                        if (status === daum.maps.services.Status.OK) {

                            var coords = new daum.maps.LatLng(
                                    result[0].y, result[0].x);

                            // 결과값으로 받은 위치를 마커로 표시합니다
                            var marker = new daum.maps.Marker({
                                map : map,
                                position : coords
                            });

                            // 인포윈도우로 장소에 대한 설명을 표시합니다
                            var infowindow = new daum.maps.InfoWindow(
                                    {
                                        content : '<div style="text-align:center;padding:3px 0;">${dto.addr1}</div>'
                                    });
                            infowindow.open(map, marker);

                            // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                            var content = '<div class="customoverlay">'
                                    + '    <span class="title">'
                                    +'</span>'
                                    + '</div>';

                            // 커스텀 오버레이가 표시될 위치입니다 
                            var position = new daum.maps.LatLng(
                                    result[0].y, result[0].x);

                            // 커스텀 오버레이를 생성합니다
                            var customOverlay = new daum.maps.CustomOverlay(
                                    {
                                        map : map,
                                        position : position,
                                        content : content,
                                        yAnchor : 1
                                    });

                            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                            map.setCenter(coords);
                        }
                    });
}

for (i = 0; i < myAddress.length; i++) {
    myMarker(i + 1, myAddress[i]);
}
    </script>




<script type="text/javascript">
//current position
var pos = 0;
//number of slides
var totalSlides = $('#slider-wrap ul li').length;
//get the slide width
var sliderWidth = $('#slider-wrap').width();


$(document).ready(function(){
  
  
  /*****************
   BUILD THE SLIDER
  *****************/
  //set width to be 'x' times the number of slides
  $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
  
    //next slide  
  $('#next').click(function(){
    slideRight();
  });
  
  //previous slide
  $('#previous').click(function(){
    slideLeft();
  });
  
  
  
  /*************************
   //*> OPTIONAL SETTINGS
  ************************/
  //automatic slider
  var autoSlider = setInterval(slideRight, 3000);
  
  //for each slide 
  $.each($('#slider-wrap ul li'), function() { 

     //create a pagination
     var li = document.createElement('li');
     $('#pagination-wrap ul').append(li);    
  });
  
  //counter
  countSlides();
  
  //pagination
  pagination();
  
  //hide/show controls/btns when hover
  //pause automatic slide when hover
  $('#slider-wrap').hover(
    function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
    function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
  );
  
  

});//DOCUMENT READY
  


/***********
 SLIDE LEFT
************/
function slideLeft(){
  pos--;
  if(pos==-1){ pos = totalSlides-1; }
  $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));  
  
  //*> optional
  countSlides();
  pagination();
}


/************
 SLIDE RIGHT
*************/
function slideRight(){
  pos++;
  if(pos==totalSlides){ pos = 0; }
  $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
  
  //*> optional 
  countSlides();
  pagination();
}



  
/************************
 //*> OPTIONAL SETTINGS
************************/
function countSlides(){
  $('#counter').html(pos+1 + ' / ' + totalSlides);
}

function pagination(){
  $('#pagination-wrap ul li').removeClass('active');
  $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
}

</script>
