<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- JQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="../js/jquery.rippler.min.js"></script>
	<!-- Bootstrap core CSS -->
	<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom fonts for this template -->
	<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
	<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>	
 	<link rel="stylesheet" href="../css/agency.min.css" >
 	<link rel="stylesheet" href="../css/rippler.min.css">	  
	<title>요청하신 페이지를 찾을 수 없습니다.</title>
	<script>
		$(document).ready(function() {
			  $(".rippler").rippler({
			    effectClass      :  'rippler-effect'
			    ,effectSize      :  16      // Default size (width & height)
			    ,addElement      :  'div'   // e.g. 'svg'(feature)
			    ,duration        :  400
			  });
			});
	</script>	
</head>
<body>
	<div class="container" style="text-align: center;
    letter-spacing: -1px;">
		<div class="row" style="display:block">
          	<img src="./img/logos/logo2.png" style="max-width: 20%">		
		</div>
		<div class="row" style="display:block">
			<p>
				<br>
				서비스 이용에 불편을 드려 대단히 죄송합니다.
			</p>
		</div>
		<div class="row" style="display:block">
			<p>
				장애가 발생하여 요청하신 서비스가 정상적으로 처리되지 않았습니다.
				<br>
				장애내용은 실시간으로 전송되었으며, 최대한 빠른 시간안에 조치하도록 하겠습니다.
				<br>
				고객 여러분께 보다 신속하고 편리한 서비스를 제공할 수 있도록 최선을
				<br>
				다하겠습니다. 감사합니다.
				<br>
				기타 문의사항은 customerservice@luxclub.com의 LuxClub 고객센터에 연락주시면 친절하게 안내해 드리겠습니다.
				<br>
				감사합니다.
			</p>
		</div>
		<div class="row" style="display:block">
			<a class="btn btn-primary btn-lg rippler rippler-inverse" href="javascript:history.go(-1)">Previous page</a>
			<a class="btn btn-secondary btn-lg rippler rippler-inverse" href="/LuxResort/index.jsp">Home page</a>
		</div>
	</div>
</body>
</html>