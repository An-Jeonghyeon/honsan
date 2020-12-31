<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	/*현재 날짜구하기  */
	function date() {
		let today = new Date();
		let year = today.getFullYear();
		let month = today.getMonth() + 1;
		let date = today.getDate();

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
		} else if (hour < 24) {
			hour = "23"
			return hour + "00";
		}

	}
	/* dress-searchWeatherInput에서 value 값 가지고 오기 */
	function inpVal(value) {
		var rsIV = value;
		$(".dress-weatherArea").html(rsIV);
	}

	/* 지역 입력 하면 name="weather"에 nx=x , ny=y 값치환 해서 보내기  */
	/* $(function(){
	
	 })
	 */
	/*                  지역이름 자바로 넘겨주기                    */
	function parsingJavaAreaName() {
		var areaName = $(".dress-searchWeatherInput").val();

		$
				.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/dressMain/weatherRequest",
					data : "areaName=" + areaName,
					dataType : "json",
					success : function(data) {
						fn(data);
					},
					error : function(e) {
						console.log(e.responseText);
					}
				});
	}

	/*name="weather"API 에서 날씨 정보 가지고 오기  */
	$(function() {
		$(".dress-searchWeatherButton")
				.click(
						function() {
							parsingJavaAreaName();
							//버튼 눌러서 $(".dress-searchWeatherInput").val();값 가지고 오기
							var IV = $(".dress-searchWeatherInput")
							if (IV != null) {
								inpVal(IV.val());
								IV.val("");

							}
							//날짜 가지고 오기
							var todate = date();
							console.log(todate)
							//발표 시간 가지고 오기
							var nowtime = nowTime();
							console.log(nowtime)

							//날씨 - 동네 예보 확인
							var url = "${pageContext.request.contextPath}/dressMain/weatherApi";
							var base_date = todate;
							var base_time = nowtime;
							//마파구 서교동, 기상청18_동네예보_조회서비스_오픈API활용가이드.zip 의 엑셀에 있음
							var nx = "59";
							var ny = "126";
							var query = "base_date=" + base_date
									+ "&base_time=" + base_time + "&nx=" + nx
									+ "&ny=" + ny;

							var fn = function(data) {
								console.log(data);
								printJSON(data);
							};
							ajaxFun(url, "get", "json", query, fn);
						})

		function printJSON(data) {
			var out;
			var category;
			var fcstDate, fcstTime;//예측일자, 예측 시간
			var fcstValue;//예측값
			var pop, t3h, sky, tmn, tmx;

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
				}
			});
			out = t3h;
			$(".dress-temper").html(out);

			var ti = nowTime()

			outtime = ti;
			$(".outTime").html(outtime);
		}
	})
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
</script>

<div class="dress-WeatherHeaderImg"></div>
<div class="dress-menuball" id="scroll">
	<span>지역별 날씨 확인 하러 가기&nbsp;&gt;</span>
</div>
<div id="dress-searchWeather">

	<input class="dress-searchWeatherInput" type="text" name="areaName"
		placeholder="지역을 입력해주세여">

	<button class="dress-searchWeatherButton" type="button">area</button>
</div>
<div class="dress-WeatherMainBody">
	<div class="dress-WeatherTmpBody">
		<div class="dress-WeatherTmp">
			<i class="fas fa-temperature-high fa-2x"></i> <span
				class="dress-weatherArea">입력한 지역 </span><span> 기온은</span> <span
				class="dress-temper"></span> <span>입니다.</span> <span>기준시간:</span> <span
				class="outTime"></span>


		</div>
		<div class="dress-tmeperText">
			<span>날씨가 매우 추니 두꺼운 외투를 입으세요!</span>
		</div>
	</div>
	<div class="dress-WeatherImgBody">
		<div class="dress-WeatherImg"></div>
	</div>
	<div class="dress-WeatherImgText">
		<span>"</span> <span class="dress-WeatherImgText-dress">가디건</span> <span>"</span>
		<span>같은 옷을 준비 하세요!</span>
	</div>
	<div class="dress-Today-color-Body">
		<button class="dress-Today-button" type="button" data-toggle="modal"
			data-target="#inputDialog">ToDay Color</button>
		<span>버튼을 눌러서 오늘을 기분좋게 해줄 색을 확인 하세요!</span>
	</div>
	<div id="dialog" title="">
		<span>이경태</span> <span>님의 오늘의 색은</span> <span
			class="dialog-randomColor">파랑</span> <span>입니다.</span>
	</div>
</div>
