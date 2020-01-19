<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- JQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.rippler.min.js"></script>
	<!-- Bootstrap core CSS -->
	<link href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom fonts for this template -->
	<link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
	<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>	
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/agency.min.css" >
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/rippler.min.css">	  
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
          	<img src="<%=request.getContextPath()%>/img/logos/logo2.png" style="max-width: 20%">		
		</div>
		<div class="row" style="display:block">
			<p>
				<br>
				서비스 이용에 불편을 드려 대단히 죄송합니다.
				<br>
				요청하신 페이지를 찾을 수 없습니다.
			</p>
		</div>
		<div class="row" style="display:block">
			<p>
				현재 접근하신 페이지는 존재하지 않는 주소입니다.
				<br>
				페이지의 주소를 잘못 입력하였거나, 요청하신 페이지의 주소가 변경 혹은 삭제되어
				<br>
				페이지를 찾을 수 없습니다.
				<br>
				입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.
				<br>
				관련 문의사항은 customerservice@luxclub.com의 LuxClub 고객센터에 연락주시면 친절하게 안내해 드리겠습니다.
				<br>
				감사합니다.
			</p>
		</div>
		<div class="row" style="display:block">
			<a class="btn btn-primary btn-lg rippler rippler-inverse" href="javascript:history.go(-1)">Previous page</a>
			<a class="btn btn-secondary btn-lg rippler rippler-inverse" href="<%=request.getContextPath()%>/index.jsp">Home page</a>
		</div>
	</div>
</body>
</html>