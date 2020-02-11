<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,com.resort.member.*,com.resort.member.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String address = request.getParameter("address");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	
	memberDAO bbs = memberDAO.getInstance();
	
	System.out.println("email값: " + email);
	System.out.println("password값: " + password);
	System.out.println("address값: " + address);
	System.out.println("name값: " + name);
	System.out.println("tel값: " + tel);
	
	int dupExists =	bbs.insertMember(email,password,address,name,tel);
	
	String returnString = "{\"dupExists\": "+dupExists+"}";
	System.out.println("member_dupCheckAjax의 returnString 값 : "+returnString);
	out.println(returnString);
%>  