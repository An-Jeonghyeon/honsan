<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
.estimate_banner{
    height: 260px;
    background: url('${pageContext.request.contextPath}/resources/images/interior/interior_bb.jpg');
    margin-top: 100px;
    padding: 120px 0px;
    text-align: center;
}

.estimate_banner_content{

    font-size: 50px;
    font-weight: 100;
    color: aliceblue;

    margin-bottom: 50px;
}

.estimate_banner_content span{
    font-weight: 700;
    font-size: 55px;

}
.estimate_banner_content_sub{
    color: rgba(240, 248, 255, 0.829);
    font-size: 25px;
    margin-top: -20px;
}

.estimate_banner_sendbutton{
    margin-top: 80px;
}

.estimate_banner_sendbutton_button{
    width: 250px;
    height: 80px;
    border-radius: 40px;
    background: #35c5f0;
    border: #35c5f0;
    color: white;
    font-size: 25px;
    font-weight: 700;
}

.estimate_sogae{
    width: 85%;
    display: flex;
    justify-content: center;
    margin: 0 auto;
    
}

.estimate_sogae_box{
    padding-top: 100px;
    padding-bottom: 120px;


}
.estimate_sogae_items_box{
    width: 32%;
    margin-left: 10px;
    margin-right: 10px;
}

.estimate_sogae_item_imgbox{
    width: 100%;
    text-align: center;
}

.estimate_sogae_item_imgbox img{
    width: 80%;
    height: 400px;
    
}

.estimate_sogae_item_contentbox{
    width: 100%;
    
}

.estimate_sogae_item_contentbox p{
    width: 100%;
    font-size: 30px;
    letter-spacing: -3px;
    font-weight: 600;
    text-align: center;
    padding: 20px 0px;
    
}

#contentbox_sub_p{
    font-size: 23px;
    color: rgba(0, 0, 0, 0.644);
}

.estimate_jin{
    text-align: center;
    margin-top: 200px;
    width: 100%;
    height: 800px;
    background: url('${pageContext.request.contextPath}/resources/images/interior/interior_jin2.png');
    background-position: 50%;

}

.estimate_list_box{

    background: white;
    width: 600px;
    margin: 0 auto;
    position: absolute;
    left :50%; 
    transform:translateX(-50%);
    border-radius: 15px;
    box-shadow: 0 5px 2px rgba(0, 0, 0, 0.5);

}

.estimate_list_controller{
    width: 90%;
    margin: 0 auto;

}

.estimate_list_ingbar{
    display: flex;
    height: 100%;
    width: 100%;
    margin: 0 auto;
    margin-top: 20px;
}

.estimate_list_ingbar_ing{
    height: 10px;
    background: #35c5f0;
    border-radius: 10px 0 0 10px;
}
.estimate_list_ingbar_non{
    height: 10px;
    background-color: #dbdbdb;
    border-radius: 0 10px 10px 0;
}

.estimate_list_ingbar_text{
    width: 100%;
    height: 60px;
}

.estimate_list_ingbar_text p{
    text-align: left;
    color: #35c5f0;
    margin-top: 2px;
    font-weight: 500;
    font-size: 18px;
}

.estimate_list_content{
    padding-top: 10px;
    padding-bottom: 10px;
    height: 40px;
    text-align: left;
    border-bottom: 1px solid #dbdbdb ;
}

.estimate_list_h1{
    height: 60px;
    text-align: left;
}

.estimate_list_content_check{
    width: 25px;
    height: 25px;
    
}
.estimate_list_content span{
    padding-left: 10px;
    font-size: 18px;
    font-weight: 500;
    
}
.estimate_list_buttonbox{
    width: 100%;
    margin-top: 60px;
    margin-bottom: 50px;
    height: 50px;
    display: flex;
}

.estimate_list_button{
    width: 100%;
    height: 100%;
    border-radius: 5px;
    border: #35c5f0;
    background: #dbdbdb;
    color: balck;
}

