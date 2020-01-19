<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  </style>
  <script>
	  function getTime(){
		    const date = new Date();
			const current_year = date.getFullYear();
			document.write(current_year);
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
			  $('.carousel').carousel({
				  interval: 2000,
				  pause:false
				});					 			  
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
  			<a class="navbar-top-LOGIN" href="#">LOG IN</a>
  			<a class="navbar-top-REGISTER" href="#">REGISTER</a>
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
          <li class="nav-item" style="min-width: 150px" id = "findhere" >
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
		        <a class="nav-link"  href="#">레스토랑</span></a>
		      </li>
		      <li class="nav-item" style="padding-left:100px">
		        <a class="nav-link"  href="#">바&라운지</a>
		      </li>
		      <li class="nav-item" style="padding-left:100px">
		        <a class="nav-link "  href="#">베이커리</a>
		      </li>
		    </ul>		   		
		</div>
	    <div id="navbarResponsive4" class="panel-collapse navbar-nav collapse justify-content-center" style="background-color:#212529; width:100%">
		   <!-- <div class="panel-body" style="min-height:100px; display:inline-block" id="detailedMenu"></div> -->
		    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
		      <li class="nav-item active" style="padding-left: 100px">
		        <a class="nav-link"  href="#">야외수영장</span></a>
		      </li>
		      <li class="nav-item" style="padding-left:100px">
		        <a class="nav-link"  href="#">온천</a>
		      </li>
		      <li class="nav-item" style="padding-left:100px">
		        <a class="nav-link" href="#">피트니스</a>
		      </li>
		      <li calss="nav-item" style="padding-left:100px">
		      	<a class="nav-link"  href="#">대연회장</a>
		    </ul>		   		
		</div>		
	    <div id="navbarResponsive5" class="panel-collapse navbar-nav collapse justify-content-center" style="background-color:#212529; width:100%">
		   <!-- <div class="panel-body" style="min-height:100px; display:inline-block" id="detailedMenu"></div> -->
		    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
		      <li class="nav-item" style="padding-left:100px">
		        <a class="nav-link"  href="d_01.jsp">예약상황</a>
		      </li>
		      <li class="nav-item" style="padding-left:100px">
		        <a class="nav-link"  href="admin_login.jsp">관리자페이지</a>
		      </li>
		      <li calss="nav-item" style="padding-left:100px">
		      	<a class="nav-link"  href="admin_logout.jsp">관리자로그아웃</a>
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
		<div id="myCarousel" class="carousel slide carousel-fade" data-ride="carousel" style="width:100%">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		    <li data-target="#myCarousel" data-slide-to="1"></li>
		    <li data-target="#myCarousel" data-slide-to="2"></li>
		  </ol>
		
		  <!-- Wrapper for slides -->
		  <div class="carousel-inner" >
		    <div class="carousel-item active">
		      <img src="./img/food/food1.jpg" style="width:100%">
		      <div class="carousel-caption">
		        <h3></h3>
		        <p></p>
		      </div>
		    </div>
		
		    <div class="carousel-item">
		      <img src="./img/food/food2.jpg" style="width:100%">
		      <div class="carousel-caption">
		        <h3></h3>
		        <p></p>
		      </div>
		    </div>
		
		    <div class="carousel-item">
		      <img src="./img/food/food3.jpg" style="width:100%">
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
		<div id="fh5co-about" data-section="about" class="animated">
			<div class="fh5co-2col fh5co-bg to-animate-2 fadeIn animated" style="background-image: url(images/res_img_1.jpg)"></div>
			<div class="fh5co-2col fh5co-text">
				<h2 class="heading to-animate fadeInUp animated">About Us</h2>
				<p class="to-animate fadeInUp animated"><span class="firstcharacter">F</span>ar far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.</p>
				<p class="text-center to-animate fadeInUp animated"><a href="#" class="btn btn-primary btn-outline">Get in touch</a></p>
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
          <h2 class="section-heading text-uppercase" id="room_name">[럭셔리 클럽 스위트]</h2>
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
    <div class="container" style="display:inline-block;">
       <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase" style="width:24%">객실 정보</h2>
		  <div>

		  <div>
        </div>
      </div>
      </div>
    </div>
  </section>

  <!-- About -->
  <section class="page-section" id="about">
    <div class="container" style="display:inline-block;">
       <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase" style="width:24%">특별서비스</h2>
		</div>
      </div>  
    </div>
  </section>

  <!-- Team -->
  <section class="bg-light page-section" id="team">
    <div class="container" style="display:inline-block;">
       <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase" style="width:24%">어메니티</h2>
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
