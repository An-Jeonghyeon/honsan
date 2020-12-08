<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dateUtil.js"></script>
<script type="text/javascript">

/* 유효성 검사 */
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
    
    f.action = "${pageContext.request.contextPath}/ ";

    f.submit();
}
/* 이메일 셀렉박스 선택시 */
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
/* 중복확인  */
 

</script>
<script>
/* 약관동의 체크 */
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

</script>


<div id="container"> <!--이건 만들어주는 틀로 바꿀거(임시)-->
	<div id="singup-content">
        
        <!-- 회원가입 헤더 -->
		<article class="singup-header">
        	<div class="singup-title">
                <h1>회원가입</h1>
            </div>
            <div class="singup-step">
                <div class="step1">
                    <div class="circle"> </div>
                    <div class="line1"> </div>
                    <p class="step-name">STEP 1</p>
                </div>
                <div class="step2">
                    <div class="line2"> </div>
                    <div class="circle2"> </div>
                    <p class="step-name2">STEP 2</p>
                </div>
            </div>
        </article>
            
            <!-- 회원가입  기본정보 -->
        <form name="memberForm" method="POST">
            <article class="singup-default">
                <div class="default-left">
                    <span><i class="far fa-user-circle fa-2x"></i></span>
                    <h1>기본정보</h1>
                </div>
                
                <div class="default-right">
                	<div class="user-basic">
                        <div class="basic-id">
                            <span  class="b-span">회원 아이디</span>
                            <input type="text" name="userId" placeholder="회원아이디 입력" class="de-input"> 
                            <button type="button">중복확인</button>
                            <small id="" class="check-sm">4~12 자의 영문, 숫자를 조합해서 사용해주세요.</small>
                        </div>
                        
                        <div class="basic-pwd">
                            <span class="b-span">비밀번호</span>
                            <input type="password" name="userPwd" placeholder="비밀번호 입력"  class="de-input"> 
                            <small id="" class="check-sm">6~16 자의 영문, 숫자 및 특수문자를 조합해서 사용해주세요</small>
                        </div>
                        <div class="basic-pwd2">
                            <span  class="b-span">비밀번호 확인</span>
                            <input type="password" name="userPwdCheck" placeholder="비밀번호 확인"  class="de-input"> 
                        </div>

                        <div class="basic-name">
                            <span  class="b-span">이름</span>
                            <input type="text" name="userName" placeholder="이름을 입력해주세요"  class="de-input"> 
                        </div>

                        <div class="basic-birth">
                            <span  class="b-span">생년월일</span>
                            <select name="birth-year" class="birth-select">
								<c:forEach var="i" begin="0" end="${2020-1910}">
								    <c:set var="yearOption" value="${2020-i}" />
								    <option value="${yearOption}">${yearOption}</option>
								</c:forEach>
                            </select>
                            <span>년</span>
                            <select name="birth-month" class="birth-select">
								<c:forEach var="i" begin="1" end="12">
							    	<option value="${i}">${i}</option>
								</c:forEach>
                            </select>
                            <span>월</span>
                            <select name="birth-day" class="birth-select">
								<c:forEach var="i" begin="1" end="31">
							    	<option value="${i}">${i}</option>
								</c:forEach>
                            </select>
                            <span>일</span>
                        </div>

                        <div class="basic-email">
                            <span  class="b-span">e-mail</span>
                            <div class="email-input">
                                <input type="text" name="email1" > 
                                <span  id="at">@</span>
                                <input type="text" name="email2" readonly="readonly" > 
                            </div>
                            <select name="selectEmail" class="email-select" onchange="changeEmail();">
                                <option value="direct">직접입력</option>
                                <option value="naver.com">naver.com</option>
                                <option value="hanmail.net">hanmail.net</option>
                                <option value="nate.com">nate.com</option>
                                <option value="gmail..com">gmail.com</option>
                                <option value="daum.net">daum.net</option>
                            </select>
                        </div>

                        <div class="basic-tel">
                            <span  class="b-span">휴대폰 번호</span>
                            <select name="tel1" id="">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="018">018</option>
                                <option value="019">019</option>
                            </select>
                            <span>-</span>
                            <input type="text" name="tel2" maxlength="4"> 
                            <span>-</span>
                            <input type="text" name="tel3" maxlength="4"> 
                        </div>

                        <div class="basic-zip">
                            <span  class="b-span">우편번호</span>
                            <input type="text" name="zip" id="zip" class="de-input c-none" readonly="readonly"> 
                            <button type="button" onclick="daumPostcode();">우편번호 검색</button>
                        </div>
                        <div class="basic-addr">
                            <div class="basic-span">
                                <span  class="b-span">주소</span>
                            </div>
                            <div class="addr-input">
                                <input type="text" name="addr1" id="addr1" placeholder="주소입력"  class="de-input c-none"  readonly="readonly">
                                <input type="text" name="addr2" id="addr2" placeholder="상세주소입력"  class="de-input">
                            </div>
                        </div>
                    </div>
                </div>
            </article>

            <!-- 회원가입 약관동의 및 완료 -->
            <div class="singup-terms">
                <div class="terms-left">
                    <span><i class="far fa-check-circle fa-2x"></i></span>
                    <h1>약관동의</h1>
                </div>

                <div class="terms-right">
                    <div class="right-allcheck">
                        <h3 class="terms-title">각 항목에 대한 약관을 충분히 읽어보시고, 약관에 동의해 주시기 바랍니다.</h3>
                        <input id="terms-all"  name="allcheck" type="checkbox" class="title-check">
                        <span>회원약관, 개인정보 수집 및 이용에 모두 동의합니다.</span>
                    </div>

                    <div class="terms-details">
                        <h3>회원약관</h3>
                        <div class="terms-scroll">
                            <ul>
                                <li>
      	  		  	                          제1조 (목적)<br>
             			                       이 약관은 ㈜농심(이하 "회사" 라 합니다)에서 운영하는 웹사이트(Web Site)에서 제공하는 서비스(이하 "서비스" 라 합니다)의 이용조건 및 절차에 관한 사항과 기타 필요한 사항을 규정함을 목적으로 합니다.<br><br>
                                </li>
                                <li>
                            	    제2조 (용어의 정의)<br>
                                1. "이용자"란 회사에서 운영하는 웹사이트에 로그인 하여 이 약관에 따라 회사가 제공하는 서비스를 받는 자를 말합니다.<br>
                                2. "회원"이란 이 약관에 동의하고 회사로부터 이용자 ID를 부여 받은 자를 말합니다.<br>
                                3. "비회원"이란 회원에 가입하지않고 회사가 제공하는 서비스를 이용하는 자를 말합니다.<br>
                                4. "ID"란 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가 승인하는 문자와 숫자의 조합을 말합니다.<br>
                                5. "비밀번호"란 회원의 비밀보호를 위해 회원자신이 설정한 문자와 숫자의 조합을 말합니다.<br><br>
                                </li>
                                <li>
                                  	  제3조 (약관의 효력과 변경)<br>
                                    ① 이 약관은 이용자에게 공시함으로서 효력을 발생합니다.<br>
                                    ② 회사는 이 약관을 변경할 수 있으며 변경된 약관은 서비스 화면에 별도 공지하게 됩니다. 이용자가 변경된 약관에 동의하지 아니하는 경우 이용자는 본인의 회원등록을 취소할 수 있으며, 변경된 약관의 효력 발생일로부터 7일 이후에도 거부의사를 표시하지 아니하고 서비스를 계속 사용할 경우 약관의 변경 사항에 동의한 것으로 간주됩니다.<br>
                                    ③ 변경된 약관은 온라인으로 공시함으로써 효력을 발생하며, 이 약관에 명시되지 않은 사항이 국내 관계법령에 규정되어 있을 경우에는 그 규정에 따릅니다.<br><br>
                                </li>
                                <li>
                             	       제4조 (계약의 성립)<br>
                                    ① 이 약관은 회원의 약관 내용에 대한 동의와 회원의 가입신청에 대한 회사의 승낙으 로 성립됩니다.<br>
                                    ② 회원으로 가입하여 서비스를 받고자 하는 자는 회사에서 요청하는 회원의 개인신상정보(이하 “개인정보”라 합니다)를 제공해야 합니다. 회원이 제공한 개인정보는 이 약관 및 회사의 개인정보보호정책에 따라 보호됩니다.<br><br>
                                </li>
                            </ul>
                        </div>
                        <input type="radio" name="agree1" class="checkAgree">
                        <span>회원 약관에 동의합니다.</span>
                        <input type="radio" name="agree1" class="checkDisagree">
                        <span>동의하지 않습니다.</span>
                    </div>

                    <div class="terms-details">
                        <h3>개인정보 수집 및 이용에 대한 안내</h3>
                        <div class="terms-scroll">
                            <strong>■ 수집하는 개인정보 항목</strong>
                            <p>회사는 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.</p>
                            <p>ο 수집항목(필수) : <b>이름, 생년월일, 성별, 로그인ID, 휴대전화번호, 이메일 주소</b><br>
                                ο 개인정보 수집방법 : 홈페이지(회원가입, 메일 문의), 또한 서비스 이용과정이나 사업 처리 과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.<br>
                                ο <b>이용자의 브라우저 종류 및 OS, 검색어, 서비스 이용 기록, IP Address, 방문 일시, 쿠키, 서비스 이용기록, 불량 이용 기록</b>
                            </p>
                            <strong>■ 개인정보의 수집 및 이용 목적</strong>
                            <p>회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다 </p>
                            <p>ο <b>서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 콘텐츠 제공</b><br>
                                ο 회원 관리 : <b>회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 연령확인, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인 , 불만처리 등 민원처리, 고지사항 전달</b><br>
                                ο 익명 정보 내부 활용 : <b>신규 서비스(제품) 개발 및 특화, 인구통계학적 특성에 따른 서비스 제공, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계</b>
                            </p>
                            <strong>■ 개인정보의 보유 및 이용기간</strong>
                            <p>회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.</p>
                            <p>가. 회사 내부 방침에 의한 정보보유 사유<br>
                            o 부정이용기록<br>
                            - 보존 이유 : 부정 이용 방지<br>
                            - 보존 기간 : <b>1년</b>
                            </p>
                            <p>나. 관련법령에 의한 정보보유 사유<br>
                     		       상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.</p>
                            <p>o 계약 또는 청약철회 등에 관한 기록<br>
                            - 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률<br>
                            - 보존 기간 : <b>5년</b>
                            </p>
                            <p>o 대금결제 및 재화 등의 공급에 관한 기록<br>
                            - 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률<br>
                            - 보존 기간 : <b>5년</b>
                            </p>
                            <p>o 소비자의 불만 또는 분쟁처리에 관한 기록<br>
                            - 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률<br>
                            - 보존 기간 : <b>3년</b>
                            </p>
                            <p>o 본인확인에 관한 기록<br>
                            - 보존 이유 : 정보통신 이용촉진 및 정보보호 등에 관한 법률<br>
                            - 보존 기간 : <b>6개월</b>
                            </p>
                            <p>o 방문에 관한 기록<br>
                            - 보존 이유 : 통신비밀보호법<br>
                            - 보존 기간 : <b>3개월</b>
                            </p>
                        </div>
                        <input type="radio" name="agree2" class="checkAgree">
                        <span>개인정보 수집 및 보유, 이용기간에 동의합니다.</span>
                        <input type="radio" name="agree2" class="checkDisagree">
                        <span>동의하지 않습니다.</span>
                    </div>

                    <div class="terms-details">
                        <h3>개인정보 취급위탁 안내</h3>
                        <div class="terms-scroll">
                            <strong>■ 개인정보 취급위탁 안내</strong><br>
                            <p>회사는 서비스 향상을 위해서 아래와 같이 개인정보를 위탁하고 있으며, 관계법령에 따라 위탁계약 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다.</p>
                            <p>회사의 개인정보 위탁처리 기관 및 위탁업무 내용은 아래와 같습니다.</p>
                            <div style="width:100%; overflow-x:auto">
                                <table>
                                    <caption>수탁자, 위탁업무내용, 위탁개인정보, 기간 정보 테이블</caption>
                                    <colgroup>
                                        <col style="">
                                        <col style="">
                                        <col style="">
                                        <col style="">
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th scope="col">수탁자</th>
                                        <th scope="col">위탁업무내용</th>
                                        <th scope="col">위탁개인정보</th>
                                        <th scope="col">기간</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><b>㈜엔디에스</b></td>
                                        <td><b>시스템 유지보수 및 서비스 개발, 테스트</b></td>
                                        <td></td>
                                        <td><b>위탁 계약 종료 시까지</b></td>
                                    </tr>
                                    <tr>
                                        <td><b>NICE신용평가㈜</b></td>
                                        <td><b>실명 본인인증</b></td>
                                        <td>실명 본인인증	가입 통신사명, 이름, 휴대폰번호, 생년월일</td>
                                        <td><b>위탁 계약 종료 시까지</b></td>
                                    </tr>
                                    <tr>
                                        <td><b>㈜쓰리에스포유</b></td>
                                        <td><b>이벤트 상품 등의 우편물 배송 서비스</b></td>
                                        <td>이름, 주소, 휴대폰번호</td>
                                        <td><b>배송 완료 시까지</b></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <input type="radio" name="agree3" class="checkAgree">
                        <span>개인정보 취급 위탁에 동의합니다.</span>
                        <input type="radio" name="agree3" class="checkDisagree">
                        <span>동의하지 않습니다.</span>
                    </div>
                    
                    <div class="singup-submit">
                        <button type="button" class="submit-reset" onclick="">취소</button>
                        <button type="button" class="submit-ok" name="sendButton" onclick="memberOk();">완료</button>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
        function daumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var fullAddr = ''; 
                    var extraAddr = ''; 

                    if (data.userSelectedType === 'R') { 
                        fullAddr = data.roadAddress;

                    } else { 
                        fullAddr = data.jibunAddress;
                    }

                    if(data.userSelectedType === 'R'){
                        if(data.bname !== ''){
                            extraAddr += data.bname;
                        }
                        if(data.buildingName !== ''){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                    }

                    document.getElementById('zip').value = data.zonecode; 
                    document.getElementById('addr1').value = fullAddr;

                    document.getElementById('addr2').focus();
                }
            }).open();
        }
    </script>
</div>