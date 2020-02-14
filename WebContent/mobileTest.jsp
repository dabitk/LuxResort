<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8"/>
<meta name="viewport" content="user-scalable=no, width=device-width"/>
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>
<script>
var orientationEvent;
var uAgent=navigator.userAgent.toLowerCase();
var mobilePhones = 'android';
if(uAgent.indexOf(movilePhones) != -1){
	orientationEvent = "resize"; //안드로이드는 resize로 들어옴
}
else orientationEvent = "orientationchange"; //아이폰은 이렇게 들어옴
window.addEventListener(orientationEvent, function()
{
	// alert("회전했어요");
	location.href('#');
	}, false);

var prevScreen=0;
var sv_prevScreen=0;
function prevShow()
{
	ScreenShow(prevScreen);
}
var muCnt = 5; //서브메뉴
var scCnt = 15; //화면

function fncShow(pos)
{
	var i = 0;
	for(i=0;i<scCnt; i++){
		var obj = document.getElementById("s"+i);
		obj.style.display = 'none';		
	}
	for(i=0;i<muCnt; i++){
		var obj = document.getElementById("menu"+i);
		var obj2 = document.getElementById("m"+i);
		if(i=0;i<muCnt;i++){
			obj.style.display='';
			obj2.style.background="#ff0000";
		}else{
			obj.style.display='none';
			obj2.style.background="#FFFF00";
		}
	}
}

var scCnt = 15;
var ScrObj;

var timer1;

function ScrAnimation(){
	var offset = -50;
	if(parseInt(ScrObj.style.left)>10){
		ScrObj.style.left = parseInt(ScrObj.style.left)+offset+"px";
		timer1 = setTimeout("ScrAnimation()", 1);
	}else{
		ScrObj.style.left=5;
		clearTimeout(timer1);
	}
}
function ScreenShow(pos){
	var i = 0;
	//모든 메뉴 페이지는 막는다.
	for(i=0;i<muCnt; i++){
		var obj = document.getElementById("menu"+i);
		obj.style.display = 'none';
	}

	for(i=0;i<scCnt; i++){
		var obj = document.getElementById("s"+i);
		if(i==pos){
			prevScreen = sv_prevScreen;
			sv_prevScreen=i;
			obj.style.display='';
			obj.style.position="relative";
			obj.style.top=35;
			obj.style.left=screen.width;
			obj.style.height=screen.height-120;
			ScrObj=obj;
			ScrAnimation();
		}else{
			obj.style.display = 'none';
		}
	}
}
	
