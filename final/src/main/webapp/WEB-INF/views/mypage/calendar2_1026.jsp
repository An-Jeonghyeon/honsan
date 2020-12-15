<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	Calendar cal=Calendar.getInstance();

	int year=cal.get(Calendar.YEAR);
	int month=cal.get(Calendar.MONTH)+1;
	
	String sy=request.getParameter("year"); // year로 넘어오는것이 없으면 null
	String sm=request.getParameter("month");
	if(sy!=null) {
		year=Integer.parseInt(sy);
	}
	if(sm!=null) {
		month=Integer.parseInt(sm);
	}
	
	cal.set(year, month-1, 1); //y년 m월 1일로 날짜 객체 설정
	year=cal.get(Calendar.YEAR);
	month=cal.get(Calendar.MONTH)+1;
	
	int lastDay=cal.getActualMaximum(Calendar.DATE);
	int week=cal.get(Calendar.DAY_OF_WEEK); // 일(1)~토(7)
	
	pageContext.setAttribute("year", year);
	pageContext.setAttribute("month", month);
	pageContext.setAttribute("lastDay", lastDay);
	pageContext.setAttribute("week", week);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	margin: 0; padding: 0;
}
body{
	font-size: 14px; font-family: 맑은 고딕, 돋움;
}

a{
	color: #000; text-decoration: none;
}
a:hover, a:active{
	color: tomato; text-decoration: underline;
}

.box {
	margin: 30px auto;
	width: 210px;
}

.box table {
	width: 100%;
	border-spacing: 0;
	border-collapse: collapse;
}

.table-date td:nth-child(7n+1){
	color: red;
}
.table-date td:nth-child(7n){
	color: blue;
}
</style>

</head>
<body>

<div class="box">
	<table>
		<tr height="30" align="center">
			<td>
				<c:url var="pre" value="calendar2.jsp">
					<c:param name="year" value="${year}"/>
					<c:param name="month" value="${month-1}"/>
				</c:url>
				<c:url var="next" value="calendar2.jsp">
					<c:param name="year" value="${year}"/>
					<c:param name="month" value="${month+1}"/>
				</c:url>
				
				<a href="${pre}">&lt;</a>
				<span>${year}年 ${month}月</span>
				<a href="${next}">&gt;</a>
			</td>
		</tr>
	</table>
	
	<table class="table-date" border="1">
		<tr height="30" align="center" bgcolor="#e4e6e4">
			<td width="30">일</td>
			<td width="30">월</td>
			<td width="30">화</td>
			<td width="30">수</td>
			<td width="30">목</td>
			<td width="30">금</td>
			<td width="30">토</td>
		</tr>
		
		<c:set var="col" value="0"/>
		<c:out value="<tr height='30' align='center'>" escapeXml="false"/>
		<c:forEach var="i" begin="1" end="${week-1}">
			<c:out value="<td>&nbsp;</td>" escapeXml="false"/>
			<c:set var="col" value="${col+1}"/>
		</c:forEach>
		
		<c:forEach var="i" begin="1" end="${lastDay}">
			<td>${i}</td>
			<c:set var="col" value="${col+1}"/>
			<c:if test="${col==7 && i!=lastDay}">
				<c:out value="</tr><tr height='30' align='center'>" escapeXml="false"/>
				<c:set var="col" value="0"/>
			</c:if>
		</c:forEach>
		
		<c:if test="${col>0 && col<7}">
			<c:forEach var="i" begin="${col+1}" end="7">
				<td>&nbsp;</td>
			</c:forEach>
		</c:if>
		<c:out value="</tr>" escapeXml="false"/>
	</table>
</div>

</body>
</html>