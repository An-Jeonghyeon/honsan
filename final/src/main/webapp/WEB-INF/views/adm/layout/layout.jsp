<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    


    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    
    
    <link href="${pageContext.request.contextPath}/resources/images/layout_logout/hollo_title.png" rel="shortcut icon" type="image/x-icon">
    <title>Hollo - Home live alone</title>
    
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" type='text/css' href="${pageContext.request.contextPath}/resources/assets/materialize/css/materialize.min.css" media="screen,projection" />
    <!-- Bootstrap Styles-->
    <link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css" rel="stylesheet" type='text/css' />
    <!-- FontAwesome Styles-->
    <link href="${pageContext.request.contextPath}/resources/assets/css/font-awesome.css" rel="stylesheet" type='text/css' />
    <!-- Morris Chart Styles-->
    <link href="${pageContext.request.contextPath}/resources/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" type='text/css' />
    <!-- Custom Styles-->
    <link href="${pageContext.request.contextPath}/resources/assets/css/custom-styles.css" rel="stylesheet" type='text/css' />
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" type='text/css' href="${pageContext.request.contextPath}/resources/assets/js/Lightweight-Chart/cssCharts.css"> 
</head>

<body>

<div class="header">
    <tiles:insertAttribute name="header"/>
</div>
	
<div class="body">
    <tiles:insertAttribute name="body"/>
</div>

	<!-- Bootstrap Js -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/assets/materialize/js/materialize.min.js"></script>
	
    <!-- Metis Menu Js -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.metisMenu.js" ></script>
    <!-- Morris Chart Js -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/morris/raphael-2.1.0.min.js" ></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/morris/morris.js" ></script>
	
	
	<script src="${pageContext.request.contextPath}/resources/assets/js/easypiechart.js" ></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/easypiechart-data.js" ></script>
	
	 <script src="${pageContext.request.contextPath}/resources/assets/js/Lightweight-Chart/jquery.chart.js"></script>
</body>

</html>