$(function () {
    $(".dress-temper").css("color", "rgb(106, 198, 255)");
    $(".dress-temper").css("font-size", "44px");


    $(".dress-menuball").click(function () {
        alert('꺼저');
    });

    function scroll_follow(id) {
        $(window).scroll(function () {
            var position = $(document).scrollTop();
            $("#scroll").css('top', position + 300);
        });
    }
        scroll_follow("#scroll");      
})
$(function(){
    $( "#dialog" ).dialog({
        autoOpen: false,
        show: {
          effect: "blind",
          duration: 1000
        },
        hide: {
          effect: "explode",
          duration: 1000
        }
      });
   
      $( ".dress-Today-button" ).on( "click", function() {
        $( "#dialog" ).dialog( "open" );
      });
})