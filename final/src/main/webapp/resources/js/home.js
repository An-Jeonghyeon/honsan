$(function(){
    var sliderIndex = 0;
    showSlider();
    
    function showSlider(){
        var i;
        var slides=document.getElementsByClassName("slide");
        for(i=0; i<slides.length;i++){
            slides[i].style.display="none";
        }
        sliderIndex++;
        if(sliderIndex>slides.length){
            sliderIndex=1;
        }
        slides[sliderIndex-1].css("display","block");
        setTimeout(showSlider,2500);
    }
})