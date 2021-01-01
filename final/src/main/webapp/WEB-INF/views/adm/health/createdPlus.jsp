<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adm/health/created.css" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">

<!-- 추가누르면 생기는 리스트 -->
<div class="moreplus">
    <table class="moreplustable">
        <tr>
            <th class="plusnum center">번호</th>
            <th class="plusdate center">기간</th>
            <th class="plustotal center">총 일수</th>
            <th class="pluscontent center">내용</th>
        </tr>
        <tr>
            <td class="center">1</td>
            <td class="center">1 ~ 3 일차</td>
            <td class="center">3일 </td>
            <td>
                <div class="pluscontent_">
                  	  스쿼트 20회
                </div>
                <div class="pluscontent_btn">
                 <button type="button" class="plusdelete">X</button>
                </div>
            </td>
        </tr>
    </table>
</div>