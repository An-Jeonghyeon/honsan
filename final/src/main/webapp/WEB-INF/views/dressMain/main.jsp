<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <div class="dress-WeatherHeaderImg"></div>
            <div class="dress-menuball" id="scroll">
                <span>지역별 날씨 확인 하러 가기&nbsp;&gt;</span>
            </div>
            <div class="dress-WeatherMainBody">
                <div class="dress-WeatherTmpBody">
                    <div class="dress-WeatherTmp">
                        <i class="fas fa-temperature-high fa-2x"></i>
                        <span>오늘의 기온은</span>
                        <span class="dress-temper">
                            -8
                        </span>
                        <span>입니다.</span>

                    </div>
                    <div class="dress-tmeperText"><span>날씨가 매우 추니 두꺼운 외투를 입으세요!</span></div>
                </div>
                <div class="dress-WeatherImgBody">
                    <div class="dress-WeatherImg"></div>
                </div>
                <div class="dress-WeatherImgText">
                    <span>"</span>
                    <span class="dress-WeatherImgText-dress">가디건</span>
                    <span>"</span>
                    <span>같은 옷을 준비 하세요!</span>
                </div>
                <div class="dress-Today-color-Body">
                    <button class="dress-Today-button" type="button" data-toggle="modal"
                        data-target="#inputDialog">ToDay Color</button>
                    <span>버튼을 눌러서 오늘을 기분좋게 해줄 색을 확인 하세요!</span>
                </div>
                <div id="dialog" title="">
                    <span>이경태</span>
                    <span>님의 오늘의 색은</span>
                    <span class="dialog-randomColor">파랑</span>
                    <span>입니다.</span>
                </div>
            </div>