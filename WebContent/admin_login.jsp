<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>관리자 로그인 페이지 입니다.</title>
<%
////////////////////////////////////////////////////////////
//
//  세션을 체크해서 없다면 로그인창으로 보낸다.
//  로그인 성공이면 예약 관리 페이지로 이동한다.
//
////////////////////////////////////////////////////////////
	
	String loginOK=null;
	String jumpURL_Fail="admin_login_form.jsp";
	String jumpURL_Success="admin_allview.jsp";
	
	loginOK=(String)session.getAttribute("login_ok");

	if(loginOK==null){ //login_ok속성이 설정되어 있지 않다면 로그인창으로 리다이렉트 시킨다 
		System.out.println("login_test: login_ok is null");
		response.sendRedirect(jumpURL_Fail);
		return;
	}
	else if(!loginOK.equals("yes")){ //login_ok속성이 설정되어 있으나 값이 yes가 아닌 경우도 로그인창으로 리다이렉트 시킨다.
		System.out.println("login_test: login_ok value is not yes");
		response.sendRedirect(jumpURL_Fail);
		return;
	}else{ //login_ok속성이 존재하며 값이 yes일때, 즉 로그인 성공일때
		System.out.println("login_test: LOGIN SUCCESS!");
		response.sendRedirect(jumpURL_Success);
	}
%>
</head>
<body>
</body>
</html>