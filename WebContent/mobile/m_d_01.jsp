<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<%@ page import="java.util.*,java.io.*, java.text.SimpleDateFormat,java.net.URLEncoder,java.net.URLDecoder,com.resort.gongii.*,com.resort.reservation.*"%>    
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
	    background-image: url(../img/reserved.jpg);
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
<%
	reservationDAO resv = reservationDAO.getInstance(); //싱글턴으로 객체 생성.
	List<calendarVO> resv_list = new ArrayList<calendarVO>();
	request.setCharacterEncoding("utf-8");
	
//	String[] holidayList = new String[]{
//				"토","일","01-01","01-24","01-25","01-26",
//				"03-01","04-30","05-05","06-06","08-15",
//				"09-30","10-01","10-02","10-03","10-09",
//				"12-25"
//	};
	
	resv_list=resv.getBookingInfo();	//첫번째 행부터 15개를 DB로부터 가져온다
	
	String loginOK = (String)session.getAttribute("login_ok");
	

	if((loginOK!=null && !loginOK.equals("yes")) || loginOK == null && !resv_list.isEmpty()){
		
		//다음 조건에 해당 되었을 때 예약자 이름에 대해 전처리를 수행한다. 관리자 로그인시 풀네임 출력, 관리자 미로그인시 이름 중간에 * 출력.
		//1. 관리자가 아닌 회원으로서 로그인 한 상태이면서 리스트가 비어있지 않는 경우
		//2. 관리자 로그인 안되있으면서 리스트가 비어있지 않는 경우
		
		for(calendarVO a:resv_list){
			if(!a.getRoom1().equals("예약가능")){ //이미 예약이 된 객실에 대해서만 전처리를 수행한다.
				if(a.getRoom1().length() == 2){ //객실1의 예약명이 2글자 길이인 경우 ex) 예약자명: 전진 -> 전*
					a.setRoom1(a.getRoom1().replace(a.getRoom1().charAt(1),'*'));
				}else if(a.getRoom1().length() >= 3){//객실1의 예약명이 3글자 이상인 경우 첫글자와 마지막 글자를 제외한 글자를 *로 출력
													 //ex) 예약자명: 김정후 -> 김*후, 앙드레김 -> 앙*김
					a.setRoom1(a.getRoom1().replace(a.getRoom1().substring(1,a.getRoom1().length()-1),"*"));
				}
			}
			if(!a.getRoom2().equals("예약가능")){
				if(a.getRoom2().length() == 2){ //관리자 미로그인 시 객실2 예약명 전처리
					a.setRoom2(a.getRoom2().replace(a.getRoom2().charAt(1),'*'));
				}else if(a.getRoom2().length() >= 3){
					a.setRoom2(a.getRoom2().replace(a.getRoom2().substring(1,a.getRoom2().length()-1),"*"));
				}
			}
			if(!a.getRoom3().equals("예약가능")){
				if(a.getRoom3().length() == 2){ //관리자 미로그인 시 객실3 예약명 전처리
					a.setRoom1(a.getRoom3().replace(a.getRoom3().charAt(1),'*'));
				}else if(a.getRoom3().length() >= 3){
					a.setRoom3(a.getRoom3().replace(a.getRoom3().substring(1,a.getRoom3().length()-1),"*"));
				}
			}
		}
	}
	
	//pageContext.setAttribute("holidayList",holidayList);
	pageContext.setAttribute("resv_list",resv_list); //페이지 컨텍스트에 list 속성을 지정한다
