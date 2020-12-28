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
        if( slides[sliderIndex-1]===undefined) {
        	return false;
        }
        slides[sliderIndex-1].style.display="block";
        setTimeout(showSlider,2500);
        
    }
});