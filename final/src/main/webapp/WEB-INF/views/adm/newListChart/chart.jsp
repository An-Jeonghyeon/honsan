<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<div id="wrapper">
	<div id="page-wrapper">
	  	
	  	<div class="header"> 
            <h2 class="page-header jyheader">
               	게시판 현황
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
				<div class="col-md-3"><h3> 총 게시판 현황 </h3></div>
				</div>
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
									<strong>총 ${dressCount} 개</strong>
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
									<strong>총 ${cookCount} 개</strong>
								</div>
							</div>
						</div> 
                    </div>
                    
                    <div class="col-xs-12 col-sm-6 col-md-3">
						<div class="card horizontal cardIcon waves-effect waves-dark">
							<div class="card-image teal">
								<i class="material-icons dp48">import_export</i>
							</div>
							<div class="card-stacked teal">
								<div class="card-content">
									<h3>방구할래?</h3> 
								</div>
								<div class="card-action">
									<strong>총 ${roomCount} 개</strong>
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
									<h3>인테리어</h3> 
								</div>
								<div class="card-action">
									<strong>총 ${interiorCount} 개</strong>
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
									<strong>총 ${suppleCount} 개</strong>
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
									<h4>오늘 뭐 입어 ?</h4>
									<div class="easypiechart" id="easypiechart-red" data-percent="${dressAve}" ><span class="percent">${dressAve}%</span>
									</div> 
								</div>
							</div>
							<div class="col-xs-12 col-sm-6 col-md-6"> 
								<div class="card-panel text-center">
									<h4>혼자 뭐 먹지 ?</h4>
									<div class="easypiechart" id="easypiechart-orange" data-percent="${cookAve}" ><span class="percent">${cookAve}%</span>
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-sm-6 col-md-6"> 
								<div class="card-panel text-center">
									<h4>방 구할래 ?</h4>
									<div class="easypiechart" id="easypiechart-teal" data-percent="${roomAve}" ><span class="percent">${roomAve}%</span>
									</div> 
								</div>
							</div>
							<div class="col-xs-12 col-sm-6 col-md-6"> 
								<div class="card-panel text-center">
									<h4>인테리어</h4>
									<div class="easypiechart" id="easypiechart-blue" data-percent="${interiorAve}" ><span class="percent">${interiorAve}%</span>
									</div>
								</div>
							</div> 
							<div class="col-xs-12 col-sm-6 col-md-6"> 
								<div class="card-panel text-center">
									<h4>건강</h4>
									<div class="easypiechart" id="easypiechart-brown" data-percent="${suppleAve}" ><span class="percent">${suppleAve}%</span>
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

