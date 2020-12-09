<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript">

window.onload = function() {
	 
    if (getCookie("id")) { // getCookie함수로 id라는 이름의 쿠키를 불러와서 있을경우
        document.loginForm.userId.value = getCookie("id"); //input 이름이 id인곳에 getCookie("id")값을 넣어줌
        document.loginForm.idsave.checked = true; // 체크는 체크됨으로
        document.getElementById('lblUserId').style.display='none';
    }

}

function setCookie(name, value, expiredays) //쿠키 저장함수
{
    var todayDate = new Date();
    todayDate.setDate(todayDate.getDate() + expiredays);
    document.cookie = name + "=" + escape(value) + "; path=/; expires="
            + todayDate.toGMTString() + ";"
}

function getCookie(Name) { // 쿠키 불러오는 함수
    var search = Name + "=";
    if (document.cookie.length > 0) { // if there are any cookies
        offset = document.cookie.indexOf(search);
        if (offset != -1) { // if cookie exists
            offset += search.length; // set index of beginning of value
            end = document.cookie.indexOf(";", offset); // set index of end of cookie value
            if (end == -1)
                end = document.cookie.length;
            return unescape(document.cookie.substring(offset, end));
        }
    }
}


function bgLabel(ob, id) {
    if(!ob.value) {
	    document.getElementById(id).style.display="";
    } else {
	    document.getElementById(id).style.display="none";
    }
}

function sendLogin() {
    var f = document.loginForm;

    if(! f.userId.value) {
        alert("아이디를 입력하세요. ");
        f.userId.focus();
        return;
    }

    if(! f.userPwd.value) {
        alert("패스워드를 입력하세요. ");
        f.userPwd.focus();
        return;
    }
    
    if (document.loginForm.idsave.checked == true) { // 아이디 저장을 체크 하였을때
        setCookie("id", document.loginForm.userId.value, 7); //쿠키이름을 id로 아이디입력필드값을 7일동안 저장
    } else { // 아이디 저장을 체크 하지 않았을때
        setCookie("id", document.loginForm.userId.value, 0); //날짜를 0으로 저장하여 쿠키삭제
    }
    

    f.action = "${pageContext.request.contextPath}/member/login";
    f.submit();
}



</script>



	<div class="body-container">
		<hr>
		<div style="width: 420px; margin: 0px auto; padding-top: 90px;">
			<div style="text-align: center;">
				<span style="font-weight: bold; font-size: 27px; color: #424951;">
					로 그 인 </span>
			</div>
			
			<form name="loginForm" method="post" action="">
				<table style="margin: 15px auto; width: 100%; border-spacing: 0px;">
					<tr align="center" height="60">
						<td><label for="userId" id="lblUserId" class="lbl">아이디
								: 영문, 숫자 조합 5자 이상</label> 
								<input type="text" name="userId" id="userId"
							class="loginTF" maxlength="15" tabindex="1"
							onfocus="document.getElementById('lblUserId').style.display='none';"
							onblur="bgLabel(this, 'lblUserId');"></td>
					</tr>
					<tr align="center" height="60">
						<td><label for="userPwd" id="lblUserPwd" class="lbl">비밀번호
								: 영문,숫자 조합 10자 이상</label> 
								<input type="password" name="userPwd"
							id="userPwd" class="loginTF" maxlength="20" tabindex="2"
							onfocus="document.getElementById('lblUserPwd').style.display='none';"
							onblur="bgLabel(this, 'lblUserPwd');"></td>
					</tr>
					<tr style="height: 30px;">
						<td><input type="checkbox" name="idsave" value="saveOk">
							아이디 저장</td>
					</tr>
					<tr align="center" height="65">
						<td>
							<button type="button" onclick="sendLogin();" class="btnConfirm">로그인</button>
						</td>
					</tr>

					<tr align="center" height="45">
						<td><a href="${pageContext.request.contextPath}/">아이디 찾기</a>&nbsp;&nbsp;
							| &nbsp;&nbsp; <a href="${pageContext.request.contextPath}/">패스워드
								찾기</a>&nbsp;&nbsp; | &nbsp;&nbsp; <a
							href="${pageContext.request.contextPath}/member/member">회원가입</a></td>
					</tr>

					<tr align="center" height="40">
						<td><span style="color: blue;">${message}</span></td>
					</tr>

				</table>
			</form>

			<hr>

		</div>

		<div style="width: 420px; margin: 0px auto; padding-top: 10px; text-align: center;">
			<p class="snslogin"
				style="width: 100%; margin: 10px auto 15px; text-align: center;">SNS
				계정으로 로그인</p>
			<!-- Naver Login Btn -->
			<div id="naverIdLogin" style=" display: inline-block;">
				<a id="naverIdLogin_loginButton"> <img
					src="https://static.nid.naver.com/oauth/big_g.PNG?version=js-2.0.0"
					width="190px" height="auto"
					style="max-width: 400px; max-height: 60px" />
				</a>
			</div>
			<!-- KaKao Login Btn --> 
			<a id="login-form-btn" href="javascript:loginFormWithKakao()"> 
			<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="190px" height="auto" style="max-width:400px;max-height:60px"/> </a>

		</div>



	</div>


	<script>
	//네이버 로그인 API
	var naverLogin = new naver.LoginWithNaverId({ 
		clientId: "IM9_P6nNaJO7bGXJ1kSj", 
		callbackUrl: "http://localhost:9090/app/", 
		isPopup: false, 
		callbackHandle:true
		/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */ 
		}); 
		/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */ 
		naverLogin.init(); 
		
		/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */ 
		window.addEventListener('load', function () { 
			naverLogin.getLoginStatus(function (status) { 
				if (status) { 
					/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */ 
					console.log(naverLogin.accessToken.accessToken) 
					var email = naverLogin.user.getEmail(); 
					var name = naverLogin.user.getName(); 
					var uniqId = naverLogin.user.getId(); 
					var birth = naverLogin.user.getBirth();
					if( email == undefined || email == null) { 
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요."); 
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */ 
						naverLogin.reprompt(); return; 
						}else if( name == undefined || name == null){ 
							alert("회원이름은 필수정보입니다. 정보제공을 동의해주세요."); 
							naverLogin.reprompt(); return; 
							}else{ // 성공
								} 
					} else { 
						console.log("callback 처리에 실패하였습니다."); 
						} 
				}); 
			});
		
		//카카오 로그인
		Kakao.init('dd27106c5a866b254e4716fef94d13ad'); 
		function loginFormWithKakao() { 
			Kakao.Auth.loginForm({ 
				success: function(authObj) { 
					Kakao.API.request({ 
						url: '/v2/user/me', 
						success: function(res) { 
							var id=res.id; //데이터베이스의 primary Key값 속성 즉 기본키의 식별성
							var email=res.kakao_account.email;
							var name=res.properties.nickname;
							
							console.log(email);
							console.log(id) ;
							console.log(name);
							} 
					}) 
					
					console.log(authObj);
					var token=authObj.access_token;
					}, 
					fail: function(err) { 
						alert(JSON.stringify(err)) 
						}, 
						}) 
						}

		
		
		
		
		
		
		


		$(document).ready(function(){
			
		}) 
		$(function(){ 
			$('#login').on("click",function(){ 
				js_login(); 
				}) 
				$('#naverIdLogin_loginButton').on("click",function(){ 
					var email = $('#naver_email').val(); 
					var password = $('#naver_password').val(); 
					$('.email').val(email); 
					$('.password').val(password); 
					}); 
			});

	
	
	</script>