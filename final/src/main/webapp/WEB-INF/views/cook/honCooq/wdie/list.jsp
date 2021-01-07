<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cook/honCooq.css" type="text/css">
 --%>


<script type="text/javascript">

$(function() {
	var color = '#'; 
	var letters = ['f6c9cc', 'a8c0c0', 'FEBF36', 'FF7238', '6475A0', 'acc7bf', 'c37070', 'eae160', 'bf7aa3', 'd7d967', 'a3d2ca', 'ff8e71', 'c6ebc9', 'a7c5eb', '949cdf', 'ffb396', 'c5a880']; 
	$(".cookTip_content-box .cookTip_content").each(function(){
		color = '#';
		color += letters[Math.floor(Math.random() * letters.length)]; 
		$(this).css("background", color);
	});
});

</script>

<script type="text/javascript">
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

function ajaxHTML(url, method, query, selector) {
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

</script>

	<div class="wdie_list-body">
		
	</div>
    
    <div class="cookTip_floating-button">
    	<a href="${pageContext.request.contextPath}/cook/honCooq/cookTip/created"><span>
    		<i class="fas fa-pen"></i> 오늘 뭐 먹지?</span>
    	</a>
    </div>



