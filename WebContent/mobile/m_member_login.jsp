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
	.centered{
	    background-image: url(../img/member.jpg);
	    background-size: 100% 100%; 
		text-align:center;
	    color: white;
	    font-size: 50px;
	    min-height: 200px;
    	padding-top: 50px;
	}
	
	.gongii-list{

	    table-layout: fixed;
	    width: 100%;
	    margin: 0;
	    border-bottom: 1px solid #ceccc6;
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
			$("#loginBtn").on("click",function(){
				$.ajax({
					url:"http://192.168.23.14:8080/LuxResort/member_loginck.jsp",
					data:{
						email: $('input[name="email"]').val(),
						password: $('input[name="password"]').val()},
					type:"POST", //HTTP 요청 방식
					dataType:"json" //서버에서 보내줄 데이터의 타입
					}).done(function(json){
						console.log(json);
						if(json.login_ok === 1){
							alert("로그인 되었습니다.");
							window.location.replace("./m_index.jsp");
						}else{
							alert("아이디 또는 비밀번호가 올바르지 않습니다.");
							$('input[name="email"]').val("");
							$('input[name="password"]').val("");
						}
					});
				});
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

<body id="page-top">
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
  				<c:when test="${sessionScope.login_ok eq 'yes_member' || sessionScope.login_ok eq 'yes'}">
		  			<a href="<%=request.getContextPath()%>/mobile/m_member_logout.jsp">
		  				LOG OUT
		  			</a>  				
  				</c:when>
  				<c:otherwise>
  					<a href="<%=request.getContextPath()%>/mobile/m_member_login.jsp">
		  				LOG IN
		  			</a>
  				</c:otherwise>
  			</c:choose></td>
			<td width='25%'><a href="<%=request.getContextPath()%>/mobile/m_member_register.jsp">REGISTER</a></td>
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
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/mobile/m_a_02.jsp">로열 스위트</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/mobile/m_a_03.jsp">프리미어 디럭스</a>
	          </div>
          </li>         
          <li class="nav-item" style="min-width: 150px" id = "findhere" >
            <a class="nav-link js-scroll-trigger dropdown-toggle" id="dropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">다이닝</a>
          	  <div class="dropdown-menu" aria-labelledby="dropdown2">
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/mobile/m_b_01.jsp">레스토랑</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/mobile/m_b_02.jsp">바&라운지</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/mobile/m_b_03.jsp">베이커리</a>
	          </div>            
          </li>
          <li class="nav-item" style="min-width: 150px" id="toursite" >
            <a class="nav-link js-scroll-trigger dropdown-toggle" id="dropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">부대시설</a>
          	  <div class="dropdown-menu" aria-labelledby="dropdown3">
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/mobile/m_c_01.jsp">스쿠버다이빙 체험</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/mobile/m_c_02.jsp">스파</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/mobile/m_c_03.jsp">대연회장</a>
	          </div>            
          </li>
          <li class="nav-item" style="min-width: 150px" id ="mkreservation" >
            <a class="nav-link js-scroll-trigger dropdown-toggle" id="dropdown4" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">예약하기</a>
          	  <div class="dropdown-menu" aria-labelledby="dropdown4">
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/mobile/m_d_01.jsp">예약 상황</a>  
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/mobile/m_d_02.jsp">객실 예약</a>
	            <div class="dropdown-divider"></div>	
	            <c:choose>
  				<c:when test="${sessionScope.login_ok eq 'yes' }">
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/mobile/m_admin_logout.jsp">관리자 로그아웃</a>			
  				</c:when>
  				<c:otherwise>
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/mobile/m_admin_login_form.jsp">관리자 페이지</a>
  				</c:otherwise>
  				</c:choose>
	          </div>            
          </li>
          <li class="nav-item" style="min-width: 150px" id="notice" >
            <a class="nav-link js-scroll-trigger dropdown-toggle" id="dropdown5" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">팬션소식</a>
          	  <div class="dropdown-menu" aria-labelledby="dropdown5">
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/mobile/m_e_01.jsp">공지사항</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/mobile/m_e_02.jsp">Q & A</a>
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

  <!-- Services -->
  <section class="page-section" id="services">
     
    <div class="centered">
    	<h1 style="margin-top:50px">멤버 로그인</h1>
    </div>
    <div class="container">
      <div class="row">
      	<div class="col-lg-12 text-center">
      	<p>회원 로그인 페이지 입니다.<p>
      	</div>
        <div class="col-lg-12 text-center gongii-Board">        
		<!-- 이곳에 공지사항 게시판을 추가한다. -->
        <div class="card text-center card  bg-default mb-3" style="display:inline-block; width:60%">
          <div class="card-header">
            멤버 로그인
          </div>
          <FORM method="POST" id="logingForm">
          <div class="card-body">
               <input type="text" name="email" class="form-control input-sm chat-input" placeholder="아이디" />
            </br>
            	<input type="password" name="password" class="form-control input-sm chat-input" placeholder="비밀번호" />
          </div>
          <div class="card-footer text-muted">
          	<button id="loginBtn" class="btn btn-secondary" >로그인</button>
          </div>
          </FORM>
        </div>		
        </div>
        <div class="col-lg-12 text-center">
			<a id="custom-login-btn" href="javascript:loginWithKakao()">
				<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
			</a>
			<script type='text/javascript'>
			  //<![CDATA[
			    // 사용할 앱의 JavaScript 키를 설정해 주세요.
			    Kakao.init('bd7797bf8cc3636f6be46fe70afdeec7');
			    function loginWithKakao() {
			      // 로그인 창을 띄웁니다.
			      Kakao.Auth.login({
			        success: function(authObj) {
				        //2. 로그인 성공시, API를 호출한다.
				       Kakao.API.request({
					       url:'/v1/user/me',
						   success:function(res){
							   res.id += "@k"; //res의 id속성값에 Kakao 로그인이라는 것을 나타내는 문자열 추가
								$.ajax({ //AJAX로 이미 등록된 아이디가 있는지 체크
									url:"/member_dupCheckAjax.jsp",
									data: {email:res.id},
									method:"POST",
								},
								success: function(idChk){ //성공적으로 응답이 돌아오면
									if(idChk==0){ //사용 가능한 아이디인 경우
										console.log("회원가입중...");
										$.ajax({
											url:"/member_SNSRegisterAjax.jsp",
											method:"POST",
											data:JSON.stringify({
												email: res.id,
												password: "kakao123", //일단 임의로 지정해둠
												address: "kakaoAddr", //일단 임의로 지정해둠
												name: res.nickname,
												tel: "010-7304-6388"
												}),
												success: function(JSONData){
													alert("회원가입이 정상적으로 완료되었습니다. 다시 한 번 카카오계정으로 로그인을 눌러주세요.");
													location.reload(); //현재 페이지를 새로고침 함.
												}
											})
											//else if(idChk==1){ //DB에 중복 아이디가 존재하는 경우는 로그인 시킨다.
											//	console.log("로그인중...");
												//로그인 처리 AJAX
											//	$.ajax({
											//		url:"member_loginck.jsp",
											//		data:JSON.stringify({
											//			email:  res.id,
											//			password: "kakao123"}),
											//		type:"POST", //HTTP 요청 방식
											//		dataType:"json" //서버에서 보내줄 데이터의 타입
											//		}).done(function(json){
											//			console.log(json);
											//			if(json.login_ok === 1){
											//				alert("로그인 되었습니다.");
											//				window.location.replace("./index.jsp");
											//			}else{
											//				alert("로그인 실패. 관리자에게 문의주세요.");
											//			}
											//		}									
											//}
										},
										fail: function(err){
											alert(JSON.stringify(err));
											}
										},
										fail: function(error){
											alert(JSON.stringify(error));
										}
						       
								   });
						       };
					        });
					      }

			    
				       
								   
									//url:"/member_SNSRegisterAjax.jsp",
									//method:"POST",
									//data:JSON.stringify({
									//	userId : res.id,
									//	userName : res.properties.nickname,
									//	password:
									//	})
									//})

							   //login(res);
							   //alert(JSON.stringify(res)); //JSON형태의 결과값 alert로 띄우기
							   //alert(JSON.stringify(authObj));
							   //console.log(res.id); //콘솔 로그에 id정보 출력
							   //console.log(res.kaccount_email); //콘솔 로그에 이메일 정보 출력
							   //console.log(res.properties['nickname']); //콘솔 로그에 닉네임 출력
							   //console.log(authObj.access_token); //콘솔 로그에 토큰값 출력
								
							   //}
					       //}) 
			   //       alert(JSON.stringify(authObj));
			   //     },
			   //     fail: function(err) {
			   //       alert(JSON.stringify(err));
			   //     }
			   //   });			      
			   //};

				//function login(res){
				//		$.ajax({
				//				url:"aa.jsp", //클라이언트가 요청을 보낼 서버의 URL 주소
				//				data: res,
									
				//				type:"POST", //HTTP 요청 방식
				//				dataType:"json" //서버에서 보내줄 데이터의 타입
				//			})
				//			//HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
				//			.done(function(json){
				//				console.log(json);
				//				if(json.dupExists != 0){
				//					$("#numOfNights").val(1); //숙박일수를 1로 초기화한다.
				//					alert("중복된 예약이 있습니다. 다른 날짜 또는 숙박일수를 선택해 주십시오.");
				//				}
				//			});
				//	 };	
			  //]]>
			</script>			
		</div>
		<div class="col-lg-12 text-center" style="margin-top:10px">
			<a id="custom-login-btn" href="#">
				<img src="img/Naver_Green.PNG" width="300"/>
			</a>
		</div>        
      </div>
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
