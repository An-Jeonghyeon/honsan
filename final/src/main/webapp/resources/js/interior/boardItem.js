
        $(function () {
        var sel_files = [];

        $("body").on("change", "#mainImg_upload", function (e) {
            // $(".upload-path").val($(this).val().replace(/.*(\/|\\)/, '')); // 업로드한 파일명
            $(".leftbox_mainImg").find("img").remove();
            $("#mainImg_upload").parent().prependTo().css("background","none");
            
            // 사진이 없으면 ! 이거 표시 할수있으려나 
            // $("#ex7").firstChild().css("background", url('camera1.png'));

            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
            
            filesArr.forEach(function (f ) {
                // 이미지 파일이 아닌경우
                if (!f.type.match("image.*")) {
                    return;
                }             
                sel_files.push(f);
                
                var reader = new FileReader();
                reader.onload = function (e1 ) {
                    
                    var out = "<img class='leftbox_mainImg_img'  src='" + e1.target.result + "'>" ;
                    

                    $(".leftbox_mainImg").append(out);
                }
                
                reader.readAsDataURL(f);
            });

        });


    });



    $(function () {
        var sel_files = [];

        $("body").on("change", "#ex1", function (e) {
            // $(".upload-path").val($(this).val().replace(/.*(\/|\\)/, '')); // 업로드한 파일명
            $(".miribogi_img1").find("img").remove();
            $("#ex1").parent().css("background","none");
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
            
            filesArr.forEach(function (f ) {
                // 이미지 파일이 아닌경우
                if (!f.type.match("image.*")) {
                    return;
                }             
                sel_files.push(f);
                
                var reader = new FileReader();
                reader.onload = function (e1 ) {
                    
                    var out = "<img class='leftbox_subImg_obj_sub'  src='" + e1.target.result + "' onclick='$(this).remove();' >" ;
                    

                    $(".miribogi_img1").append(out);
                }
                
                reader.readAsDataURL(f);
            });

        });


    });

    $(function () {
        var sel_files = [];

        $("body").on("change", "#ex2", function (e) {
            // $(".upload-path").val($(this).val().replace(/.*(\/|\\)/, '')); // 업로드한 파일명
            $(".miribogi_img2").find("img").remove();
            $("#ex2").parent().css("background","none");
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
            
            filesArr.forEach(function (f ) {
                // 이미지 파일이 아닌경우
                if (!f.type.match("image.*")) {
                    return;
                }             
                sel_files.push(f);
                
                var reader = new FileReader();
                reader.onload = function (e1 ) {
                    
                    var out = "<img class='leftbox_subImg_obj_sub'  src='" + e1.target.result + "' onclick='$(this).remove();' >" ;
                    

                    $(".miribogi_img2").append(out);
                }
                
                reader.readAsDataURL(f);
            });

        });


    });

    $(function () {
        var sel_files = [];

        $("body").on("change", "#ex3", function (e) {
            // $(".upload-path").val($(this).val().replace(/.*(\/|\\)/, '')); // 업로드한 파일명
            $(".miribogi_img3").find("img").remove();
            $("#ex3").parent().css("background","none");
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
            
            filesArr.forEach(function (f ) {
                // 이미지 파일이 아닌경우
                if (!f.type.match("image.*")) {
                    return;
                }             
                sel_files.push(f);
                
                var reader = new FileReader();
                reader.onload = function (e1 ) {
                    
                    var out = "<img class='leftbox_subImg_obj_sub'  src='" + e1.target.result + "' onclick='$(this).remove();' >" ;
                    

                    $(".miribogi_img3").append(out);
                }
                
                reader.readAsDataURL(f);
            });

        });


    });

    $(function () {
        var sel_files = [];

        $("body").on("change", "#ex4", function (e) {
            // $(".upload-path").val($(this).val().replace(/.*(\/|\\)/, '')); // 업로드한 파일명
            $(".miribogi_img4").find("img").remove();
            $("#ex4").parent().css("background","none");
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
            
            filesArr.forEach(function (f ) {
                // 이미지 파일이 아닌경우
                if (!f.type.match("image.*")) {
                    return;
                }             
                sel_files.push(f);
                
                var reader = new FileReader();
                reader.onload = function (e1 ) {
                    
                    var out = "<img class='leftbox_subImg_obj_sub'  src='" + e1.target.result + "' onclick='$(this).remove();' >" ;
                    

                    $(".miribogi_img4").append(out);
                }
                
                reader.readAsDataURL(f);
            });

        });


    });

    $(function () {
        var sel_files = [];

        $("body").on("change", "#ex5", function (e) {
            // $(".upload-path").val($(this).val().replace(/.*(\/|\\)/, '')); // 업로드한 파일명
            $(".miribogi_img5").find("img").remove();
            $("#ex5").parent().css("background","none");
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
            
            filesArr.forEach(function (f ) {
                // 이미지 파일이 아닌경우
                if (!f.type.match("image.*")) {
                    return;
                }             
                sel_files.push(f);
                
                var reader = new FileReader();
                reader.onload = function (e1 ) {
                    
                    var out = "<img class='leftbox_subImg_obj_sub'  src='" + e1.target.result + "' onclick='$(this).remove();' >" ;
                    

                    $(".miribogi_img5").append(out);
                }
                
                reader.readAsDataURL(f);
            });

        });


    });


    $(function () {
        var sel_files = [];

        $("body").on("change", "#ex6", function (e) {
            // $(".upload-path").val($(this).val().replace(/.*(\/|\\)/, '')); // 업로드한 파일명
            $(".miribogi_img6").find("img").remove();
            $("#ex6").parent().css("background","none");
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
            
            filesArr.forEach(function (f ) {
                // 이미지 파일이 아닌경우
                if (!f.type.match("image.*")) {
                    return;
                }             
                sel_files.push(f);
                
                var reader = new FileReader();
                reader.onload = function (e1 ) {
                    
                    var out = "<img class='leftbox_subImg_obj_sub'  src='" + e1.target.result + "' onclick='$(this).remove();' >" ;
                    

                    $(".miribogi_img6").append(out);
                }
                
                reader.readAsDataURL(f);
            });

        });


    });

    $(function () {
        var sel_files = [];

        $("body").on("change", "#ex7", function (e) {
            // $(".upload-path").val($(this).val().replace(/.*(\/|\\)/, '')); // 업로드한 파일명
            $(".miribogi_img7").find("img").remove();
            $("#ex7").parent().css("background","none");
            
            // 사진이 없으면 ! 이거 표시 할수있으려나 
            // $("#ex7").firstChild().css("background", url('camera1.png'));

            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
            
            filesArr.forEach(function (f ) {
                // 이미지 파일이 아닌경우
                if (!f.type.match("image.*")) {
                    return;
                }             
                sel_files.push(f);
                
                var reader = new FileReader();
                reader.onload = function (e1 ) {
                    
                    var out = "<img class='leftbox_subImg_obj_sub'  src='" + e1.target.result + "' onclick='$(this).remove();' >" ;
                    

                    $(".miribogi_img7").append(out);
                }
                
                reader.readAsDataURL(f);
            });

        });


    });


    // $(function(){
    //     $("#tagButton").click(function(){
    //        var tagContent = $("#rdTag").val();
    //        var widthSize =  tagContent.length * 15;
    //        $("#rdTag").val("#");

    //        var out = "<li class='leftbox_tag_li'> <input type='text' class='leftbox_tag_li_a' style='width:"+widthSize+"px;'"+
    //        " value=' "+ tagContent+"' > </li>";

    //         $(".leftbox_tag_ul").append(out);
            
    //     });
    // });

    $(function(){
        $("#rdTag").on("keydown" , function(e) {
           if(e.keyCode==13) {
                var tagContent = $("#rdTag").val();
                var widthSize =  tagContent.length * 15;
                $("#rdTag").val("#");

                var out = "<li class='leftbox_tag_li' onclick='$(this).remove();' > <input name='category' type='text' class='leftbox_tag_li_a' style='width:"+widthSize+"px;'"+
                " value='"+ tagContent+"' > </li>";

                $(".leftbox_tag_ul").append(out);


           }
            
        });
    });

//인풋 태그 엔터키 입력시 submit 비활성화 
//    $(function(){
//        $('.input-form').keydown(function() {
//            if (event.keyCode === 13) {
//            event.preventDefault();
//             }
//        });
//    });
    


    // 댓글 높이 자동 조절 
    function resize(obj) {
    obj.style.height = "1px";
    obj.style.height = (12+obj.scrollHeight)+"px";
}