<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 화면</title>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/projectlogin/login.css"
	type="text/css">

<script type="text/javascript">
function sendFind(){
	var f = document.loginForm;

    if(! f.userName.value) {
        alert("이름을 입력하세요. ");
        f.userName.focus();
        return;
    }
    
    var te="";
    if(f.tel.value.indexOf("-")>0){
	    var t=f.tel.value.split("-");
	    for(var i in t){
	    	te+=t[i];
	    }
    }

    if(! f.tel.value) {
        alert("휴대폰 번호를 입력하세요. ");
        f.tel.focus();
        return;
    }
    if(f.tel.value.length<10 || te.length<10) {
        alert("휴대폰 번호 확인하세요");
        f.tel.focus();
        return;
    }
    

    f.action = "${pageContext.request.contextPath}/member/findId";
    f.submit();
	
}
</script>



</head>
<body>


	<div class="body-container">
		<hr>
		<div style="width: 420px; margin: 0px auto; padding-top: 90px;">
			<div style="text-align: center;">
				<span style="font-weight: bold; font-size: 27px; color: #424951;">
					아 이 디 &nbsp;&nbsp; 찾 기  </span>
			</div>
			
			<form name="loginForm" method="post">
				<table style="margin: 15px auto; width: 100%; border-spacing: 0px;">
					<tr style="height: 15px;">
						<td>이 름</td>
					</tr>
					<tr align="center" height="60">
						<td><label for="userName" id="lblUserName" class="lbl">홍 길 동
								</label> 
								<input type="text" name="userName" id="userName"
							class="loginTF" maxlength="15" tabindex="1"
							onfocus="document.getElementById('lblUserName').style.display='none';"
							onblur="bgLabel(this, 'lblUserId');"></td>
					</tr>
					<tr style="height: 15px;">
						<td></td>
					</tr>
					<tr style="height: 15px;">
						<td>휴 대 폰&nbsp; 번 호</td>
					</tr>
					<tr align="center" height="60">
						<td><label for="tel" id="lblUserTel" class="lbl">010-1111-1111
								</label> 
								<input type="text" name="tel"
							id="tel" class="loginTF" maxlength="20" tabindex="2"
							onfocus="document.getElementById('lblUserTel').style.display='none';"
							onblur="bgLabel(this, 'lblUserPwd');"></td>
					</tr>
					<tr align="center" height="65">
						<td>
							<button type="button" onclick="sendFind();" class="btnConfirm">아 이 디 &nbsp; 확 인 </button>
						</td>
					</tr>

					<tr align="center" height="45">
						<td><a href="${pageContext.request.contextPath}/">패스워드
								찾기</a>&nbsp;&nbsp; | &nbsp;&nbsp; <a
							href="${pageContext.request.contextPath}/member/member">회원가입</a></td>
					</tr>

					<tr align="center" height="100">
						<td><span style="color: blue;">${message}</span></td>
					</tr>

				</table>
			</form>

		</div>
		

<hr>
	</div>
	
	
</body>
</html>