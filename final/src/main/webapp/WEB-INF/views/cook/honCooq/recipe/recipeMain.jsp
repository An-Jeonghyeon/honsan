<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
function ajaxFun(url, method, dataType, query, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		success:function(data){
			fn(data);
		},
		error:function(e){
			console.log(e.responseText);
		}
	});
}

// 메모
// 검색을 전제로 하기 
// 게시판으로 넣고 싶으면 각각 테이블로 넣고 조인하면 되고 

$(function() {
	$("#btnJsonOk1").click(function() {
		// JSON으로 조리식품의 레시피 DB(공공데이터) 받기
		var url="{pageContext.request.contextPath}/cook/recipe/recipeList";
		var query="tmp=";
		
		var fn = function(data) {
			console.log(data);
		};
		
		ajaxFun(url, "get", "json", query, fn);
	});

	$("#btnJsonOk2").click(function() {
		// JSON으로 레시피 기본 정보(공공데이터) 받기
		var url="{pageContext.request.contextPath}/cook/recipe/recipeList";
		var query="tmp=";
		
		var fn = function(data) {
			console.log(data);
		};
		
		ajaxFun(url, "get", "json", query, fn);
	});
	
	
	
	
	function printRecipe(data) {
		
	}
	
});


</script>


<div class="body-container" style="margin:30px auto; width: 600px;">
    <div class="title">
        <h3>자바 XML 문서</h3>
    </div>
    
     <div style="width: 95%;margin-top: 5px; margin-bottom: 5px;">
     	<p style="padding: 5px;">
     		<button type="button" id="btnXmlOk" class="btn">XML로 받기</button>
     		<button type="button" id="btnJsonOk1" class="btn">JSON으로 받기 1</button>
     		<button type="button" id="btnJsonOk2" class="btn">JSON으로 받기 2</button>
     	</p>
     	<p style="padding: 5px;">
     		<button type="button" id="btnXmlZip" class="btn">우편번호-XML로 받기</button>
     		<button type="button" id="btnJsonZip" class="btn">우편번호-JSON으로 받기</button>
     	</p>
     	<p style="padding: 5px;">
     		<button type="button" id="btnWeather1" class="btn">날씨-초단기 실황 확인</button>
     		<button type="button" id="btnWeather2" class="btn">날씨-초단기 예보 확인</button>
     		<button type="button" id="btnWeather3" class="btn">날씨-동네 예보</button>
     	</p>
     </div>

     <div id="resultLayout" style="width: 95%;"></div>
</div>