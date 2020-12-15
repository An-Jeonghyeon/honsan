<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%
	Calendar cal=Calendar.getInstance();

	int year=cal.get(Calendar.YEAR);
	int month=cal.get(Calendar.MONTH)+1;
	
	String sy=request.getParameter("year"); // year로 넘어오는것이 없으면 null
	String sm=request.getParameter("month");
	
	if(sy!=null)
		year=Integer.parseInt(sy);
	
	if(sm!=null)
		month=Integer.parseInt(sm);
	
	cal.set(year, month-1, 1); //y년 m월 1일로 날짜 객체 설정
	year=cal.get(Calendar.YEAR);
	month=cal.get(Calendar.MONTH)+1;
	
	int week=cal.get(Calendar.DAY_OF_WEEK); // 일(1)~토(7)
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
<body> <!-- 스크립트릿, 표현식 모두 없애고 JSPL로 변경  -->

<div class="box">
	<table>
		<tr height="30" align="center">
			<td>
			<c:set var="now" value="<%=new java.util.Date()%>"/>
			<c:set var="year" value="now.fn:substring(now,0,5)"/>
			<c:set var="month" value="now.fn:substring(now,0,5)"/>
			${nowDate} ${year} ${month} 
			
				<a href="calendar.jsp?year=<%=year%>&month=<%=month-1%>">&lt;</a>
				<span><%=year%>年 <%=month%>月</span>
				<a href="calendar.jsp?year=<%=year%>&month=<%=month+1%>">&gt;</a>
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
<%
		int col=0;
		out.print("<tr height='30' align='center'>");
		for(int i=1; i<week; i++) { // 1일 앞 공백
			out.print("<td>&nbsp;</td>");
			col++;
		}
		
		// 해당월의 마지막일자
		int e=cal.getActualMaximum(Calendar.DATE);
		for(int i=1; i<=e; i++) {
			out.print("<td>"+i+"</td>");
			col++;
			if(col==7 && i!=e) {
				out.print("</tr><tr height='30' align='center'>");
				col=0;
			}
		}
		
		// 주의 마지막 일자 출력 후
		while(col>0 && col<7) {
			out.print("<td>&nbsp;</td>");
			col++;
		}
		out.print("</tr>");
%>		
	</table>
	
	
</div>

</body>
</html>