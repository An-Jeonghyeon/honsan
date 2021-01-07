<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script type="text/javascript">
/* Demo purposes only */
$(".hover").mouseleave(
  function () {
    $(this).removeClass("hover");
  }
);
/* Demo purposes only */
$(".hover").mouseleave(
  function () {
    $(this).removeClass("hover");
  }
);
</script>



		 <div class="loginMainBody">
                <div class="slideshow-container">
                    <div class="slide slide1">
                    
                    </div>
                    <div class="slide slide2">
                     
                    </div>
                    <div class="slide slide3">
       
                    </div>
                </div>
            </div>
            
            <br><br><br><br><br><br>
            <p>
				<MARQUEE behavior="scroll" scrollamount="15" style="font-size: 30px;font-size: 64px; font-weight: bold; letter-spacing: 1.2em;">What you wear is how you present yourself to the world, especially today, when human contacts are so quick. Fashion is instant language.</MARQUEE>
			<!-- 스크롤의 속성 -->
		    </p>
            
            <div class="categories-Recommendation1">
                <div class="categoriesName">
                    <span>Clothes</span>
                </div>
                     
                <div class="categories-content">
	             <video src="/app/resources/images/dress/rain.mov" width="400" height="400" preload="auto" autoplay="autoplay" loop="loop" controls="controls"></video> 
	             <div class="weatherImg"></div>
	             <div class="weatherImg2"></div>
	             <div class="clothesImg"></div>
	             <div class="clothesImg2"></div>
	            </div>
             
                 
                     
            </div>
            
            <p>
				<MARQUEE behavior="scroll" scrollamount="15" style="font-size: 30px;font-size: 64px; font-weight: bold; letter-spacing: 1.2em;">Always remember: If you’re alone in the kitchen and you drop the lamb, you can always just pick it up. Who’s going to know?</MARQUEE>
			<!-- 스크롤의 속성 -->
		    </p>
            
            
            <div class="categories-Recommendation1">
                <div class="categoriesName">
                    <span>Cooking</span>
                </div>
                       
                 <div class="categories-content">
                 	<div class="categories-content-cook">
	                 	<div class="categories-content-cook-img1">
	                 		<div class="categories-content-cook-img1-box">
	                 			<div class="categories-content-cook-img1-category">
	                 				<span>Recipes</span>
	                 			</div>
	                 			<div class="categories-content-cook-img1-info">
	                 				<h3>오늘 뭐 먹지?</h3>
	                 				<span>  오늘은 또 무엇을 재료로, 무슨 요리를 해 먹으면 좋을지 고민중이신가요?
	                 				그렇다면 각양각색의 레시피를 구경하며 오늘의 메뉴를 골라보세요.
	                 				</span>
	                 			</div>
	                 			<div class="categories-content-cook-img1-more">
	                 				<span onclick="location.href='${pageContext.request.contextPath}/cook/honCooq/main';">more + </span>
	                 			</div>	                 			
	                 		</div>
	                 	</div>
	                 	<div class="categories-content-cook-inside">
		                 	<div class="categories-content-cook-img2">
		                 	</div>
		                 	<div class="categories-content-cook-words">
		                 		<div class="categories-content-cook-words-box">
		                 			<div class="categories-content-cook-img1-category">
		                 				<span>CookTip</span>
		                 			</div>
		                 			<div class="categories-content-cook-img1-info2">
		                 				<h3>주방팁이 필요할 때!</h3>
		                 				<span>  주방은 매일 청소하고 관리해도 유지하기가 어렵죠. 여러분만의 팁이 있다면 소개해 주세요!
		                 				</span>
		                 			</div>		                 	
		                 			<div class="categories-content-cook-img1-more">
		                 				<span onclick="location.href='${pageContext.request.contextPath}/cook/honCooq/main?m=2';">more + </span>
		                 			</div>	                 			
		                 		</div>
		                 	</div>
	                 	</div>
                 	</div>
                 </div>
                       
            </div>
            
            <p>
				<MARQUEE behavior="scroll" scrollamount="15" style="font-size: 30px;font-size: 64px; font-weight: bold; letter-spacing: 1.2em;">Owning a home is a keystone of wealth… both financial affluence and emotional security</MARQUEE>
			<!-- 스크롤의 속성 -->
		    </p>
            
            <div class="categories-Recommendation1">
                <div class="categoriesName">
                    <span>Room</span>
                </div>
                        
                <div class="categories-content">
				<div class="backimg">
                
					<div style="float: left; width: 35%;height:100%;">
						<div style="height: 50%;">
							
						</div>
						<div style="height: 50%;">
						<figure class="snip1432">
						  <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sample36.jpg" alt="sample36" />
						  <figcaption>
						    <div>
						      <h3>Self securityTest</h3>
						      <h3>Useful security service</h3>
						    </div>
						    <div>
						      <h2>SECURITY SERVICE</h2>
						    </div>
						  </figcaption>
						  <a href="${pageContext.request.contextPath}/room/security"></a>
						</figure>
						
						
						</div>
					</div>
					<div style="float: left; width: 20%;height:100%;">
					</div>
					<div style="float: left; width: 45%;height:100%;">
						<div style="height: 60%;">
							<figure class="snip1361">
							  <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sample45.jpg" alt="sample45" />
							  <figcaption>
							    <h3 class="thicker"><span>Room Tip</span></h3>
							    <p><br>
							    집을 구하기 전   hollo 회원들과  <br><br>
							    살펴 보아야 할 주의 사항을 <br><br>
							    공유해보아요.</p>
							  </figcaption>
							  <a href="${pageContext.request.contextPath}/room/roomtip"></a>
							</figure>
						</div>
						<div style="height: 40%;">
						
						
						
						</div>
					</div>
					
					
				</div>
                </div>        
            </div>
            
            <p>
				<MARQUEE behavior="scroll" scrollamount="15" style="font-size: 30px;font-size: 64px; font-weight: bold; letter-spacing: 1.2em;">Design is not just what it looks like and feels like. Design is how it works. - Steve Jobs</MARQUEE>
			<!-- 스크롤의 속성 -->
		    </p>
            
            <div class="categories-Recommendation1">
                <div class="categoriesName">
                    <span>Interior</span>
                </div>
                        
                <div class="categories-content">추천게시물
 
	             </div>    
            </div>
            
            <p>
				<MARQUEE behavior="scroll" scrollamount="15" style="font-size: 30px;font-size: 64px; font-weight: bold; letter-spacing: 1.2em;">It is exercise alone that supports the spirits, and keeps the mind in vigor. </MARQUEE>
			<!-- 스크롤의 속성 -->
		    </p>
            
            <div class="categories-Recommendation1">
                <div class="categoriesName">
                    <span>Health</span>
                </div>
                        
                <div class="categories-content">
               		<div class="categories-health">
						<div class="categories-health-inside">
							<div class="categories-health-img2">
								<div class="button-1 rrright">
									<div class="eff-1"></div>
									<a href="${pageContext.request.contextPath}/supplement/list"> 영양체 추천하기 </a>
								  </div>
							</div>
							<div class="categories-health-words">
							</div>
					   </div>
						<div class="categories-health-img1">
									<div class="button-1 llleft">
										<div class="eff-1"></div>
										<a href="${pageContext.request.contextPath}/challenge/list"> 도전하러가기 </a>
									  </div>
<!-- 							<div class="categories-health-img1-box"> -->
<!-- 								<div class="categories-health-img1-category"> -->
<!-- 								</div> -->
<!-- 								<div class=""> -->
<!-- 								</div> -->
<!-- 							</div> -->
						</div>
					</div>
                </div>
                        
            </div>