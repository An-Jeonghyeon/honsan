$(function(){
    $("html").on("mousewheel",function(e){
        var wheel=e.originalEvent.wheelDelta;
        if(wheel<0){
            $("h3").fadeIn(1000);
            $("small").fadeIn(1000);
        }
    })
})
function sendOk(){
    var f= document.writeForm;
    if(!f.subject.value){
        alert("유효성 검사 제목 임시");
        f.subject.focus();
        return ;
    }
    if(!f.content.value){
        alert("유효성 검사 내용 임시");
        f.content.focus();
        return;
    }

     f.submit();
}