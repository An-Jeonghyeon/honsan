<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/room/roomtip.css"
	type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<style type="text/css">
.ui-widget-header {
	background: none;
	border: none;
	height:35px;
	line-height:35px;
	border-bottom: 1px solid #cccccc;
	border-radius: 0px;
}

.alert-info {
    border: 1px solid #9acfea;
    border-radius: 4px;
    background-color: #d9edf7;
    color: #31708f;
    padding: 15px;
    margin-top: 10px;
    margin-bottom: 20px;
}
/*------------------------------------------------*/
.guest-write {
    border: #d5d5d5 solid 1px;
    padding: 10px;
    min-height: 50px;
}

.guest-delete, .guest-notify{
	cursor:pointer;
}
.guest-delete:hover, .guest-notify:hover{
	color:#F28011;
	text-decoration: underline;
}
.guest-more:hover{
	cursor:pointer;
	color: #2524FF;
}
</style>


 <script type="text/javascript">
 $(function(){
		var categoryNum = "${categoryNum}";
		var pageNo="${pageNo}";
		if(pageNo=="") {
			pageNo=1;
		}
		$("#tab-"+categoryNum).addClass("active");
		listPage(pageNo);

		$("ul.tabs li").click(function() {
			categoryNum = $(this).attr("data-categoryNum");
			
			$("ul.tabs li").each(function(){
				$(this).removeClass("active");
			});
			
			$("#tab-"+categoryNum).addClass("active");
			
			listPage(1);
		});
	});
 </script>



<script type="text/javascript">
function ajaxJSON(url, method, query, fn){
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:"json",
		success:function(data){
			fn(data);
		},
		beforeSend:function(jqXHR){
			jqXHR.setRequestHeader("AJAX",true);
		},
		error:function(jqXHR){
			if(jqXHR.status===403){
				login();
				return false;
			}
			console.log(jqXHR.responseText);
		}
		
	});
	
}
function ajaxHTML(url, method, query, selector){
	$.ajax({
		type:method,
		url:url,
		data:query,
		success:function(data){
			$(selector).html(data); //서버가 html을 돌려줌.html을 selector에 넣음
		},
		beforeSend:function(jqXHR){
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR){
			if(jqXHR.status===403){
				login();
				return false;
			}
			
			console.log(jqXHR.responseText);
		}
	});
}




function listPage(page){
	var $tab = $(".tabs .active");
	var categoryNum = $tab.attr("data-categoryNum");
	
	var url = "${pageContext.request.contextPath}/room/list";
	var query="pageNo="+page+"&categoryNum="+categoryNum;

	var fn=function(data){
		printGuest(data);
	}
	var selector = "#tab-content";
	   
	ajaxHTML(url, "get" , query , selector);
}


function sendGuest() {
	if(! $("#content").val().trim()){
		$("#content").focus();
		return;
	}
	
	var url="${pageContext.request.contextPath}/room/insert";
	var query=$("form[name=roomtipForm]").serialize();
	
	var fn = function(data){ //함수 생성
		//var state = data.state;
		//console.log(state);
		$("#content").val("");
		
		listPage(1);
	};
	
	ajaxJSON(url, "post", query, fn);
}
$(function(){
    
	   $("body").on("click", ".guest-delete", function(){
	      if(!confirm("게시글을 삭제하시곘습니까 ? ")){
	         return false;
	      }
	      var num = $(this).attr("data-num");
	      var categoryNum = $(this).attr("data-categoryNum");
	      var page = $(this).attr("data-pageNo");
	      var url = "${pageContext.request.contextPath}/room/delete";
	      var query="pageNo="+page+"&categoryNum="+categoryNum+"&num="+num;
	      
	      var fn = function(data){
	         //listPage(page);
	    	  listPage(1);
	      };
	      
	      ajaxJSON(url , "post", query , fn);
	   });
	});


</script>

<div class="body-container">
	<div style="height: 1000px;">
		<div id="wrapper">    
			    <div class="body-title">
			        <h3><i class="fas fa-exclamation-triangle"></i> 부동산 팁 </h3>
			    </div>
			    
				<div class="alert-info">
				   <i class="fas fa-info-circle"></i>
				     방을 구할 때 알아 두어야 할 유용한 팁을 서로 공유해주세요.
				</div>
			    
			    <div>
			            <div style="clear: both;">
				           <ul class="tabs">
				           	   <c:forEach var="dto" items="${listCategory}">
						       		<li id="tab-${dto.categoryNum}" data-categoryNum="${dto.categoryNum}">${dto.category}</li>
				           	   </c:forEach>
						   </ul>
					   </div>
					   <div id="tab-content" style="clear:both; padding: 20px 10px 0px;"></div>
			    </div>
		
		
		</div>
	</div>
</div>

