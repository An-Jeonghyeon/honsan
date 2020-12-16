$(function(){
    $(".dress-TipMenu1 > a").click(function(){
        $(".dress-TipMenuBody1").css("background-color","#ededed80");
        $(".dress-TipMenuBody2").css("background-color","rgba(192, 226, 255, 0.523)")
    })
    $(".dress-TipMenu2 > a").click(function(){
        $(".dress-TipMenuBody2").css("background-color","#ededed80")
        $(".dress-TipMenuBody1").css("background-color","rgba(192, 226, 255, 0.523)")
    })
 })