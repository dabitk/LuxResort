<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<%@ page import="java.util.*,java.io.*, java.text.SimpleDateFormat,java.net.URLEncoder,java.net.URLDecoder"%>    
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, user-scalable=no">
  <meta name="description" content="">
  <meta name="author" content="dabitk">
  <script src="https://kit.fontawesome.com/c0559a0b41.js" crossorigin="anonymous"></script>
  <title>럭셔리조트에 오신것을 환영합니다!</title>

  <!-- 정후 커스텀: T맵 API -->
  <script script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appkey=l7xxdf613ea839e844f09766f70c6562a462"></script>

  <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>


  <!-- 정후 커스텀: JQuery CDN -->
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
  <script type="text/javascript" src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/moment.min.js"></script>
  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath()%>/css/agency.min.css" rel="stylesheet">
  
  <!-- datepicker 사용하기 위해 가져옴 -->
  <!-- <link rel="stylesheet" href="css/bootstrap-datepicker.css"> -->
  <!-- <script src="js/bootstrap-datepicker.js"></script> -->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js"></script>
  <style>
	@media (max-width: 992px){
	  h1 {
	    font-size: 80%;
	  }
	
	  h2{
	    font-size: 22px;
	  }
	
	  h3{
	    font-size: 16px;
	  }
	  p{
	  	text-align:center;
	  }
	  #logoTop{
	  	width:80px;
	  }
	}  
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
	.myVideo{
		position:relative;
	}
	.main-reservationbar{
		z-index:2;
		position: relative;
		left: 0;
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
	#map_div{
		display:inline-block;

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
	
	.sidenav {
	  height: 100%;
	  width: 0;
	  position: fixed;
	  z-index: 1;
	  top: 0;
	  right: 0;
	  background-color: #111;
	  overflow-x: hidden;
	  transition: 0.5s;
	  padding-top: 60px;
	  text-align:center;
	}
	.sidenav .closebtn {
	  position: absolute;
	  top: 0;
	  right: 25px;
	  font-size: 36px;
	  margin-left: 50px;
	}
	.sidenav .topNav{
	  position: absolute;
	  top: 0;
	  margin-top:15px;
	}		

  </style>
  <script>
	  function getTime(){
		    const date = new Date();
			const current_year = date.getFullYear();
			document.write(current_year);
		}
	  function initTmap(){
			var map = new Tmapv2.Map("map_div",  
			{
				center: new Tmapv2.LatLng(33.2125013,126.2577351), // 지도 초기 좌표
				width: "100%", 
				height: "400px",
				zoom: 15
			});
			var marker = new Tmapv2.Marker({
				position: new Tmapv2.LatLng(33.2125013,126.2577351),
				map: map
			});	
		}

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
		  
	  $(window).on('load',function(){
	      $('#myModal').modal('show');
	  });
	  
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
		  $('#checkin,#checkout').datepicker({
			    format: 'yyyy-mm-dd',
			    startDate: '-0d',
			    endDate: '+14d'
			});
	});	  
	//function logout(res){
	//	$.ajax({
	//		url:"member_logout.jsp",
	//		}).done(function()){
			
	//		}
	//}
  </script>
</head>

