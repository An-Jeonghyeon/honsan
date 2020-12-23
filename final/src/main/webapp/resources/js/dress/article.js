$(function() {
	$("body").on("click", ".ILikeHeart", function() {
		$(".fullLikeHeart").show();
	})
	$("body").on("click", ".fullLikeHeart", function() {
		$(this).hide();

	})

	$(".RelyWrite").on("click", function() {
		$(".ReplyAnswerBody").slideDown();
	})

	$(".ReplyListUserX").on("click", function() {
		$(".ReplyAnswerBody").slideUp();
	})

	$("body").on("click", ".ReplySUb > span", function() {
		if ($("form[name=ReplayListForm]").is(':visible') == false) {
			$(".ReplySUbDown").css("transform", "rotate(180deg)");
			$("form").slideDown(1000);
		} else {
			$(".ReplySUbDown").css("transform", "rotate(360deg)");
			$("form").slideUp(1000);
		}
	})

})
$(function() {
	var counter = 0;
	$(".dress-thumbs-up").click(
			function() {

				if (counter >= 1) {
					confirm("공감을 취소 하시겠습니까?")
					$(this).css("background", "white")
					$(this).css("box-shadow",
							"0px 0px 5px  rgba(128, 128, 128, 0.529)")
					$(this).css("color", "rgb(136, 136, 136)")
					counter--;
					console.log(counter)
				} else {
					confirm("공감을 누르시겠습니까?")
					$(this).css("background", "rgb(174, 174, 174)")
					$(this).css("box-shadow",
							"0px 0px 15px  rgba(202, 164, 255, 0.529)")
					$(this).css("color", "aliceblue")
					counter++;
					console.log(counter)
				}
			})
})

