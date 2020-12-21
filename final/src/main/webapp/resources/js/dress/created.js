$(function() {
	$("html").on("mousewheel", function(e) {
		var wheel = e.originalEvent.wheelDelta;
		if (wheel < 0) {
			$("h3").fadeIn(1000);
			$("small").fadeIn(1000);
		}
	})
	var tt = $(".InputTag");
	$(".InputTag").click(function() {
		tt.val("#");
	})

})

	


var tag = [];
var counter = 0;


function addTag (value) {
    tag[counter] = value; 
    counter++; 
    console.log(tag);
    console.log($("#rdTag").val(tag))
}
function marginTag () {
    return Object.values(tag).filter(function (word) {
        return word !== "";
    });
}

function TagbtnSend() {
    var tage = $(".InputTag").val();
    
    $(".dress-TagSpanBody").append("<div class='TagAbody' style='display:inline-block;'><a href='' class='dress-TagA' style='height: 20px; padding:0 5px 0 5px;box-sizing: border-box;  background-color:rgba(184, 224, 255, 0.461);  text-align:center; display:inline-block; border-radius:5px; color:rgba(var(--fe0,0,55,107),1); margin: 0 1px 0 5px; text-decoration:none;' value='" + tage + "'>" + tage + "</a><span class='CancelTag' style='box-sizing:border-box; background-color:rgba(184, 224, 255, 0.461); width: 20px;height: 20px;display: inline-block;text-align: center;border-radius: 5px;color: rgb(0, 0, 0);font-weight: 900; margin-right:10px; cursor: pointer;'>x</span>");
    addTag($(".InputTag").val())
    
    $(".InputTag").val("");
    var cnt = $(".dress-TagA").length;
    if (cnt == 5 || cnt > 5) {
        $(".InputTag").prop("disabled", true)
        $(".Tag-btn").prop("disabled", true)
    }


    $(".CancelTag").on("click", function () {
        var p = $(this).parent();
        var cnt = $(".dress-TagA").length;
        if (cnt <= 5) {
            $(".InputTag").attr("disabled", false)
            $(".Tag-btn").attr("disabled", false)
        }
        p.remove();
        console.log(cnt);
    })
}

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
//        var value= marginTag ();
       $("#rdTag").val(tag)

       
         f.submit();
    }



