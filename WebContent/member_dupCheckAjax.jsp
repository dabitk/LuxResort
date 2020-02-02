<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,com.resort.member.*,com.resort.member.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	memberDAO bbs = memberDAO.getInstance();
	
	System.out.println("email값: " + email);
	
	int dupExists =	bbs.checkDuplicateId(email);
	
	String returnString = "{\"dupExists\": "+dupExists+"}";
	System.out.println("member_dupCheckAjax의 returnString 값 : "+returnString);
	out.println(returnString);
%>  