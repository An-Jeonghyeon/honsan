$(function () {
    $(".dress-temper").css("color", "rgb(106, 198, 255)");
    $(".dress-temper").css("font-size", "44px");


    

    function scroll_follow(id) {
        $(window).scroll(function () {
            var position = $(document).scrollTop();
            $("#scroll").css('top', position + 300);
        });
    }
        scroll_follow("#scroll");      
})
$(function(){
	$(".dress-menuball").click(function(){
		
		$( "#dialog" ).dialog({
			 title:"지역별 날씨 현황",
			 width:1000,
			 height: 1000,
             modal:false,
            
		});
	});
});