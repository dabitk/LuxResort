<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,com.resort.qna.*"%>
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
  <!-- ckeditor 가져옴 -->
  <script src="https://cdn.ckeditor.com/4.13.1/standard/ckeditor.js"></script>
  
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
	    background-image: url(img/notice.jpg);
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
	QnaDAO bbs = QnaDAO.getInstance(); //싱글턴으로 객체 생성.
	request.setCharacterEncoding("utf-8");
	String key = request.getParameter("key");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int rootid = (request.getParameter("rootid") == null) ? 0 : Integer.parseInt(request.getParameter("rootid"));
	int relevel = (request.getParameter("relevel") == null) ? 0 : Integer.parseInt(request.getParameter("relevel"));
	int recnt = (request.getParameter("recnt")==null) ? 0 : Integer.parseInt(request.getParameter("recnt"));
	
	int errorcode =0;
	QnaVO article;
	//새글을 씀 key=INSERT
	//수정 key=글번호
	
	if(key.equals("INSERT")){
		if(relevel != 0){ //삽입하려는 레코드가 댓글인 경우
			String str = "[Re]";
			title = str.concat(title); //결과 [Re]제목
			bbs.prepareDatGul(rootid,recnt); //댓글을 추가하기 전에 테이블의 recnt를 업데이트 하는 메소드.
			
			recnt = recnt+1; //댓글인 경우 부모글보다 recnt가 1 증가함
		}
		errorcode=bbs.insertArticle(title,content,rootid,relevel,recnt);
		article = bbs.getArticle();
		if(relevel==0){ //원글인 경우, rootid값은 id와 같아야 하기 때문에 테이블 삽입 후 별도의 update가 필요.
			bbs.updateWonGul(article.getId());
			article=bbs.getArticle(); //마지막으로 삽입된 레코드를 가져와서 화면에 출력한다.
		}
	}else{
		int id = Integer.parseInt(key);
		errorcode = bbs.updateArticle(id, title, content); //DB레코드 수정 쿼리 수행 메소드
		article = bbs.getArticle(id);	//id와 일치하는 레코드를 가져와서 화면에 출력한다
	}
	System.out.println("QNA 게시판 입력되는 rootid: "+ rootid + ", relevel: "+ relevel+", recnt: "+recnt);
	
	pageContext.setAttribute("key",key);
	pageContext.setAttribute("errorcode", errorcode);
	pageContext.setAttribute("article",article);
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

  <!-- Services -->
  <section class="page-section" id="services">
     
    <div class="centered">
    	<h1 style="margin-top:50px">공지사항</h1>
    </div>
    <div class="container">
      <div class="row">
      	<div class="col-lg-12 text-center">
      	<c:choose>
      		<c:when test="${key ne 'INSERT'}">
      			<p><c:out value="${article.getId()}"/>번 글이 다음과 같이 수정되었습니다.</p>
      		</c:when>
      		<c:otherwise>
      			<p>다음 내용이 Q & A 게시판에 추가되었습니다.</p>
      		</c:otherwise>
      	</c:choose>
      	</div>
        <div class="col-lg-12 text-center gongii-Board">        
		<!-- 이곳에 공지사항 게시판을 추가한다. -->
		<c:choose>
			<c:when test="${article ne null}">
				<!-- DB로부터 게시글을 성공적으로 가져왔고 관리자 로그인 상태인 경우에만 실행 -->
				<div>
					<FORM method="POST" style="text-align:left">
					<table align=center width=800 cellspacing=1 border=1>
					<TR>
					<th>번호</th>
					<td><input type="number" name="key" value='<c:out value="${article.getId()}"/>' readonly/></td>		
					</TR>
					<TR>
					<th>제목</th>
					<td><input type="text" name="title" value='<c:out value="${article.getTitle()}"/>' maxlength="70" autocomplete=off readonly/></td>		
					</TR>			
					<TR>
					<th>일자</th>
					<td><c:out value="${article.getDate()}"/></td>		
					</TR>
					<TR>
					<th>내용</th>
					<td>
						<textarea name="content" cols="80" rows="30" maxlength="1500" readonly><c:out value="${article.getContent()}"/>
						</textarea>
					<script>
						CKEDITOR.plugins.addExternal( 'filebrowser', '/myplugins/abbr/', 'plugin.js' );
	                  	CKEDITOR.replace( 'content' ,{
							height:'100%',
							width:'100%',
						    resize_dir: 'none'
	                    });
	             	</script>						
					</td>		
					</TR>						
					</table>
					<span>
						<a href="e_02.jsp" class="btn btn-primary btn-lg rippler rippler-inverse">목록으로</a>
					</span>		
					</FORM>
				</div>
			</c:when>
			<c:otherwise>
			<%--article이 null인 경우 이하 코드 실행--%>
				<%response.sendError(500); //만약 에러가 발생하면 500에러를 발생시킴%>
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
