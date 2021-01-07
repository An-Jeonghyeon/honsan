  <%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script type="text/javascript">
	/*현재 날짜구하기  */
	function date() {
		let today = new Date();
		let year = today.getFullYear();
		let month = today.getMonth() + 1;
		let date = today.getDate();
		let hour = today.getHours();
		console.log(hour);
		if(hour===1||hour===0 && month<12){
			date=date-1;
			month= "0"+month;
			if(date<10){
				date= "0"+date;
			}
			return "" + year + month + date;
		}else if(month<12){
			month= "0"+month;
			if(date<10){
				date= "0"+date;
			}
			return year+ month + date;
		}else if(hour==1){
			
		}
		
		return "" + year + month + date;
	}
	/*현재 시간구하기  */
	function nowTime() {
		let today = new Date();
		let hour = today.getHours();
		
		if (hour < 5) {
			hour = "02"
			return hour + "00";
		} else if (hour < 8) {
			hour = "05"
			return hour + "00";
		} else if (hour < 11) {
			hour = "08"
			return hour + "00";
		} else if (hour < 14) {
			hour = "11"
			return hour + "00";
		} else if (hour < 17) {
			hour = "14"
			return hour + "00";
		} else if (hour < 20) {
			hour = "17"
			return hour + "00";
		} else if (hour < 23) {
			hour = "20"
			return hour + "00";
		} else if (hour < 1) {
			hour = "20"
				return hour + "00";
		}else{
			return hour + "00";
		}
	
		return hour;
		

	}
	
	/*name="weather"API 에서 날씨 정보 가지고 오기  */
$(function() {
	$(".dress-searchWeatherButton").click(function() {
	
			//버튼 눌러서 $(".dress-searchWeatherInput").val();값 가지고 오기
			var town = $(".dress-searchWeatherInput").val();
			$(".dress-searchWeatherInput").val("");
			if (!town) {
				$(".dress-searchWeatherInput").focus();
				return false;
			}
			$(".dress-weatherArea").text(town);
			//날짜 가지고 오기
		 	var todate = date();
			console.log(todate)
			//발표 시간 가지고 오기
			var nowtime = nowTime();
			console.log(nowtime)
		
			//날씨 - 동네 예보 확인
			var url = "${pageContext.request.contextPath}/dressMain/weatherRequest"
			

			var query = "base_date=" + todate+ "&base_time=" +nowtime + "&town=" + encodeURIComponent(town);
			
			var fn = function(data) {
				printJSON(data);
			};
			ajaxFun(url, "get", "json", query, fn);
})

function printJSON(data) {
		console.log(data);
			var wind;
			var out;
			var category;
			var fcstDate, fcstTime;//예측일자, 예측 시간
			var fcstValue;//예측값
			var pop, t3h, sky, tmn, tmx ,wsd;

			if (!data.response.body) {
				alert("등록된 정보가 없습니다.");
				return false;
			}

			var list = data.response.body.items.item;
			$.each(list, function(index, item) {
				category = item.category;
				fcstDate = item.fcstDate;
				fcstTime = item.fcstTime;
				fcstValue = item.fcstValue;

				if (category === "POP") {//강수 확률
					pop = fcstValue;
				} else if (category === "SKY") {//하늘 상태
					if (fcstValue === "1") {
						sky = "맑음";
					} else if (fcstValue === "3") {
						sky = "구름 많음";
					} else if (fcstValue === "4") {
						sky = "흐림";
					}
				} else if (category === "T3H") {//3시간 기온
					t3h = fcstValue;
				} else if (category==="WSD"){//풍속 		
					var fcstvalue = fcstValue*1;
					if(fcstvalue <4){
						wsd="바람 약함"
					}else if(fcstValue >4 && fcstValue < 9){
						wsd="바람이 약간 강하다"						
					}else if(fcstValue >9 && fcstValue < 14){
						wsd="바람이 강함"						
					}else if(fcstValue > 14){
						wsd="바람이 매우 강하다"						
					} 
				}
			});
			out = t3h;
			wind = wsd;
			
			if(out*1<=1){
					$(".dress-tmeperText span").html("상당히 추워요!  <span style='color:brown;'>패딩, 두꺼운코드, 목도리, 기모제품 </span>을(를) 준비하세요!");
					$(".dress-WeatherImg").css("background-image","url('/app/resources/images/dress/cold.png')");
			}else if(out*1 > 1 &&out*1 < 8){
					$(".dress-tmeperText span").html("날씨가 추워요 여러겹의 <span style='color:brown;'>코트, 가죽자켓, 히트텍, 니트, 레깅스 </span>을(를) 준비하세요!");
					$(".dress-WeatherImg").css("background-image","url('/app/resources/images/dress/padding.png')");
			}else if(out*1 > 9 &&out*1 < 11){
					$(".dress-tmeperText span").html("날씨가 추워요 <span style='color:brown;'>자켓, 트렌치코트, 야상, 니트, 청바지, 스타킹 </span>을(를) 준비하세요!");
					$(".dress-WeatherImg").css("background-image","url('/app/resources/images/dress/trance.png')");
			}else if(out*1 >= 12 &&out*1 <= 16){
					$(".dress-tmeperText span").html("여러겹의 옷을 준비하는게 좋겠어요!  <span style='color:brown;'>자켓, 가디건, 야상, 스타킹, 청바지, 면바지 </span>을(를) 준비하세요!");
					$(".dress-WeatherImg").css("background-image","url('/app/resources/images/dress/jaket.png')");
			}else if(out*1 >=17  &&out*1 <= 19){
					$(".dress-tmeperText span").html("시원한 날씨입니다! <span style='color:brown;'>얇은니트, 맨투맨, 가디건, 청바지 </span>을(를) 준비하세요!");
					$(".dress-WeatherImg").css("background-image","url('/app/resources/images/dress/mantoma.png')");
			}else if(out*1 >= 20 &&out*1 <= 22){
					$(".dress-tmeperText span").html("날씨가 더워요! <span style='color:brown;'>얇은가디건, 긴팔, 면바지, 청바지 </span>을(를) 준비하세요!");
					$(".dress-WeatherImg").css("background-image","url('/app/resources/images/dress/mantoman.png')");
			}else if(out*1 >= 23 &&out*1 <= 27){
					$(".dress-tmeperText span").html("여름 날씨에요! <span style='color:brown;'>반팔, 얇은 셔츠, 반바지, 면바지 </span>을(를) 준비하세요!");
					$(".dress-WeatherImg").css("background-image","url('/app/resources/images/dress/tsluts.png')");
			}else if(out*1 >= 28 ){
					$(".dress-tmeperText span").html("날씨가 매우 더우니 더위에 조심하세요! <span style='color:brown;'>민소매, 반팔, 반바지, 원피스 </span>을(를) 준비하세요!");
					$(".dress-WeatherImg").css("background-image","url('/app/resources/images/dress/tsluts.png')");
			}
			
			
			$(".dress-temper").html(out);
			$(".dress-wind").html(wsd);
			var ti = nowTime();

			outtime = ti;
			$(".outTime").html(outtime);
		}
	});
	
	function ajaxFun(url, method, dataType, query, fn) {
		$.ajax({
			type : method,
			url : url,
			data : query,
			dataType : dataType,
			success : function(data) {
				fn(data);
			},
			error : function(e) {
				console.log(e.responseText);
			}
		});
	}
	
