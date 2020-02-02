<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>럭셔리조트에 오신것을 환영합니다!</title>
  <script>
	function logout(){
		alert('로그아웃 되었습니다.');
		window.location.replace("./member_login.jsp");
	}
  </script>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	session.invalidate();
	//로그아웃 후 멤버 로그인 페이지로 리다이렉트 시킨다.
%>
<script>logout()</script>
</body>
</html>