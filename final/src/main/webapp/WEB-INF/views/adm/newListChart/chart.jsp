<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="wrapper">
	<div id="page-wrapper">
	  	
	  	<div class="header"> 
            <h2 class="page-header jyheader">
               	게시판 새글 현황
           </h2>
           
           <!-- 각 게시판제목 아래 서브메뉴(ajax로 하면 될듯?)   -->
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
               </div>
               
               <!--새로운 row  -->
               <div class="row">
               	    <div class="col-xs-12 col-sm-6 col-md-3">
						<div class="card horizontal cardIcon waves-effect waves-dark">
							<div class="card-image blue">
								<i class="material-icons dp48">import_export</i>
							</div>
							<div class="card-stacked blue">
								<div class="card-content">
									<h3>건강챙기기</h3> 
								</div>
								<div class="card-action">
									<strong>10,375 개</strong>
								</div>
							</div>
						</div>
                   </div>
                    
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
                </div> <!-- /row  -->
		   </div> <!--/dashboard-cards  -->
		   
			   
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
						</div>
					</div>							
				</div>
			
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
				</div>
			</div><!--/.row-->
				
	 
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
			</div>  <!-- /. ROW  -->
				
		</div>  <!-- /. page-inner  -->
    </div> <!-- /.page-wrapper -->
</div> <!-- wrapper -->