<script>
(function ($) {
    "use strict";
    var mainApp = {

        initFunction: function () {
            /*MENU 
            ------------------------------------*/
            $('#main-menu').metisMenu();
			
            $(window).bind("load resize", function () {
                if ($(this).width() < 768) {
                    $('div.sidebar-collapse').addClass('collapse')
                } else {
                    $('div.sidebar-collapse').removeClass('collapse')
                }
            });

            /* MORRIS BAR CHART
			-----------------------------------------*/
            Morris.Bar({
                element: 'morris-bar-chart',
                data: [
					  { y: '일', a: 50, b: 90 , c: 40 , d :55 , e:77 , f:33},
					  { y: '월', a: 165,  b: 185 , c: 30 , d : 66 , e:88 , f:44},
					  { y: '화', a: 150,  b: 130 , c: 20 , d : 66 , e:99 , f:55},
					  { y: '수', a: 175,  b: 160 , c: 10 , d : 77 , e:11 , f:66},
					  { y: '목', a: 80,  b: 65 , c: 60 , d : 88 , e:22 , f:77},
					  { y: '금', a: 90,  b: 70 , c: 70 , d : 99 , e:33 , f:88},
					  { y: '토', a: 100, b: 125 , c: 80 , d : 44 , e:44 , f:99}

				],
                xkey: 'y',
                ykeys: ['a', 'b','c','d','e','f'],
                labels: ['옷', '요리','부동산','인테리어','헬스','잡동사니'],
				 barColors: [
					 '#30A5FF','#EF4040', '#1EBFAE' , '#FFB53E' , '#795548' ,'#9C27B0'],
                hideHover: 'auto',
                resize: true
            });
	 


            /* MORRIS DONUT CHART
			----------------------------------------*/
            Morris.Donut({
                element: 'morris-donut-chart',
                data: [{
                    label: "옷",
                    value: ${dressAve}
                }, {
                    label: "요리",
                    value: ${cookAve}
                }, {
                    label: "부동산",
                    value: ${roomAve}
                }, {
                    label: "인테리어",
                    value: ${interiorAve}
                }, {
                    label: "운동",
                    value: ${suppleAve}
                }],
				   colors: [
				'#EF4040' ,'#FFB53E', '#1EBFAE' , '#30A5FF' , '#795548'
  ],
                resize: true
            });

 

            /* MORRIS LINE CHART
			----------------------------------------*/
            Morris.Line({
                element: 'morris-line-chart',
                data: [
					  { y: '2014', a: 50, b: 90 , c: 40 , d :55 , e:77 , f:33},
					  { y: '2015', a: 165,  b: 185 , c: 30 , d : 66 , e:88 , f:44},
					  { y: '2016', a: 150,  b: 130 , c: 20 , d : 66 , e:99 , f:55},
					  { y: '2017', a: 175,  b: 160 , c: 10 , d : 77 , e:11 , f:66},
					  { y: '2018', a: 80,  b: 65 , c: 60 , d : 88 , e:22 , f:77},
					  { y: '2019', a: 90,  b: 70 , c: 70 , d : 99 , e:33 , f:88},
					  { y: '2020', a: 100, b: 125 , c: 80 , d : 44 , e:44 , f:99},
					  { y: '2021', a: 155, b: 175 , c: 90 , d : 33 , e:55 , f:11},
					  { y: '2022', a: 80, b: 85 , c: 44 , d :22 , e:66 , f:22},
					  { y: '2023', a: 145, b: 155 , c: 55 , d :11 , e:74 , f:52},
					  { y: '2024', a: 160, b: 195 , c: 66 , d :28 , e:37 , f:39}
				],
            
				 
      xkey: 'y',
      ykeys: ['a', 'b','c','d','e','f'],
      labels: ['옷', '요리','부동산','인테리어','헬스','잡동사니'],
      fillOpacity: 0.6,
      hideHover: 'auto',
      behaveLikeLine: true,
      resize: true,
      pointFillColors:['#ffffff'],
      pointStrokeColors: ['black'],
      lineColors:[ '#30A5FF','#EF4040', '#1EBFAE' , '#FFB53E' , '#795548' ,'#9C27B0']
	  
            });
           
        
            $('.bar-chart').cssCharts({type:"bar"});
            $('.donut-chart').cssCharts({type:"donut"}).trigger('show-donut-chart');
            $('.line-chart').cssCharts({type:"line"});

            $('.pie-thychart').cssCharts({type:"pie"});
       
	 
        },

        initialization: function () {
            mainApp.initFunction();

        }

    }
    // Initializing ///

    $(document).ready(function () {
		$(".dropdown-button").dropdown();
		$("#sideNav").click(function(){
			if($(this).hasClass('closed')){
				$('.navbar-side').animate({left: '0px'});
				$(this).removeClass('closed');
				$('#page-wrapper').animate({'margin-left' : '260px'});
				
			}
			else{
			    $(this).addClass('closed');
				$('.navbar-side').animate({left: '-260px'});
				$('#page-wrapper').animate({'margin-left' : '0px'}); 
			}
		});
		
        mainApp.initFunction(); 
    });

	/* $(".dropdown-button").dropdown(); */
	
}(jQuery));

</script>