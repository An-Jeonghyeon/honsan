$(function(){
    
    $(".dress-TipMenu1 > a").click(function(){
        $(".dress-TipMenuBody1").css("background-color","rgb(201, 201, 201)");
        $(".dress-TipMenuBody2").css("background-color","rgb(233, 233, 233)")
    })
    $(".dress-TipMenu2 > a").click(function(){
        $(".dress-TipMenuBody2").css("background-color","rgb(201, 201, 201)")
        $(".dress-TipMenuBody1").css("background-color","rgb(233, 233, 233)");
    })
 })