<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,com.resort.member.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	memberDAO mDAO = memberDAO.getInstance();
	
	memberVO mVO = mDAO.doAuthentication(email,password);
	String returnString = "{\"login_ok\": 0}";
	System.out.println(mVO);
	if(mVO != null){ //DB에서 ID와 비밀번호가 일치하는 사용자 레코드를 발견했을 경우
		session.setAttribute("login_ok","yes_member"); //로그인 상태를 세션에 기록
		session.setAttribute("member_name", mVO.getName()); //로그인된 사용자명을 세션에 기록
		returnString = "{\"login_ok\": 1}";
	}
	
	System.out.println(returnString);
	System.out.println(session.getAttribute("member_name"));
	out.println(returnString);
%>