/* 모달에 지역별 날씨 뿌리기 */

    $(function(){ 
	 var url="${pageContext.request.contextPath}/dressMain/areaWeatherChart";
	//$.getJSON(): AJAX 처리 결과를 json 으로 반환 받는 함수 
	$.getJSON(url, function(data){ 
		

		Highcharts.chart("dialog", {
			title:{
				text:"전국 평균 기온 "
				
			},
			xAxis:{
				categories:data.categories
			},
		    yAxis:{
		    	title:{
		    		text:"기온(c)"
		    	}
		    },
		   series:data.series
		
		})
		
 	
	 })
 })     
 $(function(){
	 $("#dialog").css("height","700");
	$("#highcharts-8ewdc0b-0").css("width","0");

 })
</script>

<div class="dress-WeatherHeaderImg"></div>
    <div class="dress-menuball" id="scroll">
        <span>지역별 날씨 확인 하러 가기&nbsp;&gt;</span>
    </div>

    <div class="dress-WeatherMainBody">
        <div class="BodyBody">
            <div class="dress-WeatherTmpBody">
                <div class="dress-WeatherTmp">
                    <div class="wa">
                        <div class="svg-contain">
                            <svg version="1.1" class="clear-sky-svg" xmlns="http://www.w3.org/2000/svg"
                                xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 72.3 52.6"
                                style="enable-background:new 0 0 72.3 52.6;" xml:space="preserve">
                                <g>
                                    <path class="sun"
                                        d="M50.8,25.7c0,7.9-6.4,14.4-14.4,14.4s-14.4-6.4-14.4-14.4s6.4-14.4,14.4-14.4S50.8,17.8,50.8,25.7z" />
                                    <path class="line big-path line-1" d="M54.5,25.8h6" />
                                    <path class="line big-path line-2" d="M12.4,25.8h6" />
                                    <path class="line big-path line-3" d="M36.5,44.3v6" />
                                    <path class="line big-path line-4" d="M36.5,8.2v-6" />
                                    <path class="line big-path line-5" d="M23,38.8l-4.8,4.8" />
                                    <path class="line big-path line-6" d="M54.9,8.9L50,13.8" />
                                    <path class="line big-path line-7" d="M50,38.8l4.4,4.4" />
                                    <path class="line big-path line-8" d="M18.8,9.6l4.2,4.2" />
                                </g>
                            </svg>
                        </div>
                    </div>
                    <div class="waa">
                        <span class="dress-temper"><b></b></span>
                    </div>
                    <div class="dress-baseTimeBody">
                        <span class="dress-baseTime">기준시간</span>
                        <span class="outTime"></span>
                            <div class="dress-windWidn">
                                <div class="dress-wind">바람강도</div>
                            </div>
                    </div>
                    <div id="dress-searchWeather">
                        <input class="dress-searchWeatherInput" type="text" name="town"
                            placeholder="ex)강서구, 해운대구,제주">
                        <button class="dress-searchWeatherButton" type="button">area</button>
                    </div>
                    <div class="dress-tmeperText">
                        <span></span>
                    </div>

                </div>
            </div>
            <div class="dress-WeatherImgBody">
                <div class="dress-WeatherImg"></div>
            </div>
            <div class="dress-WeatherImgText"></div>

            <div id="dialog">
                <div class="innerdialog"></div>
            </div>
        </div>
    </div>

