$(function () {
    $("body").on("click", ".ILikeHeart", function () {
        $(".fullLikeHeart").show();
    })
    $("body").on("click", ".fullLikeHeart", function () {
        $(this).hide();

    })

    $(".RelyWrite").on("click", function () {
        $(".ReplyAnswerBody").slideDown();
    })

    $(".ReplyListUserX").on("click", function () {
        $(".ReplyAnswerBody").slideUp();
    })

    $("body").on("click",".ReplySUb > span",function(){
        if($("form[name=ReplayListForm]").is(':visible')==false){
             $(".ReplySUbDown").css("transform","rotate(180deg)");
             $("form").slideDown(1000);
        }else{
            $(".ReplySUbDown").css("transform","rotate(360deg)");
            $("form").slideUp(1000);
        }
    })

})