.estimate_list_prebutton{
    width: 50%;
    height: 100%;
    margin-right: 10px;
    border-radius: 5px;
    border: #dbdbdb;
    background: #dbdbdb;
}

.estimate_list_content_memobox{
    width: 100%;
    height: 300px;
}

.estimate_list_content_memo{
    width: 100%;
    height: 100%;
    font-size: 20px;
    border: 1px solid #dbdbdb;
    resize : none;
}

.estimate_list_content_input{
    width: 60%;
    height: 100%;
    border-radius: 4px;
    border: none;
    font-size: 20px;

}
</style>

<script>

$(function(){
	$(".content_memo").focus(function(){
		$(".estimate_list_button").removeAttr("disabled");
		$(".estimate_list_button").css("background","#35c5f0");
	});
	
	$(".estimate_banner_sendbutton_button").click(function(){
		$(".estimate_banner_sendbutton_button").hide();
		$(".estimate_list_controller:first").show();
		
		$(".estimate_list_content_check").click(function(){
			$(".estimate_list_button").removeAttr("disabled");
			$(".estimate_list_button").css("background","#35c5f0");
		});
		
		
		$(".estimate_list_button").click(function(){

						
			if ($(".estimate_list_button").hasClass("last")) {
				var f = document.estimate_list;
				
				//현재 보이는 곳에서 required클래스를 가지고 있니?
				str = f.userName.value;
				str = str.trim();
				if(!str) {
					alert("이름을 입력하세요.");
					f.userName.focus();
					return;
				}
				str = f.tel.value;
				str = str.trim();
				if(!str) {
					alert("전화번호를 입력하세요.");
					f.tel.focus();
					return;
				}	
			
				// 마지막 레이아웃에서 가입 버튼을 클릭한 경우
				//memberOk(); 전송 버튼 만들것 
				return false; // jQuery에서 return false는 이벤트를 취소하는 것. return 써도 되지만.. 더 이상 클릭 처리하지 않겠다는 의미
			}
			
			if (! $(".estimate_list_controller").last().is(":visible")) { // last() 검색할 때 쓰임 
				$(".estimate_list_controller:visible").hide().next(".estimate_list_controller").fadeIn(100); //fadeIn은 애니메이션 효과주기 위해 사용. show 써도 됨		
				$(".estimate_list_button").attr("disabled");
				$(".estimate_list_button").css("background","#dbdbdb");
				
			}
			
			
		});
	});
});

$(function() {
	$(".estimate_list_prebutton").click(function() {
		if ($(".estimate_list_controller").first().is(":visible")) { // 회원가입 취소를 누르면
			$(".estimate_list_controller:first").show();
		}
		
		$(".estimate_list_controller:visible").hide().prev(".estimate_list_controller").fadeIn(100);
					
	});
});

</script>

