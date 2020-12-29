<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Target Material Design Bootstrap Admin Template</title>
	
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/materialize/css/materialize.min.css" media="screen,projection" />
    <!-- Bootstrap Styles-->
    <link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css" rel="stylesheet" type='text/css'/>
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
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand waves-effect waves-dark" href="${pageContext.request.contextPath}/home"> <strong>honsan</strong></a>
				
		<div id="sideNav" href=""><i class="material-icons dp48">toc</i></div>
            </div>

            <ul class="nav navbar-top-links navbar-right"> 
				<li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown4"><i class="fa fa-envelope fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>				
				<li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown3"><i class="fa fa-tasks fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>
				  <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown1"><i class="fa fa-user fa-fw"></i> <b>admin</b> <i class="material-icons right">arrow_drop_down</i></a></li>
            </ul>
        </nav>
		<!-- Dropdown Structure -->
<ul id="dropdown1" class="dropdown-content">
<li><a href="#"><i class="fa fa-user fa-fw"></i> 머머머</a>
</li>
<li><a href="#"><i class="fa fa-gear fa-fw"></i> 모모모</a>
</li> 
<li><a href="#"><i class="fa fa-sign-out fa-fw"></i> 뚜뚜뚜</a>
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
        <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li>
                        <a class="waves-effect waves-dark" href="${pageContext.request.contextPath}/adm/chart"><i class="fa fa-bar-chart-o"></i> 게시판 새글 현황</a>
                    </li>
					<li>
                        <a href="${pageContext.request.contextPath}/adm/visitorStatus" class=" waves-effect waves-dark"><i class="fa fa-bar-chart-o"></i>방문자 현황</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/adm/memberManagement" class="waves-effect waves-dark"><i class="fa fa-desktop"></i> 회원 관리</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/adm/boardManagement" class="active-menu waves-effect waves-dark"><i class="fa fa-qrcode"></i> 게시판 관리</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/adm/health" class="waves-effect waves-dark"><i class="fa fa-table"></i>[하루운동챌린지]관리</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/adm/cook" class="waves-effect waves-dark"><i class="fa fa-edit"></i>[우리집 냉장고]관리</a>
                    </li>
                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
			  <div class="header"> 
                        <h1 class="page-header">
                           	 정지게시판 현황
                        </h1>
						<ol class="breadcrumb">
					  <li><a href="#">Home</a></li>
					  <li><a href="#">정지 게시판 현황</a></li>
					  <li class="active">Data</li>
					</ol> 
									
		</div>
		
            <div id="page-inner"> 
                                 
            <div class="row">

                <div class="col-md-4 col-sm-4">
                        <div class="card blue-grey darken-1">
						<div class="card-content white-text">
						  <span class="card-title">정지 게시판 제목  및 아이디 </span>
						  <p>정지된 이유 및 내용 등 글자로 표기 하는 방법입니다 호롤롤롤롤ㄹ</p>
						</div>
						<div class="card-action">
						  <a href="#">(정지 게시물 링크로 가기)</a>
						  <a href="#">(정지 회원 리스트로 가기 )</a>
						</div>
					  </div>
                </div>
                
                <div class="col-md-4 col-sm-4">
                        <div class="card blue-grey darken-1">
						<div class="card-content white-text">
						  <span class="card-title">정지 게시판 제목  및 아이디 </span>
						  <p>정지된 이유 및 내용 등 글자로 표기 하는 방법입니다 호롤롤롤롤ㄹ</p>
						</div>
						<div class="card-action">
						  <a href="#">(정지 게시물 링크로 가기)</a>
						  <a href="#">(정지 회원 리스트로 가기 )</a>
						</div>
					  </div>
                </div>
                
                <div class="col-md-4 col-sm-4">
                        <div class="card blue-grey darken-1">
						<div class="card-content white-text">
						  <span class="card-title">정지 게시판 제목  및 아이디 </span>
						  <p>정지된 이유 및 내용 등 글자로 표기 하는 방법입니다 호롤롤롤롤ㄹ</p>
						</div>
						<div class="card-action">
						  <a href="#">(정지 게시물 링크로 가기)</a>
						  <a href="#">(정지 회원 리스트로 가기 )</a>
						</div>
					  </div>
                </div>

            </div>
                   <!-- /. ROW  -->
            <div class="row">
                <div class="col-md-4 col-sm-4">
                    <div class="card">
						<div class="card-image waves-effect waves-block waves-light">
						  <img class="activator" src="http://materializecss.com/images/office.jpg">
						</div>
						<div class="card-content">
						  <span class="card-title activator grey-text text-darken-4">정지 게시판 제목 및 아이디 </span>
						  <p><a href="#">정지된 게시물로 가기</a> </p>
						  
						</div>
						<div class="card-reveal">
						  <span class="card-title grey-text text-darken-4">정지 사유 <i class="material-icons right">close</i></span>
						  <p>게시물이 정지된 이유라던가 먼가 있을거임 아마 나도 모름 모름모름열매 취업하고싶다 </p>
						</div>
					  </div>
                </div>
                <div class="col-md-4 col-sm-4">
                    <div class="card">
						<div class="card-image waves-effect waves-block waves-light">
						  <img class="activator" src="http://materializecss.com/images/office.jpg">
						</div>
						<div class="card-content">
						  <span class="card-title activator grey-text text-darken-4">정지 게시판 제목 및 아이디 </span>
						  <p><a href="#">정지된 게시물로 가기</a> </p>
						  
						</div>
						<div class="card-reveal">
						  <span class="card-title grey-text text-darken-4">정지 사유 <i class="material-icons right">close</i></span>
						  <p>게시물이 정지된 이유라던가 먼가 있을거임 아마 나도 모름 모름모름열매 취업하고싶다 </p>
						</div>
					  </div>
                </div>
                                <div class="col-md-4 col-sm-4">
                    <div class="card">
						<div class="card-image waves-effect waves-block waves-light">
						  <img class="activator" src="http://materializecss.com/images/office.jpg">
						</div>
						<div class="card-content">
						  <span class="card-title activator grey-text text-darken-4">정지 게시판 제목 및 아이디 </span>
						  <p><a href="#">정지된 게시물로 가기</a> </p>
						  
						</div>
						<div class="card-reveal">
						  <span class="card-title grey-text text-darken-4">정지 사유 <i class="material-icons right">close</i></span>
						  <p>게시물이 정지된 이유라던가 먼가 있을거임 아마 나도 모름 모름모름열매 취업하고싶다 </p>
						</div>
					  </div>
                </div>           	
            </div>
                    <!-- /. ROW  --> 
 
                    <!-- /. ROW  --> 
				<footer><p>Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>
</p></footer>
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
    <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js" ></script>
	
	<script src="${pageContext.request.contextPath}/resources/assets/materialize/js/materialize.min.js" ></script>
	
    <!-- Metis Menu Js -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.metisMenu.js" ></script>
    <!-- Morris Chart Js -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/morris/raphael-2.1.0.min.js" ></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/morris/morris.js" ></script>
	
	
	<script src="${pageContext.request.contextPath}/resources/assets/js/easypiechart.js" ></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/easypiechart-data.js" ></script>
	
	 <script src="${pageContext.request.contextPath}/resources/assets/js/Lightweight-Chart/jquery.chart.js" ></script>
	
    <!-- Custom Js -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/custom-scripts.js" ></script> 
	<script>
	$(document).ready(function(){
	 $('ul.tabs').tabs();
		$('.collapsible').collapsible({
		  accordion: false, // A setting that changes the collapsible behavior to expandable instead of the default accordion style
		  onOpen: function(el) { alert('Open'); }, // Callback for Collapsible open
		  onClose: function(el) { alert('Closed'); } // Callback for Collapsible close
		}
	  );
	});
	</script>
 

</body>

</html>
