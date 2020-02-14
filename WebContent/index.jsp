<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<%@ page import="java.util.*,java.io.*, java.text.SimpleDateFormat,java.net.URLEncoder,java.net.URLDecoder"%>    
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">
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
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
  <script type="text/javascript" src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
  <script type="text/javascript" src="js/moment.min.js"></script>
  <!-- Custom styles for this template -->
  <link href="css/agency.min.css" rel="stylesheet">
  
  <!-- datepicker 사용하기 위해 가져옴 -->
  <!-- <link rel="stylesheet" href="css/bootstrap-datepicker.css"> -->
  <!-- <script src="js/bootstrap-datepicker.js"></script> -->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js"></script>
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
	.myVideo{
		position:relative;
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
				width: "690px", 
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
		// 여기서부터 라인 171까지 모바일 디바이스를 탐지하면 모바이 전용 페이지로 리다이렉트 시키는 코드.
		var isMobile = false; //initiate as false
		// device detection
		if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|ipad|iris|kindle|Android|Silk|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(navigator.userAgent) 
		    || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(navigator.userAgent.substr(0,4))) { 
		    isMobile = true;
		}
		if(isMobile === true){
			window.location = "http://192.168.23.14:8080/LuxResort/mobile/m_index.jsp"
		}

	      $('#myModal').modal('show');
	  });
	  
	  $(document).ready(function(){
		  //이하 네비게이션 바를 클릭했을 때 서브메뉴가 나타나게 하는 부분
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
<%
	Date d = new Date();
	SimpleDateFormat dformat = new SimpleDateFormat ( "yyyy년 MM월 dd일 HH시 mm분 ss초");
	
	String lastVisit = URLEncoder.encode(dformat.format(d), "UTF-8");
	//System.out.println("받은쿠키값: " + URLDecoder.decode(lastVisit,"UTF-8"));

	Cookie cookieName = new Cookie("lastVisit", lastVisit);
	cookieName.setMaxAge(120*60); //쿠키 유효기간은 2시간으로 설정해둔다
	response.addCookie(cookieName); //response객체에 쿠키를 보내주어야 사용가능하다
	
	String welcomeMsg = "럭셔리조트에 방문해주셔서 감사합니다.";
	if(request.getCookies() != null){
		Cookie[] cookies = request.getCookies();
		for(int i=0;i<cookies.length;i++){
			Cookie thisCookie = cookies[i];
			if("lastVisit".equals(thisCookie.getName())){
				String member_name = (String)session.getAttribute("member_name");
				if(member_name != null){ //멤버 로그인한 상태라면 이름 + 환영 메시지를 출력한다 
					welcomeMsg =  member_name + "님의 최근 방문일시는 "+URLDecoder.decode(thisCookie.getValue(),"UTF-8") + " 입니다.";					
				}else{ //로그인 되어있지 않다면 쿠키에 기록된 마지막 방문시간을 출력한다.
					welcomeMsg =  "최근 방문일시는 "+URLDecoder.decode(thisCookie.getValue(),"UTF-8") + " 입니다.";					
				}
				//System.out.println("보낸 쿠키값: "+ welcomeMsg);
			}
		}
	}
%>
    <!-- Modal content-->
	<div id="myModal" class="modal fade" role="dialog">
  		<div class="modal-dialog">
    	<div class="modal-content">
      	<div class="modal-header">
        	<h4 class="modal-title">환영합니다!</h4>
        	<button type="button" class="close" data-dismiss="modal">&times;</button>
      	</div>
      	<div class="modal-body">
        	<p><%=welcomeMsg %></p>
      	</div>
      	<div class="modal-footer">
        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      	</div>
    	</div>
  		</div>	
	</div>
  <!-- Navigation -->
  <!-- <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">-->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top shrink" id="mainNav">
  	<div class="navbar-top">
  		<div class="navbar-top--left"></div>
  		<div class="navbar-top--right">
  			<a class="navbar-top-HOME" href="./index.jsp"">HOME</a>
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
      		<img src="/LuxResort/img/logos/logo.jpg" style="max-width: 30%">
      	</span>
		<span style="display:inline-block; vertical-align:top">
		    <h2 class="hotel-name">럭셔리조트</h2>
      		<h3 class="hotel-slogan" style="margin:0">Your Story. Make History.</h3>
		</span>      
      </a>
		<span>
	      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	        Menu
	        <i class="fas fa-bars"></i>
	      </button>
		</span>
	<div class="collapse navbar-collapse" id="navbarResponsive" data-toggle="collapse" data-target="" aria-controls="navbarResponsive2" aria-expanded="false" aria-label="Toggle navigation2">
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
          <li class="nav-item" style="min-width: 150px" id ="mkreservation" >
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
		    <ul class="navbar-nav mr-auto mt-2 mt-lg-0" >
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
		    <ul class="navbar-nav mr-auto mt-2 mt-lg-0" >
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
		    <ul class="navbar-nav mr-auto mt-2 mt-lg-0" >
		      <li class="nav-item active" style="padding-left: 100px">
		        <a class="nav-link"  href="c_01.jsp">스쿠버다이빙 체험</span></a>
		      </li>
		      <li class="nav-item" style="padding-left:100px">
		        <a class="nav-link"  href="c_02.jsp">스파</a>
		      </li>
		      <li class="nav-item" style="padding-left:100px">
		        <a class="nav-link" href="c_03.jsp">대연회장</a>
		      </li>  		
		</div>		
	    <div id="navbarResponsive5" class="panel-collapse navbar-nav collapse justify-content-center" style="background-color:#212529; width:100%">
		   <!-- <div class="panel-body" style="min-height:100px; display:inline-block" id="detailedMenu"></div> -->
		    <ul class="navbar-nav mr-auto mt-2 mt-lg-0" >
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
  <div class="myVideo">
    <video autoplay loop muted style="width:100%">
         <source src="/LuxResort/img/video/pvmovie.mp4" type="video/mp4">
    </video>
      <div class="container" style="position:relative; top:-200px">
        <div class="card check-availabilty rounded bg-secondary" style="padding:15px">
          <div class="block-32" data-aos="fade-up" data-aos-offset="-200">
            <form action="d_02.jsp" method="POST">
              <div class="row">
              	<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                      <label for="room" class="font-weight-bold text-black"><i class="fal fa-male"></i> 숙박실</label>
                      <div class="field-icon-wrap">
                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                        <select name="room" id="room" class="form-control">
                          <option value="1">럭셔리 클럽 스위트</option>
                          <option value="2">로열 스위트</option>
                          <option value="3">프리미어 디럭스</option>
                        </select>
                      </div>              	
              	</div>
                <div class="col-md-6 mb-3 mb-lg-0 col-lg-2">
                  <label for="checkin" class="font-weight-bold text-black"><i class="far fa-building"></i> 체크인</label>
                  <div class="field-icon-wrap">
                    <div class="icon"><span class="icon-calendar"></span></div>
                    <input type="text" id="checkin" name="checkin" class="form-control" data-provide="datepicker" autocomplete="off" required>
                  </div>
                </div>
                <div class="col-md-6 mb-3 mb-lg-0 col-lg-2">
                  <label for="checkout" class="font-weight-bold text-black"><i class="far fa-building"></i> 체크아웃</label>
                  <div class="field-icon-wrap">
                    <div class="icon"><span class="icon-calendar"></span></div>
                    <input type="text" id="checkout" name="checkout" class="form-control" data-provide="datepicker" autocomplete="off" required>
                  </div>
                </div>
                <div class="col-md-6 mb-3 mb-md-0 col-lg-2">
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
          <h2 class="section-heading text-uppercase">"상위 1%의 선택"</h2>
          <h3 class="section-subheading text-muted">고품격 프리미엄 객실</h3>

        </div>
      </div>
      <div class="row text-center">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		    <li data-target="#myCarousel" data-slide-to="1"></li>
		    <li data-target="#myCarousel" data-slide-to="2"></li>
		  </ol>
		
		  <!-- Wrapper for slides -->
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="/LuxResort/img/room/r4.jpg" style="width:100%">
		      <div class="carousel-caption">
		        <h3>럭셔리 클럽 스위트</h3>
		        <p>$1,500~</p>
		      </div>
		    </div>
		
		    <div class="carousel-item">
		      <img src="/LuxResort/img/room/r8.jpg" style="width:100%">
		      <div class="carousel-caption">
		        <h3>로열 스위트</h3>
		        <p>$800~</p>
		      </div>
		    </div>
		
		    <div class="carousel-item">
		      <img src="/LuxResort/img/room/r7.jpg" style="width:100%">
		      <div class="carousel-caption">
		        <h3>프리미어 디럭스</h3>
		        <p>$300~</p>
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
		<div style="text-align:center;width:100%;padding-left:150px">
			<p style="border:double; margin:20px auto; padding: 10px;">
				<i class="fal fa-exclamation-circle"></i> 객실요금은 오늘 기준의 1박 최저가 금액이며 예약하시는 날짜에 따라 다를 수 있습니다.
			</p>
		</div>
      </div>
    </div>
  </section>

  <!-- Portfolio Grid -->
  <section class="bg-light page-section" id="portfolio">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">푸른 바다의 비경속으로...</h2>
          <h3 class="section-subheading text-muted">대한민국이라고는 믿겨지지 않는 이국적인 경험</h3>
        </div>
      </div>
      <div class="row" style="display:inline-block">
      	 <span id="toursite_description" >
      	 	<h2 style="width:30%">"2019년 WORLD TOURSITE TOP100 선정"</h2>
      	 	<p id="toursite_desc_p">대한민국 최남단에 위치한 럭셔리조트는 제주도의 아름다움과 열대지방의 이국적인 감각을 현대적인 감각으로 풀어낸 5성 호텔로 파노라믹한 스카이라인과 환상적인 야경을 조망할 수 있으며 일몰과 일출을 한 자리에서 감상할 수 있는 국내 최고의 고품격 5성 럭셔리 호텔입니다.</p>
      	 </span>
         <span id="toursite_div"><img src="/LuxResort/img/tour/grotto.jpg" style="width:100%"/></span>
      </div>
      </div>
    </div>
  </section>

  <!-- About -->
  <section class="page-section" id="about">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">자연의 보석을 맛보는 미식투어</h2>
          <h3 class="section-subheading text-muted">미슐랭 3성을 받은 제주도 유일의 레스토랑이 선보이는 미식의 심포니</h3>
        </div>
      </div>
      <div class="row" style="display:inline-block">
         <span id="toursite2_div"><img style="width:100%" src="/LuxResort/img/tour/bbq.jpg"/></span>
      	 <span id="toursite2_description" >
      	 	<h2 style="width:30%; float:right">"제주도 유일의 미슐랭 3성 레스토랑이 선보이는 미식의 오케스트라"</h2>
      	 	<p id="toursite2_desc_p" style="float:right;">대한민국 최남단에 위치한 럭셔리조트는 제주도의 아름다움과 열대지방의 이국적인 감각을 현대적인 감각으로 풀어낸 5성 호텔로 파노라믹한 스카이라인과 환상적인 야경을 조망할 수 있으며 일몰과 일출을 한 자리에서 감상할 수 있는 국내 최고의 고품격 5성 럭셔리 호텔입니다.</p>
      	 </span>         
      </div>      
    </div>
  </section>

  <!-- Team -->
  <section class="bg-light page-section" id="team">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">찾아오시는길</h2>
          <h3 class="section-subheading text-muted">63513 제주특별자치도 서귀포시 대정읍 하모리 621-1<br>TEL : +82-64-73X-xxxx | FAX : +82-64-73X-XXXX</h3>
        </div>
      </div>
      <div class="row" style="display:inline-block">
      	 <span id="map_description" style="width:30%">
      	 	<div style="display:table-row">
	      	 	<h2 style="width:90%">"대한민국 최남단의 샹그릴라"</h2>
	      	 	<p id="map_desc_p">대한민국 최남단에 위치한 럭셔리조트는 제주도의 아름다움과 열대지방의 이국적인 감각을 현대적인 감각으로 풀어낸 5성 호텔로 파노라믹한 스카이라인과 환상적인 야경을 조망할 수 있으며 일몰과 일출을 한 자리에서 감상할 수 있는 국내 최고의 고품격 5성 럭셔리 호텔입니다.</p>
	      	</div>
      	 	<div style="display:table-row">
	      	 	<ul style="list-style-type:none; padding-inline-start:0px">
	      	 		<li><i class="fas fa-bus"></i> 버스<br>xxx-xxxx-xxxx-xxxx </li>
	      	 		<li><i class="fas fa-taxi"></i> 자동차(렌터카/택시)<br>xxx-xxxx-xxxx-xxxx</li>
	      	 	</ul>
      	 	</div>
      	 </span>
         <span id="map_div"></span>
      </div>


    </div>
  </section>

  <!-- Contact -->
  <section class="page-section" id="contact">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <img src="/LuxResort/img/logos/logo2.png" style="max-width: 20%">
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
