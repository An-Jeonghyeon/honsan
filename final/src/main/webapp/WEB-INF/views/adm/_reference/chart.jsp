<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
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
    <div id="wrapper">
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle waves-effect waves-dark" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- 왼쪽 최상단 홈페이지 이름 부분  -->
                <a class="navbar-brand waves-effect waves-dark" href="${pageContext.request.contextPath}/home"> <strong>honsan</strong></a>
				
				<!-- 최상단 리스트 표시 !!  -->
		<div id="sideNav" href=""><i class="material-icons dp48">toc</i></div>
            </div>
			
			<!-- 최상단 메세지 , 차트 , 알림 , 마이페이지 순 이미지  -->
            <ul class="nav navbar-top-links navbar-right"> 
				<li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown4"><i class="fa fa-envelope fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>				
				<li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown3"><i class="fa fa-tasks fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>
				  <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown1"><i class="fa fa-user fa-fw"></i> <b>관리자</b> <i class="material-icons right">arrow_drop_down</i></a></li>
            </ul>
        </nav>
        <!-- 위 최상단 아이콘 안의 1번 속성   -->
		<!-- Dropdown Structure -->
<ul id="dropdown1" class="dropdown-content">
<li><a href="${pageContext.request.contextPath}/home"><i class="fa fa-sign-out fa-fw"></i>돌아가기</a>
</li>
</ul>
		<!--  최상단 이미지 2번 속성  w : 길이 조절  -->

</ul>
<!-- 맨위 속성 3번  오늘의 게시글 수 확인용 -->
<ul id="dropdown3" class="dropdown-content dropdown-tasks w250">
<li>
		<a href="#">
			<div>
				<p>
					<strong>오늘의 옷 게시판 </strong>
					<span class="pull-right text-muted">today 60개 </span>
				</p>
				<div class="progress progress-striped active">
					<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
						<span class="sr-only"></span>
					</div>
				</div>
			</div>
		</a>
	</li>
	<li class="divider"></li>
	<li>
		<a href="#">
			<div>
				<p>
					<strong>요리 나라 </strong>
					<span class="pull-right text-muted">today 28개</span>
				</p>
				<div class="progress progress-striped active">
					<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="28" aria-valuemin="0" aria-valuemax="100" style="width: 28%">
						<span class="sr-only">28% Complete</span>
					</div>
				</div>
			</div>
		</a>
	</li>
	<li class="divider"></li>
	<li>
		<a href="#">
			<div>
				<p>
					<strong>건물 주님</strong>
					<span class="pull-right text-muted">today 60 개</span>
				</p>
				<div class="progress progress-striped active">
					<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
						<span class="sr-only">60% Complete (warning)</span>
					</div>
				</div>
			</div>
		</a>
	</li>
	<li class="divider"></li>
	<li>
		<a href="#">
			<div>
				<p>
					<strong>내 방 탄소년단 </strong>
					<span class="pull-right text-muted">today 85 개</span>
				</p>
				<div class="progress progress-striped active">
					<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%">
						<span class="sr-only">85% Complete (danger)</span>
					</div>
				</div>
			</div>
		</a>
	</li>
	<li class="divider"></li>
	<li>
</ul>   
<!-- Q&A FAQ 받아오면 넣을 이미지 최신 일자  -->
<ul id="dropdown4" class="dropdown-content dropdown-tasks w250 taskList">
  <li>
  							<a href="#">
                                <div>
                                    <strong>원숭이 </strong>
                                    <span class="pull-right text-muted">
                                        <em>FAQ</em>
                                    </span>
                                </div>
                                <p>이건 머임 ?? 어떻게 하는건지좀 알려줘바 ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</p>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                        	<a href="#">
                                <div>
                                    <strong>토끼 </strong>
                                    <span class="pull-right text-muted">
                                        <em>Q&A</em>
                                    </span>
                                </div>
                                <p>토끼 토끼 토끼끼끼끼 토끼끼끼끼 토토톹토토끼끼끼끼끼끼끼끼끼끼 ?</p>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>??????</strong>
                                    <span class="pull-right text-muted">
                                        <em>여긴머넣어 </em>
                                    </span>
                                </div>
                                <p>머를 넣어야 할지 모르겠당 ㅎㅎ </p>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>전체 문의 보기 </strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
