
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

$(function(){
	if($("#interiorLikeCount").attr("data-userLike")=="1") { // 데이터값이 1이면 
		$("#thumbs").removeClass("far").addClass("fas"); // 클래스명 삭제 , 삽입으로 변경 
	}


	$(".btnSendInteriorLike").click(function(){
		var userLike=$("#interiorLikeCount").attr("data-userLike"); // 스팬 데이터값이 0이면 
		if(userLike=="0") {
			var url="${pageContext.request.contextPath}/interior/insertInteriorLike";
			var num="${dto.num}"; 
			// var query={num:num}; 이렇게 써도 아래와 같은 의미
			var query="num="+num; 
			// ajoxjson 좋아요 +1 DB작업 처리 후 결과를 state 에 반환 
			var fn = function(data){
				var state=data.state;
				if(state==="true") {
					var count = data.interiorLikeCount;
					$("#interiorLikeCount").text(count);
					$("#interiorLikeCount").attr("data-userLike", "1"); //삽입후 이미지변경을위해 1로 변경
					$("#thumbs").removeClass("far").addClass("fas"); // 1로변경되었으니 이미지 변경 
					
				} else if(state==="false") {					
					alert("좋아요 추가에 문제가 발생했습니다.");
				}
			};		
		} else {			//이미 좋아요가 눌려져있을경우 , 데이터가 1인경우 
			var url="${pageContext.request.contextPath}/interior/deleteInteriorLike";
			var num="${dto.num}";
			var query="num="+num;
			//	좋아요 -1 DB작업 처리 후 결과를 state 에 반환 
			var fn = function(data){
				var state=data.state;
				if(state==="true") {
					var count = data.interiorLikeCount;
					$("#interiorLikeCount").text(count);
					$("#interiorLikeCount").attr("data-userLike", "0"); //취소 후 라서 1을 0으로 변경
					$("#thumbs").removeClass("fas").addClass("far"); // 이미지도 변경 
	
				} else if(state==="false") {
					alert("좋아요 삭제에 문제가 발생했습니다.");
				}
			};								
		}	
		ajaxJSON(url, "post", query, fn);   
	});
	
});
