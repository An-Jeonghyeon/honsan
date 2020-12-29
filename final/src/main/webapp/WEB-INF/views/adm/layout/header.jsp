<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
			<li>
				<a href="${pageContext.request.contextPath}/home"><i class="fa fa-sign-out fa-fw"></i>돌아가기</a>
			</li>
		</ul>
		<!--  최상단 이미지 2번 속성  w : 길이 조절  -->


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
             <li>
                 <a class="text-center" href="#">
                     <strong>전체 문의 보기 </strong>
                     <i class="fa fa-angle-right"></i>
                 </a>
             </li>
		</ul>  
		
		
		<!--  네이바 -->
			   <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav navul" id="main-menu">
                    <li>
                        <a href="${pageContext.request.contextPath}/adm/adm" class="waves-effect waves-dark"><i class="fa fa-bar-chart-o"></i> 게시판 새글 현황</a>
                    </li>
					<li>
                        <a href="${pageContext.request.contextPath}/adm/visitorStatus" class="waves-effect waves-dark"><i class="fa fa-bar-chart-o"></i>방문자 현황</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/adm/memberMng" class="waves-effect waves-dark"><i class="fa fa-desktop"></i> 회원 관리</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/adm/boardMng" class="waves-effect waves-dark"><i class="fa fa-qrcode"></i> 게시판 관리</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/adm/health" class="waves-effect waves-dark"><i class="fa fa-table"></i>[하루운동챌린지] 관리</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/adm/cook" class="waves-effect waves-dark"><i class="fa fa-edit"></i>[우리집 냉장고] 관리</a>
                    </li>
                </ul>
            </div>

        </nav> <!-- /. NAV SIDE  -->
       
</div>	<!-- wrapper -->