%>
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
    	<h1 style="margin-top:50px">예약현황</h1>
    </div>
    <div class="container">
      <div class="row">
      	<div class="col-lg-12 text-center">
      	<p>금일부터 30일간의 예약 현황을 알려드립니다. 원하시는 날짜와 객실을 선택해서 예약을 해주시기 바랍니다.<p>
      	</div>
        <div class="col-lg-12 text-center gongii-Board">        
		<!-- 이곳에 공지사항 게시판을 추가한다. -->
				<c:choose>
					<c:when test="${!resv_list.isEmpty()}">
						<table align=center style="width:100%" cellspacing=1 border=1>
							<TR><TH class="calendr">일자</TH><TH class="room1">럭셔리 클럽 스위트</TH><TH class="room2">로열 스위트</TH><TH class="room3">프리미어 디럭스</TH></TR>
							<c:forEach var="a" items="${resv_list}">
							<TR>
								<!-- room1, room2, room3은 예약가능일 때만 클릭이 가능 -->
								<TD class="calendr">
								<c:choose>
									<c:when test="${fn:contains(a.calendr,'토')}"><p style="color:red"><c:out value="${a.calendr}"/></p></c:when>
									<c:when test="${fn:contains(a.calendr,'일')}"><p style="color:red"><c:out value="${a.calendr}"/></p></c:when>
									<c:when test="${fn:contains(a.calendr,'01-01')}"><p style="color:red"><c:out value="${a.calendr}"/></p></c:when>
									<c:when test="${fn:contains(a.calendr,'01-24')}"><p style="color:red"><c:out value="${a.calendr}"/></p></c:when>
									<c:when test="${fn:contains(a.calendr,'01-25')}"><p style="color:red"><c:out value="${a.calendr}"/></p></c:when>
									<c:when test="${fn:contains(a.calendr,'01-26')}"><p style="color:red"><c:out value="${a.calendr}"/></p></c:when>
									<c:when test="${fn:contains(a.calendr,'03-01')}"><p style="color:red"><c:out value="${a.calendr}"/></p></c:when>
									<c:when test="${fn:contains(a.calendr,'04-30')}"><p style="color:red"><c:out value="${a.calendr}"/></p></c:when>
									<c:when test="${fn:contains(a.calendr,'05-05')}"><p style="color:red"><c:out value="${a.calendr}"/></p></c:when>
									<c:when test="${fn:contains(a.calendr,'06-06')}"><p style="color:red"><c:out value="${a.calendr}"/></p></c:when>
									<c:when test="${fn:contains(a.calendr,'08-15')}"><p style="color:red"><c:out value="${a.calendr}"/></p></c:when>
									<c:when test="${fn:contains(a.calendr,'09-30')}"><p style="color:red"><c:out value="${a.calendr}"/></p></c:when>
									<c:when test="${fn:contains(a.calendr,'10-01')}"><p style="color:red"><c:out value="${a.calendr}"/></p></c:when>
									<c:when test="${fn:contains(a.calendr,'10-02')}"><p style="color:red"><c:out value="${a.calendr}"/></p></c:when>
									<c:when test="${fn:contains(a.calendr,'10-03')}"><p style="color:red"><c:out value="${a.calendr}"/></p></c:when>
									<c:when test="${fn:contains(a.calendr,'10-09')}"><p style="color:red"><c:out value="${a.calendr}"/></p></c:when>
									<c:when test="${fn:contains(a.calendr,'12-25')}"><p style="color:red"><c:out value="${a.calendr}"/></p></c:when>		
									<c:otherwise>
										<p><c:out value="${a.calendr}"/></p>
									</c:otherwise>
								</c:choose>
								</TD>
								<c:choose>
									<c:when test="${a.room1 ne '예약가능'}">
										<!-- 관리자 로그인 되어있는 경우는 이름을 클릭해서 예약수정 페이지로 이동 가능 -->
										<c:choose>
											<c:when test="${sessionScope.login_ok eq 'yes' }">
												<TD class="room1"><a href="<%=request.getContextPath()%>/admin_oneview.jsp?checkin=<c:out value='${a.calendr}'/>&room=1"><c:out value="${a.room1}"/></a></TD>
											</c:when>
											<c:otherwise>
												<TD class="room1"><c:out value="${a.room1}"/></TD>
											</c:otherwise>
										</c:choose>
									</c:when>									
									<c:otherwise>
										<TD class="room1"><a href="<%=request.getContextPath()%>/d_02.jsp?room=1&checkin=<c:out value='${a.calendr}'/>"><c:out value="${a.room1}"/></a></TD>
									</c:otherwise>								
								</c:choose>
								<c:choose>
									<c:when test="${a.room2 ne '예약가능'}">
										<!-- 관리자 로그인 되어있는 경우는 이름을 클릭해서 예약수정 페이지로 이동 가능 -->
										<c:choose>
											<c:when test="${sessionScope.login_ok eq 'yes' }">
												<TD class="room2"><a href="<%=request.getContextPath()%>/admin_oneview.jsp?checkin=<c:out value='${a.calendr}'/>&room=2"><c:out value="${a.room2}"/></a></TD>
											</c:when>
											<c:otherwise>
												<TD class="room2"><c:out value="${a.room2}"/></TD>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<TD class="room2"><a href="<%=request.getContextPath()%>/d_02.jsp?room=2&checkin=<c:out value='${a.calendr}'/>"><c:out value="${a.room2}"/></a></TD>
									</c:otherwise>								
								</c:choose>
								<c:choose>
									<c:when test="${a.room3 ne '예약가능'}">
										<!-- 관리자 로그인 되어있는 경우는 이름을 클릭해서 예약수정 페이지로 이동 가능 -->
										<c:choose>
											<c:when test="${sessionScope.login_ok eq 'yes' }">
												<TD class="room3"><a href="<%=request.getContextPath()%>/admin_oneview.jsp?checkin=<c:out value='${a.calendr}'/>&room=3"><c:out value="${a.room3}"/></a></TD>
											</c:when>
											<c:otherwise>
												<TD class="room3"><c:out value="${a.room3}"/></TD>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<TD class="room3"><a href="<%=request.getContextPath()%>/d_02.jsp?room=3&checkin=<c:out value='${a.calendr}'/>"><c:out value="${a.room3}"/></a></TD>
									</c:otherwise>								
								</c:choose>										
							</TR>
							</c:forEach>
						</table>
					</c:when>
					<c:otherwise>
						<%response.sendError(500); //만약 에러가 발생하여 예약현황 출력이 안되는 경우는 500에러를 발생시킴.%>
					</c:otherwise>			
				</c:choose>
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