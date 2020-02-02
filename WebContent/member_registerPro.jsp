<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,com.resort.member.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	System.out.println("Entered registerPro.jsp");
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String address = request.getParameter("address");
	String name = request.getParameter("name");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	
	String tel = tel1 + '-' + tel2 + '-' + tel3;
	System.out.println(tel);
	
	memberDAO mDAO = memberDAO.getInstance();
	
	int errorcode=mDAO.insertMember(email, password, address, name, tel);
	if(errorcode == 0){ //회원가입 처리가 에러없이 완료된 경우
		memberVO mVO = mDAO.getMember(email);
		String member_name = mVO.getName();
		session.setAttribute("login_ok","yes_member"); //세션에 멤버 로그인 상태를 기록하고
		if(member_name != null){ //로그인한 사용자 이름이 null이 아니라면 세션에 기록한다
			session.setAttribute("member_name",member_name);
		}
		response.sendRedirect("index.jsp"); //메인페이지로 리다이렉트 시킨다.
	}else{ //에러가 발생한 경우
		response.sendError(500); //500에러를 발생시킨다
	}
%>
</body>
</html>