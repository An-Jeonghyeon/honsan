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

$(function() {
	$("#btnJsonOk1").click(function() {
		// JSON으로 조리식품의 레시피 DB(공공데이터) 받기
		var url="{pageContext.request.contextPath}/cook/recipe/recipeList";
		var query="tmp=";
		
		var fn = function(data) {
			console.log(data);
		};
		
		ajaxFun(url, "get", "xml", query, fn);
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
     	<button type="button" id="btnJsonOk1" class="btn">JSON으로 받기 1</button>
     	<button type="button" id="btnJsonOk2" class="btn">JSON으로 받기 2</button>
     	<button type="button" id="btnXmlOk1" class="btn">XML로 받기 1</button>
     	<button type="button" id="btnXmlOk2" class="btn">XML로 받기 2(우편번호-XML로 받기)</button>
     	<button type="button" id="btnData1" class="btn">공공 API(날씨-초단기 실황 확인)</button>
     	<button type="button" id="btnData2" class="btn">공공 API(날씨-초단기 예보 확인)</button>
     </div>

     <div id="resultLayout" style="width: 95%;"></div>
</div>