</script>
<style type="text/css">
li{text-align:left;vertical-align:middle; margin:2; padding:10; height:20; background-color:#aaaa00; border:2px; solid:red; font-size:16px}
ul{text-align:left;vertical-align:middle; margin:2; padding:10; height:20; background-color:#bbaabb; border:2px; solid:red; font-size:16px}
</style>
<title>Insert title here</title>
</head>
<body onload="ScreenShow(0)">

	<div id="container" style="width:device-width;height:device-height;">
	<div id="header1" style="background-color:#00FFFF; height:35px;width:15%;float:left;" onclick='prevShow();'>
	<center>
		<img src="back_btn.png" width=40px height=32px>
	</center>
	</div>
	<div id="header2" style="background-color:#00FFFF; height:35px; width:70%;float:left;">
	<center style="margin:10px;">
		<B>조아 리조트</B>
	</center>
	</div>
	<div id="header3" style="background-color:#00FFFF; height:35px; width:15%;float:left" onclick='ScreenShow(0);'>
	<center>
		<img src="home_btn.png" width=30px height=32px>
	</center>
	</div>
	<div id="menu0" style="background-color:#EEEEEE;display:none;width:device-width">
	리조트소개
		<li onclick='ScreenShow(0);'>조아리조트</li>
		<li onclick='ScreenShow(1);'>VIP룸</li>
		<li onclick='ScreenShow(2);'>일반룸</li>
		<li onclick='ScreenShow(3);'>합리적인룸</li>
		<br>
	</div>
	<div id="menu1" style="background-color:#EEEEEE;display:none;width:device-width">
	찾아오기
		<li onclick='ScreenShow(4);'>찾아오는길</li>
		<li onclick='ScreenShow(5);'>대중교통이용</li>
		<li onclick='ScreenShow(6);'>자가용이용</li>
		<br>
	</div>
	<div id="menu2" style="background-color:#EEEEEE;display:none;width:device-width">
	주변명소
		<li onclick='ScreenShow(7);'>높아산</li>
		<li onclick='ScreenShow(8);'>조아해수욕장</li>
		<li onclick='ScreenShow(9);'>따끈온천</li>
		<br>
	</div>
	<div id="menu3" style="background-color:#EEEEEE; display:none; width:device-width">
	예약하기
		<li onclick='ScreenShow(10);'>예약상황</li>
		<li onclick='ScreenShow(11);'>예약하기</li>
		<br>
	</div>
	<div id="menu4" style="background-color:#EEEEEE; display:none; width:device-width">
	리조트소개
		<li onlick='ScreenShow(12);'>리조트소식</li>
		<br>
	</div>
	<div id="s0" style="background-image:url(background.jpg);display:none;width:device-width;">
		<center>
		<img src="main.jpg" width=200px height=150px>
		<br>조아리조트로 놀러오셔요
		</center>
	</div>
	<div id="s1" style="background-image:url(background.jpg);display:none;width:device-width;">
		<center>
			<img src="a_01.jpg" width=200px height=150px>
			<br>VIP룸은 럭셔리 휴식공간입니다.
		</center>	
	</div>
	<div id="s2" style="background-image:url(background.jpg);display:none;width:device-width;">
		<center>
			<img src="a_02.jpg" width=200px height=150px>
			<br>일반룸은 아늑학 휴식공간입니다.
		</center>
	</div>
	<div id="s3" style="background-image:url(background.jpg);display:none;width:device-width;">
		<center>
			<img src="a_03.jpg" width=200px height=150px>
			<br>경제적인 방도 준비되어 있습니다.
		</center>
	</div>
	<div id="s4" style="background-image:url(background.jpg);display:none;width:device-width;">

			<img src="b_01.jpg" width=200px height=150px>
			<br>
			<br>* 이곳으로 오셔요

	</div>
	<div id="s5" style="background-image:url(background.jpg);display:none;width:device-width;">

			<img src="b_02.jpg" width=200px height=150px>
			<br>?지하철 이용 시
			<br>? 7호선

	</div>
	<div id="s6" style="background-image:url(background.jpg);display:none;width:device-width;">

			<img src="b_03.jpg" width=200px height=150px>
			<br>?자가용 이용 시
			<br>? 7호선

	</div>
	<div id="s7" style="background-image:url(background.jpg);display:none;width:device-width;">

			<img src="c_01.jpg" width=200px height=150px>
			<br>아름다운 높아산이 근처에 있습니다.

	</div>
	<div id="s8" style="background-image:url(background.jpg);display:none;width:device-width;">

			<img src="c_02.jpg" width=200px height=150px>
			<br>신나는 조아해수욕장이 근처에 있습니다.

	</div>
	<div id="s9" style="background-image:url(background.jpg);display:none;width:device-width;">

			<img src="c_03.jpg" width=200px height=150px>
			<br>편히 쉴수있는 따끈온천이 근처에 있습니다.

	</div>
	<div id="s10" style="background-image:url(background.jpg);display:none;width:device-width;">
		<iframe src="d_01_m.jsp" frameborder="0" border="0" bordercolor="white" width=320px height=420px marginwidth="0" marginheight="0" scrolling="yes"></iframe>

	</div>
	<div id="s11" style="background-image:url(background.jpg);display:none;width:device-width;">
		<iframe src="d_02_m.jsp" frameborder="0" border="0" bordercolor="white" width=320px height=420px marginwidth="0" marginheight="0" scrolling="yes"></iframe>
	</div>
	<div id="s12" style="background-image:url(background.jpg);display:none;width:device-width;">
		나 메뉴4_1에 대한 화면
	</div>
	<div id="s13" style="background-image:url(background.jpg);display:none;width:device-width;">
		나 메뉴4_2에 대한 화면
	</div>
	<div id="s14" style="background-image:url(background.jpg);display:none;width:device-width;">
		나 메뉴4_3에 대한 화면
	</div>
	
	<div id="m0" onclick="fncShow(0);" style="position:absolute;bottom:3px;position:absolute;left:1%; background-color:#FF0000; height:60px;width:18%;float:left;">
		<center>
		<img src="m1_btn.png" width=40px height=40px><br>
		<font size=2>리조트소개</font></center></div>
	<div id="m1" onclick="fncShow(1);" style="position:absolute;bottom:3px;position:absolute;left:21%;background-color:	#FFFF00;height:60px;width:18%;float:left;">
		<center>
		<img src="m2_btn.png" width=40px height=40px><br>
		<font size=2>찾아오기</font></center></div>
	<div id="m2" onclick="fncShow(2);" style="position:absolute;bottom:3px;position:absolute;left:41%;background-color: #FFFF00;height:60px;width:18%;float:left;">
		<center>
		<img src="m3_btn.png" width=40px height=40px><br>
		<font size=2>주변명소</font></center></div>
	<div id="m3" onclick="fncShow(3);" style="position:absolute;bottom:3px;position:absolute;left:61%;background-color: #FFFF00;height:60px;width:18%;float:left;">
		<center>
		<img src="m4_btn.png" width=40px height=40px><br>
		<font size=2>예약하기</font></center></div>
	<div id="m4" onclick="fncShow(4);" style="position:absolute;bottom:3px;position:absolute;left:81%;background-color: #FFFF00;height:60px;width:18%;float:left;">
		<center>
		<img src="m5_btn.png" width=40px height=40px><br>
		<font size=2>리조트소개</font></center></div>
	</div>			


</body>
</html>