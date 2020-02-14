<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="dabitk">
  <script src="https://kit.fontawesome.com/c0559a0b41.js" crossorigin="anonymous"></script>
  <title>럭셔리조트에 오신것을 환영합니다!</title>

  <!-- 정후 커스텀: T맵 API -->
  <script script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appkey=l7xxdf613ea839e844f09766f70c6562a462"></script>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>


  <!-- 정후 커스텀: JQuery CDN -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <!-- Custom styles for this template -->
  <link href="css/agency.min.css" rel="stylesheet">
 
  <!-- datepicker 사용하기 위해 가져옴 -->
  <link rel="stylesheet" href="css/bootstrap-datepicker.css">
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/bootstrap-datepicker.ko.min.js"></script>  
  
  <style>
  	.hotel-name{
  	    font-weight: 500;
    	font-family: Montserrat, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  	}
  	.hotel-slogan{
  	    font-size: 16px;
    	font-weight: 200;
    	font-style: italic;
    	margin-bottom: 75px;
    	text-transform: none;
    	font-family: 'Droid Serif', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
    	color: #a0a0a0;
  	}
	.room_Carousel{
		position:relative;
		width:100%;
	}
	.main-reservationbar{
		z-index:2;
		position: relative;
		left: 0;
		top: -200px;
	}
	#mainReservationBarForm{
		display:inline-block;
		background-color: gray;
	}
	fieldset{
		display:inline-block;
	}
	.search{
		display:inline-block;
	}
	#map_description{
		display:inline-block;
	}
	#map_desc_p{
		letter-spacing: -1px;
		width: 100%;
    	float: left;
	}
	#map_div{
		display:inline-block;
		float:right;
	}
	
	#toursite_desc_p{
		letter-spacing: -1px;
		width: 30%;
    	float: left;
	}
	
	#toursite_div{
		display:inline-block;
		float:right;
		width:50%;
	}
	#toursite2_desc_p{
		letter-spacing: -1px;
		width: 30%;

	}
	#toursite2_div{
		display:inline-block;
		float:left;
		width:60%;
	}
	
	#navbarDropdown{
		color:#a0a0a0;
	}
	
	#navbarResponsive{
		flex-basis:none;
	}
	.nav-item{
		min-width: 150px;
	}
	body i {
	font-family:'FontAwesome'!important;
	}
	#services{
		padding:0;
	}
	#room_name{
	  font-size: 72px;
	  background: -webkit-linear-gradient(90deg,#B37E01,#F6E779,#B37E01);
	  -webkit-background-clip: text;
	  -webkit-text-fill-color: transparent;
	}
	<!--테이블 스타일-->

	th,td{
		padding:30px 30px; font-size:16px; vertical-align:middle;
	}
	td{
		background-color: white;
	}
	table{
		width:100%;
		border-collapse:collapse;
		border-spacing:0;
		box-sizing:border-box;
		border-top:2px solid #999;
		border-bottom:2px solid #999;
	}		
  </style>
  <script>
	  function getTime(){
		    const date = new Date();
			const current_year = date.getFullYear();
			document.write(current_year);
		}
