$(function(){
    $("html").on("mousewheel",function(e){
        var wheel=e.originalEvent.wheelDelta;
        if(wheel<0){
            $("h3").fadeIn(1000);
            $("small").fadeIn(1000);
        }
    })
})
