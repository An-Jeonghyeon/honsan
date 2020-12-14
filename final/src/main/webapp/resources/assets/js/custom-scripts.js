/*------------------------------------------------------
    Author : www.webthemez.com
    License: Commons Attribution 3.0
    http://creativecommons.org/licenses/by/3.0/
---------------------------------------------------------  */

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
                    value: 82
                }, {
                    label: "요리",
                    value: 46
                }, {
                    label: "부동산",
                    value: 84
                }, {
                    label: "인테리어",
                    value: 55
                }, {
                    label: "운동",
                    value: 55
                }, {
                    label: "잡동사니",
                    value: 55
                }],
				   colors: [
    '#30A5FF','#EF4040', '#1EBFAE' , '#FFB53E' , '#795548' ,
    '#9C27B0' 
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

	$(".dropdown-button").dropdown();
	
}(jQuery));
