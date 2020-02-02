<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,com.resort.gongii.*,com.resort.reservation.*"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="dabitk">
  <script src="https://kit.fontawesome.com/c0559a0b41.js" crossorigin="anonymous"></script>
  <title>예약현황 게시판입니다.</title>

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
  
  <style>
  <!-- 공지게시판용 style -->
  		.key{
			width:7%;
			text-align:center;
		}
		.title{
			width:68%;
		}
		.viewcnt{
			width:12%;
			text-align:center;
		}
		.registerDate{
			width:13%;
			text-align:center;
		}
		
		#writeBtn{
			float:right;
		}

   <!-- 이상 공지게시판용 style 종료--> 
  
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
	.centered{
	    background-image: url(img/reserved.jpg);
	    background-size: cover;
		text-align:center;
	    color: white;
	    min-height: 200px;
    	padding-top: 50px;
	}
	
	.gongii-list{

	    table-layout: fixed;
	    width: 100%;
	    margin: 0;
	    border-bottom: 1px solid #ceccc6;
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
	});	 
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
	
	//pageContext.setAttribute("holidayList",holidayList);
	pageContext.setAttribute("resv_list",resv_list); //페이지 컨텍스트에 list 속성을 지정한다
%>
  <!-- Navigation -->
  <!-- <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">-->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top shrink" id="mainNav">
  	<div class="navbar-top" style="width:100%">
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
          <li class="nav-item" style="min-width: 150px" id="introduction">
            <a class="nav-link js-scroll-trigger" href="#">리조트소개</a>           
          </li>
          <li class="nav-item" style="min-width: 150px" id ="findhere">
            <a class="nav-link js-scroll-trigger" href="#">다이닝</a>
          </li>
          <li class="nav-item" style="min-width: 150px" id="toursite">
            <a class="nav-link js-scroll-trigger" href="#">부대시설</a>
          </li>
          <li class="nav-item" style="min-width: 150px" id ="mkreservation">
            <a class="nav-link js-scroll-trigger" href="#">예약하기</a>
          </li>
          <li class="nav-item" style="min-width: 150px" id="notice">
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
						<table align=center width=800 cellspacing=1 border=1>
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
										<TD class="room1"><c:out value="${a.room1}"/></TD>
									</c:when>									
									<c:otherwise>
										<TD class="room1"><a href="d_02.jsp?room=1&checkin=<c:out value='${a.calendr}'/>"><c:out value="${a.room1}"/></a></TD>
									</c:otherwise>								
								</c:choose>
								<c:choose>
									<c:when test="${a.room2 ne '예약가능'}">
										<TD class="room2"><c:out value="${a.room2}"/></TD>
									</c:when>
									<c:otherwise>
										<TD class="room2"><a href="d_02.jsp?room=2&checkin=<c:out value='${a.calendr}'/>"><c:out value="${a.room2}"/></a></TD>
									</c:otherwise>								
								</c:choose>
								<c:choose>
									<c:when test="${a.room3 ne '예약가능'}">
										<TD class="room3"><c:out value="${a.room3}"/></TD>
									</c:when>
									<c:otherwise>
										<TD class="room3"><a href="d_02.jsp?room=3&checkin=<c:out value='${a.calendr}'/>"><c:out value="${a.room3}"/></a></TD>
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
      <div class="row" style="width:100%">
        <div class="col-lg-12 text-center">
          <img src="./img/logos/logo2.png" style="max-width: 20%"/>
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
      <div class="row align-items-center" >
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
