
//중복확인
var id_check = false;

function userIdCheck() {
	var str = $("#userId").val();
	str = str.trim();
	if(!/^[a-zA-Z0-9]{4,12}$/i.test(str)) { 
		$("#userId").focus();
		$("#userId").val("");
		$("#help_id").css("color","red");
		return;
	}
	
	$("#help_id").css("color","black");
	var url="/app/member/userIdCheck";
	var q="userId="+str;
	
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,success:function(data) {
			var p=data.passed;
			if(p=="true") {
	        	 alert("사용하실 수 있는 아이디입니다.");
	        	 id_check = true;
			} else {
	         	alert("중복된 아이디가 존재합니다.");
				$("#userId").val("");
				$("#userId").focus();
				id_check = false;
			}
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});
}

//유효성검사
function memberOk() {
    var f = document.memberForm;
    var str;

    str = f.userId.value;
    str = str.trim();
    if(!str) {
        alert("아이디를 입력하세요.");
        f.userId.focus();
        return;
    }
    if(!/^[a-zA-Z0-9]{4,12}$/i.test(str) ) { 
        alert("아이디는 4~12자이며 영문, 숫자를 조합해서 사용해주세요.");
        f.userId.focus();
        return;
    }
    f.userId.value = str;
    if(id_check==false) {
        alert("아이디 중복확인을 해주세요.");
        f.userId.focus();
       	return;
    }

    str = f.userPwd.value;
    str = str.trim();
    if(!str) {
        alert("패스워드를 입력하세요.");
        f.userPwd.focus();
        return;
    }
    if( ! /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,16}$/i.test(str)) { 
        alert("비밀번호는 6~16 자의 영문,숫자 및 특수문자를 조합해서 사용해주세요.");
        f.userPwd.focus();
        return;
    }
    f.userPwd.value = str;

    if(str!= f.userPwdCheck.value) {
        alert("패스워드가 일치하지 않습니다.");
        f.userPwdCheck.focus();
        return;
    }
    
    str = f.userName.value;
    str = str.trim();
    if(!str) {
        alert("이름을 입력하세요.");
        f.userName.focus();
        return;
    }
    f.userName.value = str;
    
    str = f.email1.value;
    str = str.trim();
    if(!str) {
        alert("이메일을 입력하세요.");
        f.email1.focus();
        return;
    }
    
    str = f.email2.value;
    str = str.trim();
    if(!str) {
        alert("이메일을 입력하세요.");
        f.email2.focus();
        return;
    }

    str = f.tel2.value;
    str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요.");
        f.tel2.focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다.");
        f.tel2.focus();
        return;
    }

    str = f.tel3.value;
    str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요.");
        f.tel3.focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다.");
        f.tel3.focus();
        return;
    }
    
    str = f.zip.value;
    str = str.trim();
    if(!str) {
        alert("주소를 입력하세요.");
        f.zip.focus();
        return;
    }
    
    str = f.addr1.value;
    str = str.trim();
    if(!str) {
        alert("주소를 입력하세요.");
        f.addr1.focus();
        return;
    }

    str = f.allcheck.checked;
    if(!str){
        alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
        f.allcheck.focus();
        return;
    } 
    
    f.action = "${pageContext.request.contextPath}/member/${mode}";

    f.submit();
}

//이메일 셀렉박스 선택시 
function changeEmail() {
    var f = document.memberForm;
        
    var str = f.selectEmail.value;
    if(str!="direct") {
        f.email2.value=str; 
        f.email2.readOnly = true;
        f.email1.focus(); 
    }
    else {
        f.email2.value="";
        f.email2.readOnly = false;
        f.email1.focus();
    }
}

//약관동의 체크
$(function(){
	$("#terms-all").click(function() {
	    if($(this).prop("checked")){
	        $(".checkAgree").prop("checked", true);
	        $(".checkDisagree").prop("checked", false);
	    }else{
	        $(".checkAgree").prop("checked", false);
	        $(".checkDisagree").prop("checked", true);
	    }
	});
	
   $(".checkDisagree").click(function(){
      $("#terms-all").prop("checked", false);
   });
   
   $(".checkAgree").click(function(){
		var is_checked = true;
		
	    $(".terms-right .checkAgree").each(function(){
	        is_checked = is_checked && $(this).is(":checked");
	    });
	    $("#terms-all").prop("checked", is_checked);
   });
   
});