<body id="page-top" onload="initTmap()">
  <!-- Navigation -->
  <!-- <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">-->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top shrink" id="mainNav">

    <div class="container">
    
      <a class="navbar-brand js-scroll-trigger" href="#page-top">
      	<span>
      		<img src="<%=request.getContextPath()%>/img/logos/logo.jpg" id="logoTop" style="max-width: 30%">
      	</span>
		<span style="display:inline-block; vertical-align:top">
		    <h2 class="hotel-name">럭셔리조트</h2>
      		<h3 class="hotel-slogan" style="margin:0">Your Story. Make History.</h3>
		</span>      
      </a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" onclick="openNav()">
        Menu
        <i class="fas fa-bars"></i>
      </button>
	<div class="sidenav" id="mySidenav">
		<table class="topNav" cellpadding='0' cellspacing='0' border='0'>
		<tr height='30'>
			<td width='25%'><a href="m_index.jsp">HOME</a></td>
			<td width='25%'>  			<!-- 로그인 여부에 따라 LOG IN 버튼 또는 LOG OUT 버튼이 보이게 한다 -->
  			<c:choose>
  				<c:when test="${sessionScope.login_ok eq 'yes_member' }">
		  			<a href="<%=request.getContextPath()%>/member_logout.jsp">
		  				LOG OUT
		  			</a>  				
  				</c:when>
  				<c:otherwise>
  					<a href="<%=request.getContextPath()%>/member_login.jsp">
		  				LOG IN
		  			</a>
  				</c:otherwise>
  			</c:choose></td>
			<td width='25%'><a href="<%=request.getContextPath()%>/member_register.jsp">REGISTER</a></td>
			<td width='25%'><a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	            <i class="fas fa-globe"></i> KOR
	          </a>
	          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	            <a class="dropdown-item" href="#">English</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="#">Japanese</a>
	          </div>
	        </td>
		</tr>
		</table>
		<div>		<img src="<%=request.getContextPath()%>/img/logos/logo2.png" id="logoTop" style="max-width: 30%"></div>
		<span style="display:inline-block; vertical-align:top">
		    <h2 class="navbar-brand hotel-name" style="font">럭셔리조트</h2>
      		<h3 class="hotel-slogan" style="margin:0">Your Story. Make History.</h3>
		</span>      	
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<hr style="border-top: 1px solid white">
        <ul class="navbar-nav text-uppercase ml-auto">
          <li class="nav-item" style="min-width: 150px" id ="introduction">
            <a class="nav-link js-scroll-trigger dropdown-toggle" id="dropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">리조트소개</a>
          	  <div class="dropdown-menu" aria-labelledby="dropdown1">
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/mobile/m_a_01.jsp">럭셔리 클럽 스위트</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/a_02.jsp">로열 스위트</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/a_03.jsp">프리미어 디럭스</a>
	          </div>
          </li>         
          <li class="nav-item" style="min-width: 150px" id = "findhere" >
            <a class="nav-link js-scroll-trigger dropdown-toggle" id="dropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">다이닝</a>
          	  <div class="dropdown-menu" aria-labelledby="dropdown2">
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/b_01.jsp">레스토랑</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/b_02.jsp">바&라운지</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/b_03.jsp">베이커리</a>
	          </div>            
          </li>
          <li class="nav-item" style="min-width: 150px" id="toursite" >
            <a class="nav-link js-scroll-trigger dropdown-toggle" id="dropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">부대시설</a>
          	  <div class="dropdown-menu" aria-labelledby="dropdown3">
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/c_01.jsp">스쿠버다이빙 체험</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/c_02.jsp">스파</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/c_03.jsp">대연회장</a>
	          </div>            
          </li>
          <li class="nav-item" style="min-width: 150px" id ="mkreservation" >
            <a class="nav-link js-scroll-trigger dropdown-toggle" id="dropdown4" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">예약하기</a>
          	  <div class="dropdown-menu" aria-labelledby="dropdown4">
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/d_01.jsp">예약상황</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/admin_login.jsp">관리자페이지</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/admin_logout.jsp">관리자로그아웃</a>
	          </div>            
          </li>
          <li class="nav-item" style="min-width: 150px" id="notice" >
            <a class="nav-link js-scroll-trigger dropdown-toggle" id="dropdown5" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">팬션소식</a>
          	  <div class="dropdown-menu" aria-labelledby="dropdown5">
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/e_01.jsp">공지사항</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/e_02.jsp">Q & A</a>
	          </div>            
          </li>
        </ul>    
      </div>
    </div>
