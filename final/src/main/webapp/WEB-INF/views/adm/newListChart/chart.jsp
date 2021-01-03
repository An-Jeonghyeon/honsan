<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



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
				<div class="col-md-9"> 
					<div class="card">
						<div class="card-image">
							 <div id="morris-line-chart"></div>
						</div> 
						<div class="card-action">
						 	 <b>요일 별 그래프 </b>
						</div>
					</div>
				</div>		
			</div>
			<div class="row">
				<div class="col-md-9"> 
					<div class="card">
						<div class="card-image">
					 		 <div id="morris-bar-chart"></div>
						</div> 
						<div class="card-action">
							<b> 요일 별 그래프 </b>
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
					  { y: '${pre6wday}', a: 50, b: 90 , c: 40 , d :55 , e:77 },
					  { y: '${pre5wday}', a: 165,  b: 185 , c: 30 , d : 66 , e:88 },
					  { y: '${pre4wday}', a: 150,  b: 130 , c: 20 , d : 66 , e:99 },
					  { y: '${pre3wday}', a: 175,  b: 160 , c: 10 , d : 77 , e:11 },
					  { y: '${pre2wday}', a: 80,  b: 65 , c: 60 , d : 88 , e:22},
					  { y: '${pre1wday}', a: 90,  b: 70 , c: 70 , d : 99 , e:33 },
					  { y: '${woday}', a: 100, b: 125 , c: 80 , d : 44 , e:44 }

				],
                xkey: 'y',
                ykeys: ['a', 'b','c','d','e'],
                labels: ['옷', '요리','부동산','인테리어','헬스'],
				 barColors: [
					 '#30A5FF','#EF4040', '#1EBFAE' , '#FFB53E' , '#795548' ],
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
					  { y: "${pre6day}", a: 50, b: 90 , c: 40 , d :55 , e:77 },
					  { y: "${pre5day}", a: 165,  b: 185 , c: 30 , d : 66 , e:88 },
					  { y: "${pre4day}", a: 150,  b: 130 , c: 20 , d : 66 , e:99 },
					  { y: "${pre3day}", a: 175,  b: 160 , c: 10 , d : 77 , e:11},
					  { y: "${pre2day}", a: 80,  b: 65 , c: 60 , d : 88 , e:22 },
					  { y: "${pre1day}", a: 90,  b: 70 , c: 70 , d : 99 , e:33 },
					  { y: "${today}", a: 100, b: 125 , c: 80 , d : 44 , e:44 }
				],
            
				 
      xkey: 'y',
      ykeys: ['a', 'b','c','d','e'],
      labels: ['옷', '요리','부동산','인테리어','헬스'],
      fillOpacity: 0.6,
      hideHover: 'auto',
      behaveLikeLine: true,
      resize: true,
      pointFillColors:['#ffffff'],
      pointStrokeColors: ['black'],
      lineColors:[ '#30A5FF','#EF4040', '#1EBFAE' , '#FFB53E' , '#795548' ]
	  
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