</ul>  
	   <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a class="active-menu waves-effect waves-dark" href="${pageContext.request.contextPath}/adm/chart"><i class="fa fa-bar-chart-o"></i> 게시판 새글 현황</a>
                    </li>
					<li>
                        <a href="${pageContext.request.contextPath}/adm/visitorStatus" class=" waves-effect waves-dark"><i class="fa fa-bar-chart-o"></i>방문자 현황</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/adm/memberManagement" class="waves-effect waves-dark"><i class="fa fa-desktop"></i> 회원 관리</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/adm/boardManagement" class="waves-effect waves-dark"><i class="fa fa-qrcode"></i> 게시판 관리</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/adm/health" class="waves-effect waves-dark"><i class="fa fa-table"></i>[하루운동챌린지] 관리</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/adm/cook" class="waves-effect waves-dark"><i class="fa fa-edit"></i>[우리집 냉장고] 관리</a>
                    </li>
                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
      
		<div id="page-wrapper">
		  <div class="header"> 
                        <h1 class="page-header">
                            	게시판 작성 현황
                        </h1>
						<ol class="breadcrumb">
					  <li><a href="#">Home</a></li>
					  <li><a href="#">게시판 현황</a></li>
					  <li class="active">Data</li>
					</ol> 
									
		</div>
			<!-- 게시판현황 전체 게시판 크기  -->
            <div id="page-inner"> 
			<!--  게시판 수 표시 칸  -->
			<div class="dashboard-cards"> 
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-3">
					
						<div class="card horizontal cardIcon waves-effect waves-dark">
						<div class="card-image red">
						<i class="material-icons dp48">import_export</i>
						</div>
						<div class="card-stacked red">
						<div class="card-content">
						<h3>오늘 뭐 입어?</h3> 
						</div>
						<div class="card-action">
						<strong>10,375 개</strong>
						</div>
						</div>
						</div>
	 
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">
					
						<div class="card horizontal cardIcon waves-effect waves-dark">
						<div class="card-image orange">
						<i class="material-icons dp48">import_export</i>
						</div>
						<div class="card-stacked orange">
						<div class="card-content">
						<h3>혼자 뭐 먹지?</h3> 
						</div>
						<div class="card-action">
						<strong>36,540</strong>
						</div>
						</div>
						</div> 
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">
					
							<div class="card horizontal cardIcon waves-effect waves-dark">
						<div class="card-image blue">
						<i class="material-icons dp48">import_export</i>
						</div>
						<div class="card-stacked blue">
						<div class="card-content">
						<h3>방구할래?</h3> 
						</div>
						<div class="card-action">
						<strong>24,225</strong>
						</div>
						</div>
						</div> 
						 
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">
					
					<div class="card horizontal cardIcon waves-effect waves-dark">
						<div class="card-image green">
						<i class="material-icons dp48">import_export</i>
						</div>
						<div class="card-stacked green">
						<div class="card-content">
						<h3>인테리어</h3> 
						</div>
						<div class="card-action">
						<strong>88,658</strong>
						</div>
						</div>
						</div> 
						 
                    </div>
                    
                    
                    
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-3">
						<div class="card horizontal cardIcon waves-effect waves-dark">
						<div class="card-image brown">
						<i class="material-icons dp48">import_export</i>
						</div>
						<div class="card-stacked brown">
						<div class="card-content">
						<h3>건강챙기기</h3> 
						</div>
						<div class="card-action">
						<strong>10,375 개</strong>
						</div>
						</div>
						</div>
	 
                    </div>
                 </div>
			   </div>
				<!-- /. ROW  --> 
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-7"> 
					<div class="cirStats">
						  	<div class="row">
								<div class="col-xs-12 col-sm-6 col-md-6"> 
										<div class="card-panel text-center">
											<h4>Profit</h4>
											<div class="easypiechart" id="easypiechart-blue" data-percent="82" ><span class="percent">82%</span>
											</div> 
										</div>
								</div>
								<div class="col-xs-12 col-sm-6 col-md-6"> 
										<div class="card-panel text-center">
											<h4>No. of Visits</h4>
											<div class="easypiechart" id="easypiechart-red" data-percent="46" ><span class="percent">46%</span>
											</div>
										</div>
								</div>
								<div class="col-xs-12 col-sm-6 col-md-6"> 
										<div class="card-panel text-center">
											<h4>Customers</h4>
											<div class="easypiechart" id="easypiechart-teal" data-percent="84" ><span class="percent">84%</span>
											</div> 
										</div>
								</div>
								<div class="col-xs-12 col-sm-6 col-md-6"> 
										<div class="card-panel text-center">
											<h4>Sales</h4>
											<div class="easypiechart" id="easypiechart-orange" data-percent="55" ><span class="percent">55%</span>
											</div>
										</div>
								</div> 
								<div class="col-xs-12 col-sm-6 col-md-6"> 
										<div class="card-panel text-center">
											<h4>Sales</h4>
											<div class="easypiechart" id="easypiechart-brown" data-percent="55" ><span class="percent">55%</span>
											</div>
										</div>
								</div>  
								<div class="col-xs-12 col-sm-6 col-md-6"> 
										<div class="card-panel text-center">
											<h4>Sales</h4>
											<div class="easypiechart" id="easypiechart-purple" data-percent="55" ><span class="percent">55%</span>
											</div>
										</div>
								</div>  
							</div>
						</div>							
						</div><!--/.row-->
						<div class="col-xs-12 col-sm-12 col-md-5"> 
						     <div class="row">
									<div class="col-xs-12"> 
									<div class="card">
										<div class="card-image donutpad">
										  <div id="morris-donut-chart"></div>
										</div> 
										<div class="card-action">
										  <b>Donut Chart Example</b>
										</div>
									</div>	
								</div>
							 </div>
						</div><!--/.row-->
					</div>
					
		 
			<div class="row">
				<div class="col-md-5"> 
						<div class="card">
						<div class="card-image">
						 <div id="morris-line-chart"></div>
						</div> 
						<div class="card-action">
						  <b>Line Chart</b>
						</div>
						</div>
		  
			</div>		
					
				<div class="col-md-7"> 
					<div class="card">
					<div class="card-image">
					  <div id="morris-bar-chart"></div>
					</div> 
					<div class="card-action">
					  <b> Bar Chart Example</b>
					</div>
					</div>					
					</div>
					
				</div> 
			 
				
				

  
					
						
<!-- 							  <div id="morris-area-chart"></div>
							</div> 
							 -->
		
					




                <!-- /. ROW  -->

	   
				
				
	
                <!-- /. ROW  -->
			   <div class="fixed-action-btn horizontal click-to-toggle">
    <a class="btn-floating btn-large red">
      <i class="material-icons">menu</i>
    </a>
    <ul>
      <li><a class="btn-floating red">1</a></li>
      <li><a class="btn-floating yellow darken-1"><i class="material-icons">format_quote</i></a></li>
      <li><a class="btn-floating green"><i class="material-icons">publish</i></a></li>
      <li><a class="btn-floating blue"><i class="material-icons">attach_file</i></a></li>
    </ul>
  </div>
		
				<footer><p>Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>
</p>
				
        
				</footer>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
    <!-- jQuery Js -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery-1.10.2.js" ></script>
	
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
	
    <!-- Custom Js -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/custom-scripts.js" ></script> 
 

</body>

</html>