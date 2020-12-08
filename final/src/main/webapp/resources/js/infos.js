
$(function(){
	
	$(".admin_content").hide();
	
	$("body").on("click", ".admin_subject", function() {
		//$(".replyAnswer").show();
		var $subject_show = $(this).closest("ul").children('.admin_content'); // next로 형제 요소를 찾는다
		var isVisible = $subject_show.is(":visible");//false
				
		if (isVisible) {
			$subject_show.hide();
		} else {
			$(".admin_content").hide();
			$subject_show.show();
		}	
	});	
	
	
});