<section>
    <div class="estimate_banner">
        <div class="estimate_banner_controller">
            <h1 class="estimate_banner_content">인테리어가 막막하세요 ? <span> 인테리어</span> 걱정 말고 맡기 세요 .</h1>
            <p class="estimate_banner_content_sub">한 번만 의뢰하면 업체 추천-현장실사-견적비교가 ONE-STOP으로 !</p>
            <div class="estimate_banner_sendbutton">
                <button class="estimate_banner_sendbutton_button" type="button">바로 의뢰하기</button>
                
                <form name="estimate_list" method="post">
	                <div class="estimate_list_box">
	                    <div class="estimate_list_controller" style="display: none;">
	                        <div class="estimate_list_ingbar">
	                            <div class="estimate_list_ingbar_ing" style="width: 20%;"></div>
	                            <div class="estimate_list_ingbar_non" style="width: 80%;"></div>
	                        </div>
	                       <!-- 첫 번째 페이지 -->
	                        <div class="estimate_list_ingbar_text">
	                            <p style="margin-left: 15%;">1/5</p>
	                        </div>
	                        <h1 class="estimate_list_h1">어떤 건물을 인테리어 하실건가요 ?</h1>
	                        <div class="estimate_list_content">
	                            <input name="homeName" type="radio" class="estimate_list_content_check"><span>아파트</span>
	                        </div>
	                        <div class="estimate_list_content">
	                            <input name="homeName" type="radio" class="estimate_list_content_check"><span>빌라</span>
	                        </div>
	                        <div class="estimate_list_content">
	                            <input name="homeName" type="radio" class="estimate_list_content_check"><span>주택</span>
	                        </div>
	                        <div class="estimate_list_content">
	                            <input name="homeName" type="radio" class="estimate_list_content_check"><span>원룸</span>
	                        </div>
	                        <div class="estimate_list_buttonbox">
	                        	<button type="button" class="estimate_list_prebutton"> 취소 </button>
	                            <button type="button" class="estimate_list_button" disabled="disabled"> 다음 </button>
	                        </div>
	                    </div>
	                    <!-- 2 번째 페이지 -->
	                    <div class="estimate_list_controller" style="display: none;">
	                        <div class="estimate_list_ingbar">
	                            <div class="estimate_list_ingbar_ing" style="width: 40%;"></div>
	                            <div class="estimate_list_ingbar_non" style="width: 60%;"></div>
	                        </div>
	                        <div class="estimate_list_ingbar_text">
	                            <p style="margin-left: 35%;">2/5</p>
	                        </div>
	                        <h1 class="estimate_list_h1">공사 예정일이 언제인가요 ?</h1>
	                        <div class="estimate_list_content">
	                            <input name="bir" type="radio" class="estimate_list_content_check"><span>미정</span>
	                        </div>
	                        <div class="estimate_list_content">
	                            <input name="bir" type="radio" class="estimate_list_content_check"><span>1개월 이내</span>
	                        </div>
	                        <div class="estimate_list_content">
	                            <input name="bir" type="radio" class="estimate_list_content_check"><span>2개월 이내</span>
	                        </div>
	                        <div class="estimate_list_content">
	                            <input name="bir" type="radio" class="estimate_list_content_check"><span>2개월 이후</span>
	                        </div>
	                        <div class="estimate_list_buttonbox">
	                            <button type="button" class="estimate_list_prebutton"> 이전 </button>
	                            <button type="button" class="estimate_list_button" disabled="disabled"> 다음 </button>
	                        </div>
	                    </div>
	                    
	                    <!-- 3 번째 페이지 -->
	
	                    <div class="estimate_list_controller" style="display: none;">
	                        <div class="estimate_list_ingbar">
	                            <div class="estimate_list_ingbar_ing" style="width: 60%;"></div>
	                            <div class="estimate_list_ingbar_non" style="width: 40%;"></div>
	                        </div>
	                        <div class="estimate_list_ingbar_text">
	                            <p style="margin-left: 55%;">3/5</p>
	                        </div>
	                        <h1 class="estimate_list_h1">인테리어 예산을 알려주세요 .</h1>
	                        <div class="estimate_list_content">
	                            <input name="budget" type="radio" class="estimate_list_content_check"><span>1천만원대</span>
	                        </div>
	                        <div class="estimate_list_content">
	                            <input name="budget" type="radio" class="estimate_list_content_check"><span>2천만원대</span>
	                        </div>
	                        <div class="estimate_list_content">
	                            <input name="budget" type="radio" class="estimate_list_content_check"><span>3천만원대</span>
	                        </div>
	                        <div class="estimate_list_content">
	                            <input name="budget" type="radio" class="estimate_list_content_check"><span>4천만원대 이상</span>
	                        </div>
	                        <div class="estimate_list_content">
	                            <input name="budget" type="radio" class="estimate_list_content_check"><span>미정</span>
	                        </div>
	                        <div class="estimate_list_buttonbox">
	                            <button type="button" class="estimate_list_prebutton"> 이전 </button>
	                            <button type="button" class="estimate_list_button" disabled="disabled"> 다음 </button>
	                        </div>
	                    </div>
	
	                    <!-- 4 번째 페이지 -->
	
	                    <div class="estimate_list_controller" style="display: none;">
	                        <div class="estimate_list_ingbar">
	                            <div class="estimate_list_ingbar_ing" style="width: 80%;"></div>
	                            <div class="estimate_list_ingbar_non" style="width: 20%;"></div>
	                        </div>
	                        <div class="estimate_list_ingbar_text">
	                            <p style="margin-left: 75%;">4/5</p>
	                        </div>
	                        <h1 class="estimate_list_h1">전달 하고싶은 말을 알려주세요 .</h1>
	                        <div class="estimate_list_content_memobox">
	                            <textarea name="content" class="estimate_list_content_memo content_memo"></textarea>
	                        </div>
	                        <div class="estimate_list_buttonbox">
	                            <button type="button" class="estimate_list_prebutton"> 이전 </button>
	                            <button type="button" class="estimate_list_button" > 다음 </button>
	                        </div>
	                    </div>
	
	                    <!-- 5 번째 페이지 -->
	
	                    <div class="estimate_list_controller" style="display: none;">
	                        <div class="estimate_list_ingbar">
	                            <div class="estimate_list_ingbar_ing" style="width: 99%;"></div>
	                            <div class="estimate_list_ingbar_non" style="width: 1%;"></div>
	                        </div>
	                        <div class="estimate_list_ingbar_text">
	                            <p style="margin-left: 95%;">5/5</p>
	                        </div>
	                        <h1 class="estimate_list_h1">이름과 연락처를 알려주세요 .</h1>
	                        <div class="estimate_list_content">
	                            <input name="userName" class="estimate_list_content_input" type="text" placeholder="이름을 입력해주세요.">
	                        </div>
	                        <div class="estimate_list_content">
	                            <input name="tel" class="estimate_list_content_input" type="text" placeholder="ex:) 010-1234-5678 ">
	                        </div>
	
	                        <div class="estimate_list_buttonbox">
	                            <button type="button" class="estimate_list_prebutton"> 이전 </button>
	                            <button type="button" class="estimate_list_button" disabled="disabled"> 완료 </button>
	                        </div>
	                    </div>                    
	
	
	                </div>
                </form>
            </div>
        </div>
    </div>
    <div class="estimate_sogae_box">
        <div class="estimate_sogae">
            <div class="estimate_sogae_items_box">
                <div class="estimate_sogae_item_imgbox">
                    <img src="${pageContext.request.contextPath}/resources/images/interior/sogae1.png">
                </div>
                <div class="estimate_sogae_item_contentbox">
                    <p>잘하는 업체, 어떻게 찾는지 모르겠다고요 ?</p>
                    <p id="contentbox_sub_p">포털 사이트에서 한 업체, 한업체 찾지 말고<br>홀로에서 한번에 비교하고 선정하세요 </p>
                </div>
            </div>
            <div class="estimate_sogae_items_box">
                <div class="estimate_sogae_item_imgbox">
                    <img src="${pageContext.request.contextPath}/resources/images/interior/sogae2.png">
                </div>
                <div class="estimate_sogae_item_contentbox">
                    <p>다양한 업체를 쉽게 비교하고 싶다고요?</p>
                    <p id="contentbox_sub_p">전문 매니저가 필요한 서비스를<br>정확하게 파악해서 맞춤업체를 추천해드립니다.</p>
                </div>
            </div>
            <div class="estimate_sogae_items_box">
                <div class="estimate_sogae_item_imgbox">
                    <img src="${pageContext.request.contextPath}/resources/images/interior/sogae3.png">
                </div>
                <div class="estimate_sogae_item_contentbox">
                    <p>또 맡기고 싶은 업체를 만나고 싶다고요?</p>
                    <p id="contentbox_sub_p">전문 매니저가 검증된 업체만 선별하여<br>꼼꼼하고 확실하게 진행하실 수 있습니다. </p>
                </div>
            </div>
        </div>
        <div class="estimate_jin">
        </div>
    </div>

</section>