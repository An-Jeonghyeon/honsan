<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <!-- 
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">	 
     -->

    <script src="${pageContext.request.contextPath}/resources/js/layout_login.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/dress/created.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/home.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/dressTip/list.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/dressMain/main.js"></script>
      
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout_login.css" type="text/css">
    <!-- 글쓰기 폼 css 참고할 사람은 아래의 링크를 참고하세요! 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dress/created.css" type="text/css">
     -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dress/list.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dress/article.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dressTip/list.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dressMain/main.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cook/honCooq.css" type="text/css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.7.0/css/all.min.css" integrity="sha512-gRH0EcIcYBFkQTnbpO8k0WlsD20x5VzjhOA1Og8+ZUAhcMUCvd+APD35FJw3GzHAP3e+mP28YcDJxVr745loHw==" crossorigin="anonymous" />
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    
    <title>Document</title>
</head>

<body>
   <div id="mainBody">
		<header>
		    <tiles:insertAttribute name="header"/>
		</header>
			
		<section id="mainSection">
		    <tiles:insertAttribute name="body"/>
		</section>
		
		<footer>
		    <tiles:insertAttribute name="footer"/>
		</footer>
	</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery.ui.datepicker-ko.js"></script>

</body>
</html>