<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "100%";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
</script>
  </nav>

  <!-- Header -->
  <header class="masthead" style="margin-top:80px">
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
		      <img src="../img/room/r4.jpg" style="width:100%">
		      <div class="carousel-caption">
		        <h3></h3>
		        <p></p>
		      </div>
		    </div>
		
		    <div class="carousel-item">
		      <img src="../img/room/vip4.JPG" style="width:100%">
		      <div class="carousel-caption">
		        <h3></h3>
		        <p></p>
		      </div>
		    </div>
		
		    <div class="carousel-item">
		      <img src="../img/room/vip7.jpg" style="width:100%">
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
      <div class="container" style="position:relative;">
        <div class="card check-availabilty rounded bg-secondary" style="padding:15px">
          <div class="block-32" data-aos="fade-up" data-aos-offset="-200">
            <form action="<%=request.getContextPath()%>/d_02.jsp" method="POST">
              <div class="row">
                <div class="col-md-6 mb-3 mb-lg-0 col-lg-2" style="width:50%">
                  <label for="checkin" class="font-weight-bold text-black"><i class="far fa-building"></i> 체크인</label>
                  <div class="field-icon-wrap">
                    <div class="icon"><span class="icon-calendar"></span></div>
                    <input type="text" id="checkin" name="checkin" class="form-control" data-provide="datepicker" autocomplete="off" required>
                  </div>
                </div>
                <div class="col-md-6 mb-3 mb-lg-0 col-lg-2" style="width:50%">
                  <label for="checkout" class="font-weight-bold text-black"><i class="far fa-building"></i> 체크아웃</label>
                  <div class="field-icon-wrap">
                    <div class="icon"><span class="icon-calendar"></span></div>
                    <input type="text" id="checkout" name="checkout" class="form-control" data-provide="datepicker" autocomplete="off" required>
                  </div>
                </div>
              </div>
              <div class="row">
              	<div class="mb-3 mb-lg-0 col-lg-3" style="width:56%">
                      <label for="room" class="font-weight-bold text-black"><i class="fal fa-male"></i> 숙박실</label>
                      <div class="field-icon-wrap">
                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                        <select name="room" id="room" class="form-control">
                          <option value="1">럭셔리 클럽 스위트</option>
                        </select>
                      </div>              	
              	</div>                
					<div style="display:flex; width:44%">
                    <div class="mb-3 mb-md-0" style="width:50%">
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


                    <div class="ml-3 mb-3 mr-3 mb-md-0" style="width:50%">
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
               </div>
               <div class="row">
                <div class="col-lg-3 align-self-end">
                  <!-- <a href="d_02.jsp?room=1&checkin=2020-01-20" class="btn btn-primary btn-block text-white">예약하러 가기</a>-->
                  <input type="submit" class="btn btn-primary btn-block text-whtie" value="예약하러 가기">
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
          <h2 class="section-heading text-uppercase" id="room_name">[ 럭셔리 클럽 스위트 ]</h2>
          <h3 class="section-subheading text-muted">
최고의 귀빈만을 위한 럭셔리 클럽 스위트는 품격 있는 유러피안 클래식 디자인을 바탕으로,
<br>
 현대적인 세련미를 더한 독특한 디자인을 가지고 있습니다.
<br>
예술 작품, 객실 소품에서도 품격이 느껴지는 VIP를 위한 한국 최고의 스위트 룸입니다.
<br>
모든 면에서 세계 최고를 체현하는 '럭셔리 클럽 스위트'에서 럭셔리조트가 ‘상위 1%의 선택’인 진정한 이유를 느껴보시기 바랍니다.</h3>
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
								<td><div class="td-txt">4명</div></td>
								<th scope="col">최대 인원</th>
								<td><div class="td-txt">4명</div></td>
							</tr>
							<tr>
								<th scope="col">객실 구성</th>
								<td><div class="td-txt">침실 2, 거실 1, 다이닝룸, 욕실 2, 주방</div></td>
								<th scope="col">객실 면적</th>
								<td><div class="td-txt">277㎡</div></td>
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


    </div>
  </section>

  <!-- Contact -->
  <section class="page-section" id="contact">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <img src="<%=request.getContextPath()%>/img/logos/logo2.png" style="max-width: 20%">
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
  <!-- <script src="vendor/jquery/jquery.min.js"></script> -->
  <script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="<%=request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Contact form JavaScript -->
  <!-- <script src="js/jqBootstrapValidation.js"></script>-->
  <!-- <script src="js/contact_me.js"></script>-->

  <!-- Custom scripts for this template -->
  <script src="<%=request.getContextPath()%>/js/agency.min.js"></script>

</body>

</html>