/* 	  function initTmap(){
			var map = new Tmapv2.Map("map_div",  
			{
				center: new Tmapv2.LatLng(33.2125013,126.2577351), // 지도 초기 좌표
				width: "690px", 
				height: "400px",
				zoom: 15
			});
			var marker = new Tmapv2.Marker({
				position: new Tmapv2.LatLng(33.2125013,126.2577351),
				map: map
			});	
		} */

	  function toggle(id, id2) { //KOR,ENG,JPN 홈페이지 표시언어 변경 드롭바를 표시하는데 쓰이는 함수.
	    var n = document.getElementById(id);
		if (n.style.display != 'none') 
		  {
		  	n.style.display = 'none';
	      	document.getElementById(id2).setAttribute('aria-expanded', 'false');
	  	}else{
	  		n.style.display = '';
	  		document.getElementById(id2).setAttribute('aria-expanded', 'true');
		 }
	  }
		  $(document).ready(function(){
			  $("#introduction").click( function () {
				  	$('#navbarResponsive').attr('data-target','#navbarResponsive2');
				  	$('#navbarResponsive3').removeClass("show");
				  	$('#navbarResponsive4').removeClass("show");
				  	$('#navbarResponsive5').removeClass("show");
				  	$('#navbarResponsive6').removeClass("show");
				  });
			  $("#findhere").click( function () {	  
				  	$('#navbarResponsive').attr('data-target','#navbarResponsive3');
				  	$('#navbarResponsive2').removeClass("show");
				  	$('#navbarResponsive4').removeClass("show");
				  	$('#navbarResponsive5').removeClass("show");
				  	$('#navbarResponsive6').removeClass("show");			  	
				 });
			  $("#toursite").click(function () {	  
				    $('#navbarResponsive').attr('data-target','#navbarResponsive4');
				  	$('#navbarResponsive2').removeClass("show");
				  	$('#navbarResponsive3').removeClass("show");
				  	$('#navbarResponsive5').removeClass("show");
				  	$('#navbarResponsive6').removeClass("show");			    
				 });
			  $("#mkreservation").click(function () {	  
				    $('#navbarResponsive').attr('data-target','#navbarResponsive5');
				  	$('#navbarResponsive2').removeClass("show");
				  	$('#navbarResponsive3').removeClass("show");
				  	$('#navbarResponsive4').removeClass("show");
				  	$('#navbarResponsive6').removeClass("show");		    
				 });	
			  $("#notice").click(function () {	  
				    $('#navbarResponsive').attr('data-target','#navbarResponsive6');
				  	$('#navbarResponsive2').removeClass("show");
				  	$('#navbarResponsive3').removeClass("show");
				  	$('#navbarResponsive4').removeClass("show");
				  	$('#navbarResponsive5').removeClass("show");			    
				 });
			  $('#checkin_date, #checkout_date').datepicker({
				    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
				    startDate: '-10d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
				    endDate: '+10d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
				    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
				    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
				    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
				    datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
				    daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
				    daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
				    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
				    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
				    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
				    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
				    templates : {
				        leftArrow: '&laquo;',
				        rightArrow: '&raquo;'
				    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
				    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
				    title: "테스트",	//캘린더 상단에 보여주는 타이틀
				    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
				    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
				    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
				    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
				    
				  }).on("click",function(e){console.log(e)});				 			  
		});	 
  </script>
</head>

<body id="page-top">

  <!-- Navigation -->
  <!-- <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">-->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top shrink" id="mainNav">
  	<div class="navbar-top">
  		<div class="navbar-top--left"></div>
  		<div class="navbar-top--right">
  			<a class="navbar-top-HOME" href="./index.jsp">HOME</a>
  			<!-- 로그인 여부에 따라 LOG IN 버튼 또는 LOG OUT 버튼이 보이게 한다 -->
  			<c:choose>
  				<c:when test="${sessionScope.login_ok eq 'yes_member' }">
		  			<a class="navbar-top-LOGIN" href="member_logout.jsp">
		  				LOG OUT
		  			</a>  				
  				</c:when>
  				<c:otherwise>
  					<a class="navbar-top-LOGIN" href="member_login.jsp">
		  				LOG IN
		  			</a>
  				</c:otherwise>
  			</c:choose>
  			<a class="navbar-top-REGISTER" href="member_register.jsp">REGISTER</a>
	        <li class="nav-item dropdown" style="display:inline-block; list-style-type: none; text-color: gray">
	          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	            <i class="fas fa-globe"></i> KOR
	          </a>
	          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	            <a class="dropdown-item" href="#">English</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="#">Japanese</a>
	          </div>
	        </li>  			
  		</div>
  	</div>
    <div class="container">
    
      <a class="navbar-brand js-scroll-trigger" href="#page-top">
      	<span>
      		<img src="./img/logos/logo.jpg" style="max-width: 30%">
      	</span>
		<span style="display:inline-block; vertical-align:top">
		    <h2 class="hotel-name">럭셔리조트</h2>
      		<h3 class="hotel-slogan" style="margin:0">Your Story. Make History.</h3>
		</span>      
      </a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
       <div class="collapse navbar-collapse" id="navbarResponsive" data-toggle="collapse" data-target="#navbarResponsive2" aria-controls="navbarResponsive2" aria-expanded="false" aria-label="Toggle navigation2">
        <ul class="navbar-nav text-uppercase ml-auto">
          <li class="nav-item" style="min-width: 150px" id ="introduction" >
            <a class="nav-link js-scroll-trigger" href="#">리조트소개</a>           
          </li>
          <li class="nav-item" style="min-width: 150px" id = "findhere">
            <a class="nav-link js-scroll-trigger" href="#">다이닝</a>
          </li>
          <li class="nav-item" style="min-width: 150px" id="toursite" >
            <a class="nav-link js-scroll-trigger" href="#">부대시설</a>
          </li>
          <li class="nav-item" style="min-width: 150px" id ="mkreservation">
            <a class="nav-link js-scroll-trigger" href="#">예약하기</a>
          </li>
          <li class="nav-item" style="min-width: 150px" id="notice" >
            <a class="nav-link js-scroll-trigger" href="#">팬션소식</a>
          </li>
        </ul>
      </div>    
    </div>
     <div class="container">
	    <div id="navbarResponsive2" class="panel-collapse navbar-nav collapse justify-content-center" style="background-color:#212529; width:100%">
		   <!-- <div class="panel-body" style="min-height:100px; display:inline-block" id="detailedMenu"></div> -->
		    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
		      <li class="nav-item active" style="padding-left:100px">
		        <a class="nav-link"  href="a_01.jsp">럭셔리 클럽 스위트</span></a>
		      </li>
		      <li class="nav-item" style="padding-left:100px">
		        <a class="nav-link"  href="a_02.jsp">로열 스위트</a>
		      </li>
		      <li class="nav-item" style="padding-left:100px">
		        <a class="nav-link "  href="a_03.jsp">프리미어 디럭스</a>
		      </li>
		    </ul>		   		
		</div>
	    <div id="navbarResponsive3" class="panel-collapse navbar-nav collapse justify-content-center" style="background-color:#212529; width:100%">
		   <!-- <div class="panel-body" style="min-height:100px; display:inline-block" id="detailedMenu"></div> -->
		    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
		      <li class="nav-item active" style="padding-left:100px">
		        <a class="nav-link"  href="b_01.jsp">레스토랑</span></a>
		      </li>
		      <li class="nav-item" style="padding-left:100px">
		        <a class="nav-link"  href="b_02.jsp">바&라운지</a>
		      </li>
		      <li class="nav-item" style="padding-left:100px">
		        <a class="nav-link "  href="b_03.jsp">베이커리</a>
		      </li>
		    </ul>		   		
		</div>
	    <div id="navbarResponsive4" class="panel-collapse navbar-nav collapse justify-content-center" style="background-color:#212529; width:100%">
		   <!-- <div class="panel-body" style="min-height:100px; display:inline-block" id="detailedMenu"></div> -->
		    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
		      <li class="nav-item active" style="padding-left: 100px">
		        <a class="nav-link"  href="c_01.jsp">스쿠버다이빙 체험</span></a>
		      </li>
		      <li class="nav-item" style="padding-left:100px">
		        <a class="nav-link"  href="c_02.jsp">스파</a>
		      </li>
		      <li class="nav-item" style="padding-left:100px">
		        <a class="nav-link" href="c_03.jsp">대연회장</a>
		      </li>
		    </ul>		   		
		</div>		
	    <div id="navbarResponsive5" class="panel-collapse navbar-nav collapse justify-content-center" style="background-color:#212529; width:100%">
		   <!-- <div class="panel-body" style="min-height:100px; display:inline-block" id="detailedMenu"></div> -->
		    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
		      <li class="nav-item" style="padding-left:100px">
		        <a class="nav-link"  href="d_01.jsp">예약상황</a>
		      </li>
		      <c:choose>
  				<c:when test="${sessionScope.login_ok eq 'yes' }">
			      <li class="nav-item" style="padding-left:100px">
			        <a class="nav-link"  href="admin_logout.jsp">관리자로그아웃</a>
			      </li>				
  				</c:when>
  				<c:otherwise>
			      <li calss="nav-item" style="padding-left:100px">
			      	<a class="nav-link"  href="admin_login.jsp">관리자페이지</a>
			      </li>
  				</c:otherwise>
  			</c:choose>
		    </ul>		   		
		</div>
	    <div id="navbarResponsive6" class="panel-collapse navbar-nav collapse justify-content-center" style="background-color:#212529; width:100%">
		   <!-- <div class="panel-body" style="min-height:100px; display:inline-block" id="detailedMenu"></div> -->
		    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
		      <li class="nav-item active" style="padding-left:100px">
		        <a class="nav-link"  href="e_01.jsp">공지사항 게시판</span></a>
		      </li>
		      <li class="nav-item" style="padding-left:100px">
		        <a class="nav-link"  href="e_02.jsp">답글 게시판</a>
		      </li>
		    </ul>		   		
		</div>						      	
    </div>
  </nav>

  <!-- Header -->
  <header class="masthead">
  <div style="width:100%; height:100%">
  <div class="room_Carousel">
      <div class="row text-center">
		<div id="myCarousel" class="carousel slide" data-ride="carousel" style="width:100%">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		    <li data-target="#myCarousel" data-slide-to="1"></li>
		    <li data-target="#myCarousel" data-slide-to="2"></li>
		  </ol>
		
		  <!-- Wrapper for slides -->
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="./img/room/r8.jpg" style="width:100%">
		      <div class="carousel-caption">
		        <h3></h3>
		        <p></p>
		      </div>
		    </div>
		
		    <div class="carousel-item">
		      <img src="./img/room/standard3.jpg" style="width:100%">
		      <div class="carousel-caption">
		        <h3></h3>
		        <p></p>
		      </div>
		    </div>
		
		    <div class="carousel-item">
		      <img src="./img/room/standard4.jpg" style="width:100%">
		      <div class="carousel-caption">
		        <h3></h3>
		        <p></p>
		      </div>
		    </div>
		  </div>
		
		  <!-- Left and right controls -->
		  <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
      </div>
      <div class="container" style="position:relative; top:-200px">
        <div class="card check-availabilty rounded bg-secondary" style="padding:15px">
          <div class="block-32" data-aos="fade-up" data-aos-offset="-200">
            <form action="#">
              <div class="row">
                <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                  <label for="checkin_date" class="font-weight-bold text-black"><i class="far fa-building"></i> 체크인</label>
                  <div class="field-icon-wrap">
                    <div class="icon"><span class="icon-calendar"></span></div>
                    <input type="text" id="checkin_date" class="form-control" data-provide="datepicker">
                  </div>
                </div>
                <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                  <label for="checkout_date" class="font-weight-bold text-black"><i class="far fa-building"></i> 체크아웃</label>
                  <div class="field-icon-wrap">
                    <div class="icon"><span class="icon-calendar"></span></div>
                    <input type="text" id="checkout_date" class="form-control" data-provide="datepicker">
                  </div>
                </div>
                <div class="col-md-6 mb-3 mb-md-0 col-lg-3">
                  <div class="row">
                    <div class="col-md-6 mb-3 mb-md-0">
                      <label for="adults" class="font-weight-bold text-black"><i class="fal fa-male"></i> 성인</label>
                      <div class="field-icon-wrap">
                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                        <select name="" id="adults" class="form-control">
                          <option value="">1</option>
                          <option value="">2</option>
                          <option value="">3</option>
                          <option value="">4+</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-md-6 mb-3 mb-md-0">
                      <label for="children" class="font-weight-bold text-black"><i class="fal fa-male"></i> 아이</label>
                      <div class="field-icon-wrap">
                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                        <select name="" id="children" class="form-control">
                          <option value="">1</option>
                          <option value="">2</option>
                          <option value="">3</option>
                          <option value="">4+</option>
                        </select>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-lg-3 align-self-end">
                  <button class="btn btn-primary btn-block text-white">Check Availabilty</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
  </div>    
  </div>
    
    

  </header>

  <!-- Services -->
  <section class="page-section" id="services">
    <div class="container">
       <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase" id="room_name">[ 로열 스위트 ]</h2>
          <h3 class="section-subheading text-muted">
 현대의 귀족이 된 기분을 맛볼 수 있는 우아하면서도 고풍스러운 인테리어.
 <br> 
 흑요석으로 제작된 세련된 가구들과 천장의 화려한 샹들리에, 그리고 집무공간과 서재를 갖춘 집무실을 두어
 <br>
 룸을 방문한 VIP가 편리하게 업무를 마칠 수 있도록 배려하고 있습니다.
 <br>
 VIP 룸의 욕실은 이탈리아 북부 알프스 천연 대리석으로 제작되어 고품격 휴식을 원하시는 분들께 최적의 선택입니다.</h3>
        </div>
      </div>
      <div class="row text-center">
		

      </div>
    </div>
  </section>

  <!-- Portfolio Grid -->
  <section class="bg-light page-section" id="portfolio">
    <div class="container">
       <div class="row">
        <div class="col-lg-12 text-center" id="page_Spec">
        		<h3>객실 개요</h3>
				<table class="rwd-table">
						<colgroup>
							<col style="width: 20%">
							<col style="width: 30%">
							<col style="width: 20%">
							<col style="width: 30%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="col">체크인</th>
								<td><div class="td-txt">15:00</div></td>
								<th scope="col">체크아웃</th>
								<td><div class="td-txt">11:00</div></td>
							</tr>
							<tr>
								<th scope="col">기준 인원</th>
								<td><div class="td-txt">2명</div></td>
								<th scope="col">최대 인원</th>
								<td><div class="td-txt">2명</div></td>
							</tr>
							<tr>
								<th scope="col">객실 구성</th>
								<td><div class="td-txt">침실 1, 거실 1, 다이닝룸, 욕실 1</div></td>
								<th scope="col">객실 면적</th>
								<td><div class="td-txt">245㎡</div></td>
							</tr>
							<tr>
								<th scope="col">객실 수</th>
								<td><div class="td-txt">1실</div></td>
								<th scope="col"></th>
								<td><div class="td-txt"></div></td>
							</tr>
						</tbody>
				</table>
      </div>
      </div>
    </div>
  </section>

  <!-- About -->
  <section class="page-section" id="about">
    <div class="container">
       <div class="row">
        <div class="col-lg-12 text-center">
          <!-- <h2 class="section-heading text-uppercase" style="width:24%">어메니티</h2>-->
          <h3>어메니티</h3>
		</div>
      </div>  
    </div>
  </section>

  <!-- Contact -->
  <section class="page-section" id="contact">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <img src="./img/logos/logo2.png" style="max-width: 20%">
          <h2 class="section-heading text-uppercase">럭셔리조트</h2>
          <h3 class="section-subheading text-muted">Your Story. Make History.</h3>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12">
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="footer">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-md-4">
          <span class="copyright">Copyright &copy; LuxClub <script>getTime()</script></span>
        </div>
        <div class="col-md-4">
          <ul class="list-inline social-buttons">
            <li class="list-inline-item">
              <a href="https://twitter.com/search-home">
                <i class="fab fa-twitter"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="https://www.facebook.com/">
                <i class="fab fa-facebook-f"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="https://www.instagram.com/explore/tags/hawaii/">
                <i class="fab fa-instagram"></i>
              </a>
            </li>
          </ul>
        </div>
        <div class="col-md-4">
          <ul class="list-inline quicklinks">
            <li class="list-inline-item">
              <a href="#"><b>Privacy Policy</b></a>
            </li>
            <li class="list-inline-item">
              <a href="#"><b>Terms of Use</b></a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Contact form JavaScript -->
  <!-- <script src="js/jqBootstrapValidation.js"></script>-->
  <!-- <script src="js/contact_me.js"></script>-->

  <!-- Custom scripts for this template -->
  <script src="js/agency.min.js"></script>

</body>

</html>
